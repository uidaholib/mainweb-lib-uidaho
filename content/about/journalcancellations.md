---
title: Journal Cancellations — FY27
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
custom-foot: js/line-chart-js.html;js/copy-link-js.html
gen_ai: true
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
{%- comment -%}
    The budget chart is driven by "_data/about_collections_budget.csv", one row per fiscal year:
    - budget: subscriptions / continuing resources spending, whole dollars.
    - cpi_index: CPI-U (BLS series CUUR0000SA0) averaged over the July-June fiscal year.
    - journal_increase: that year's average journal price increase, in percent (blank for the first year).
    The adjusted lines are calculated in the first year's dollars:
    inflation-adjusted = budget x (first year index / that year's index); journal-adjusted = budget / combined increases since the first year.
{%- endcomment -%}

The Library's Collections Team, working with our subject liaison librarians, reviews every journal package and database before it comes up for renewal.
Several months ahead of each deadline, the team compiles standardized usage reports from the publisher, calculates the resource's cost per use, compares it with similar resources we subscribe to, examines the resource's relationship to university strategic priorities, and gathers feedback from liaisons and the departments they serve.
The team then makes a recommendation to the Dean before every renewal deadline.

## Budget

{% assign budget = site.data.about_collections_budget -%}
{%- assign base_index = budget.first.cpi_index | plus: 0.0 -%}
{%- assign factor = 1.0 -%}
{%- assign actual = "" | split: "" -%}
{%- assign cpi = "" | split: "" -%}
{%- assign journal = "" | split: "" -%}
{%- for r in budget -%}
{%- unless forloop.first -%}{%- assign step = r.journal_increase | divided_by: 100.0 | plus: 1.0 -%}{%- assign factor = factor | times: step -%}{%- endunless -%}
{%- assign b = r.budget | plus: 0 -%}
{%- assign actual = actual | push: b -%}
{%- assign c = b | times: base_index | divided_by: r.cpi_index | round -%}
{%- assign cpi = cpi | push: c -%}
{%- assign j = b | divided_by: factor | round -%}
{%- assign journal = journal | push: j -%}
{%- endfor -%}
{%- assign chart_labels = budget | map: "fiscal_year" | join: "," -%}
{%- assign chart_caption = "Subscriptions spending, " | append: budget.first.fiscal_year | append: "–" | append: budget.last.fiscal_year -%}
{%- capture chart_note -%}Adjusted lines show what each year's spending could buy in {{ budget.first.fiscal_year }} dollars. The FY20 drop reflects university-wide budget cuts.{%- endcapture -%}
{%- capture budget_series -%}
Actual spending|clearwater|{{ actual | join: "," }}|Actual;Adjusted for inflation (CPI-U)|lupine|{{ cpi | join: "," }}|Inflation-adjusted;Adjusted for journal price increases|leather|{{ journal | join: "," }}|Journal-adjusted
{%- endcapture %}
{% include feature/line-chart.html caption=chart_caption note=chart_note labels=chart_labels series=budget_series format="dollars-whole" size="lg" %}
<p class="small text-muted">Inflation: Consumer Price Index (CPI-U), averaged over each July–June fiscal year. Journal price increases: average yearly increases for college and university libraries.</p>

Our goal is to make the University's investment in the Library go as far as it can.
When a resource is underused, we first try to raise awareness of it through our subject liaisons and Library communication channels.
However, with industry-standard library resource increases of between four and six percent per year, our spending power decreases every year, and a flat budget functions as a budget cut.
Thus, we are in a position where we must cut resources every year, and sometimes even frequently-used resources get cut.

The resources below are the ones that, by the measures detailed above, deliver the least value for their cost.

{% for year in years %}
{%- assign year_items = cancellations | where: "fiscal_year", year -%}
<h2 id="{{ year | slugify }}-cancellations" class="mt-5">{{ year }} cancellations</h2>

{% for item in year_items %}
{%- assign cpu_pairs = item.cpu_history | split: ";" -%}
{%- assign latest = cpu_pairs | last | split: ":" -%}
<section class="border-top pt-4 mt-4" aria-labelledby="{{ item.resource | slugify }}">
    <div class="d-flex align-items-center flex-wrap gap-1 mb-1">
        <h3 id="{{ item.resource | slugify }}" class="mb-0">{{ item.resource }}</h3>
        <a href="#{{ item.resource | slugify }}" class="copy-link link-secondary p-2" title="Copy link to this section">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" aria-hidden="true" class="bi bi-link-45deg d-block" viewBox="0 0 16 16"><path d="M4.715 6.542 3.343 7.914a3 3 0 1 0 4.243 4.243l1.828-1.829A3 3 0 0 0 8.586 5.5L8 6.086a1 1 0 0 0-.154.199 2 2 0 0 1 .861 3.337L6.88 11.45a2 2 0 1 1-2.83-2.83l.793-.792a4 4 0 0 1-.128-1.287z"/><path d="M6.586 4.672A3 3 0 0 0 7.414 9.5l.775-.776a2 2 0 0 1-.896-3.346L9.12 3.55a2 2 0 1 1 2.83 2.83l-.793.792c.112.42.155.855.128 1.287l1.372-1.372a3 3 0 1 0-4.243-4.243z"/></svg>
            <span class="visually-hidden">Copy link to {{ item.resource }}</span>
        </a>
        <span class="copy-link-status small text-muted" role="status"></span>
    </div>
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

<p class="bg-light p-3 mb-4"><strong>Cost per use</strong> is a resource's annual price divided by the number of times its articles were downloaded or viewed in full. A lower cost per use means more value for each dollar spent.</p>

<h2 id="still-need-access" class="mt-5">Still need access?</h2>

If one of these resources supports coursework or research you depend on, you can often reach the same content through **[Interlibrary Loan]({{ '/services/ill/' | relative_url }})**.

Please fill out the form below with any requests or suggestions that you have.

{:.text-center}
[Submit Feedback](https://uidaho.co1.qualtrics.com/jfe/form/SV_cUevKPbg1aulCtf){:.btn .btn-lg .btn-outline-pride-gold .m-4}
