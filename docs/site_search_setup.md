# Site Search

The website features a quick site search built into the header navigation.
The search is configured by individual page front matter using these options:

- `search:` true/false, opt in to appear in site search results
- `search_headings:` true/false, opt out to NOT index at the sub-heading level, it will only have a record for the page. This is useful for complicated pages with lots of headings that should not be individual results or less-essential page content that we don't need deep access to.

Additional external sources can be added as records in the index using the file "_data/search_index_additions.csv".

The search index splits content up by the sub-headings on the page and results link directly to the related heading (unless you opt out with `search_headings: false`).
The main page record uses the page front matter `description:` and `tags:` to add context.
The sub-heading records use the page text.

## Tech

- "_includes/js/header-js.html" contains the search JS.
- [flexsearch](https://github.com/nextapps-de/flexsearch) powers the search.
- "_plugins/search_index.rb" generates the index json.
- "_plugins/headings_ids.rb" adds unique ids to all content to ensure it can link to sub-headings.
