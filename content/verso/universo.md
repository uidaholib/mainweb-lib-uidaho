---
title: About UniVERSO
section: VERSO
permalink: /verso/universo.html
layout: page
search: true
keywords: UniVERSO; AI search; research discovery
description: "UniVERSO is the University of Idaho's AI-powered research discovery tool for finding researchers and expertise using plain-language search over VERSO profiles and publications."
page_nav:
    parent: /verso/
    children:
        - /verso/how-universo-works.html
page_callout:
    title: UniVERSO
    text: Discover Idaho research and expertise with AI-powered search
    link: https://universo.uidaho.edu
    link-text: Try UniVERSO
    color: palouse
page_resources:
    title: Resources
    links:
        - text: Edit Your VERSO Profile
          link: /verso/profile.html
        - text: Request a Summary Change
          link: https://universo.uidaho.edu/feedback?category=profile_summary_change
        - text: Submit Your CV
          link: https://universo.uidaho.edu/feedback?category=cv_submission
        - text: UniVERSO Feedback
          link: https://universo.uidaho.edu/feedback?category=general_feedback
---

**UniVERSO** is an AI-powered research discovery tool built by the University of Idaho Library and the Institute for Interdisciplinary Data Sciences (IIDS). It lets anyone — students, faculty, staff, community partners, or the public — search for U of I researchers and expertise using plain-language questions instead of exact keywords, and it draws its answers from [VERSO](/verso/) profile and publication data.

UniVERSO is currently in **beta**. Data is still being ingested, ranking is still being tuned, and AI-generated answers may contain mistakes — always verify anything important against a researcher's VERSO profile directly.

**UniVERSO is not a second version of VERSO.** VERSO is the system of record — it holds your profile and publications, and it's where you make edits. UniVERSO is a discovery layer on top of that record: you ask it a question in ordinary language and it points you to people and their work. You don't edit anything in UniVERSO. You edit in VERSO, and it flows through on the next refresh.

<nav aria-label="Jump to a section" class="p-3 mb-4 border">
    <span class="fw-bold text-uppercase small me-2">Jump to a section:</span>
    <a href="#what-you-can-use-it-for" class="btn btn-sm btn-outline-secondary m-1">What You Can Use It For</a>
    <a href="#how-universo-works" class="btn btn-sm btn-outline-secondary m-1">How UniVERSO Works</a>
    <a href="#improving-your-results" class="btn btn-sm btn-outline-secondary m-1">Improving Your Results</a>
    <a href="#managing-your-ai-generated-summary" class="btn btn-sm btn-outline-secondary m-1">Managing Your AI-Generated Summary</a>
    <a href="#good-to-know" class="btn btn-sm btn-outline-secondary m-1">Good to Know</a>
    <a href="#questions-or-feedback" class="btn btn-sm btn-outline-secondary m-1">Questions or Feedback</a>
</nav>

## What You Can Use It For

- **Finding a collaborator or co-investigator.** Describe a research problem or methodology in your own words and see which faculty members' published work relates to it — including connections across departments that a keyword search might miss.
- **Finding an advisor or mentor.** Prospective and current graduate students can search by topic to identify faculty whose research and student mentorship history align with their interests.
- **Scoping expertise for a grant, media inquiry, or partnership.** Quickly identify who at the university works in a given area, along with representative publications, without needing to know the exact terminology a department uses internally.
- **Exploring a department or unit's research footprint.** Ask about a specific college, department, or program to see the researchers and work associated with it.
- **General research exploration.** Because UniVERSO uses conceptual (semantic) search rather than strict keyword matching, it can surface related work in adjacent fields — for example, a query about "machine learning in agriculture" may also return researchers working on "precision farming" or "crop yield prediction."

UniVERSO only knows about researchers and publications that exist in VERSO. If someone doesn't have a VERSO profile, or their VERSO profile is sparse, they are less likely to be discoverable — see [Improving Your Results](#improving-your-results) below.

## How UniVERSO Works

UniVERSO does not maintain its own research records — it is a search and summarization layer built entirely on top of VERSO data, pulling profiles and publications in, embedding them for conceptual search, matching them against your query, and generating a response with AI (via MindRouter). This also covers how the per-researcher AI summaries are generated. See [How UniVERSO Works](/verso/how-universo-works.html) for the full technical walkthrough.

## Improving Your Results

UniVERSO's ability to find and correctly represent you depends entirely on the richness of your VERSO profile.

The two highest-impact things you can do are **add more of your publications** and **add abstracts to them**. Everything UniVERSO says about you is built from that material, so a profile with ten well-described works represents you far better than one with three bare titles.

