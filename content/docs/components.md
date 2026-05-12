---
title: Library Website Components
noindex: true
section: Docs
permalink: /docs/components.html
layout: page
search: false
tags: 
description:
---
{% assign colors = "pride-gold;clearwater;raspberry;garnet;lupine;huckleberry;palouse;leather;bark;brand-black" | split: ";" %}

To build consistency across the pages, the library website has a variety of reusable template components that add features to the content.
They are based on the main U of I design, our needs, and [Bootstrap features](https://getbootstrap.com/docs/5.3/getting-started/introduction/).
Brand colors are added to a [customized version of Bootstrap](https://github.com/thecdil/bootstrap-sass-template/tree/uidaho).

## Components

### Button Colors

{% for c in colors %}
[{{ c }}](https://www.lib.uidaho.edu/){:.btn .btn-{{ c }}}

{% endfor %}

### Outline Buttons

{% for c in colors %}
[{{ c }}](https://www.lib.uidaho.edu/){:.btn .btn-outline-{{ c }}}

{% endfor %}

### Text

{% for c in colors %}
{{ c }} text.
{:.text-{{ c }}}

{% endfor %}

### Background

{% for c in colors %}
<div class="bg-{{ c }} p-4 m-3"><span class="text-white">{{ c }}</span></div>{% endfor %}

### Border

{% for c in colors %}
<div class="p-4 border border-5 border-{{ c }} m-3">{{ c }} at border-5</div>{% endfor %}
