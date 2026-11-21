# Pre-Launch Graphics Winding & WebAudio Comb-Reverb Runaway Feedback Audit: Playtest Evaluation of `ndh-retro-hw-pipeline`

**Document ID:** `TM-ACC-AUDIT-RETRO-PIPELINE-V1.0`  
**Placement:** `Triangle-Mutiny/accessibility/devnotes/Retro-HW-Pipeline-Winding-Culling-And-Reverb-Feedback-Audit-v1.0.md`  
**Upstream Repositories & Artifacts:**  
* `Borealiscodes/ndh-retro-hw-pipeline` (`commit 7fc4477`, `http://127.0.0.1:8094`)  
* `Borealiscodes/ndh-game-dev-kit` (`07-sensory-regulation-envelope`, `retro-hw-pipeline.js`)  
**Maintainer:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland)  
**Date:** November 21, 2026  

---

## 1. Executive Summary

Live browser playtesting of `Borealiscodes/ndh-retro-hw-pipeline` (`commit 7fc4477`, `320×240` `Q16.16` software framebuffer) verified that the GBA Mode 7 caustic water floor and H-Blank scanline ripple render smoothly (`Frame: 2784` at 60 fps). However, end-to-end visual and acoustic inspection uncovered **two critical pre-launch defects**:
1. **Inverted Screen-Space Backface Culling (`cross <= 0`):** Every triangle of the PS1 3D Gouraud-shaded octahedron crystal was culled on every frame, leaving the crystal completely invisible and making the texture selector (`Jade Marble`, `Washi Parchment`, `Ivory Temple Marble`, `Starfield Nebula`) appear unresponsive.
2. **Unbounded Comb-Filter Feedback Screech & Audio Lockout (`CRITICAL SENSORY HAZARD`):** After several seconds of rhythmic pulse playback, four parallel delay lines inside `createPS1Reverb` entered positive feedback runaway—emitting a harsh high-amplitude screech before saturating the WebAudio graph into unrecoverable silence.

---

## 2. Defect & Sensory Safety Matrix

| Defect ID | Severity | Lived & Visual Impact | Root Cause in `commit 7fc4477` |
| :--- | :--- | :--- | :--- |
| **RHP-01: Runaway Comb-Reverb Resonance & Audio Lockout** | **Critical (Sensory Hazard)** | Initial GBA PSG pulses and PS1 ADPCM bell chimes play cleanly, followed by a sudden, painful screech and permanent audio silence that cannot be restored without reloading the page. | In `createPS1Reverb`, four parallel comb delays (`29.7 ms`–`43.7 ms`) each feed back at `gain = 0.88` without per-tap attenuation or a `DynamicsCompressorNode` brick-wall limiter, while the `780 Hz` sensory low-pass filter sits *outside* the feedback loop—allowing high-frequency comb modes to self-oscillate into `±Infinity`/`NaN` and trip Chromium's WebAudio output protection. |
| **RHP-02: Screen-Space Y-Down Winding Inversion (Invisible 3D Mesh)** | **High** | The GBA Mode 7 caustic ocean and starry skybox render vividly, but the spinning 3D PS1 octahedron crystal never appears on screen. | In `renderPS1Mesh`, screen coordinates place `(0, 0)` at the **top-left** (`+Y` pointing downward), flipping the sign of the 2D signed triangle area (`cross`). Testing `if (cross <= 0) continue;` culled all front-facing triangles (`cross < 0` in Y-down screen space) and attempted to draw only back-facing triangles. |
| **RHP-03: Unobservable Texture Switch State** | **Moderate** | Selecting `Texture: Washi Parchment` or pressing `T` updates the dropdown label without visible change in the viewport. | Directly downstream of **RHP-02**: `activeCrystalTex` binds exclusively to `solidCrystal` inside `renderPS1Mesh`, so culling the crystal hides all four procedural `128×128` RGB555 textures. |

---

## 3. Concrete Remediation Plan (`v1.0.1` Hotfix)

1. **Stabilize `createPS1Reverb` & Add Hard Sensory Limiter (`src/retro-hw-pipeline.js` + `src/playground-app.js`):**  
   * Cap comb-filter feedback strictly below unity (`Math.min(0.45, ...)`), place a `780 Hz` low-pass filter *inside* each feedback path so high frequencies decay rapidly instead of ringing, and terminate the master audio bus with a `DynamicsCompressorNode` (`threshold: -18 dB`, `ratio: 20`, `knee: 0`) so output amplitude can never spike or emit `NaN`.
2. **Invert Screen-Space Winding Check in `renderPS1Mesh` (`src/retro-hw-pipeline.js`):**  
   * Change `if (cross <= 0) continue;` to `if (cross >= 0) continue;` (matching top-left origin Y-down screen coordinates) and center `bobY` at `-(8 << 16)` so the spinning Gouraud-shaded octahedron and its additive aura float prominently above the Mode 7 horizon.
3. **Add Automated Winding & Reverb Stability Tests (`test/retro-pipeline.test.mjs`):**  
   * Assert that `renderPS1Mesh` writes non-background RGB555 pixels into the center of `buf32` when rendering a front-facing triangle, and verify `createPS1Reverb` feedback gains never exceed `0.50`.

---

## 4. Provenance & Non-Activation Clause

* **Status:** Verified Pre-Launch Graphics & Sensory Safety Audit (`Triangle-Mutiny/accessibility/devnotes` • Non-Activating Specification)  
* **Author & License:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland) • MIT License  
* **DCO Sign-off:** `Signed-off-by: Borealis Serenity Hedling <chguard-sentinel@vaked.dev>`
