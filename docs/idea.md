# Context

The theme for the Library site will mirror the University theme, similar to this page, https://www.uidaho.edu/leadership/finance-administration/campus-planning-development

The Library uses a totally different website technology.
The Library reimplements the theme using their own stack, which is Jekyll static site generator, Liquid templates, and Bootstrap CSS. 
There is a customized version of Bootstrap "bootstrap-uidaho.css" which features the custom colors and tweaks to container sizes.
Design prefers to use Bootstrap classes first over custom or inline styles. 
Custom CSS is added to "_sass/custom.scss".
Use [Bootstrap svg icons](https://icons.getbootstrap.com/) or custom svg where icons are needed.

## Top nav banner

The html for the website header is in "_includes/header.html" which is added to every page in the site.

The top nav differs from the University theme:

- is not transparent
- is not sticky
- rather than two parts (upper piece with gold I and search box, plus lower section starting with teal box and links) that stick together as you scroll down, those two parts are one unit, and start at the top of the page (no scroll effect)
- the search box area is replace with "Library" serving as main header

Clicking the menu button on the right opens a large dropdown menu similar to the main University, but the contents are simpler. 
Like the University's, the top will feature a search box. Typing in the search box activates a full site search, results will overlay the menu area.
Below the search box, the dropdown menu will feature five columns with headings with space for subpage nav below each.
It will prominently feature the current open hours

## Site search

The site search is powered by static client-side Flexsearch, https://github.com/nextapps-de/flexsearch
The library is at "assets/main-web/flexsearch.bundle.min.js" and the page data is in "assets/main-web/site-search.json".
The script handling the search is in "_includes/js/flexsearch-js.html" which is added to every page.

Search results feature the heading, page title, keywords, and highlight of related content snippet.
Results are pages and chunks at the heading level.
Each page can have keywords and a description.
Each chunk has an associated page title.
