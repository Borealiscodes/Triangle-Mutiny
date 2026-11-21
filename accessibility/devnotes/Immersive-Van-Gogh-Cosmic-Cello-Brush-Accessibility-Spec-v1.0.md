# Attempted-to-Realized Accessibility & Architecture Specification: Uplifting `Immersive-Van-Gogh-Canvas` into a Tactile Cosmic Cello & Celestial Brush Adventure

**Document ID:** `TM-ACC-SPEC-VAN-GOGH-CELLO-V1.0`  
**Placement:** `Triangle-Mutiny/accessibility/devnotes/Immersive-Van-Gogh-Cosmic-Cello-Brush-Accessibility-Spec-v1.0.md`  
**Target Repository:** `Borealiscodes/Immersive-Van-Gogh-Canvas` (`v2.0.0` Uplift)  
**Upstream Primitives Synthesized:**  
* `Borealiscodes/ndh-retro-hw-pipeline` (`v1.0.0` — Deterministic `Q16.16` `RGB555` Framebuffer, `4×4` Bayer Impasto Dithering, GBA H-Blank Ripple & Brick-Wall Limited `<= 780 Hz` Audio)  
* `Borealiscodes/Zen-Shodo-Koan-Brush-Sanctuary` (`v1.0.0` — Zero-Dependency Celestial Brush Classifier `CIRCLE`, `SLASH`, `WAVE`, `CROSS` & `550 ms` Multi-Stroke Grouping)  
* `Borealiscodes/ndh-acoustic-math-toys` (`v1.0.0` — 5-Cell Unicode Braille `U+2800–U+28FF` Progress Bars & `aria-live` Parity)  
**Maintainer:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland)  
**Date:** November 21, 2026  

---

## 1. Executive Summary & Design Intent

Visual art games and interactive gallery experiences traditionally exclude blind, low-vision, and sensory-sensitive neurodivergent participants by relying on unguided mouse-painting hitboxes, harsh high-frequency audio loops, and visual-only progression cues. This specification defines the pre-build accessibility and engineering architecture for uplifting **`Borealiscodes/Immersive-Van-Gogh-Canvas`** into a gentle, contemplative **Cosmic Cello & Celestial Brush Painting Adventure** spanning two iconic canvases:

1. **Chapter I — *Starry Night* (Saint-Rémy Nocturne):** Painting swirling cobalt wind currents, golden starlight halos, a towering cypress silhouette, and radiant village star-bursts.
2. **Chapter II — *Sunflowers* (Arles Golden Still Life):** Painting sturdy ochre stems, sun-drenched seed crowns, curling cadmium-yellow petals, and warm afternoon light beams.

Rather than bolting accessibility onto a visual canvas after completion, every brushstroke in this uplift simultaneously paints deterministic **`Q16.16` `RGB555` impasto pixels**, bows a **velocity-responsive solo cello harmonic (`<= 780 Hz`)**, unlocks a **new orchestral chamber layer**, updates a **5-cell Unicode Braille progress bar**, and narrates the emerging painting via **`aria-live="polite"`**.

---

## 2. Attempted-to-Realized Accessibility & Sensory Matrix

| Accessibility Challenge (Attempted / Baseline Risk) | Realized Architectural Solution (`v2.0.0` Specification) | Verified Primitive Source |
| :--- | :--- | :--- |
| **ACC-VG-01: Bounded `<canvas>` Exclusion for Blind Touch Users** *(Identified in `TM-ACC-AUDIT-SHODO-CI-IMPASSE-V1.0`)* | **Full-Parity Keyboard & Button Brush Triggers + Perimeter Audio Cues:** Every freehand gesture (`WAVE`, `CIRCLE`, `SLASH`, `CROSS`) has an explicit, high-contrast button and single-key shortcut (`~`, `O`, `/`, `+`), while pointer drags near canvas edges emit soft spatial proximity pings so blind touch users never lose orientation. | `Zen-Shodo-Koan-Brush-Sanctuary` + `ndh-game-dev-kit` (`08-nonvisual-spatial-bridge`) |
| **ACC-VG-02: Sensory Overload & Comb-Reverb Screech Hazard** *(Identified in `TM-ACC-AUDIT-RETRO-PIPELINE-V1.0`)* | **Mute-by-Default Boot + `<= 780 Hz` Biquad Filter + Brick-Wall Limiter:** Audio boots muted (`M` to unmute), routes all cello and chamber voices through a `780 Hz` low-pass envelope, caps reverb feedback at `0.38`, and terminates with a `DynamicsCompressorNode` brick-wall limiter (`-18 dB` threshold, `20:1` ratio). | `ndh-retro-hw-pipeline` (`v1.0.0` sensory envelope) |
| **ACC-VG-03: Vestibular & Visual Motion Fatigue** | **`prefers-reduced-motion` Auto-Detection + `Space` Pause/Resume:** Swirling Starry Night wind currents and Sunflowers H-Blank heat shimmer automatically respect OS reduced-motion preferences on boot and can be paused or resumed at any moment via **`Space`**. | `ndh-retro-hw-pipeline` (`index.html`) |
| **ACC-VG-04: Visual-Only Painting Progress** | **Progressive 4-Layer Chamber Cello Orchestration + 5-Cell Braille Meter:** Each completed brushstroke layer (`1/4` to `4/4`) adds a rich musical voice to the chamber arrangement and advances a live Unicode Braille meter (`U+2800–U+28FF`) alongside descriptive `aria-live` poetic captions. | `ndh-acoustic-math-toys` (`toBrailleBar`) |

