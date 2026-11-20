# 🎙️ Dual-Voice VITS & Roundhouse Cadence Success Debrief: Empirical Evaluation of Run #6 (`1:14` Embodied Audio Essay)

**Document ID:** `TM-ACC-DEBRIEF-DUAL-VITS-v1.0`  
**Placement:** `Triangle-Mutiny/accessibility/devnotes/Dual-Voice-VITS-Roundhouse-Cadence-Success-Debrief-v1.0.md`  
**Upstream Repositories & Artifacts:**  
* `Borealiscodes/piper_tts` (`nondual-embodied-studio/render_embodied_essay.py`, commit `7642632`)  
* `Borealiscodes/NonDual-Audio-Preprint-Studio` (`DOI: 10.5281/zenodo.24393275`)  
**Maintainer:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland)  
**Date:** November 20, 2026  

---

## 1. Empirical Listening Outcome (Run #6 • `1:14` Duration)

Moving from a single rapid-fire American VITS voice (`0:55`, Run #5) to **two distinct British/Scottish neural VITS models (`en_GB-alan-medium` for Speaker A + `en_GB-alba-medium` for Speaker B)** with unhurried Roundhouse pacing (`--length-scale 1.30`, `--sentence-silence 0.55`, and `2,000 ms` inter-speaker river/wind pauses) produced a **1 minute 14 second (`1:14`)** spoken-word artifact that crossed a critical phenomenological threshold:

1. **Elimination of Jarring Screen-Reader Tone:** Unlike built-in mobile `speechSynthesis` voices—which sound metallic, rushed, and detached—pairing two warm regional VITS models over a `<= 680 Hz` low-pass filtered river/wind stillness bed created an unhurried, conversational room feel.
2. **Genuine Two-Register Alternation:** Alternating between Speaker A (`en_GB-alan-medium`, ecological observation and technical clarity) and Speaker B (`en_GB-alba-medium`, Social Model barrier critique, Sophie Scholl moral clarity, and Carl Sagan humility) preserved conversational contrast without AI sycophancy or ego inflation.
3. **Zero-Footprint Cloud Execution (`0 KB` Tablet `/data` Used):** Offloading `.onnx` model downloads and WAV synthesis to GitHub's free Ubuntu Actions runner (`workflow_dispatch`) completely bypassed the Android tablet's `ENOSPC` storage constraint while leaving the verified `1:14` `.wav` artifact ready for archival on Zenodo (`DOI: 10.5281/zenodo.24393275`).

---

## 2. Iterative Trajectory Across Six Runs (`Run #1` $\to$ `Run #6`)

| Iteration | Configuration | Empirical Outcome & Diagnostic Lesson |
| :--- | :--- | :--- |
| **Baseline (`NonDual-Audio-Preprint-Studio`)** | Browser `window.speechSynthesis` + WebAudio `<= 680 Hz` bed. | Phonetic locks (`"FLIK-shun"`, `"RAH-sah DAR-shahn"`) and zero-flattery linting worked, but OS voice sounded cold and robotic. |
| **Local Edge Attempt (`proot-distro` Debian)** | On-device ARM64 container + `piper-tts`. | Hit `Errno 28: No space left on device` on tablet `/data`; proved the necessity of separating lightweight script verification (`< 25 KB`) from cloud `.onnx` inference. |
| **Cloud Run #4 (`--json-input`)** | GitHub Actions Ubuntu runner + `en_US-lessac-medium`. | Stillness bed survived, but CLI flag mismatch caused Piper to read `"download dire json input"` aloud—exposing TTS CLI flag literalism. |
| **Cloud Run #5 (Plain `stdin`, 1 Voice)** | `en_US-lessac-medium` at `1.12x` length scale (`0:55`). | Spoke the true text accurately, but single American female voice rushed through all four turns in `0:55` without natural breathing room. |
| **Cloud Run #6 (Dual `en_GB` Voices + Pauses)** | `en_GB-alan-medium` + `en_GB-alba-medium`, `1.30x` cadence, `0.55s` sentence silence, `2.0s` turn gaps (`1:14`). | **Verified Success:** Normal contemplative cadence, warm two-speaker alternation, zero jarring screen-reader tone, and explicit statement of limitations. |

---

## 3. Remaining Epistemic Honesty Note

Even at `1:14` with dual `en_GB` VITS voices and `2.0s` stillness pauses, neural synthesis remains a **reproducible accessibility bridge** rather than a substitute for a live human narrator. Maintaining the clean semantic transcript alongside the `.wav` audio essay ensures screen-reader users, deaf/hard-of-hearing readers, and future human volunteer narrators all retain full sovereignty over the text.

---

## 4. Provenance & Non-Activation Clause

* **Gratitude:** Special thanks to **Flyxion (`@standardgalactic`)** for pioneering the research-projection direction that motivated this systematic study of spoken-word AI failure modes.
* **Status:** Verified Empirical Listening Debrief (`Triangle-Mutiny/accessibility/devnotes` • Non-Activating Specification)  
* **Author & License:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland) • MIT License  
* **DCO Sign-off:** `Signed-off-by: Borealis Serenity Hedling <chguard-sentinel@vaked.dev>`
