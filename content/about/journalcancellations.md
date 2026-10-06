---
title: Journal Cancellations
section: About
permalink: /about/journalcancellations.html
layout: page
search: true
search_headings: true
keywords: journal subscriptions; journal cancellations; database access; cost per use; library budget; library policy
description: "How the Library's Collections Team reviews journal and database subscriptions, and the reasoning behind recent cancellations."
page_nav:
    parent: /about/policies.html
    children:
custom-foot: js/line-chart-js.html
---
{% comment %}
    Cancellations are driven by "_data/about_journal_cancellations.csv", one row per cancelled resource:

    - fiscal_year: e.g. FY27. Each fiscal year gets its own section, newest first.
    - annual_cost: optional, e.g. 12,500. Left blank, it is hidden.
    - cpu_history: fiscal year and cost per use pairs, oldest first, separated by semicolons, e.g. FY23:14.70;FY24:23.31
    - rationale: the main reason for cancelling.
    - other_factors: optional, any further review that informed the decision (e.g. coverage overlap). Left blank, it is hidden.
{% endcomment %}
{%- assign cancellations = site.data.about_journal_cancellations -%}
{%- assign years = cancellations | map: "fiscal_year" | uniq | sort | reverse -%}
{%- assign budget = site.data.about_collections_budget -%}
{%- assign budget_labels = budget | map: "fiscal_year" | join: "," -%}

{% include feature/alert.html color="warning" text="**Placeholder data:** the budget chart below uses made-up numbers to preview the design. It will be updated with real figures." %}

{%- capture budget_series -%}
Actual budget|clearwater|{{ budget | map: "actual" | join: "," }}|Actual;Adjusted for inflation (CPI)|lupine|{{ budget | map: "cpi_adjusted" | join: "," }}|Inflation-adjusted;Adjusted for journal price increases|leather|{{ budget | map: "journal_adjusted" | join: "," }}|Journal-adjusted
{%- endcapture %}
{% include feature/line-chart.html caption="Collections budget" note="The adjusted lines show what each year's budget could buy in FY17 dollars." labels=budget_labels series=budget_series format="dollars-whole" size="lg" %}

The Library's Collections Team, working with our subject liaison librarians, reviews every journal package and database before it comes up for renewal.
One to two months ahead of each deadline, the team examines standardized usage reports from the publisher, calculates the resource's cost per use, compares it with similar resources we subscribe to, and gathers feedback from liaisons and the departments they serve.
The team then makes a recommendation to the Dean before every renewal deadline.

Our goal is to make the University's investment in the Library go as far as it can.
When a resource is underused, we first try to raise awareness of it through liaisons and the Library newsletter.
Meanwhile, journal subscription prices rise every year, typically by 4 to 6 percent, so a budget that stays flat buys less each year.
And budgets are tight across campus: between a $30,000 reduction to our budget and $110,000 in subscription price increases, the Library must cut $140,000 from its subscriptions in FY27.
The resources below are the ones that, by these measures, deliver the least use for their cost.

<p class="bg-light p-3 mb-4"><strong>Cost per use</strong> is a resource's annual price divided by the number of times its articles were downloaded or viewed in full. A lower cost per use means more value for each dollar spent.</p>

{% for year in years %}
{%- assign year_items = cancellations | where: "fiscal_year", year -%}
<h2 id="{{ year | slugify }}-cancellations" class="mt-5">{{ year }} cancellations</h2>

{% for item in year_items %}
{%- assign cpu_pairs = item.cpu_history | split: ";" -%}
{%- assign latest = cpu_pairs | last | split: ":" -%}
<section class="border-top pt-4 mt-4" aria-labelledby="{{ item.resource | slugify }}">
    <h3 id="{{ item.resource | slugify }}" class="mb-1">{{ item.resource }}</h3>
    <p class="text-muted mb-3">{{ item.description }}</p>

    <dl class="row mb-2">
        {%- if item.annual_cost and item.annual_cost != "" %}
        <dt class="col-sm-5">Annual cost</dt>
        <dd class="col-sm-7">{% unless item.annual_cost contains "$" %}${% endunless %}{{ item.annual_cost }}</dd>
        {%- endif %}
        <dt class="col-sm-5">Cost per use, {{ latest[0] | strip }}</dt>
        <dd class="col-sm-7">${{ latest[1] | strip }}</dd>
    </dl>

    {%- assign cpu_labels = "" | split: "" -%}
    {%- assign cpu_values = "" | split: "" -%}
    {%- for pair in cpu_pairs -%}
    {%- assign p = pair | split: ":" -%}
    {%- assign cpu_labels = cpu_labels | push: p[0] -%}
    {%- assign cpu_values = cpu_values | push: p[1] -%}
    {%- endfor -%}
    {%- assign cpu_labels = cpu_labels | join: "," -%}
    {%- capture cpu_series %}Cost per use|clearwater|{{ cpu_values | join: "," }}{% endcapture %}
    {% include feature/line-chart.html caption="Cost per use by fiscal year" labels=cpu_labels series=cpu_series %}

    <p><strong>Why we cancelled:</strong> {{ item.rationale }}</p>
    {%- if item.other_factors and item.other_factors != "" %}
    <p><strong>Other factors:</strong> {{ item.other_factors }}</p>
    {%- endif %}
</section>
{% endfor %}
{% endfor %}

<h2 id="still-need-access" class="mt-5">Still need access?</h2>

Any journals that are cancelled will remain available via [Interlibrary Loan]({{ '/services/ill/' | relative_url }}).
If we have cancelled something that you would like us to keep or if you have suggestions for new titles, suggestions for journals will be rated highly in future discussions as funding becomes available.

Please fill out the form below with any requests or suggestions that you have.

{:.text-center}
[Submit Feedback](https://uidaho.co1.qualtrics.com/jfe/form/SV_cUevKPbg1aulCtf){:.btn .btn-lg .btn-outline-pride-gold .m-4}
