---
title: Book a Room
section: Services
permalink: /services/rooms.html
layout: page
search: true
keywords: study rooms; room reservations; LibCal booking
description: "Browse and reserve group study rooms, 3D printers, and other bookable library spaces through the LibCal reservation system."
page_nav:
    parent: /services/
    children:
---
{% assign rooms = site.data.services_rooms %}

The Library has a variety of reservable spaces from group study rooms to 3D printers.
Check the descriptions below to find the space you need. 
Reservations are made on our <a href="https://libcal.uidaho.edu/">LibCal</a> system via the links available below.

{% include feature/browse-list.html data="services_rooms" label="spaces" %}