- **Add your publications and creative works**, and make sure the association is correct. The more of your work that's connected to your profile, the more accurately UniVERSO can represent your expertise — and the more likely you are to surface for a question in an area you actually work in.
- **Add abstracts to your publications.** A title alone gives the system very little to match on. An abstract gives it a paragraph of your own subject matter, in your own terms. Where VERSO is missing an abstract, UniVERSO tries to backfill it from open scholarly databases, but your own abstract is always better than a backfilled one.
- **Send us your CV and we'll do it in bulk.** If adding works one at a time isn't realistic, [submit your CV](https://universo.uidaho.edu/feedback?category=cv_submission) and we'll batch-add the items to your profile — usually within one to three business days, depending on what else is in the queue. This is the fastest way to go from a sparse profile to a full one.
- **Add keywords to your VERSO profile.** Include both broad terms (e.g., "environmental science") and specific ones (e.g., "soil carbon sequestration"). Keywords directly inform both search matching and the AI summary.
- **Write a bio and list research interests.** These fields feed directly into your AI-generated summary. If you write a full research overview, UniVERSO will use it in place of a generated summary — see [Managing Your AI-Generated Summary](#managing-your-ai-generated-summary).
- **Connect your ORCID** so your publications are reliably attributed to you rather than left unlinked.
- **Keep your profile current.** UniVERSO's picture of your work is only as recent as your VERSO profile and UniVERSO's last data refresh.

Instructions for making these changes live on the [Editing Your Profile](/verso/profile.html) page.

## Managing Your AI-Generated Summary

Your AI-generated summary is separate from your VERSO profile itself — it's a derived, algorithmically written overview that UniVERSO displays and searches. It is deliberately non-comprehensive: an overview of your main areas of work plus a few highlights, sourced from your own publications and profile data, not a CV.

Most faculty won't need to do anything here. The options, from least to most effort:

**Nothing to do**

- **Leave it as is.** Your get the AI-generated overview described above, drawn from your own VERSO-linked work. 
- **Already wrote a research overview in VERSO? It's already in use.** If you have a self-written overview in your VERSO profile, UniVERSO pulls it in automatically and shows it in place of a generated summary. There's nothing to send us. 
  

**Tell us what to change**

- **Add Your Own** -- If you would like to control what's written in the summary, [add your bio/research summary in VERSO](https://verso.uidaho.edu/esploro/settings/about?institution=01ALLIANCE_UID) (*Sign In* → *Edit Profile* → *About* → *Describe Your Research*) and it will come through on the next refresh (email us at lib-verso@uidaho.edu if you'd like it up sooner).
- **Request a revision.** If your summary is inaccurate, outdated, or doesn't reflect your work the way you'd like, [tell us what should change](https://universo.uidaho.edu/feedback?category=profile_summary_change). You can also copy the summary, edit it yourself, and send us the edited version — we'll use it as written. Or just describe what's wrong and we'll make the fix.
- **Give the generator standing notes.** If there's something the summary keeps getting wrong or keeps leaving out — a subfield it misreads, a project it ignores, a term you don't use for your own work — [send us a note](https://universo.uidaho.edu/feedback?category=profile_summary_change) and we'll attach it to every future summary generated for you. Unlike a one-time edit, this holds as your publications change and your summary is regenerated.
- **Opt out of AI summarization.** If you'd prefer that no AI-generated summary be produced for you at all, [request an opt-out](https://universo.uidaho.edu/feedback?category=profile_opt_out) and we will exclude you from future summary generation. 
  - Let us know in your request if you'd like to be opted out of just the summary (we'll disable the summarization) or of UniVERSO entirely (we'll delete you from the system). 

### Contolling what Outputs Appear

Hiding a work or field directly in VERSO (see the *Privacy* section of [Editing Your Profile](/verso/profile.html)) removes it from both VERSO and UniVERSO. Nothing you do in UniVERSO changes anything in VERSO itself.

## Good to Know

- **UniVERSO is in beta.** Answers and summaries are AI-generated and may contain mistakes; data ingestion and ranking are still being refined.
- **Summaries are built only from your own material.** The model writing your summary is given your VERSO-linked publications, abstracts, and profile fields.
- **Coverage is limited to VERSO.** If a researcher or publication doesn't appear, it may not yet be represented in VERSO.
- **Match scores are query-specific.** The relevance percentage shown for a result reflects how closely it matches *your particular question* — the same publication can score differently for a different query.
- **Data isn't live.** UniVERSO refreshes from VERSO on a regular schedule rather than syncing instantly, so very recent VERSO changes may take some time to appear.

## Questions or Feedback

Use the form that matches what you need — it routes your message to the right place and saves us a round of clarifying email. If none of them fit, use [General Feedback](https://universo.uidaho.edu/feedback) or email <lib-verso@uidaho.edu>.

**About the tool**

- [Report a bug](https://universo.uidaho.edu/feedback?category=bug_report) — something is broken or behaving unexpectedly
- [Request a feature](https://universo.uidaho.edu/feedback?category=feature_request) — something you wish it did
- [Report a data quality issue](https://universo.uidaho.edu/feedback?category=data_quality) — wrong, missing, or misattributed records
- [General feedback](https://universo.uidaho.edu/feedback?category=general_feedback) — anything else

**About your own profile**

- [Request a summary change](https://universo.uidaho.edu/feedback?category=profile_summary_change) — revise, replace, or add standing notes to your AI summary
- [Request an opt-out](https://universo.uidaho.edu/feedback?category=profile_opt_out) — remove your AI summary, or remove yourself from UniVERSO
- [Submit your CV](https://universo.uidaho.edu/feedback?category=cv_submission) — we'll batch-add your works to your VERSO profile

------------------------------------------------------------------------

*Last updated: August 2026*
