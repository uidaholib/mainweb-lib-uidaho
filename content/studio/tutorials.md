---
title: Studio How-To Guides
section: The Studio
permalink: /studio/tutorials.html
layout: page
search: true
keywords: the studio; tutorials; guides
description: "Index of step-by-step tutorials and how-to guides for recording podcasts and videos and using Studio equipment and software."
page_nav:
    parent: /studio/
    children:
---

Whether you're recording your first podcast or setting up for video production, these step-by-step guides will help you get the most out of your Studio session.

{% assign studio_media = site.lib-media | append: "/studio/" %}

{% include feature/browse-list.html data="studio_tutorials" label="guides" image_base=studio_media %}
