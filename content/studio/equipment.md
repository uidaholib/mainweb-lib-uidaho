---
title: Studio Equipment
section: The Studio
permalink: /studio/equipment.html
layout: page
search: true
keywords: the studio; equipment
description: "Audio and video equipment available to patrons using the Studio."
page_nav:
    parent: /studio/
    children:
---

The Studio provides a wide range of equipment to support your audio and video projects.

There are two types of equipment available:

- In-Studio Equipment: Dedicated tools that stay in the space for your use during a reservation.
- [Loanable Equipment]({{ '/find/equipment-loans.html' | relative_url }}): Select items can be checked out separately for use outside the Studio.

For details about available software and important guidelines, visit our [FAQ page]({{ '/studio/faq.html' | relative_url }}) and review the [Terms of Use]({{ '/studio/termsofuse.html' | relative_url }}).

{% assign studio_media = site.lib-media | append: "/studio/" %}

{% include feature/browse-list.html data="studio_equipment" image_base=studio_media label="equipment" %}
