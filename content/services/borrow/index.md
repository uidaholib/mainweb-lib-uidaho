---
title: Borrow/Renew
section: Services
permalink: /services/borrow/
layout: page
search: true
tags: library account; loan periods; library card
description: "Explains how to log into your Library Account to renew materials, and covers library card eligibility, loan periods, and fines for borrowing books, DVDs, and other items."
page_nav:
    parent: /services/
    children:
---

<a href="https://alliance-uidaho.primo.exlibrisgroup.com/discovery/account?vid=01ALLIANCE_UID:UID" class="btn btn-outline-pride-gold btn-lg my-2" ><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16" aria-hidden="true"><path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0z"/><path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708z"/></svg> Library Account Login</a>

Log into your Library Account *(using your University of Idaho username and password)* to:

- Renew materials and review your loans
- Access <a href="{{ '/find/articles.html' | relative_url }}">library databases</a> from anywhere in the world
- Use <a href="{{ '/services/ill/index.html' | relative_url }}">Interlibrary Loan / Rapido</a> and view your pending requests

Offline, use your Vandal Card to check out and renew Books, DVDs, and other materials from the library.

{% include feature/squiggly-divider.html %}

## Library Account Policies

<div class="text-center">
  <a href="#card" class="btn btn-secondary btn-sm my-2">Library Card Info</a>
  <a href="#loanperiods" class="btn btn-secondary btn-sm my-2">Loan Periods</a>
  <a href="#fines" class="btn btn-secondary btn-sm my-2">Fines</a>
  <a href="#renew" class="btn btn-secondary btn-sm my-2">Renewal Options</a>
</div>

### How do I get a library card?
{:#card}

#### Library Cards for Students, Faculty, and Staff

Your Idaho Vandal ID card can be used as your library card to check out materials as well as to access your interlibrary loan account and other online materials.

If you have a valid University of Idaho network username and password, you will also be able to access databases like JSTOR, Web of Science and Academic Search Premier <a href="{{ '/services/distance.html' | relative_url }}" >from off campus</a> by using your University of Idaho username and password.

**Preferred Name:** the Library circulation system used to check in and out materials can be updated to include a preferred name. Patrons interested in changing the name used on this system should inquire at the circulation desk or email <a href="mailto:libcirc@uidaho.edu">libcirc@uidaho.edu</a>. Please note campus systems that use the U of I single sign-on system will still display the legally registered name for your account.

#### Guest Library Cards

Guest privileges are available to:

- Idaho residents with photo ID (residents under 18 years old must have parent or guardian willing to establish a parent/child account)
- WSU faculty, staff, and students with WSU ID
- Summit Library members, who may use their home library's card

Guests may borrow books, DVDs and other library materials. If you are not actively affiliated with the university, you will not have remote access to most electronic resources or to some library-specific services.

### Loan Periods
{:#loanperiods}

Generally, cardholders can borrow an unlimited number of items. Loan periods will vary depending on your status and the type of material being borrowed. Note, equipment can not be loaned to guest accounts.

<table class="table table-bordered my-3">
  <thead>
    <tr>
      <th scope="col">Type of Material</th>
      <th scope="col">Loan Period</th>
      <th scope="col">Renewals</th>
    </tr>
  </thead>
  <tbody>
    {% for m in site.data.services_loan_periods %}
    <tr>
      <th scope="row">{{ m.material }}</th>
      <td>{{ m.loan_period }}</td>
      <td>{{ m.renewal }}</td>
    </tr>
    {% endfor %}
  </tbody>
</table>

### Fines and Late Fees
{:#fines}

The library no longer collects late fees or fines for items in our general collection as part of our commitment to equitable access to information and student affordability.

Some items in the library, such as <a href="{{ '/services/reserve/' | relative_url }}">print Course Reserves</a> or U of I Multimedia equipment, are exceptions to this policy and will continue to accrue late fees. In addition, the library will continue assessing lost item fees to patrons. Items move into lost status when they have not been returned 15 days after the assigned due date, at which time patrons are charged a $100 fee ($80 replacement item cost and $20 processing fee).

If you have questions about which items have late fees and which don't, or want to supply your own replacement copy, please contact our Access Services/Circulation Desk at 208-885-6559 and we'd be happy to assist you.

<table class="table table-bordered my-3">
  <thead>
    <tr>
      <th scope="col">Item Type</th>
      <th scope="col">Cost per Day</th>
      <th scope="col">Fine Cap</th>
      <th scope="col">Replacement Fee</th>
    </tr>
  </thead>
  <tbody>
    {% for i in site.data.services_loan_fees %}
    <tr>
      <td>{{ i.item }}</td>
      <td>{{ i.per_day }}</td>
      <td>{{ i.fine_cap }}</td>
      <td>{{ i.replacement_fee }}</td>
    </tr>
    {% endfor %}
  </tbody>
</table>

### Renewing Library Materials
{:#renew}

Three options available for renewing:

- Online at <a href="https://alliance-uidaho.primo.exlibrisgroup.com/discovery/account?vid=01ALLIANCE_UID:UID" >Your Library Account</a>, where you can also see what items are checked out to you and when they are due
- By telephone at <strong>(208) 885-6559</strong>
- In person at the Circulation Desk (1st floor)

To better ensure equal opportunity to use the library's physical items for the entire U of I community, checked out items may be renewed twice upon request, then must be physically returned to the Circulation Desk to be checked in. If the item is not otherwise requested or recalled, then it may be checked out again.
