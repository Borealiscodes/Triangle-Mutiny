# 🎙️ CLI Flag Literalism & Neural VITS Audio Debrief: When Speech Synthesizers Read Their Own Command Arguments Aloud

**Document ID:** `TM-ACC-DEBRIEF-CLI-TTS-v1.0`  
**Placement:** `Triangle-Mutiny/accessibility/devnotes/CLI-Flag-Literalism-And-Neural-TTS-Debrief-v1.0.md`  
**Upstream Repositories & Artifacts:**  
* `Borealiscodes/piper_tts` (`nondual-embodied-studio/render_embodied_essay.py`)  
* `Borealiscodes/NonDual-Audio-Preprint-Studio` (`DOI: 10.5281/zenodo.24393275`)  
**Maintainer:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland)  
**Date:** November 20, 2026  

---

## 1. Empirical Observation from Run #4 (`zenodo-24393275-embodied.wav`)

Listening to the first cloud-rendered `.wav` artifact (`571 KB`) from `Borealiscodes/piper_tts` revealed two clear empirical findings:

1. **What Worked (`<= 680 Hz` Stillness Bed & VITS Timbre):** The pure-Python low-pass filtered brown-noise river/wind stillness bed (`synthesize_stillness_bed`) survived the audio pipeline cleanly without clipping, and the neural VITS voice (`en_US-lessac-medium` at `1.12x` length scale) exhibited noticeably softer vocal timbre than the mechanical browser `speechSynthesis` baseline.
2. **What Failed (CLI Flag Literalism):** Instead of speaking the normalized philosophical dialogue, the synthesized voice literally read `"download dire json input"` repeatedly. Because `piper-tts` 1.8's Python CLI (`python3 -m piper`) expects `--data-dir` (rather than `--download-dir`) and treats unrecognized flags or raw JSON lines on `stdin` as literal text-to-speak when `--json-input` is omitted or mismatched, the synthesizer faithfully vocalized its own invocation arguments.

---

## 2. Engineering Lesson: Plain Stdin Text vs. Unverified Wrapper Flags

Text-to-speech CLIs exhibit a unique failure mode compared to ordinary compilers: **they rarely fail loudly on malformed text payloads—they simply read the raw syntax aloud.**

To eliminate CLI flag ambiguity across Piper versions (`1.2.x` C++ binary vs. `1.8.x` Python module):
* **Pass Normalized Plain Text Directly on `stdin`:** Since `render_embodied_essay.py` already loops turn-by-turn to insert exact `pause_ms` silence intervals and switch `speaker_id` / voice models per turn, passing normalized plain text (`normalize_for_speech(turn["text"]) + "\n"`) directly to `stdin` with `--output_file <turn.wav>` requires zero JSON-input parsing inside Piper.
* **Use `--data-dir .` and `--speaker <id>`:** Standardize on documented `python3 -m piper` flags (`--model`, `--data-dir`, `--speaker`, `--length-scale` / `--length_scale`, `--output_file`) and add a post-render sanity check verifying that the spoken input does not contain CLI flag tokens (`--`, `json`, `download-dir`).

---

## 3. Provenance & Non-Activation Clause

* **Status:** Verified Experimental Audio Debrief (`Triangle-Mutiny/accessibility/devnotes` • Non-Activating Specification)  
* **Author & License:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland) • MIT License  
* **DCO Sign-off:** `Signed-off-by: Borealis Serenity Hedling <chguard-sentinel@vaked.dev>`
