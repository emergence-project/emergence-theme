---
title: "Front Matter as an Interface"
date: 2025-02-15 00:00:00 +0000
description: "Using a small metadata contract to keep content predictable."
categories: [Notes, Workflow]
subcategory: workflow
tags: [content, metadata, jekyll]
math: false
toc: false
sitemap: false
---

## Overview

Front matter connects plain-text content to navigation, grouping, status, and
page layout. A small stable schema makes the result easier to understand.

## Example

```yaml
title: "A clear title"
subcategory: workflow
tags: [content, metadata]
toc: true
```

## Guideline

Keep required fields few, document exact enum values, and let the renderer
provide sensible defaults.
