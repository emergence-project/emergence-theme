# Component Inventory

A catalog of every reusable UI piece in the `emergence` design system, for
whoever builds the Figma component library — each entry names the source
markup/SCSS, the variants and states that exist today, and which
[design tokens](tokens/) it draws on. Keep this in sync when a component's
markup or SCSS changes; it's the map back to source, not a copy of it.

Token names below are written as `category.name` (see `tokens/color.*.json`
/ `tokens/global.json`) — the matching CSS custom property is
`--category-name`.

## Navigation

### Top nav bar

- Source: `_includes/nav.html`, `_sass/emergence/_navigation.scss`
- Class: `.top-nav`
- Children: `.logo`, `.nav-links` (with per-link `.active` state), `.theme-toggle`, `.nav-hamburger`
- States: link `.active` (current page), hamburger open/closed (mobile, JS-driven), hover/focus on all links and buttons
- Variants: desktop (horizontal links) vs. mobile (`.nav-hamburger` + collapsible `.nav-links`) — breakpoint `breakpoint.tablet`
- Tokens: `color.bg-nav`, `color.nav-border`, `blur.nav`, `color.accent` (active link)

### Theme toggle

- Source: `.theme-toggle` button inside `nav.html`, icon swapped via JS (`fa-sun` / `fa-moon`)
- States: light / dark (icon + `data-theme` attribute on `<html>`)
- Mobile: 44px hit area with the visible Point inset to its original 36px size
- Tokens: `color.accent`, `shadow.toggle`, `shadow.toggle-hover`

## Buttons, Tags, Badges

### Button

- Source: `_sass/emergence/_components.scss`
- Classes: `.btn` (base), `.btn-primary` (variant), `.btn-large` (size variant)
- States: default, `:hover` (lift + glow), `:active` (press)
- Tokens: `color.btn-bg`, `color.btn-bg-hover`, `color.btn-primary-bg`, `color.text-primary`, `radius.sm` / `radius.md` (large), `spacing.xs`, `spacing.lg`

### Tag / Badge

- Source: `_sass/emergence/_components.scss`
- Classes: `.tag`, `.badge` (identical styling, different semantic use)
- States: default, `:hover` (accent-tinted background)
- Tokens: `color.tag-text`, `color.tag-bg`, `color.tag-border`, `color.accent-bg-light`, `radius.md`

### Project/note/reading tag list

