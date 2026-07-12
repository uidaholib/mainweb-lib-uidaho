---
title: Library Website Docs
section: Docs
permalink: /docs/
layout: page
search: false
tags: 
description:
page_nav:
    children:
        - /docs/contributing.html
        - /docs/components.html
noindex: true
---

{% assign colors = "pride-gold;clearwater;raspberry;garnet;lupine;huckleberry;palouse;leather;bark;brand-black" | split: ";" %}

The Library website follows some basic design guidelines and constraints in order to mirror the main University website and accessibility best practices. 

## Brand Colors

U of I's official brand includes these theme colors: {{ colors | join: ", " }}.
We generate a custom Bootstrap theme using those colors, making the color variations available for all standard Bootstrap components.

{% for c in colors %}
[{{ c }}](https://www.lib.uidaho.edu/){:.btn .btn-lg .btn-{{ c }} .m-2}{% endfor %}

## Style Guide

### Accessible Writing

Image alt text: 

- All images must have descriptive alt text! 
- Don't use images that have text or tables in them, the text should be in the HTML. 

Headings:

- Write in shorter blocks of text and include plenty of meaningful sub-headings. This helps users scan and understand the contents.
- Headings must follow logical order on the page, increasing by one step (h1, h2, h3, etc) without skipping levels. 

Links:

- Don't use "click here" style links!
- Always put links over descriptive meaningful text.

### Consistency 

Phone Numbers:

- Content: Check that numbers are consistent across site
- Should read (xxx) xxx-xxxx
- A phone number may be a link, but doesn’t always have to be - make this decision according to context and use the old website as an example.
- When a call link, code should be: `<a href="tel:+1-208-xxx-xxxx">(208) xxx-xxxx</a>`
- When a text link, code should be: `<a href="sms:+1-208-xxx-xxxx">(208) xxx-xxxx</a>`

Names:

- Check that names are current and consistent across site.

Email:

- Check that emails are updated and consistent across site.
- In markdown `<username@uidaho.edu>` will be converted into a email link.
- In HTML should be `<a href="mailto:username@uidaho.edu">username@uidaho.edu</a>`
- Consider if it should be an email link (which will open a email client for the user) or a link to the person's profile page giving users more contact options.

Proper Use of "And":

- Avoid using "&", always use “and” instead inside of content.

### U of I 

- Always use "U of I" (not "UI" or "UIdaho")

### Resources

- [U of I Brand Resource Center](https://www.uidaho.edu/brand)
- [Brand intranet pages](https://vandalsuidaho.sharepoint.com/sites/InsideUI-UCM/SitePages/Brand.aspx)
- [U of I Brand Book](https://content-hub.uidaho.edu/api/public/content/226d8af4ad704e65a2e42d96613305b2?v=e636bbda).
