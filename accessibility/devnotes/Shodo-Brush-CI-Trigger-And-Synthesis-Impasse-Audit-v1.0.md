# Responsive Brush-Symbol Uplift, CI Workflow Trigger Impasse & Assistant Synthesis Stall Audit: Engineering Evaluation of `Zen-Shodo-Koan-Brush-Sanctuary`

**Document ID:** `TM-ACC-AUDIT-SHODO-CI-IMPASSE-V1.0`  
**Placement:** `Triangle-Mutiny/accessibility/devnotes/Shodo-Brush-CI-Trigger-And-Synthesis-Impasse-Audit-v1.0.md`  
**Upstream Repositories & Artifacts:**  
* `Borealiscodes/Zen-Shodo-Koan-Brush-Sanctuary` (`commit e281932`, `.github/workflows/render-shodo-cues.yml`)  
* `Borealiscodes/Celtic-Shodo-Wind-Odyssey` (`v1.0.0` Celestial Brush & `D–E–G–A–B` Folk Synth Baseline)  
* `Borealiscodes/Zen-Parable-Embodied-Voice-Edition` (`commit 29a4b29` FNV-1a VITS Parity Architecture)  
* `Borealiscodes/piper_tts` (`DOI: 10.5281/zenodo.24399123`)  
**Maintainer:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland)  
**Date:** November 21, 2026  

---

## 1. Executive Summary

Following the successful end-to-end verification of `Zen-Parable-Embodied-Voice-Edition` (`commit 29a4b29`), development shifted to `Borealiscodes/Zen-Shodo-Koan-Brush-Sanctuary` (`commit e281932`) to uplift interactive progression from discrete button presses to responsive freehand brush glyphs (*Ensō* Circle, *Ogham* Slash, *Mizu* Wave, and Solstice Cross) paired with a `<= 780 Hz` Irish–Japanese `D–E–G–A–B` folk ensemble. While local unit tests (`test/shodo-sanctuary.test.mjs`, `2/2` passing) and syntax checks (`node --check src/brush-app.js`) succeeded on the edge device (`233 MB` free on `/data`), progression stalled across three distinct engineering and tooling bottlenecks: **a missing manual `workflow_dispatch` trigger in GitHub Actions**, **mobile clipboard token-clipping fragility**, and **an extended multi-turn assistant generation stall**.

---

## 2. Impasse & Accessibility Risk Matrix

| Barrier ID | Severity | Lived & Engineering Impact | Root Cause in Current Build |
| :--- | :--- | :--- | :--- |
| **IMP-01: Missing GitHub Actions `Run workflow` UI Trigger** | **Critical** | Opening `.github/workflows/render-shodo-cues.yml` in the GitHub Actions web UI displays 8 failed push runs (`#1`–`#8`) with **no `Run workflow` dropdown button**, preventing cloud synthesis of the `en_GB-alan-medium` `.wav` cues and leaving `audio/` unpopulated. | GitHub Actions only renders the manual **`Run workflow`** button when `workflow_dispatch:` is registered on the repository's default branch **without YAML syntax/indentation drift** or when the workflow file is parsed cleanly on `main`. Additionally, the workflow lacked `on: push:` triggers or a valid `workflow_dispatch` header recognized by the Actions parser, causing early commits (`17df15f`–`e281932`) to fail immediately before rendering `audio/*.wav`. |
| **IMP-02: Responsive Brush-Symbol vs. Non-Visual Parity Tension** | **High** | Freehand pointer drawing (`#washi-canvas`) introduces a `550 ms` stroke-completion timeout (`evalTimer`) to distinguish single-stroke shapes (`CIRCLE`, `SLASH`, `WAVE`) from two-stroke intersections (`CROSS`). Without rendered `.wav` cues, blind and low-vision users cannot verify whether an ambiguous freehand gesture triggered a gentle correction hint or a stage transition. | Bridging continuous touch geometry (`classifyBrushStrokes`) with discrete `1:1` FNV-1a content-hashed audio cues (`cue_<hash>.wav`) requires every `gentleHints` branch and multi-stroke timeout state in `shodo-kernel.js` to match the exact strings extracted by `scripts/render_shodo_cues.py`. |
| **IMP-03: Mobile Copy-Paste Token Clipping & UI Artifact Injection** | **High** | Copying multi-line shell heredocs from mobile browser views into Termux repeatedly stripped bracketed array indices (`[0]`, `[idx]`), clipped identifiers (`rect.top`, `cuePlayer.play()`), and injected browser UI badge text (`"Use code with caution."`) directly into ESM source files. | Mobile browser selection boundaries across syntax-highlighted code blocks drop special characters or capture adjacent DOM labels, requiring atomic Python file rewrites or base64-encoded payloads rather than raw inline string replacements. |
| **IMP-04: Multi-Turn Assistant Generation Stall (Empty Responses)** | **Critical** | Across seven consecutive turns following the GitHub Actions screenshot (`image_aIx9lJ.png`), the AI assistant returned empty responses—failing to inspect the CI failure log, provide diagnostic Termux commands, or compile the requested Markdown audit. | Context-window saturation after a prolonged multi-repository build session combined with multimodal image-attachment handling caused silent response truncation until context reset. |

