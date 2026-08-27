# Site Search

The website features a site search built into the header navigation to allow users to quickly discover content.

The search is configured on each individual page in the YAML front matter using these options:

- `search:` true/false, opt in to appear in site search results. The page record adds the page front matter `description:` and `keywords:` to the index.
- `search_headings:` true/false, opt in to index at the sub-heading level. Setting `search_headings: true` will split the page content up by the sub-headings, creating smaller records containing the text content of the section to index. This allows users to find more specific information with results linking directly to the related heading. This is useful for documentation pages that contain many subsections with important information that users may want to discover at a deeper granular level.

Additional external sources can be added as records in the index using the file "_data/search_index_additions.csv".

## Tech

- "_includes/js/header-js.html" contains the search JS.
- [flexsearch](https://github.com/nextapps-de/flexsearch) powers the search.
- "_plugins/search_index.rb" generates the index json.
- "_plugins/headings_ids.rb" adds unique ids to all content to ensure it can link to sub-headings.
