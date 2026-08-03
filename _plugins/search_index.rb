# frozen_string_literal: true

#########
#
# Search Index
#
# Jekyll plugin to generate the JSON data file powering the site search.
#
# Page content is chunked on its headings, so each heading becomes its own
# search record linking straight to that heading's anchor. A final record per
# page covers the page as a whole.
#
# Runs on the ":site, :post_render" hook, once every page has been rendered but
# before anything is written. That ordering matters: the content read here is
# fully converted html, with Liquid expanded and heading ids in place (see
# _plugins/heading_ids.rb). Generating from a Liquid template instead meant the
# template could be rendered before the pages it was reading, capturing their
# raw unrendered source.
#
# Pages opt in with "search: true" in their front matter, and must have a title.
#
# Configure in _config.yml under the "search_index" key (all keys optional):
#
#   search_index:
#     enabled: true                                  # set false to skip generating
#     output: '/assets/main-web/site-search.json'    # where to write the file
#     heading_level: 3                               # chunk on headings down to this level
#     collections: []                                # collection labels to index alongside pages
#     additions: 'search_index_additions'            # _data file(s) of extra records
#     tag_delimiter: ';'                             # separator for the csv tags column
#     pretty: false                                  # true for human readable json
#
# "additions" names one or more csv files in _data/ holding curated records for
# resources that are not pages of this site, such as guides on another server.
# Each row becomes a single record, with the columns:
#
#   title,description,tags,link
#
# Rows without a title or link are skipped. Links starting with "/" are treated
# as site relative and get the baseurl, anything else is used as given.
#
# Each record has the shape:
#
#   "12": {
#     "url": "/studio/audacity.html#2-recording",  page url plus heading anchor
#     "title": "2. Recording",                     heading text, or page title
#     "page": "Audio Recording and Editing",       parent page title, null on page records
#     "tags": null,                                page front matter tags, page records only
#     "content": "..."                             plain text of the section
#   }
#
# (c) 2026 University of Idaho Library
# Distributed under the conditions of the MIT license
#
#########

require 'json'
require 'cgi'

