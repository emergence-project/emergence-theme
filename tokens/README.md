# Design Tokens

Style Dictionary–formatted token source, mechanically extracted from this
theme's actual token files:

- `color.light.json`, `color.dark.json` — from `_data/theme_light.yml` /
  `_data/theme_dark.yml`
- `global.json` — from the non-color variables in
  `_sass/emergence/_variables.scss` (typography, spacing, radius,
  breakpoints, transitions, z-index)

These are the source of truth for values, not a separate design decision —
if you change a color, edit the `.yml` file (or `_variables.scss` for
global tokens) as before, then re-run the extraction below. Nothing in the
Jekyll build reads from `tokens/` yet; it's a portable export for use
outside this repo (Figma tokens plugins, a separate design tool, another
codebase).

## Format

Classic [Style Dictionary](https://styledictionary.com/) shape: nested
objects with a `value` leaf. Names match the CSS custom property they came
from, minus the category prefix — e.g. `--color-accent` becomes
`color.accent.value`, `--shadow-focus-ring` becomes
`shadow.focus-ring.value`. Running these through Style Dictionary's default
`name/cti/kebab` transform reconstructs the original `--color-accent`
variable name, so adopting a real build later is a drop-in, not a rename.

## Regenerating color.*.json

`color.light.json` / `color.dark.json` are generated from the theme YAML
files, not hand-maintained. After editing `_data/theme_light.yml` or
`_data/theme_dark.yml`, regenerate with:

```bash
ruby -ryaml -rjson -e '
["dark", "light"].each do |mode|
  data = YAML.load_file("_data/theme_#{mode}.yml")
  out = { "color" => {}, "shadow" => {}, "bg" => {} }
  data.each do |key, value|
    node = { "value" => value.to_s }
    if key.start_with?("color-")
      out["color"][key.sub("color-", "")] = node
    elsif key.start_with?("shadow-")
      out["shadow"][key.sub("shadow-", "")] = node
    elsif key.start_with?("bg-")
      out["bg"][key.sub("bg-", "")] = node
    else
      out[key] = node
    end
  end
  File.write("tokens/color.#{mode}.json", JSON.pretty_generate(out) + "\n")
end
'
```

`global.json` is hand-maintained since `_variables.scss` mixes real tokens
with SCSS-only constructs (mixins, the `:root` fallback block) that don't
translate 1:1 — update it by hand alongside `_variables.scss`.

## Not included

No Style Dictionary build config (`style-dictionary.config.js`) or `npm`
tooling is set up in this repo — that would add a Node build step to what
is otherwise a plain Jekyll site with no JS pipeline. Add one only if a
consumer actually needs generated platform output (iOS/Android constants,
another framework's CSS, etc.); until then this JSON is meant to be read
directly or fed into an external Style Dictionary build.

See `../COMPONENTS.md` for the component inventory these tokens back.
