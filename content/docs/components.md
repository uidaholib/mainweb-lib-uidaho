---
title: Website Components
section: Docs
permalink: /docs/components.html
layout: page
search: false
keywords: website components; documentation; design patterns
description: "Documentation for reusable website components used across the University of Idaho Library site."
page_nav:
    parent: /docs/
noindex: true
---
<style> code { color:#000; }</style>
{% assign colors = "pride-gold;clearwater;raspberry;garnet;lupine;huckleberry;palouse;leather;bark;brand-black;brand-gray" | split: ";" %}

To build consistency across the pages, the library website has a variety of reusable template components that add features to the content.
They are based on the main U of I design, our needs, and [Bootstrap features](https://getbootstrap.com/docs/5.3/getting-started/introduction/).
Brand colors are added to a [customized version of Bootstrap](https://github.com/thecdil/bootstrap-sass-template/tree/uidaho).

It is important to use the existing BS theme classes (rather than inline styles or custom css) as much as possible for consistency and maintainability.
Using the existing classes allows us to update all styles in one place so all enhancements will cascade into the content without needing to fix customized variations across the site.

## Components

### Button Colors

{% for c in colors %}
[{{ c }}](https://www.lib.uidaho.edu/){:.btn .btn-{{ c }} .me-3} `btn-{{ c }}`

{% endfor %}

### Outline Buttons

{% for c in colors %}{% unless c == "brand-gray" %}
[{{ c }}](https://www.lib.uidaho.edu/){:.btn .btn-outline-{{ c }} .me-3} `btn-outline-{{ c }}`

{% endunless %}{% endfor %}

### Background

Background `bg-` classes can be used for any of the theme colors.
To use text with automatically selected contrasting color, use the `text-bg-` version of the class.

{% for c in colors %}
<div class="text-bg-{{ c }} p-5 mt-3">{{ c }}</div>
`bg-{{ c }}` or `text-bg-{{ c }}`
{% endfor %}

### Border

Borders can be added to div using the class `border` plus a `border-` color class. 

{% for c in colors %}
<div class="p-4 border border-5 border-{{ c }} mt-3">{{ c }} at border-5</div>
`border-{{ c }}`
{% endfor %}

### Text

Most of these text classes are not accessible! Use rarely with caution.

{% for c in colors %}
{{ c }} text.
{:.text-{{ c }}}

{% endfor %}
