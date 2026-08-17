# mainweb-lib-uidaho

Jekyll static site for the University of Idaho Library (www.lib.uidaho.edu). Stack: Jekyll, Liquid templates, a customized Bootstrap build (`bootstrap-uidaho.css`).

## Ground rules for agents

- **Reuse before you build.** Reusable features live as Jekyll includes in `_includes/` (page nav, callouts, resource lists, breadcrumbs, chat widgets, etc.). Check there — and `docs/components.md` — before writing a new pattern for something a component may already do.
- **Bootstrap classes first.** Reach for existing Bootstrap / bootstrap-uidaho utility classes before custom or inline CSS. If custom CSS is genuinely needed, it belongs in `_sass/_custom.scss`.
- **Brand is inherited, not invented.** The site mirrors www.uidaho.edu's theme, reimplemented independently in Jekyll/Bootstrap. Treat the existing Bootstrap-uidaho theme as fixed — don't reinterpret it, introduce new typefaces/icon fonts/colors, or push past what's documented in `docs/custom-bootstrap.md` and `docs/_variables.scss`, even on standard content pages. Sub-sections (Verso, Studio, Mill, Datahub, fellowships, etc.) share the same templates and are not separate sub-brands.
- **Calm, not flashy.** Avoid heavy motion/animation — patrons use a wide range of devices and connections. Interactions should be functional and unobtrusive.
- **Keep it simple.** This is a small, informal team project (see `docs/contributing.md`). Prefer the plain, obvious solution over new abstractions, plugins, or build tooling.
- **WCAG 2.1 AA** is required — this is a public university site. Preserve contrast, focus states (the teal focus ring is load-bearing, don't override it), and semantic markup.

Quick brand facts (full detail in `docs/custom-bootstrap.md` / `docs/_variables.scss`): font is Public Sans only; corners are square by default (`$enable-rounded: false`); primary color is teal `$clearwater`; icons are Bootstrap SVG icons or custom SVG, no icon fonts or emoji-as-icon; light mode only, no dark mode.

## Where to look

- `docs/contributing.md` — branch/PR workflow and deploy process. `main` should always be deployable; larger changes (new features, nav/global changes, reorganization) go through a feature branch + PR, not directly to `main`.
- `docs/custom-bootstrap.md` + `docs/_variables.scss` — the full brand system (colors, type scale, containers, corners).
- `docs/components.md` — how includes/components work and how they read site data (`_data/`).
- `docs/page_setup.md` — required front matter for pages, and the `page_nav` / `page_callout` / `page_resources` options.
- `docs/site_search_setup.md` — how the client-side Flexsearch index is built; relevant when adding/changing front matter that affects search.

## Testing

- Dev server: `bundle exec jekyll s`
- Production build: `rake deploy`

Check the build succeeds and view affected pages in the dev server before considering a change done. Often your user might have a dev site going at http://127.0.0.1:4000/ already when working so check that first.
