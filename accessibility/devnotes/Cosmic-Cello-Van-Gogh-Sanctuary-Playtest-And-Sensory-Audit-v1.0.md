# Sensory-Safety, Pacing & Impasto Visual Fidelity Audit: Playtest Evaluation of `Cosmic-Cello-Van-Gogh-Sanctuary`

**Document ID:** `TM-ACC-AUDIT-VAN-GOGH-CELLO-V1.0`  
**Placement:** `Triangle-Mutiny/accessibility/devnotes/Cosmic-Cello-Van-Gogh-Sanctuary-Playtest-And-Sensory-Audit-v1.0.md`  
**Upstream Repositories & Artifacts:**  
* `Borealiscodes/Cosmic-Cello-Van-Gogh-Sanctuary` (`commit a283533`, `http://127.0.0.1:8095`)  
* `Triangle-Mutiny/accessibility/devnotes/Immersive-Van-Gogh-Cosmic-Cello-Brush-Accessibility-Spec-v1.0.md` (`TM-ACC-SPEC-VAN-GOGH-CELLO-V1.0`)  
**Maintainer:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland)  
**Date:** November 21, 2026  

---

## 1. Executive Summary

Live mobile browser playtesting of **`Borealiscodes/Cosmic-Cello-Van-Gogh-Sanctuary`** (`commit a283533`, `http://127.0.0.1:8095`) across both *Chapter I: Starry Night* and *Chapter II: Sunflowers* revealed **five severe sensory, musical, visual, and structural defects** that violate our neurodivergent sensory-care and contemplative pacing goals:

1. **Migraine-Inducing Monotonous Beat Instead of Expressive Music (`CRITICAL SENSORY HAZARD`):** A rigid `680 ms` `setInterval` pulse triggers raw sawtooth/triangle notes on every tick with zero phrasing, rests, harmonic cadences, or expressive vibrato—creating a repetitive, fatiguing throb rather than a lyrical chamber cello performance.
2. **Oversimplified Geometric Primitives & Misaligned Coordinates (`Sunflowers` & `Starry Night`):** As seen in playtest screenshots, *Sunflowers* renders five disconnected vertical green sticks floating in mid-air while the yellow sunflower crowns are clipped at the very top border (`y = 0..20`), and *Starry Night* renders flat horizontal gradient bands rather than rich swirling Van Gogh impasto brushstrokes.
3. **Ephemeral User Brushstrokes (No Persistent Visual Trail):** User pointer strokes (`userStrokes`) are cleared (`strokes = Array.of()`) immediately upon gesture recognition (`submitGesture`), leaving zero visible trace of the player's own hand on the canvas.
4. **Rushed 4-Stroke Progression (`Too Fast`):** Completing an entire painting in four single taps (`~4 seconds`) eliminates contemplative immersion and makes the experience feel like a checklist rather than a meditative painting adventure.
5. **Forced Linear Coupling of the Two Paintings:** *Starry Night* and *Sunflowers* are chained sequentially (`chapterIndex 0 -> 1`) instead of being **separate, selectable stories** that players can enter, paint additively at their own pace, and revisit freely.

---

## 2. Playtest Defect & Sensory Impact Matrix

