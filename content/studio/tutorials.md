---
title: Tutorials & How-To Guides
section: The Studio
permalink: /studio/tutorials.html
layout: page
search: true
tags:
description:
page_nav:
    parent: /studio/
    children:

---

{% assign collections = site.data.studio_tutorials | where_exp: 'c', 'c.hidden != "true"' %}

<p class="py-3">Whether you're recording your first podcast or setting up for video production, these step-by-step guides will help you get the most out of your Studio session.</p>

<div class="row justify-content-center">
    {% for c in collections %}
    <div class="col-md-4">
        <div class="card my-2 text-center">
            <div class="card-header">
                <h2 class="h4">{{ c.title }}</h2>
            </div>
            <div class="card-body">
                {% if c.img %}<img class="card-img{% unless forloop.index < 4 %} lazyload{% endunless %}" {% unless forloop.index < 4 %}data-{% endunless %}src="{{ site.lib-media }}/studio/{{ c.img }}" alt="{{ c.collection }}">{% endif %}
                <p class="card-text">{{ c.description }}</p>
                {% if c.link %}<a href="{{ c.link | relative_url }}" class="btn btn-clearwater stretched-link" >View Tutorial</a>{% endif %}
            </div>
        </div>
    </div>
    {% endfor %}
</div>