- Source: inline `<ul>` inside `project-card.html`, `note-card.html`, `reading-card.html`
- Classes: `.project-entry__tags`, `.note-entry__tags`, `.reading-entry__tags`
- Rendering: plain text list, dot-separated via `::after` content — not the `.tag`/`.badge` pill style. Distinct component, same data (topic tags), different visual treatment (matches DESIGN.md's "quiet text list, not colored badges").
- Tokens: `color.text-tertiary`, `color.separator`

## Cards

### Glass card

- Source: `_sass/emergence/_components.scss`
- Class: `.glass-card`
- States: default, `:hover` (lift + background/border shift)
- Note: legacy/general-purpose card component. The active project/note/reading list components below do **not** use this — they're flat, bordered, no-elevation per DESIGN.md's "no card glow" rule. Confirm with design before using `.glass-card` in new work.
- Tokens: `color.bg-glass`, `color.bg-glass-hover`, `color.border-glass`, `color.border-glass-hover`, `blur.glass`, `radius.xl`, `spacing.lg`

### Project entry card

- Source: `_includes/project-card.html`, `_sass/emergence/pages/_projects.scss`
- Class: `.project-entry`
- Structure: index number + status badge (`.project-entry__meta`) → title (`.project-entry__title`) → description → tag list → conditional "view project" link
- Variants (BEM modifiers on root): `.project-entry--completed`, `.project-entry--in-progress`, `.project-entry--planned` (mirrors `project.status`); `.project-entry--featured` (first item per type, accent border)
- States: `:hover` / `:focus-within` — only on `--completed` (others aren't clickable, no link rendered)
- Sub-parts: `.project-entry__status--completed` / `--in-progress` (color-coded dot + label)
- Tokens: `color.accent` (featured border, completed status), `color.status-progress`, `color.separator`, `font.size.project-heading`

## Project Page

### Hero

- Source: `index.html`, `_sass/emergence/pages/_projects.scss`
- Classes: `.project-hero`, `.project-hero__dot` (accent-colored trailing period)
- Tokens: `color.accent`, `font.size.display`, `font.weight.light`

### Category tabs

- Source: `index.html` (ARIA `role="tablist"`/`role="tab"`), `_sass/emergence/pages/_projects.scss`, inline `<script>` in `index.html` for tab-switching + arrow-key navigation
- Classes: `.project-tabs` (container), `.project-tab` (button, with `.project-tab__number` prefix), `.project-panel` (content, `[hidden]` when inactive)
- States: `.project-tab.active` (`aria-selected="true"`), `:hover`, `:focus-visible`
- Tokens: `color.accent` (active underline + number), `color.text-tertiary` (inactive tab), `color.separator`

## Notes / Readings

### Group heading + list

- Source: `_sass/emergence/pages/_notes.scss`, `_readings.scss` (structurally identical, different collection)
- Classes: `.note-group` / `.reading-group`, `.note-group__heading` / `.reading-group__heading`, `.note-list` / `.reading-list`
- Grouping: by `subcategory` front matter value, not hardcoded — see DESIGN.md Content Model

### Entry row

- Source: `_includes/note-card.html` / `reading-card.html`
- Classes: `.note-entry` / `.reading-entry` (whole row is a link), `__title`, `__date`, `__tags`
- States: `:hover` (inherits link/anchor default — no bespoke hover style beyond text)
- Empty state: `.notes-empty` / `.readings-empty` (shown when collection has zero published entries)

## About Page

### Profile block

- Source: `_tabs/about.md`, `_sass/emergence/pages/_about.scss`
- Classes: `.about-profile` (flex row), `.about-photo` (168px / 128px mobile, `object-fit: cover`), `.about-identity`, `.about-identity__ko`, `.about-identity__affiliation`, `.about-identity__status` (conditional, shown only if `p.status` set)

### Section block

- Source: same files
- Classes: `.about-section` (repeated for design intent, system grammar, and demo links), `.section-title`, `.section-content`
- Structure: all sections remain inside one Reading plane and use separator Traces rather than nested cards

### System grammar

- Source: same files
- Classes: `.system-grammar`, `.system-role`, `.system-role__identity`, `.system-role__mark`, `.system-role__term`, `.system-role__label`, `.system-role__description`, `.system-role__use`
- Variants: `--field`, `--plane`, `--trace`, and `--point` render small visual specimens for the four form roles
- Responsive: two-column term/description rows collapse to a single column at the tablet breakpoint

### Optional identity-site variants

- The stylesheet retains publication, social-link, and CV classes for sites
  that replace the anonymous demo profile with a personal identity.

### Publication list

- Source: same files
- Classes: `.publication-list`, `.publication-entry`, `.publication-entry__title` (conditionally a link if `pub.url` set), `.publication-entry__meta`

### Social links + CV button

- Source: same files
- Classes: `.about-links` (icon + label list, each `<li>` conditional on the profile field being set), `.about-cv-link` (button-styled download link)
- Icons: FontAwesome (`fab fa-github`, `fab fa-linkedin`, `fas fa-envelope`, `fab fa-instagram`, `fas fa-download`)

## Post / Article Page

- Source: `_layouts/post.html`, `_sass/emergence/pages/_post.scss`
- Classes: `.post-container`, `.post-header`, `.post-title`, `.post-meta`, `.post-date`, `.post-tags` / `.post-tag`, `.post-body`, `.post-content`
- Sidebar: `.left-sidebar`, `.sidebar-section`, `.sidebar-title`, `.sidebar-tags` / `.sidebar-tag`, `.toc-list` / `.toc-item` / `.toc-link` (table of contents)
- Breadcrumb: `.breadcrumb`, `.breadcrumb-item`, `.breadcrumb-separator`
- Prev/next navigation: `.post-navigation`, `.nav-previous` / `.nav-next`, `.nav-label`, `.nav-title`
- Related posts: `.related-posts`, `.related-title`, `.related-grid`, `.related-card`, `.related-card-title`, `.related-card-date`, `.related-card-desc`
- Comments mount point: `.post-comments` (integration point, not a styled component itself)

## Layout Primitives

- `.custom-page-container` — width-capped, centered content column used by every top-level tab page (`_layouts/custom-page.html`), with fade-in on load
- `.page-bg` — fixed full-viewport background layer driven entirely by `bg.*` tokens (solid color by default; `bg.image` can switch it to an image + overlay)

## Footer

- Source: `_layouts/base.html` (markup shared by every page), `_sass/emergence/_base.scss`
- Classes: `.site-footer` (the only one actually applied — `_layouts/base.html` uses it unconditionally). `.site-footer-home` is defined in `_base.scss` but not referenced in any `.html` file — dead CSS, don't build a Figma variant for it. The homepage's distinct footer spacing comes from a `.project-home + .site-footer` adjacent-sibling override in `pages/_projects.scss`, not from a footer modifier class.

## Typography Primitives

- Source: `_sass/emergence/_typography.scss`
- Base: unstyled-by-default `h1`–`h6` scale (weights taper from `font.weight.thin` at `h1` down to `font.weight.regular` at `h5`/`h6` — this is a bare type ramp, not a "heading component")
- Page-level: `.page-hero`, `.page-title`, `.page-subtitle` — used by simpler tab pages that don't need the full custom hero markup notes/readings/projects have (`.notes-hero`, `.project-hero`, etc. are page-specific and documented above; these are the generic fallback)
- Utility classes: `.text-center` / `.text-left` / `.text-right`, `.text-caption`, `.text-small`, `.card-title`, `.content-list` — spot-check usage before Figma-izing; some may be legacy from before the editorial redesign

## Spacing Utilities

- Source: `_sass/emergence/_base.scss`
- Classes: `.mt-sm` / `.mt-md` / `.mt-lg` / `.mt-xl`, `.mb-sm` / `.mb-md` / `.mb-lg` / `.mb-xl`, `.p-sm` / `.p-md` / `.p-lg` / `.p-xl` — direct utility mapping to `spacing.*` tokens, not really "components." Worth representing in Figma as spacing tokens/auto-layout gap presets rather than as component variants.

## Not yet inventoried

Nothing else turned up in a full class-name sweep of `_sass/emergence/`
(`_base.scss`, `_components.scss`, `_navigation.scss`, `_typography.scss`,
and everything under `pages/`) — no modal, toast, or form-input styles
exist in this theme today. If a future page introduces one, add it here.