| Defect ID | Severity | Lived & Visual Impact | Root Cause in `commit a283533` |
| :--- | :--- | :--- | :--- |
| **VG-01: Migraine-Inducing Metronomic Beat (`680 ms` Loop)** | **Critical (Sensory Hazard)** | Unmuting audio produces an unrelenting, mechanical `680 ms` thudding beat (`sawtooth` + `triangle` + `sine` firing on every interval tick) with no melodic phrasing, breath rests, or dynamic contour—inducing migraine pressure rather than calm. | `startLoop()` in `src/cello-chamber-engine.js` uses a fixed `680 ms` `setInterval` that re-triggers raw oscillators every beat with uniform `0.14 s` attacks, no phrase rests, no portamento/vibrato, and overly resonant low-mid sawtooth harmonics. |
| **VG-02: Oversimplified Geometry & Clipped Flower Crowns** | **High** | In *Sunflowers*, five bare vertical lines float beneath cut-off yellow semicircles at the top edge of the frame (`cy = 56..102` offset off-canvas or masked by wall layering); in *Starry Night*, the sky lacks swirling spiral eddies and textured impasto strokes. | `vangogh-renderer.js` draws unrotated circles/rectangles (`blooms` occluded or clipped near top edge; stems disconnected from vase and heads) without multi-pass directional impasto dashes or spiral vortex flow fields. |
| **VG-03: Invisible / Erased Player Brushstrokes** | **High** | Drawing on the canvas shows a brief gold line that vanishes as soon as the stroke finishes, giving no lasting visual record of the player's brushwork. | `submitGesture()` in `src/vangogh-app.js` executes `strokes = Array.of();` immediately after `applyPaintingStroke`, erasing the user's stroke buffer instead of baking painted pigment strokes additively into a persistent canvas layer. |
| **VG-04: Rushed 4-Step Pacing** | **Moderate** | Four single gestures complete an entire painting in seconds, leaving no room for layered brushwork, shading, or unhurried exploration. | `PAINTING_CHAPTERS` defines only 4 binary steps per painting (`stepIndex 0..3`) with single-stroke completion and no multi-pass accumulation (e.g., underpainting $\to$ midtones $\to$ impasto highlights $\to$ starlight/sunbeams). |
| **VG-05: Coupled Linear Story Flow** | **Moderate** | Players cannot choose *Sunflowers* directly from the gallery or linger inside *Starry Night* after completing Stroke 4 because `applyPaintingStroke` automatically forces a transition into Chapter II. | `applyPaintingStroke` hardcodes `chapterIndex + 1` on step 4 completion and lacks a story-selector control (`Story I: Starry Night` vs. `Story II: Sunflowers`). |

---

## 3. Concrete Remediation Architecture (`v2.0.0` Uplift Plan)

1. **Replace Metronomic `setInterval` With Phrased, Breath-Paced Chamber Cello Synthesis (`src/cello-chamber-engine.js`):**
   * Eliminate the rigid `680 ms` mechanical loop.
   * Synthesize **true lyrical melodies with natural rests, gentle vibrato (`5 Hz` LFO), warm formants (`triangle` + `sine` octave harmonic, zero harsh sawtooth buzz), and 4-bar breathing cadences**—plus an interactive **Play/Pause Performance** toggle separate from gentle brush-bowing resonance.
2. **Separate Selectable Story Canvases (`Starry Night` & `Sunflowers`):**
   * Provide explicit **Gallery Story Tabs** (**`Story I: Starry Night`** and **`Story II: Sunflowers`**) so each painting stands as its own self-contained contemplative chapter that never auto-evicts the player upon completion.
3. **Persistent Additive Impasto Layer (`committedStrokes`):**
   * Retain every stroke the player draws in a persistent **`paintedPigmentLayer`** (`Uint32Array`) colored to match the active palette (cobalt/ultramarine/gold for *Starry Night*; ochre/sienna/cadmium-yellow for *Sunflowers*), so every gesture visibly accumulates on the canvas alongside multi-pass directional *Q16.16* impasto brushwork.
4. **Expanded Multi-Stage Contemplative Pacing (8–12 Additive Brush Passes per Painting) & Corrected Composition:**
   * Fix the *Sunflowers* bouquet layout so every stem connects cleanly from the terracotta vase (`y = 148`) into full, centered golden sunflower heads (`cy = 72..126`) with layered petals, seed spirals, and directional impasto strokes; upgrade *Starry Night* with true dual-spiral wind vortices, crescent moon glow, rolling Alpilles hills, and textured cypress flame strokes.

---

## 4. Provenance & Non-Activation Clause

* **Status:** Verified Playtest & Sensory-Safety Audit (`Triangle-Mutiny/accessibility/devnotes` • Non-Activating Specification)  
* **Author & License:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland • ORCID: [`0009-0004-7968-5707`](https://orcid.org)) • MIT License  
* **DCO Sign-off:** `Signed-off-by: Borealis Serenity Hedling <chguard-sentinel@vaked.dev>`
