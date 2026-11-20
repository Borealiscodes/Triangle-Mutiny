# Array-vs-Object Type Coercion & Silent Audio Fallback Audit: Resolving `undefined` Narration Strings in `Zen-Parable-Embodied-Voice-Edition`

**Document ID:** `TM-ACC-AUDIT-TYPE-COERCION-v1.0`  
**Placement:** `Triangle-Mutiny/accessibility/devnotes/Array-Index-Type-Coercion-Narration-Audit-v1.0.md`  
**Upstream Repositories & Artifacts:**  
* `Borealiscodes/Zen-Parable-Embodied-Voice-Edition` (`src/reflection-app.js`, commit `6776a30`)  
* `Borealiscodes/Zen-Parable-NonDual-Reflection` (`src/nondual-kernel.js`)  
**Maintainer:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland)  
**Date:** November 20, 2026  

---

## 1. Empirical Playtest Observation (`commit 6776a30`)

Removing the redundant header toggles (`index.html`) and wiring `soundscape.toggleMute()` cleanly restored the WebAudio sanctuary and gesture buttons, yet live playtesting at `http://127.0.0.1:8091` revealed the opening `aria-live` narration box displaying:

> `"undefined. undefined undefined Available gestures: ."`

Alongside complete silence on initial load.

---

## 2. Root-Cause Analysis: Unchecked Container Coercion in `formatStageIntro`

1. **Passing an Array Container Instead of the Stage Object (`NONDUAL_PARABLES` vs. `state.parable`):**  
   Initializing `spokenLinesQueue` with `formatStageIntro(NONDUAL_PARABLES)` instead of `formatStageIntro(state.parable)` passed the top-level `Array` of four parables into a formatter expecting a single parable `Object`. In unguarded JavaScript, reading `.title`, `.koan`, `.sceneOpening`, and `.choices` on an `Array` does not throw an exception—it silently evaluates every property to `undefined`.
2. **Cascading Content-Hash Audio Miss (`cue_<hash>.wav` 404):**  
   Because `fnv1a32()` hashed the malformed string `"undefined. undefined undefined Available gestures: ."`, the resulting 32-bit FNV-1a digest did not match any of the 21 pre-rendered `.wav` files in `audio/`, causing `cuePlayer.play()` to reject with HTTP `404` while autoplay suppression prevented `speechSynthesis` fallback prior to user gesture.
3. **Architectural Fix (Single Canonical State Reference + `Array.isArray` Guard):**  
   * Derive the initial intro strictly from **`state.parable`** (`formatStageIntro(state.parable)`) rather than indexing external module arrays.  
   * Add an explicit guard inside `formatStageIntro(p)` (`if (!p || Array.isArray(p)) return "";`) so an array container can never silently interpolate `undefined` into `aria-live` or audio hashes.

---

## 3. Provenance & Non-Activation Clause

* **Status:** Verified Type-Safety & Audio-Hash Audit (`Triangle-Mutiny/accessibility/devnotes` • Non-Activating Specification)  
* **Author & License:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland) • MIT License  
* **DCO Sign-off:** `Signed-off-by: Borealis Serenity Hedling <chguard-sentinel@vaked.dev>`
