# 🎙️ Audio-Text Parity & Gameplay Affordance Audit: Why "Soothing Paraphrasing" Breaks Accessible Game Navigation

**Document ID:** `TM-ACC-AUDIT-PARITY-v1.0`  
**Placement:** `Triangle-Mutiny/accessibility/devnotes/Audio-Text-Parity-And-Affordance-Audit-v1.0.md`  
**Upstream Repositories & Artifacts:**  
* `Borealiscodes/Zen-Parable-Embodied-Voice-Edition` (`scripts/calm-narration-cues.json`, commit `c15d21a`)  
* `Borealiscodes/Zen-Parable-NonDual-Reflection` (`src/nondual-parables-data.js`)  
* `Borealiscodes/piper_tts` (`DOI: 10.5281/zenodo.24399123`)  
**Maintainer:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland)  
**Date:** November 20, 2026  

---

## 1. Empirical Listening Evaluation (`en_US-ryan-medium` • `p0-intro.wav`–`p3-reset.wav`)

Testing the first neural voice cue set inside `Zen-Parable-Embodied-Voice-Edition` (`http://127.0.0.1:8091`) confirmed that the hybrid `.wav` playback pipeline worked reliably over the `<= 780 Hz` WebAudio river/wind soundscape, yet revealed **three critical UX and accessibility failures**:

1. **Loss of Actionable Gameplay Affordances:** Rewriting parable cues into generic "Bob Ross-inspired" reassurance (*"There is nowhere to rush and no mistakes to make here..."*) omitted the concrete gesture keys (`A`, `D`, `W`, `R`, `Space`) and action labels, leaving non-visual players unsure of what controls exist or how to advance through the stage.
2. **Audio-Text Desynchronization (Parity Drift):** Because `scripts/calm-narration-cues.json` was authored separately from `src/nondual-parables-data.js`, the spoken `.wav` cues no longer matched the full on-screen `aria-live` parable text and philosophical reflections—violating **1:1 Audio-Text Parity** for deaf/hard-of-hearing, blind, and bimodal readers.
3. **Vocal Register Mismatch (`en_US-ryan-medium`):** Even slowed to `1.35x` length scale, `en_US-ryan-medium` retains an energetic American broadcast inflection and slight synthetic buzz compared to the quieter, grounded regional cadence observed with `en_GB-alan-medium` and `en_GB-alba-medium` (`DOI: 10.5281/zenodo.24399123`).

---

## 2. Three Architectural Rules for Accessible Game Narration (`v1.1.0` Fix)

1. **Single Source of Truth (`nondual-parables-data.js` $\to$ Audio):** Never maintain a separate paraphrased cue script. Generate audio cues directly from the canonical parable title, opening narration, explicit gesture key prompts, and full outcome reflection in `src/nondual-parables-data.js` so spoken audio and `aria-live` text remain 100% identical.
2. **Explicit Tactile Control Prompts in Every Stage Intro:** Every stage opening cue must state the exact available keys and actions plainly (e.g., *"Press A to Clap Two Hands, or D to Listen to One Hand"*) alongside the poetic koan framing.
3. **Grounded Regional VITS Checkpoints (`en_GB-alan-medium` / `en_GB-alba-medium`):** Standardize on calmer `en_GB` checkpoints at `1.28x`–`1.32x` length scale with `0.55s` sentence silence rather than energetic `en_US` news/broadcast models.

---

## 3. Provenance & Non-Activation Clause

* **Status:** Verified UX & Accessibility Audit (`Triangle-Mutiny/accessibility/devnotes` • Non-Activating Specification)  
* **Author & License:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland) • MIT License  
* **DCO Sign-off:** `Signed-off-by: Borealis Serenity Hedling <chguard-sentinel@vaked.dev>`
