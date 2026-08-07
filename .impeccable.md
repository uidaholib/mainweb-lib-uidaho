# mainweb-lib-uidaho

Jekyll static site for the University of Idaho Library (www.lib.uidaho.edu).

## Design Context

### Users

Three main audiences, often in the same session:

- **Current students & faculty** — finding hours, study rooms, course reserves, databases, research help. Task-focused, often on mobile between classes.
- **Researchers & grad students** — deeper tasks: archives, special collections, subject guides, citation tools, digital repository (Verso), makerspace (Mill), media studio (Studio), data services (Datahub).
- **Prospective students & the public** — alumni, donors, community members browsing services, exhibits, fellowships, giving pages. More exploratory, less task-driven.

### Brand Personality

The brand is inherited, not invented: this site deliberately mirrors the main University of Idaho site (www.uidaho.edu), reimplemented independently in Jekyll/Bootstrap instead of the university's Tailwind stack. The personality is the university's, not the library's own: confident, institutional, grounded in place (Idaho/Palouse-inspired earth and jewel tones), academically credible rather than trendy.

### Aesthetic Direction

**Strict brand compliance.** Treat the existing Bootstrap-uidaho theme as fixed — do not reinterpret or push past it, even on standard content pages. Sub-sections (Verso, Studio, Mill, Datahub, fellowships, etc.) use the same shared templates and are not separate sub-brands with their own visual identity.

Established system (see `docs/custom-bootstrap.md` and `docs/_variables.scss`):

- **Font**: Public Sans (self-hosted variable font, weights 100–900), loaded via `_includes/head.html`. Do not introduce other typefaces.
- **Corners**: square by default (`$enable-rounded: false`); `.rounded-*` utilities exist only for deliberate opt-in use.
- **Color palette** (10 official U of I brand colors, defined in `_variables.scss`):
  - `$pride-gold #F1B300`, `$raspberry #D7003F`, `$garnet #7A0017`, `$lupine #5E48FF`, `$huckleberry #261882`, `$clearwater #008080` (primary — teal used for focus rings, active states, `.btn-primary`), `$palouse #034441`, `$leather #AB4700`, `$bark #552301`, plus `$brand-black #191919` / `$brand-gray #F2F2F2` / `$brand-white #fff`.
  - Body text and links are brand-black, not pure black.
- **Type scale**: base 1.125rem/1.556 line-height; explicit heading sizes (h1 3.75rem → h6 1.375rem), headings weight 900, RFS fluid scaling on large headings only.
- **Containers**: wider than stock Bootstrap (640/768/1024/1280/1536), matching uidaho.edu's scale.
- **Icons**: Bootstrap SVG icons (icons.getbootstrap.com) or custom SVG — no icon font, no emoji-as-icon.
- **Theme**: light mode only. No dark mode variant exists or is planned.

### Design Principles

1. **Bootstrap classes first.** Reach for existing Bootstrap/bootstrap-uidaho utility classes before writing custom or inline CSS. Custom CSS belongs in `_sass/_custom.scss`.
2. **Reuse components, don't reinvent them.** Reusable features live as Jekyll includes in `_includes/components/`; check there before building a new pattern for something like callouts, resource lists, or page nav.
3. **Calm, not flashy.** Avoid heavy motion/animation — patrons use a wide range of devices and connections; interactions should be functional and unobtrusive, not decorative.
4. **WCAG 2.1 AA compliance** is required — this is a public university site. Maintain contrast, focus states (teal focus ring is load-bearing, don't override it), and semantic markup.
5. **Match, don't diverge from, uidaho.edu.** When in doubt about a pattern (spacing, component shape, color usage), the standard is "does this look like it belongs on the main university site," not "is this a fresh, distinctive design."
