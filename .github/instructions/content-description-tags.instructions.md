---
description: Generate concise, search-focused frontmatter descriptions and semicolon-separated keywords for content markdown and HTML pages.
applyTo: "content/**/*.{md,html}"
---

<!-- Tip: Use /create-instructions in chat to generate content with agent assistance -->

Use these instructions when creating or updating the `description` and `keywords` values in frontmatter for pages in the `content/` folder, including both Markdown and HTML files.

Goal:
- Write a short description of what the page contains.
- Place that sentence in the frontmatter `description` field.

Requirements:
- Write exactly 1 sentence.
- Keep it brief, clear, and specific.
- Use plain, direct language in a declarative sentence.
- Include likely user search terms for the local library site search feature.
- Include broader SEO-friendly terms that match the page topic naturally.
- Describe the actual page content and primary use for visitors.

Style constraints:
- Do not use hype, promotional language, or exaggeration.
- Do not use em dashes.
- Do not use contrived or AI-sounding phrasing.
- Avoid vague filler words.

Quality check before finalizing:
- Is it 1 sentence?
- Does it accurately describe the page content?
- Does it contain useful keywords people would search for?
- Is the tone neutral and straightforward?

keywords:
- After writing the description, add or update the frontmatter `keywords` value.
- Use 2 to 3 keywords when possible.
- Do not use more than 5 keywords.
- Separate keywords with semicolons.
- Choose keywords that match page content and likely user search terms.
- Keep keywords short, specific nouns or noun phrases.
- Avoid duplicate keywords or near-synonyms in the same list.

keywords format example:
- `keywords: research help; citation guides; library workshops`