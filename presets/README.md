# Design-system presets

Presets are optional installation-time design systems. A small preset may
replace only `_data/theme_dark.yml` and `_data/theme_light.yml`; an expressive
preset may also provide imagery, Sass partials, layouts, and page composition.

A preset must document every file it replaces and preserve the content model,
accessible interactions, collection contracts, and the existing light/dark
preference. Presets do not add extra runtime theme modes.

- [`glacier-stellar`](glacier-stellar/) — a complete image-led system with a
  Glacier light environment and Galaxy dark environment
