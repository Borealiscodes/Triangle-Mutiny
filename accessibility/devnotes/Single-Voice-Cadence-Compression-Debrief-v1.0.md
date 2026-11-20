# 🎙️ Single-Voice Cadence Compression Debrief: Empirical Evaluation of Run #5 (`en_US-lessac-medium`)

**Document ID:** `TM-ACC-DEBRIEF-CADENCE-v1.0`  
**Placement:** `Triangle-Mutiny/accessibility/devnotes/Single-Voice-Cadence-Compression-Debrief-v1.0.md`  
**Upstream Repositories & Artifacts:**  
* `Borealiscodes/piper_tts` (`nondual-embodied-studio/render_embodied_essay.py`)  
* `Borealiscodes/NonDual-Audio-Preprint-Studio` (`DOI: 10.5281/zenodo.24393275`)  
**Maintainer:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland)  
**Date:** November 20, 2026  

---

## 1. Empirical Listening Evaluation (Run #5 • 55-Second Render)

Listening to Run #5 (`zenodo-24393275-embodied.wav`) confirmed that the plain-`stdin` fix resolved the CLI flag literalism bug—the synthesizer accurately pronounced `"RAH-sah DAR-shahn"`, `"FLIK-shun"`, `"TOH-roh"`, and `"BON-shoh"` over the `<= 680 Hz` stillness bed. However, human auditory evaluation surfaced **three remaining phenomenological gaps**:

1. **Single-Speaker Collapse:** Passing `speaker_id: 0` vs. `speaker_id: 1` to a single-speaker `.onnx` checkpoint (`en_US-lessac-medium`) produces only **one female American voice** for both Speaker A and Speaker B, erasing the intended conversational alternation between ecological observation and critical moral inquiry.
2. **Breathless 55-Second Pacing:** Synthesizing full multi-sentence paragraphs in a single Piper invocation at near-default `length_scale` (`1.12`) compresses the entire four-turn essay into **55 seconds** with minimal intra-sentence breathing room.
3. **Synthetic Prosody Ceiling:** Even with VITS neural synthesis, rapid-fire delivery feels mechanical; contemplative Roundhouse-style audio requires **dual distinct voice models**, slower phoneme duration (`length_scale >= 1.28`), **clause/sentence-level micro-pauses (`400–600 ms`)**, and generous **inter-speaker stillness gaps (`1,800–2,200 ms`)**.

---

## 2. Three Concrete Engineering Upgrades for Run #6

1. **Dual Distinct Neural Checkpoints (`Speaker A` vs. `Speaker B`):** Download two separate `.onnx` voice models in the render pipeline (e.g., `en_GB-alan-medium.onnx` for Speaker A and `en_GB-alba-medium.onnx` for Speaker B) rather than relying on `speaker_id` inside a single-speaker model.
2. **Sentence-Level Breath Segmentation:** Split each turn into individual sentences/clauses before synthesis and insert `450 ms` micro-pauses between sentences plus `1,800–2,200 ms` stillness pauses between speakers.
3. **Unhurried Phoneme Duration (`length_scale = 1.30`) + Sentence Silence (`--sentence-silence 0.45`):** Wire `--length-scale 1.30` and `--sentence-silence 0.45` directly into the `python3 -m piper` invocation so the cadence breathes naturally over the `<= 680 Hz` river/wind bed.

---

## 3. Provenance & Non-Activation Clause

* **Status:** Verified Empirical Listening Debrief (`Triangle-Mutiny/accessibility/devnotes` • Non-Activating Specification)  
* **Author & License:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland) • MIT License  
* **DCO Sign-off:** `Signed-off-by: Borealis Serenity Hedling <chguard-sentinel@vaked.dev>`
