---
title: "Responsive Reading Width"
date: 2025-02-10 00:00:00 +0000
description: "Keeping long-form text comfortable from phones to wide screens."
categories: [Notes, Layout]
subcategory: layout
tags: [layout, responsive, readability]
math: false
toc: true
sitemap: false
---

## Overview

Long lines slow scanning, while overly narrow columns fragment sentences.
Responsive reading width keeps prose comfortable without making the layout
feel fixed.

## Practical range

Use a readable maximum width, flexible outer gutters, and a single-column
fallback before space becomes tight.

## Example

```scss
.reading-surface {
  width: min(100% - 2rem, 68rem);
  margin-inline: auto;
}
```

The exact number matters less than keeping the relationship between text,
navigation, and the visual environment stable.
