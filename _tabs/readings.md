---
title: Readings
layout: base
icon: fas fa-book-open
order: 3
permalink: /readings/
slug: readings
description: "Notes on design principles, web craft, and sustainable publishing."
---

<div class="page-bg"></div>
{% include nav.html %}

<main class="readings-home" id="main-content">
  <header class="readings-hero">
    <h1>readings<span class="readings-hero__dot">.</span></h1>
    <p>Notes on design principles, web craft, and sustainable publishing.</p>
  </header>

  <section class="readings-plane" aria-label="Readings index">
    {% assign grouped_readings = site.readings | sort: "date" | reverse | group_by: "subcategory" %}
    {% if grouped_readings.size > 0 %}
      {% for group in grouped_readings %}
        <section class="reading-group">
          <header class="reading-group__heading">
            <h2>{{ group.name | replace: "-", " " }}</h2>
          </header>
          <div class="reading-list">
            {% for item in group.items %}
              {% include reading-card.html reading=item %}
            {% endfor %}
          </div>
        </section>
      {% endfor %}
    {% else %}
      <p class="readings-empty">No readings yet — add markdown files to <code>_readings/&lt;subcategory&gt;/</code>.</p>
    {% endif %}
  </section>
</main>
