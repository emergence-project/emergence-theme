---
title: "Building a Modular Type Scale"
date: 2025-02-01 00:00:00 +0000
description: "A repeatable method for sizing headings and body text."
categories: [Notes, Typography]
subcategory: typography
tags: [typography, scale, rhythm]
math: true
toc: true
sitemap: false
---

## Overview

A modular scale creates clear hierarchy from a small set of related values.

## Scale

Starting with a base size $t_0$ and ratio $r$, each step can be written as:

$$
t_n = t_0 r^n
$$

The numbers are a starting point. Reading distance, line length, and font
metrics still decide the final values.

## Application

Emergence uses fluid heading ranges and a stable body size so the hierarchy
survives viewport changes without abrupt jumps.
