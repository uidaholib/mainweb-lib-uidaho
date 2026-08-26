---
title: Non-Idaho Telephone and Business Directories
section: Special Collections
permalink: /special-collections/non-idaho-directories.html
layout: page
search: true
keywords: non-Idaho directories; telephone directories; special collections
description: "List of telephone books and city business directories from states neighboring Idaho held by Special Collections and Archives."
page_nav:
    parent: /special-collections/
    children:
table-id: "#directories"
table-paginate: true
---
{% assign directories = site.data.spec_directories_non_idaho %}

A list of telephone and business directories from neighboring states held in Spec. 

*Updated 2021-07-28*

<table id="directories" class="table table-striped">
    <thead>
        <tr>
            <th scope="column">City</th>
            <th scope="column">State</th>
            <th scope="column">Phonebook Dates</th>
            <th scope="column">City Directory Dates</th>
            <th scope="column">Notes</th>
        </tr>
    </thead>
    <tbody class="table-group-divider">
    {% for a in directories %}
        <tr>
            <td>{{ a.city }}</td>
            <td>{{ a.state }}</td>
            <td>{{ a.dates_phonebook }}</td>
            <td>{{ a.dates_city }}</td>
            <td>{{ a.notes }}</td>
        </tr>
    {% endfor %}
    </tbody>
    <thead>
        <tr>
            <th>City</th>
            <th>State</th>
            <th>Phonebook Dates</th>
            <th>City Directory Dates</th>
            <th>Notes</th>
        </tr>
    </thead>
</table>
