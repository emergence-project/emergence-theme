---
title: About
layout: custom-page
icon: fas fa-info-circle
order: 4
permalink: /about/
slug: about
description: "How emergence balances atmosphere, structure, and interaction."
---

{% assign p = site.data.profile %}

<div class="about-content">
  <div class="about-profile">
    <img src="{{ p.avatar | relative_url }}" alt="" class="about-photo">
    <div class="about-identity">
      <h2>{{ p.name }}</h2>
      <p class="about-identity__affiliation">
        {{ p.program }}<br>
        {{ p.institution }}
      </p>
      {% if p.status %}
      <p class="about-identity__status">{{ p.status }}</p>
      {% endif %}
    </div>
  </div>

  <div class="about-section">
    <h3 class="section-title">design intent</h3>
    <div class="section-content">
      <p>Emergence pairs immersive light and dark environments with calm
      editorial surfaces. Images establish place; typography, spacing, and
      predictable navigation keep the content in control.</p>
    </div>
  </div>

  <div class="about-section about-section--system">
    <h3 class="section-title">how the system works</h3>
    <div class="section-content section-content--system">
      <p class="system-grammar__intro">Every visible shape has one of four
      roles. If an element is not environment, surface, signal, or control,
      it does not need decoration of its own.</p>

      <dl class="system-grammar">
        <div class="system-role">
          <dt class="system-role__identity">
            <span class="system-role__mark system-role__mark--field" aria-hidden="true"></span>
            <span>
              <span class="system-role__term">Field</span>
              <span class="system-role__label">continuous environment</span>
            </span>
          </dt>
          <dd class="system-role__description">
            <p>The glacier and stellar photographs form one uninterrupted
            place. The hero remains open so the environment can lead.</p>
            <p class="system-role__use"><span>seen in</span> background · hero</p>
          </dd>
        </div>

        <div class="system-role">
          <dt class="system-role__identity">
            <span class="system-role__mark system-role__mark--plane" aria-hidden="true"></span>
            <span>
              <span class="system-role__term">Plane</span>
              <span class="system-role__label">readable optical surface</span>
            </span>
          </dt>
          <dd class="system-role__description">
            <p>A translucent plane appears only when text needs contrast or
            several controls belong together. Its radius follows its role,
            not decoration.</p>
            <p class="system-role__use"><span>seen in</span> Horizon Rail · reading surface · project item</p>
          </dd>
        </div>

        <div class="system-role">
          <dt class="system-role__identity">
            <span class="system-role__mark system-role__mark--trace" aria-hidden="true"></span>
            <span>
              <span class="system-role__term">Trace</span>
              <span class="system-role__label">position and continuity</span>
            </span>
          </dt>
          <dd class="system-role__description">
            <p>Thin horizontal lines separate content and show where the
            reader is. Tabs stay textual because selection needs a trace,
            not another box.</p>
            <p class="system-role__use"><span>seen in</span> active navigation · tabs · section rules</p>
          </dd>
        </div>

        <div class="system-role">
          <dt class="system-role__identity">
            <span class="system-role__mark system-role__mark--point" aria-hidden="true"></span>
            <span>
              <span class="system-role__term">Point</span>
              <span class="system-role__label">single state or action</span>
            </span>
          </dt>
          <dd class="system-role__description">
            <p>A circle is reserved for one state or one control. That is why
            the environment switch is round while structural containers are
            not.</p>
            <p class="system-role__use"><span>seen in</span> theme control · focus · status · emergence dot</p>
          </dd>
        </div>
      </dl>

      <p class="system-grammar__environment"><strong>Two environments, one
      grammar.</strong> Deep Glacier and Stellar Field share structure without
      becoming simple color inversions. Each tunes transparency, edge
      contrast, shadow, and image crop for its own light.</p>
    </div>
  </div>

  <div class="about-section">
    <h3 class="section-title">try the system</h3>
    <div class="section-content">
      <p>Switch the environment, move through each collection, and open an
      entry to experience the reading layout, table of contents, tags, and
      related-content patterns.</p>
      <ul class="about-links">
        <li><a href="{{ '/' | relative_url }}">Explore projects</a></li>
        <li><a href="{{ '/notes/' | relative_url }}">Browse notes</a></li>
        <li><a href="{{ '/readings/' | relative_url }}">Browse readings</a></li>
      </ul>
    </div>
  </div>
</div>
