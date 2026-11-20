# 🎙️ Neural TTS & Embodied Narration Audit: Transitioning from Cold Browser Speech Synthesis to Offline Multi-Speaker Piper Pipelines

**Document ID:** `TM-ACC-AUDIT-NEURAL-TTS-v1.0`  
**Placement:** `Triangle-Mutiny/accessibility/devnotes/Neural-TTS-Embodied-Narration-Audit-v1.0.md`  
**Upstream Repositories & Artifacts:**  
* `Borealiscodes/NonDual-Audio-Preprint-Studio` (Mechanical `speechSynthesis` Baseline)  
* `Borealiscodes/piper_tts` (Research Fork of Rhasspy Piper VITS Neural TTS)  
* Hedling, B. S. (2026). *Beyond Bolted-On Screen Readers: Narrative Phenomenology, the RNIB Roundhouse Sensory Dark, and Perceptual-Cognitive Unity (Rasa-Darśan)*. Zenodo. [`DOI: 10.5281/zenodo.24393275`](https://doi.org)  
**Maintainer:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • County Dublin, Ireland)  
**Date:** November 20, 2026  

---

## 1. Purpose & Empirical Context

In `NonDual-Audio-Preprint-Studio v1.0.0`, we established deterministic phonetic locks (`"Flyxion"` $\to$ `"FLIK-shun"`, `"rasa-darśan"` $\to$ `"RAH-sah DAR-shahn"`, `"Tōrō"` $\to$ `"TOH-roh"`), zero-flattery script linting, and six-register dialogue pacing over a `<= 680 Hz` WebAudio stillness bed. However, field testing on Android confirmed a clear phenomenological limitation: **built-in browser `speechSynthesis` voices sound cold, metallic, and detached**—creating an unintended emotional barrier when narrating contemplative preprints.

Forking **`Borealiscodes/piper_tts`** enables an offline, neural VITS synthesis experiment (`nondual-embodied-studio/`) that pairs warmer vocal timbre with the exact same anti-sycophancy and phonetic guardrails.

---

## 2. Comparative Architecture: Mechanical Baseline vs. Neural Piper Pipeline

| Evaluation Axis | Mechanical Baseline (`speechSynthesis`) | Enhanced Neural Experiment (`Borealiscodes/piper_tts`) |
| :--- | :--- | :--- |
| **Vocal Warmth & Prosody** | Cold OS speech synthesis; pitch/cadence vary unpredictably across browsers and devices. | Expressive VITS `.onnx` neural voices (`en_GB` / `en_US`) with deterministic `--length_scale` pacing (`1.12` unhurried Roundhouse cadence). |
| **Co-Presence with Soundscape** | Browser speech runs on a separate OS audio channel from the WebAudio stillness bed. | Mixes neural speaker tracks directly into a `<= 680 Hz` low-pass filtered river/wind stillness bed into a single unified `.wav` / `.ogg` artifact. |
| **Pre-Synthesis Guardrails** | JavaScript `phonetic-guard.js` + `anti-sycophancy-linter.js` (`3/3` tests passing). | Python parity ports (`phonetic_guard.py` + `anti_sycophancy_linter.py`) gate `--json-input` synthesis before any audio renders. |
| **Archival & Distribution** | Live browser playback only (requires user to open HTML page). | Generates self-contained, downloadable spoken-word `.wav` / `.ogg` files attachable directly to Zenodo (`DOI: 10.5281/zenodo.24393275`). |
| **Edge / Termux Runtime Cost** | Zero install; runs natively inside Android Chrome. | Requires ~60–120 MB per `.onnx` voice model and `proot-distro` (Ubuntu/Debian ARM64) on Android Termux due to `glibc` vs. Bionic `libc`. |

---

## 3. Mandatory Architectural & Ethical Invariants

1. **Non-Destructive Fork Isolation:** All experimental scripts must live inside a dedicated `nondual-embodied-studio/` directory inside `Borealiscodes/piper_tts`, keeping upstream C++/Python Piper code clean for future upstream syncs.
2. **Guardrails Before Synthesis:** No `.onnx` model may synthesize a script unless `anti_sycophancy_linter.py` passes (`0` banned flattery terms and `>= 2` explicit limitations) and `phonetic_guard.py` normalizes Unicode diacritics and handles.
3. **Model Card & Licensing Hygiene:** Every `.onnx` voice model used in an experiment must document its `MODEL_CARD` license (e.g., MIT / CC-BY / public domain) and state honestly that neural TTS still approximates—rather than replaces—human narration.
4. **Zero-Footprint Edge Discipline:** On Android Termux devices, `.onnx` checkpoints and temporary `.wav` renders must remain `gitignored` and cleaned up after testing so device storage stays lean.

---

## 4. Provenance & Non-Activation Clause

* **Gratitude:** Special thanks to **Flyxion (`@standardgalactic`)** for pioneering research-projection directions and helping surface spoken-word AI failure modes.
* **Status:** Verified Architectural & Accessibility Audit (`Triangle-Mutiny/accessibility/devnotes` • Non-Activating Specification)  
* **Author & License:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • County Dublin, Ireland) • MIT License  
* **DCO Sign-off:** `Signed-off-by: Borealis Serenity Hedling <chguard-sentinel@vaked.dev>`
