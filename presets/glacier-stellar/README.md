# Deep Glacier / Stellar Field design-system preset

This preset provides the image-led identity used by the repository's anonymous
live demo and packages it for reuse with the Emergence content model.

- **Deep Glacier** uses the glacial landscape as its light environment, with
  translucent ice surfaces, deep navy type, diffuse shadows, and soft blue
  optical edges.
- **Stellar Field** uses the galaxy photograph as its dark environment, with
  indigo glass, cool white type, cyan starlight, and restrained glow.

It is a complete installation-time design preset, not a color swap. It includes
JPEG fallbacks with 1920px and 3840px AVIF/WebP delivery derivatives, 93
light/dark environment tokens, matching Sass fallbacks and page partials, an
image-led homepage, collection indexes, long-form layouts, and
environment-specific image credits in the base layout. The normal light/dark
toggle remains the only runtime theme control. The governing form contract is
documented in [DESIGN.md](DESIGN.md).

## Install

The repository demo already has this preset applied. From the theme root,
re-run the installer to restore that state after experimentation or to apply
the preset in a fresh Emergence checkout:

```bash
./presets/glacier-stellar/install.sh
```

The installer replaces the active light/dark data, shared visual partials,
homepage, navigation, project-card and post templates, Notes/Readings index
templates, and the default social preview. It also updates the standard
`_config.yml` social-preview path from `.png` to `.jpg`; custom paths are left
alone with a warning. Commit or back up local design overrides before running
it, then rebuild the site.

Shared content contracts remain in the theme root: `_layouts/custom-page.html`,
`_includes/note-card.html`, and `_includes/reading-card.html` are intentionally
not duplicated.

## What remains stable

- `project_type` and `status` contracts
- project tab keyboard behavior
- active Projects, Notes, Readings, and tabs permalinks
- Notes, Readings, About, and project content
- the existing light/dark preference and toggle

The preset changes the environmental imagery, homepage composition, Horizon
Rail, optical surfaces, typography accents, depth, and interaction treatment.
It does not restore the historical Bento navigation or change collection
contracts.

## Source and license

The Stellar Field image is
[`Colorful galaxy` by Jeremy Thomas](https://unsplash.com/photos/blue-and-purple-galaxy-digital-wallpaper-E0AHdsENmDg);
the included base layout preserves that credit. Media licensing is documented
separately from the theme's software license in
[ASSET-LICENSES.md](ASSET-LICENSES.md).

Portable Style Dictionary representations of the preset values live in
`tokens/`.
