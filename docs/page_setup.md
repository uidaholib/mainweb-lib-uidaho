# Website Page Setup

Each page has front matter that helps provide structured data for browsing, searching, and navigating the site. 

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
page_nav:
    parent:
    children:
---
```

Please try to keep it in this order for consistency.

Use these guidelines for filling in the front matter:

- title: the page title that will appear at the top of the page
- section: general category the content fits under
- permalink: location on the site. This should match the location in the project folders. 
- layout: the page template to use
- search: true or false, opt in to appear in site search results
- tags: keywords to help with search and browse, used in site search and meta markup.
- description: short summary of the content, used in site search and meta markup.
- page_nav: sets up the page nav. This allows for a flexible, decentralized nav structure. If the page_nav section is blank, no page_nav feature appear on the page. It contains two possible keys:
    - parent: adding the permalink of a page will pull in the page nav based on the parent. If this page does not have children, it will be treated as a sub page of the parent, the page_nav will be the same as the parent's.
    - children: optional list of child pages, given as list of permalink values. If the page has children listed, they will appear in the page_nav feature. If the page does not have a parent, it will appear at the top. If the page has a parent, the parent will appear at the top.

## Other Keys

- `noindex: true` set to ask google to NOT index the page.
- `custom-foot:` pulls in an include at the bottom of the html to allow custom js loading.
