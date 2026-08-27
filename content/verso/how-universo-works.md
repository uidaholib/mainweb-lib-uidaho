---
title: How UniVERSO Works
section: VERSO
permalink: /verso/how-universo-works.html
layout: page
search: true
keywords: UniVERSO; AI search; semantic search; embeddings; MindRouter
description: "A technical walkthrough of how UniVERSO ingests VERSO data, embeds it, matches it against your query, and generates AI responses using MindRouter."
page_nav:
    parent: /verso/universo.html
    children:
---

UniVERSO does not maintain its own research records — it is a search and summarization layer built entirely on top of [VERSO](/verso/) data. At a high level, a query moves through four stages.

## 1. Pulling data from VERSO

On a regular refresh cycle, UniVERSO ingests researcher profiles and publication/creative-work records from the systems that power VERSO (Ex Libris Alma and Esploro). This includes researcher names, titles, departmental affiliations, keywords, research topics, biographies, and — for each output — titles, abstracts, publication venues, and dates. Where VERSO itself is missing an abstract, UniVERSO will attempt to backfill it from open scholarly databases (OpenAlex, with Semantic Scholar as a fallback) so more of the corpus is searchable.

This is a periodic sync, not a live connection — changes made in VERSO are not reflected in UniVERSO instantly. See [Editing Your Profile](/verso/profile.html) for how to update your VERSO record itself.

## 2. Embedding the data

Once ingested, publication text and researcher information are converted into **vector embeddings** — numerical representations that capture the *meaning* of the text, not just its exact wording. These embeddings are stored in a vector database (ChromaDB) as two parallel indexes: one for individual publications and creative works, and one for AI-generated researcher summaries (see below). This is what allows UniVERSO to match on concepts and topics rather than requiring the same words used in a researcher's profile.

## 3. Matching your query

When you ask a question, UniVERSO embeds your query the same way and searches both indexes for the closest conceptual matches. The candidate researchers that surface are then reranked using several signals together:

- How closely their **publications** match your query
- How closely their **AI-generated summary** matches your query
- Whether you **named them directly**
- Overlap between your query and their listed **keywords and research topics**

Results are also boosted for factors like publication recency and filtered to remove very low-signal record types, so the researchers and works you see are meant to reflect genuine topical relevance rather than raw keyword frequency.

## 4. Generating a response

The ranked researchers and publications are handed to a large language model (LLM), which writes a conversational overview of the results, highlights the most relevant researchers and works, and suggests natural follow-up questions. LLM calls are routed through **MindRouter**, the University of Idaho's in-house AI platform (with a general-purpose provider available as a fallback), so query traffic stays within university-managed infrastructure rather than depending solely on an outside vendor. You can ask follow-up questions in the same conversation, and UniVERSO will continue reasoning over the same set of results.

## AI-generated researcher summaries

In addition to answering live queries, UniVERSO periodically generates a standing summary for each eligible researcher, built exclusively from that researcher's own VERSO-linked publications, abstracts, and profile fields (keywords, title, department) — the LLM is not drawing on outside knowledge about a researcher's reputation or work. Each summary is produced in stages: main research themes, methods/approaches, broader impacts, primary areas of inquiry, a mentorship summary (for researchers who have advised theses or dissertations), and a final synthesis combining all of the above. These per-researcher summaries are what UniVERSO searches when it looks for a topical match to a researcher's overall body of work, separate from matching individual publications.

Because these summaries are generated automatically from limited profile data, they may not capture every nuance of someone's research — see [Managing Your AI-Generated Summary](/verso/universo.html#managing-your-ai-generated-summary) for how to review, revise, or opt out of yours.

------------------------------------------------------------------------

*Last updated: August 2026*
