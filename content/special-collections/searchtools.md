---
title: Research Tools
section: Special Collections
permalink: /special-collections/searchtools.html
layout: page
search: true
tags:
description:
page_nav:
    parent: /special-collections/
    children:
page_resources:
    title: More Research Tools
    links: 
        - text: Bibliography of U of I History
          link: /special-collections/uibibliography.html
        - text: Genealogical Resources
          link: /special-collections/genealogicalresources.html
        - text: Idaho Biographical Index
          link: /special-collections/idahobio.html
        - text: Idaho Telephone and Business Directories
          link: /special-collections/directories.html
        - text: Historic Newspapers
          link: /find/microfilm.html
---

Use these tools to discover finding aids, collections, and items in Special Collections.

{% assign tools = site.data.spec_searchtools %}

<div class="row py-3 justify-content-center">
{% for t in tools %}
<div class="col-md-4 text-center">
{% capture text %}
**Use to find**: {{ t.shortdesc }} 

{{ t.description }}

<a href="{{ t.link | relative_url }}" class="btn btn-outline-pride-gold m-1">Go to {{ t.title }}</a>

{% endcapture %}
{% include feature/card.html header=t.title text=text %}
</div>
{% endfor %}
</div>