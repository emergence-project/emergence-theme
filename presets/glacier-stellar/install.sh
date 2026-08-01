#!/bin/sh

set -eu

preset_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
theme_root=$(CDPATH= cd -- "$preset_dir/../.." && pwd)

if [ ! -f "$theme_root/_config.yml" ] || [ ! -d "$theme_root/_sass/emergence" ]; then
  echo "Run this installer from inside a glacier-stellar checkout." >&2
  exit 1
fi

mkdir -p \
  "$theme_root/_data" \
  "$theme_root/_includes" \
  "$theme_root/_layouts" \
  "$theme_root/_sass/emergence/pages" \
  "$theme_root/_tabs" \
  "$theme_root/assets/img/common"

cp "$preset_dir/theme_dark.yml" "$theme_root/_data/theme_dark.yml"
cp "$preset_dir/theme_light.yml" "$theme_root/_data/theme_light.yml"

for asset in \
  bg-dark.jpg bg-dark-1920.avif bg-dark-1920.webp \
  bg-dark-3840.avif bg-dark-3840.webp \
  bg-light.jpg bg-light-1920.avif bg-light-1920.webp \
  bg-light-3840.avif bg-light-3840.webp \
  social-preview.jpg; do
  cp "$preset_dir/assets/$asset" "$theme_root/assets/img/common/$asset"
done

ruby -e '
config_path = ARGV.fetch(0)
source = File.read(config_path)
png_path = "/assets/img/common/social-preview.png"
jpg_path = "/assets/img/common/social-preview.jpg"

if source.include?(png_path)
  File.write(config_path, source.gsub(png_path, jpg_path))
elsif !source.include?(jpg_path)
  warn "Preset installed, but _config.yml uses a custom social preview. Update it manually if desired."
end
' "$theme_root/_config.yml"

for partial in _variables.scss _base.scss _typography.scss _components.scss _navigation.scss; do
  cp "$preset_dir/scss/$partial" "$theme_root/_sass/emergence/$partial"
done

for page in _projects.scss _notes.scss _readings.scss _about.scss _post.scss; do
  cp "$preset_dir/scss/pages/$page" "$theme_root/_sass/emergence/pages/$page"
done

cp "$preset_dir/includes/nav.html" "$theme_root/_includes/nav.html"
cp "$preset_dir/includes/project-card.html" "$theme_root/_includes/project-card.html"
cp "$preset_dir/layouts/base.html" "$theme_root/_layouts/base.html"
cp "$preset_dir/layouts/post.html" "$theme_root/_layouts/post.html"
cp "$preset_dir/tabs/notes.md" "$theme_root/_tabs/notes.md"
cp "$preset_dir/tabs/readings.md" "$theme_root/_tabs/readings.md"
cp "$preset_dir/index.html" "$theme_root/index.html"

echo "Installed the Glacier / Galaxy preset."
