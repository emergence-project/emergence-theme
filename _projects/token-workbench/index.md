---
title: "Token Workbench"
description: "A portable color and type token set shared by both visual environments."
tags: [Design Tokens, YAML, SCSS]
order: 1
status: completed
project_type: systems
---

## Brief

Keep color, depth, imagery, and interaction decisions inspectable outside any
single stylesheet.

## Decisions

- Store active site values in readable YAML.
- Mirror fallbacks in Sass for standalone compilation.
- Publish portable JSON for design-tool and application experiments.

## Result

Light and dark environments share the same semantic token names, so switching
themes changes optical treatment without changing structure.

## Try it

Toggle the theme, then inspect the token files under `_data/` and `tokens/`.
