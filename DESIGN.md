# emergence — Design System

## Goal

This theme favors a portfolio that reads fast over one that decorates. The
visual language borrows from academic documents and editorial layout, not
from any single existing template. Content is the subject; the design system
gets out of its way.

## Information Structure

Projects carry two independent axes:

1. `project_type` — the nature of the work, used as the page's primary grouping.
   - `research`: research implementations
   - `systems`: software & design systems
2. `status` — completeness, shown as secondary information inside each entry.
   - `completed`
   - `in-progress`
   - `planned`

Within each group, the first project by `order` gets an accent-colored
border. Card size and title size are uniform across all entries — importance
is communicated by order and color, not by a separate "featured" treatment.

## Visual Principles

### 1. The work is the subject

- The homepage hero opens with `projects.`, not a name or tagline.
- A group heading is immediately followed by its entries.
- There is no separate legend explaining the grouping — the section headings do that work.

### 2. Reduce decoration, strengthen hierarchy

- No card backgrounds, glow, or large icon thumbnails.
- Structure comes from thin rules, type size, and whitespace.
- Tags render as a quiet, dot-separated text list instead of colored badges.
- In prose lists, top-level items use a filled bullet (`•`); nested sub-items use an open bullet (`◦`) and a lighter color. As hierarchy deepens, ink decreases.

### 3. Don't mix type and status

- `project_type` decides which section an entry lives in.
- `status` is shown only as a small dot + label inside the entry.
- Projects of different maturity but the same type stay in the same group; projects of the same maturity but different type never share a group.

### 4. One accent color

- Light mode: near-white background, near-black text.
- Dark mode: neutral near-black surface, near-white text.
- Both themes use exactly one restrained accent color, for links, current-location indicators, and completed status.

### 5. System font stack

- The SF Pro system font stack throughout.
- Body text is Regular; entry titles are Semibold.
- Only the page hero uses Light weight, so it can be large without feeling heavy.
- No monospace decorative labels.

## Interaction

- Links respond with color and underline only.
- No lifting or glowing card-hover effects.
- Keyboard focus is a visible accent-colored outline.
- On mobile, group headings and entry lists stack into a single column.

## Theme Tokens

Colors are managed in `_data/theme_dark.yml` and `_data/theme_light.yml`.
`_sass/emergence/_variables.scss` carries matching fallback values for when
the data files aren't loaded (e.g. linting the SCSS standalone). Most
`shadow-*` and glow tokens are intentionally set to `none` — this system does
not use elevation to express hierarchy.

The same tokens are also exported as portable Style Dictionary JSON in
[`tokens/`](tokens/), for use outside this repo (Figma tokens plugins, a
separate design tool, another codebase). [`COMPONENTS.md`](COMPONENTS.md)
catalogs every reusable component these tokens back, source file included —
the reference point for anyone building a Figma component library.

Optional design systems live under [`presets/`](presets/). A palette preset
may replace only the light/dark YAML token pair; an expressive preset may also
provide imagery, Sass partials, layouts, and page composition. Every preset
must preserve the content model, accessible interaction contracts, and the
existing light/dark preference, and must document every file it replaces.
Presets are installation-time choices, not additional runtime theme modes.

The neutral flat editorial system remains the foundation and portable baseline
described above. The checked-out anonymous demo intentionally has the
[`glacier-stellar`](presets/glacier-stellar/) preset applied so the advertised
design can be experienced immediately. Its glacier and galaxy photographs are
primary environment layers, while translucent optical surfaces make the same
content contracts readable over those images. Re-running the preset installer
restores that demo state after experimentation.

## Content Model

- **Projects** (`_projects/`) — the homepage. Grouped by `project_type`, sorted by `order` within each group.
- **Notes** (`_notes/<subcategory>/`) and **Readings** (`_readings/<subcategory>/`) — grouped automatically by whatever `subcategory` values exist in the content, newest first. No hardcoded category list.
- **About** (`_tabs/about.md`) — anonymous system identity followed by design
  intent, the reader-facing Field / Plane / Trace / Point grammar, and links
  into the sample collections. The environment distinction is summarized
  inside the grammar rather than repeated as a separate section. Sections
  remain inside one Reading plane and use Trace dividers instead of nested
  cards.
