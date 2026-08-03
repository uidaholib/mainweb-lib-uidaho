# frozen_string_literal: true

#########
#
# Heading IDs
#
# Jekyll plugin to ensure every heading in page content has a unique "id" attribute,
# so headings can be targeted by anchor links (used by the site search to jump
# straight to the matching section).
#
# Kramdown already generates ids for headings written in Markdown, but content
# written directly in HTML (or output by Liquid loops and includes) gets nothing.
# This fills the gap by adding an id to any heading that is missing one.
#
# Runs on the ":post_convert" hook, so it sees the rendered page content *before*
# it is placed in a layout -- headings added by files in "_layouts/" are untouched.
#
# Optionally it can also inject a clickable anchor link into each heading,
# similar to https://github.com/allejo/jekyll-anchor-headings
#
# Configure in _config.yml under the "heading_ids" key (all keys optional):
#
#   heading_ids:
#     enabled: true              # set false to turn the plugin off
#     min_level: 1               # shallowest heading level to process
#     max_level: 3               # deepest heading level to process
#     slugify_mode: 'default'    # Jekyll slugify mode: default, pretty, ascii, latin, raw
#     anchors: false             # set true to add a clickable link inside each heading
#     anchor_class: 'heading-anchor'
#     anchor_text: '#'           # link contents, can be html such as an svg icon
#     anchor_title: 'Permalink to this heading'
#     anchor_position: 'after'   # 'after' or 'before' the existing heading text
#
# Individual pages can opt out using "heading_ids: false" in their front matter.
#
# (c) 2026 University of Idaho Library
# Distributed under the conditions of the MIT license
#
#########

require 'set'

module HeadingIds
  # used when a key is not set in _config.yml
  DEFAULTS = {
    'enabled'         => true,
    'min_level'       => 1,
    'max_level'       => 3,
    'slugify_mode'    => 'default',
    'anchors'         => false,
    'anchor_class'    => 'heading-anchor',
    'anchor_text'     => '#',
    'anchor_title'    => 'Permalink to this heading',
    'anchor_position' => 'after'
  }.freeze

  # matches a complete heading element, capturing: level, attributes, inner html.
  # note: an attribute value containing a literal ">" would break the match,
  # which is not valid html anyway, so headings like that are simply skipped.
  HEADING_REGEX = %r{<h([1-6])((?:\s[^>]*)?)>(.*?)</h\1\s*>}im

  # matches any id attribute, used to detect existing ids
  ID_ATTRIBUTE_REGEX = /\sid\s*=\s*["']([^"']*)["']/i

  # only html output gets processed, skipping json, xml, txt, etc
  HTML_EXTENSIONS = ['.html', '.htm'].freeze

  class << self
    # entry point called by the hook for each page / document
    def process(doc)
      return unless html_output?(doc)
      return if doc.content.nil? || doc.content.empty?
      return if doc.data['heading_ids'] == false

      config = config_for(doc.site)
      return unless config['enabled']

      levels = Range.new(config['min_level'].to_i, config['max_level'].to_i)
      return if levels.none?

      doc.content = add_ids(doc.content, levels, config)
    end

    private

    # settings from _config.yml layered over the defaults
    def config_for(site)
      DEFAULTS.merge(site.config['heading_ids'] || {})
    end

    def html_output?(doc)
      HTML_EXTENSIONS.include?(doc.output_ext)
    end

    # rewrite every in-range heading in the content
    def add_ids(content, levels, config)
      # collect ids already in the content (kramdown generated or hand written)
      # so that generated ids never collide with them
      used_ids = content.scan(ID_ATTRIBUTE_REGEX).flatten.to_set

      content.gsub(HEADING_REGEX) do
        level = Regexp.last_match(1).to_i
        attributes = Regexp.last_match(2)
        inner_html = Regexp.last_match(3)
        original = Regexp.last_match(0)

        next original unless levels.include?(level)

        id = existing_id(attributes)

        if id.nil?
          id = generate_id(inner_html, used_ids, config['slugify_mode'])
          # a heading with no sluggable text (empty, or symbols only) is left alone
          next original if id.nil?

          attributes = %(#{attributes} id="#{id}")
        end

        inner_html = add_anchor(inner_html, id, config) if config['anchors']

        %(<h#{level}#{attributes}>#{inner_html}</h#{level}>)
      end
    end

    def existing_id(attributes)
      match = attributes.match(ID_ATTRIBUTE_REGEX)
      return nil if match.nil? || match[1].empty?

      match[1]
    end

    # build a unique slug from the heading text
    def generate_id(inner_html, used_ids, slugify_mode)
      text = heading_text(inner_html)
      # skip empty headings before slugify, which logs a warning on empty input
      return nil if text.empty?

      slug = Jekyll::Utils.slugify(text, mode: slugify_mode)
      return nil if slug.nil? || slug.empty?

      # append a counter until unique, matching the kramdown convention
      unique = slug
      suffix = 1
      while used_ids.include?(unique)
        unique = "#{slug}-#{suffix}"
        suffix += 1
      end

      used_ids << unique
      unique
    end

    # reduce heading html to plain text for slugifying
    def heading_text(inner_html)
      text = inner_html.gsub(/<[^>]*>/, ' ')
      # decode the entities kramdown and Liquid escaping commonly produce
      text.gsub!(/&(?:amp|lt|gt|quot|#39|apos|nbsp);/, ' ')
      text.strip
    end

    # wrap or append a link pointing at the heading's own id
    def add_anchor(inner_html, id, config)
      link = %(<a class="#{config['anchor_class']}" href="##{id}" title="#{config['anchor_title']}">#{config['anchor_text']}</a>)

      config['anchor_position'].to_s == 'before' ? "#{link}#{inner_html}" : "#{inner_html}#{link}"
    end
  end
end

# ":post_convert" fires after the content is converted but before it is wrapped
# in a layout, which is exactly the content exposed to Liquid as {{ content }}
Jekyll::Hooks.register %i[pages documents], :post_convert do |doc|
  HeadingIds.process(doc)
end
