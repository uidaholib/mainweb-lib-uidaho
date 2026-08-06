---
title: Page Setup
section: Docs
permalink: /docs/pages.html
layout: page
search: false
tags: page setup; frontmatter; navigation
description: "Instructions for page frontmatter, navigation, and setup patterns used to build library website pages."
page_nav:
    parent: /docs/
page_callout: 
    title: Example Callout
    text: Callouts are a card feature with an optional image, heading, description text, and link.
    link: https://www.lib.uidaho.edu/digital/
    link-text: Visit
    image: https://www.lib.uidaho.edu/media/collections/fatmen.jpg
    image-alt: Two men race down main street in historic photograph
    color: pride-gold
page_resources:
    title: Example Resources
    links:
        - text: Website Repository
          link: https://github.com/uidaholib/mainweb-lib-uidaho   
        - text: Docs on GitHub
          link: https://github.com/uidaholib/mainweb-lib-uidaho/tree/main/docs
        - text: Site Search Docs
          link: https://github.com/uidaholib/mainweb-lib-uidaho/blob/main/docs/site_search_setup.md
noindex: true
---

Each page has front matter that helps provide structured data for browsing, searching, and navigating the site.

## All Pages

The standard front matter looks like:


```
---
title: 
section: 
permalink: 
layout: 
search:
tags: 
description:
---
```

Please try to keep it in this order for consistency.

Use these guidelines for filling in the front matter:

- `title:` the page title that will appear at the top of the page
- `section:` general category the content fits under
- `permalink:` location on the site. This should match the location in the project folders. 
- `layout:` the page template to use
- `search: true` true or false, opt in to appear in site search results
- `search_headings: false` set site search to NOT index at the sub-heading level, it will only have a record for the page. This is useful for complicated pages with lots of headings that should not be individual results or less-essential page content that we don't need deep access to.
- tags: keywords to help with search and browse, used in site search and meta markup.
- `description:` short summary of the content, used in site search and meta markup.
- `noindex: true` set to ask google to NOT index the page.
- `custom-foot:` pulls in an include at the bottom of the html to allow custom js loading.

## Page Layout Features

The standard "page" layout comes with several built in feature options that are controlled by the front matter.
The page is a narrow text layout for better reading, with optional features on the right side column.
The features are page-navigation.html, page-callout.html, and page-resources.html found in "_includes/components/", each file has full options documented in comments at the top.

The components are controlled by these front matter keys:

- `page_nav:` sets up the page nav. This allows for a flexible, decentralized nav structure. If the page_nav section is blank, no page_nav feature appear on the page. It contains two possible keys:
    - `parent:` adding the permalink of a page will pull in the page nav based on the parent. If this page does not have children, it will be treated as a sub page of the parent, the page_nav will be the same as the parent's.
    - `children:` optional list of child pages, given as list of permalink values. If the page has children listed, they will appear in the page_nav feature. If the page does not have a parent, it will appear at the top. If the page has a parent, the parent will appear at the top.
- `page_callout:` a card feature with an optional image, a heading, description text, and a link.
- `page_resources:` a list of resource links in a grey card. These are generally external or deep links, supplementing than the standard page nav.


Below is an example of all options:

```
---
title: Example Great Page
section: Example
permalink: /demo/
layout: page
search: true
tags: Demos; Cats
description: "A demo page with features"
page_nav:
    parent: /example/
    children:
        - /example/subpage.html
        - /example/another.html
        - /example/cats.html
page_callout: 
    title: Digital Collections
    text: Digital Collections is a continually growing, searchable database that provides access to rare and unique collections to enhance and support research and education at the University of Idaho.
    link: https://www.lib.uidaho.edu/digital/
    link-text: Visit
    image: https://www.lib.uidaho.edu/media/collections/fatmen.jpg
    image-alt: Two men race down main street in historic photograph
    color: pride-gold
page_resources:
    title: Resources
    links:
        - text: U of I Brand
          link: https://www.uidaho.edu/brand    
        - text: Brand intranet pages
          link: https://vandalsuidaho.sharepoint.com/sites/InsideUI-UCM/SitePages/Brand.aspx
        - text: U of I Brand Book
          link: https://content-hub.uidaho.edu/api/public/content/226d8af4ad704e65a2e42d96613305b2?v=e636bbda 
---
```