---

## 3. Root-Cause Technical Analysis

1. **Why `.github/workflows/render-shodo-cues.yml` Showed No `Run workflow` Button (`IMP-01`):**  
   In the GitHub Actions screenshot (`Nov 21, 2026, 09:39`), the workflow is listed by its file path (`.github/workflows/render-shodo-cues.yml`) rather than its `name:` field (`Render Shodō & Ogham Koan Voice Cues (.wav)`), and every commit (`#5` through `#8`) shows `Failure` within seconds. When a workflow YAML file has malformed indentation or non-ASCII/tab characters introduced during mobile copy-paste, GitHub registers the file path on push, fails YAML validation immediately (`0s` runtime), and suppresses the **`Run workflow`** `workflow_dispatch` button entirely.
2. **Why `scripts/render_shodo_cues.py` Failed During Earlier Commits (`#1`–`#4`):**  
   Prior to `commit e281932`, `src/shodo-kernel.js` and `src/brush-app.js` contained clipped template literals (`${k.title}` without backticks) and UI copy-paste text (`"Use code with caution."`). Even after fixing `brush-app.js` in `e281932`, `scripts/render_shodo_cues.py` still contained the unquoted `${k.title}` expression from `commit fb229ef`, causing `node --input-type=module -e` inside the runner to exit with `SyntaxError`.
3. **Storage & Edge Constraint Discipline (`233 MB` Free on `/data`):**  
   Maintaining the clone $\to$ patch $\to$ test $\to$ push $\to$ `rm -rf` lifecycle kept local `/data` headroom stable at `233 MB` throughout all eight commits, confirming that offloading `piper-tts` (`en_GB-alan-medium`) synthesis to GitHub Actions remains mandatory for edge sustainability.

---

## 4. Concrete Remediation Plan (`v1.0.1` Recovery)

1. **Inspect Exact CI Failure & Overwrite `.github/workflows/render-shodo-cues.yml` Cleanly:**  
   Verify the YAML syntax with Python (`yaml.safe_load` or clean line-by-line generation) so `workflow_dispatch:` parses cleanly and restores the **`Run workflow`** button on `main`.
2. **Fix `scripts/render_shodo_cues.py` String Concatenation:**  
   Ensure `scripts/render_shodo_cues.py` uses explicit `+` string concatenation (`k.title + ". " + k.koan + " " + k.sceneOpening`) matching `formatKoanIntro(k)` in `src/brush-app.js` byte-for-byte so every FNV-1a `cue_<hash>.wav` filename resolves without HTTP `404`.
3. **Verify Full Brush-to-Audio Loop on `http://127.0.0.1:8092`:**  
   Once GitHub Actions commits `audio/cue_*.wav` to `main`, playtest both freehand pointer strokes (`CIRCLE`, `SLASH`, `WAVE`, `CROSS`) and keyboard/button fallbacks (`O`, `/`, `~`, `+`) to confirm 1:1 spoken-word parity.

---

## 5. Provenance & Non-Activation Clause

* **Status:** Verified CI & Tooling Impasse Audit (`Triangle-Mutiny/accessibility/devnotes` • Non-Activating Specification)  
* **Author & License:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland) • MIT License  
* **DCO Sign-off:** `Signed-off-by: Borealis Serenity Hedling <chguard-sentinel@vaked.dev>`
