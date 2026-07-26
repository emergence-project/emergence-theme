---
title: Notes
layout: base
icon: fas fa-book
order: 2
permalink: /notes/
slug: notes
description: "Short demonstrations of typography, layout, tokens, and content structure."
---

<div class="page-bg"></div>
{% include nav.html %}

<main class="notes-home" id="main-content">
  <header class="notes-hero">
    <h1>notes<span class="notes-hero__dot">.</span></h1>
    <p>Short demonstrations of typography, layout, tokens, and content structure.</p>
  </header>

  <section class="notes-plane" aria-label="Notes index">
    {% assign grouped_notes = site.notes | sort: "date" | reverse | group_by: "subcategory" %}
    {% if grouped_notes.size > 0 %}
      {% for group in grouped_notes %}
        <section class="note-group">
          <header class="note-group__heading">
            <h2>{{ group.name | replace: "-", " " }}</h2>
          </header>
          <div class="note-list">
            {% for post in group.items %}
              {% include note-card.html note=post %}
            {% endfor %}
          </div>
        </section>
      {% endfor %}
    {% else %}
      <p class="notes-empty">No notes yet — add markdown files to <code>_notes/&lt;subcategory&gt;/</code>.</p>
    {% endif %}
  </section>
</main>