---

## 3. Dual-Canvas Choreography & Original Chamber Cello Suites

*(Provenance & Copyright Note: To honor the emotional warmth of folk-ballad storytelling such as Don McLean's "Vincent" and Harry Chapin's "Mr. Tanner" while remaining 100% original and public-domain / MIT compliant, the procedural WebAudio engine synthesizes two original chamber cello suites inspired by their pastoral baritone warmth.)*

### Chapter I: *Starry Night* — Suite I: *Nocturne in G Major*
1. **Stroke 1 — Flowing Wind Wave (`WAVE` / Key `~`):**  
   * *Visual Layer:* Swirling `Q16.16` cobalt and ultramarine impasto currents sweep across the night sky with `4×4` Bayer dithering.  
   * *Musical Layer 1:* **Solo Baritone Cello** enters with a slow, singing legato melody (`G2–D3–B3–A3`).
2. **Stroke 2 — Crescent Moon & Stars (`CIRCLE` / Key `O`):**  
   * *Visual Layer:* Glowing cadmium-gold stars and crescent moon ignite with PS1-style `100%` additive halos (`blendMode = 1`).  
   * *Musical Layer 2:* **Fingerpicked Acoustic Guitar / Lever Harp** arpeggios weave beneath the cello.
3. **Stroke 3 — Cypress Silhouette (`SLASH` / Key `/`):**  
   * *Visual Layer:* A deep emerald-umber cypress tree rises from the foreground into the swirling sky.  
   * *Musical Layer 3:* **Warm String Quartet Pad & Pizzicato Bass** anchor the harmonic progression.
4. **Stroke 4 — Village Starlight Finale (`CROSS` / Key `+`):**  
   * *Visual Layer:* Radiant four-point starlight bursts illuminate the sleeping village church spire below.  
   * *Musical Layer 4:* **Soft Celesta & Harmonic Chimes** join the full chamber ensemble in serene stillness.

### Chapter II: *Sunflowers* — Suite II: *Pastoral Aria in D Major*
1. **Stroke 1 — Earthenware Vase & Stems (`SLASH` / Key `/`):**  
   * *Visual Layer:* Warm terracotta vase and sturdy olive-ochre stems emerge against a luminous *washi*-textured wall.  
   * *Musical Layer 1:* **Lyric Baritone Cello** opens with an expressive, resonant baritone aria (`D2–A2–F#3–E3`).
2. **Stroke 2 — Golden Seed Crowns (`CIRCLE` / Key `O`):**  
   * *Visual Layer:* Rich umber and burnt-sienna circular seed heads bloom across the bouquet.  
   * *Musical Layer 2:* **Pizzicato Upright Bass & Warm Acoustic Chords** establish a gentle rolling pulse.
3. **Stroke 3 — Curling Cadmium Petals (`WAVE` / Key `~`):**  
   * *Visual Layer:* Textured yellow-gold impasto petals unfurl around every crown with subtle GBA H-Blank warmth shimmer.  
   * *Musical Layer 3:* **Muted Chamber Strings & Soft Woodwind Pad** swell behind the solo cello.
4. **Stroke 4 — Afternoon Sunlight Finale (`CROSS` / Key `+`):**  
   * *Visual Layer:* Warm golden sunbeams bathe the completed still life in `RGB555` radiance.  
   * *Musical Layer 4:* **Full Pastoral Chamber Ensemble** resolves on a warm `D` major chord before resting.

---

## 4. Pre-Build Engineering Checklist

1. **Zero External Assets (`0 KB` Media Footprint):** All `320×240` impasto textures, starfields, and cello/guitar/string voices are synthesized deterministically in pure ESM (`src/vangogh-renderer.js`, `src/cello-chamber-engine.js`, `src/brush-classifier.js`).
2. **Deterministic Verification (`node --test`):** Automated unit tests verify stroke classification (`CIRCLE`, `SLASH`, `WAVE`, `CROSS`), painting state progression across both canvases, `Q16.16` framebuffer pixel writes, and `SHA-256` gallery reflection receipts.
3. **Edge-Clean Deployment:** Built and verified via clean temporary clone $\to$ test $\to$ push $\to$ cleanup so local mobile storage remains unburdened.

---

## 5. Provenance & Non-Activation Clause

* **Status:** Verified Pre-Build Accessibility & Architecture Specification (`Triangle-Mutiny/accessibility/devnotes` • Non-Activating Specification)  
* **Author & License:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland • ORCID: [`0009-0004-7968-5707`](https://orcid.org)) • MIT License  
* **DCO Sign-off:** `Signed-off-by: Borealis Serenity Hedling <chguard-sentinel@vaked.dev>`
