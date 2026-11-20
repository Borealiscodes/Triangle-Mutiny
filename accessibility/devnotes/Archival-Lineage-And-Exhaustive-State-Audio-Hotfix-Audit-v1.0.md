# Archival Prototype Lineage & Exhaustive State-Branch Audio Hotfix Audit: Content-Hashed VITS Synthesis and One-Tap Acoustic Entry

**Document ID:** `TM-ACC-AUDIT-LINEAGE-HOTFIX-v1.0`  
**Placement:** `Triangle-Mutiny/accessibility/devnotes/Archival-Lineage-And-Exhaustive-State-Audio-Hotfix-Audit-v1.0.md`  
**Upstream Repositories & Artifacts:**  
* `Borealiscodes/Zen-Parable-Embodied-Voice-Edition` (`commit 3dbb72a`, `http://127.0.0.1:8091`)  
* `Borealiscodes/Zen-Parable-Audio-Sanctuary` (Archival Prototype Baseline)  
* `Borealiscodes/Zen-Parable-Geometry-Odyssey` (Visual-First Grid Baseline)  
* `Borealiscodes/Zen-Parable-NonDual-Reflection` (`v1.0.0` `speechSynthesis` Baseline)  
* `Borealiscodes/piper_tts` (`DOI: 10.5281/zenodo.24399123`)  
* Hedling, B. S. (2026). *Beyond Bolted-On Screen Readers: Narrative Phenomenology, the RNIB Roundhouse Sensory Dark, and Perceptual-Cognitive Unity (Rasa-Darśan)*. Zenodo. [`DOI: 10.5281/zenodo.24393275`](https://doi.org)  
**Maintainer:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland)  
**Date:** November 20, 2026  

---

## 1. Research Archival Governance & Lineage Integrity

As iterative accessibility prototypes evolve from visual-first coordinate grids (`Zen-Parable-Geometry-Odyssey`) and coordinate-based proximity beacons (`Zen-Parable-Audio-Sanctuary`) into unified non-dual gesture sanctuaries (`Zen-Parable-NonDual-Reflection`) and regional neural VITS voice editions (`Zen-Parable-Embodied-Voice-Edition`), **retroactive provenance notices** on both Zenodo (`10.5281/zenodo.24393275`) and earlier GitHub repositories serve three essential functions:

1. **Preventing Citation Confusion:** Readers and peer reviewers discovering an early prototype via a published DOI are explicitly informed which repositories represent preserved historical baselines versus active embodied-voice engineering.
2. **Preserving Reproducible Failure History:** Keeping early baselines intact rather than overwriting them preserves the empirical comparison between bolted-on screen-reader telemetry (`"east, 37% proximity"`), robotic OS `speechSynthesis`, and pre-rendered `en_GB-alan-medium` VITS narration.
3. **Bidirectional DOI Linking:** Cross-linking the foundational phenomenology preprint (`DOI: 10.5281/zenodo.24393275`) with the empirical neural TTS dataset (`DOI: 10.5281/zenodo.24399123`) creates a verifiable audit trail across text, code, and audio artifacts.

---

## 2. Engineering Hotfix Architecture (`commit 3dbb72a`)

To resolve all four accessibility and state-synchronization defects identified in `TM-ACC-AUDIT-PLAYTEST-V1.0` without expanding edge device storage (`258 MB` free on `/data`), `Zen-Parable-Embodied-Voice-Edition` (`commit 3dbb72a`) implemented three structural invariants:

| Defect Addressed | Architectural Hotfix (`commit 3dbb72a`) | Verification & Accessibility Guarantee |
| :--- | :--- | :--- |
| **ACC-01: Silent-Boot Discoverability Trap** | Added an auto-focused primary entry gate (`#btn-enter-sanctuary`: *"Enter Acoustic Sanctuary (Enable Soundscape & Storyteller Voice)"*) at the top of `index.html`, plus automatic audio unlock on the first keyboard gesture (`A`, `D`, `W`, `R`, `Space`). | Guarantees blind and low-vision users immediately hear the `<= 780 Hz` river/wind bed and Parable 1's opening narration + key prompts on first interaction. |
| **ACC-03: State-Blind Audio Mismatches (`STEP_ASHORE` / `RELEASE_RAFT` / Multi-Step Cues)** | Replaced single-pass button extraction in `scripts/render_calm_cues.py` with an **exhaustive Breadth-First Search (BFS)** over `createNonDualState()` and `performContemplativeGesture()`, extracting all **21 reachable narrative branches** across Parables 1–4. | Eliminates contradictory causal feedback (such as hearing *"The river still flows before you"* after boarding the cedar raft) and covers every breath count (`1..3`) and ladle measure (`3..0`). |
| **ACC-02 & ACC-04: Cross-Act Truncation & Cue Key Drift** | Replaced fragile string-interpolated filenames (`p1-ONE_HAND.wav`) with **deterministic 32-bit FNV-1a content hashes (`cue_<hex>.wav`)** computed identically in Python and browser ESM, paired with a single unlocked `HTMLAudioElement` (`cuePlayer`) chaining `[resolutionPart, nextStageIntro]` on cross-act transitions. | Guarantees **1:1 Audio-Text Parity** between the `aria-live="polite"` transcript and the spoken `.wav` file, while ensuring every stage transition speaks the completed parable's resolution followed immediately by the next parable's title, koan, scene opening, and available gesture keys. |

---

## 3. Provenance & Non-Activation Clause

* **Status:** Verified Archival Governance & State-Audio Hotfix Audit (`Triangle-Mutiny/accessibility/devnotes` • Non-Activating Specification)  
* **Author & License:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland) • MIT License  
* **DCO Sign-off:** `Signed-off-by: Borealis Serenity Hedling <chguard-sentinel@vaked.dev>`