module SearchIndex
  # used when a key is not set in _config.yml
  DEFAULTS = {
    'enabled'       => true,
    'output'        => '/assets/main-web/site-search.json',
    'heading_level' => 3,
    'collections'   => [],
    'additions'     => nil,
    'tag_delimiter' => ';',
    'pretty'        => false
  }.freeze

  # matches an id attribute on a heading's opening tag
  ID_ATTRIBUTE_REGEX = /\sid\s*=\s*["']([^"']*)["']/i

  # named entities that survive html stripping and have no plain ascii equivalent
  # in CGI.unescapeHTML, mapped so search text stays readable
  ENTITIES = {
    '&nbsp;'   => ' ',
    '&ndash;'  => '-',
    '&mdash;'  => '-',
    '&hellip;' => '...',
    '&lsquo;'  => "'",
    '&rsquo;'  => "'",
    '&ldquo;'  => '"',
    '&rdquo;'  => '"'
  }.freeze

  class << self
    # entry point called by the hook once per build
    def generate(site)
      config = DEFAULTS.merge(site.config['search_index'] || {})
      return unless config['enabled']

      # clamp to the levels html actually has, then build the splitting regex once
      max_level = config['heading_level'].to_i.clamp(1, 6)
      heading_regex = %r{<h([1-#{max_level}])((?:\s[^>]*)?)>(.*?)</h\1\s*>}im

      records = {}
      id = 0

      searchable_docs(site, config['collections']).each do |doc|
        url = relative_url(site, doc.url)
        # every string stored in the index goes through plain_text, so that
        # results never render escaped markup back at the user
        title = plain_text(doc.data['title'])

        headings = []

        split_sections(doc.content.to_s, heading_regex).each do |section|
          heading = section[:heading]
          content = plain_text(section[:body])

          # the chunk before the first heading describes the page itself,
          # skip it when there is nothing in it
          next if heading.nil? && content.empty?

          headings << heading[:text] if heading

          records[(id += 1).to_s] = {
            'url'     => heading && !heading[:id].empty? ? "#{url}##{heading[:id]}" : url,
            'title'   => heading ? heading[:text] : title,
            'page'    => title,
            'tags'    => nil,
            'content' => content
          }
        end

        # whole page record, described by its front matter description
        # or, failing that, a list of the headings it contains
        description = plain_text(doc.data['description'])

        records[(id += 1).to_s] = {
          'url'     => url,
          'title'   => title,
          'page'    => nil,
          'tags'    => doc.data['tags'],
          'content' => description.empty? ? headings.join(', ') : description
        }
      end

      addition_records(site, config).each do |record|
        records[(id += 1).to_s] = record
      end

      add_page(site, config, records)
    end

    private

    # curated records from _data csv files, for resources that are not pages of
    # this site. one row in, one record out, with no headings to chunk on
    def addition_records(site, config)
      Array(config['additions']).flat_map do |name|
        rows = site.data[name.to_s]

        unless rows.is_a?(Array)
          Jekyll.logger.warn 'Search Index:', "no _data file found for additions: #{name}"
          next []
        end

        rows.filter_map do |row|
          title = plain_text(row['title'])
          link = row['link'].to_s.strip
          next if title.empty? || link.empty?

          {
            'url'     => addition_url(site, link),
            'title'   => title,
            'page'    => nil,
            'tags'    => split_tags(row['tags'], config['tag_delimiter']),
            'content' => plain_text(row['description'])
          }
        end
      end
    end

    # additions can link anywhere, so only links rooted at "/" get the baseurl.
    # anything carrying a scheme ("https:", "mailto:") or protocol relative
    # ("//cdn.example.org") points off site and is used exactly as given
    def addition_url(site, link)
      return link if link.match?(%r{\A(?:[a-z][a-z0-9+.-]*:|//)}i)

      link.start_with?('/') ? relative_url(site, link) : link
    end

    # the tags column holds a delimited list, stored as an array for the
    # search results to render as badges, or null when empty
    def split_tags(value, delimiter)
      tags = value.to_s.split(delimiter).map(&:strip).reject(&:empty?)
      tags.empty? ? nil : tags
    end

    # pages (and optionally collection documents) that opted in to search
    def searchable_docs(site, collections)
      docs = site.pages.select { |page| page.html? || page.url.end_with?('/') }

      Array(collections).each do |label|
        collection = site.collections[label]
        docs += collection.docs if collection
      end

      docs.select { |doc| doc.data['title'] && doc.data['search'] == true }
    end

    # break content into chunks, each being the text following a heading.
    # returns an array of { heading: { text:, id: } or nil, body: String },
    # where a nil heading marks the chunk before the first heading
    def split_sections(content, heading_regex)
      sections = []
      heading = nil
      position = 0

      while (match = heading_regex.match(content, position))
        sections << { heading: heading, body: content[position...match.begin(0)] }

        heading = {
          text: plain_text(match[3]),
          id: match[2].match(ID_ATTRIBUTE_REGEX)&.captures&.first.to_s
        }
        position = match.end(0)
      end

      sections << { heading: heading, body: content[position..] }
      sections
    end

    # reduce html to the readable text used for searching and result snippets
    def plain_text(html)
      text = html.to_s.dup
      # drop content that is markup rather than words, mirroring Jekyll's strip_html
      text.gsub!(%r{<script.*?</script>}m, ' ')
      text.gsub!(%r{<style.*?</style>}m, ' ')
      text.gsub!(/<!--.*?-->/m, ' ')
      text.gsub!(/<.*?>/m, ' ')
      # decode after stripping, so a decoded "<" can never look like a tag.
      # entities would otherwise be escaped a second time when results render
      text.gsub!(/&[a-z]+;/i) { |entity| ENTITIES.fetch(entity.downcase, entity) }
      text = CGI.unescapeHTML(text)
      # collapse the whitespace left behind
      text.gsub(/\s+/, ' ').strip
    end

    # prepend the site baseurl, as the relative_url Liquid filter does
    def relative_url(site, url)
      baseurl = site.config['baseurl'].to_s
      baseurl.empty? ? url : "#{baseurl.chomp('/')}#{url}"
    end

    # hand the finished json to Jekyll as a page so it gets written to the
    # destination, and is not treated as a stale file to clean up
    def add_page(site, config, records)
      output = config['pretty'] ? JSON.pretty_generate(records) : JSON.generate(records)
      path = config['output'].to_s

      page = Jekyll::PageWithoutAFile.new(site, site.source, File.dirname(path), File.basename(path))
      page.data['permalink'] = path
      page.data['sitemap'] = false
      page.content = output
      page.output = output

      site.pages << page

      Jekyll.logger.info 'Search Index:', "generated #{records.size} records in #{path}"
    end
  end
end

Jekyll::Hooks.register :site, :post_render do |site|
  SearchIndex.generate(site)
end
