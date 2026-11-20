# Blind-User Accessibility & State-Machine Audio Engineering Audit: Playtest Evaluation of `Zen-Parable-Embodied-Voice-Edition`

**Document ID:** `TM-ACC-AUDIT-PLAYTEST-V1.0`  
**Placement:** `Triangle-Mutiny/accessibility/devnotes/Embodied-Audio-Sanctuary-Playtest-And-State-Audio-Audit-v1.0.md`  
**Upstream Repositories & Artifacts:**  
* `Borealiscodes/Zen-Parable-Embodied-Voice-Edition` (`commit 4661026`, `http://127.0.0.1:8091`)  
* `Borealiscodes/Zen-Parable-NonDual-Reflection` (`v1.0.0`)  
* `Borealiscodes/piper_tts` (`DOI: 10.5281/zenodo.24399123`)  
**Maintainer:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland)  
**Date:** November 20, 2026  

---

## 1. Executive Summary

Live mobile playtesting of `Zen-Parable-Embodied-Voice-Edition` (`en_GB-alan-medium` VITS cues at `1.28x` cadence over a `<= 780 Hz` WebAudio river/wind soundscape) confirmed that regional neural voice synthesis eliminates the metallic fatigue of built-in OS screen readers. However, end-to-end playtesting across Acts 1 and 2 uncovered **four severe accessibility barriers for blind and low-vision players** alongside **four underlying state-machine and audio-pipeline bugs** that must be resolved before release.

---

## 2. Accessibility Issues Affecting Blind & Low-Vision Players

| Barrier ID | Severity | Lived Impact on Blind & Low-Vision Users | Root Cause in Current Build |
| :--- | :--- | :--- | :--- |
| **ACC-01: Silent-Boot Discoverability Trap** | **Critical** | The sanctuary boots with both **Sanctuary Soundscape: OFF** and **Storyteller Voice: OFF** (`spokenEnabled = false`). A blind user opening the page hears total silence unless they manually hunt through header toggle buttons first, directly contradicting the RNIB Roundhouse "acoustic-first room" premise. | Browser autoplay policies block WebAudio / `<audio>` prior to a user gesture, and the UI lacks a primary, auto-focused **"Enter Acoustic Sanctuary (Enable Soundscape & Voice)"** entry gate or automatic audio unlock on the first gesture press. |
| **ACC-02: Truncated Cross-Act Narrative & Missing Koan/Control Onboarding** | **High** | When completing Act 1 (`ONE_HAND`) and entering Act 2 (*The Raft and the Shore*), the player hears the transition announcement (*"A single breath of Shakuhachi flute... — II. The Raft and the Shore"*) **without** hearing Act 2's koan, scene opening, or available gesture keys (`A`, `W`, `D`, `R`). Blind players enter Act 2 with zero orientation to the new environment or controls. | `p0-ONE_HAND.wav` ends immediately after announcing Act 2's title, while `p1-intro.wav` fails to chain reliably on mobile Chrome or is suppressed/interrupted, leaving the koan and key prompts unspoken. |
| **ACC-03: Contradictory Causal Feedback (State-Blind Audio Cues)** | **Critical** | After pressing **`Board the Cedar Raft (A)`** and then pressing **`Step Onto the Far Shore (W)`**, the spoken audio falsely reports *"The river is still in front of you"*—telling a blind player their valid movement failed even when the internal state advanced. Similarly, **`Let Go of the Raft (R)`** can advance to Act 3 without speaking the raft-release resolution. | Static audio cues were pre-rendered from a single default state (`createNonDualState()`) rather than branching on sub-stage preconditions (`onRaft`, `crossedShore`, `stillnessCount`, `measuresPoured`). |
| **ACC-04: Visual-Only Selection & Dual Screen-Reader Collision Risk** | **Moderate** | Visually highlighted text selections (`parableTitleEl`, `parableKoanEl`) are separate DOM nodes from the `aria-live` `storyVoiceEl` region. When a blind player uses TalkBack/VoiceOver alongside built-in Storyteller Voice, two voices collide unless `aria-live` announcements and `.wav` cues share a single deterministic `audioCueKey`. | `reflection-app.js` updates `parableTitleEl` and `parableKoanEl` silently while only sending `state.narration` to `storyVoiceEl`, splitting the visual/screen-reader DOM from the `.wav` audio script. |

---

## 3. Root-Cause Engineering Analysis

1. **Precondition-Blind Cue Extraction (`scripts/render_calm_cues.py`):**  
   Calling `performContemplativeGesture(createNonDualState(), c.id)` once per button only exercises the **initial entry guard** of multi-step parables:
   * In **Parable 2 (*The Raft and the Shore*)**, `STEP_ASHORE` has two distinct states (`!onRaft` warning vs. `onRaft` arrival), and `RELEASE_RAFT` has three distinct states (`!onRaft` warning, `onRaft && !crossedShore` premature release, and `crossedShore` completion).
   * In **Parable 3 (*Two Monks and the Flag*)**, `REST_STILL` progresses across multiple stillness breaths (`stillnessCount` $1 \to 2 \to 3$).
   * In **Parable 4 (*The Empty Cup*)**, `POUR_MEASURE` progresses across four ladle measures (`measuresRemaining` $4 \to 3 \to 2 \to 1 \to 0$).
2. **Missing Explicit `audioCueKey` Contract in `nondual-kernel.js`:**  
   Because `performContemplativeGesture` returns `state.narration` as a plain string without an explicit `state.audioCueKey` identifier, the UI layer (`reflection-app.js`) has to guess which `.wav` file matches the state transition—causing mismatches whenever one button has multiple state-dependent outcomes.
3. **Mobile Media-Session Chaining & Entry Gate:**  
   Chaining two sequential `.wav` files (`p0-ONE_HAND.wav` $\to$ `p1-intro.wav`) via `onended` requires a single persistent `HTMLAudioElement` unlocked inside an explicit **"Enter Sanctuary"** button (or the user's first button tap) so Chrome Android never drops the second track in the queue.

---

## 4. Concrete Remediation Plan (`v1.2.0` Fix)

1. **First-Tap "Enter Acoustic Sanctuary" Entry Gate (`index.html` + `reflection-app.js`):**  
   Place an auto-focused primary button at the top of the sanctuary (**`Enter Acoustic Sanctuary — Enable Soundscape & Voice`**) that unlocks WebAudio + `cuePlayer` inside a single user tap, hides the gate, and immediately plays `p0-intro.wav` (Title + Koan + Scene Opening + Gesture Keys).
2. **Kernel-Emitted `audioCueKey` for Every Branch (`src/nondual-kernel.js`):**  
   Have `performContemplativeGesture` set `state.audioCueKey` explicitly on every branch (e.g., `p1-STEP_ASHORE-need-raft`, `p1-STEP_ASHORE-arrived`, `p1-RELEASE_RAFT-need-shore`, `p1-RELEASE_RAFT-complete`), and expose a helper `getAllCanonicalAudioCues()` so `render_calm_cues.py` renders **every reachable branch `.wav`** directly from the kernel's own text.
3. **Clean Separation of Resolution Audio vs. Next-Stage Intro Audio:**  
   When a terminal gesture completes Parable $N$ and advances to Parable $N+1$, `state.audioCueKey` plays the completion resolution (`p1-RELEASE_RAFT-complete.wav`) and automatically chains `p2-intro.wav` (which speaks Act 2/3's full title, koan, scene opening, and available gesture keys).

---

## 5. Provenance & Non-Activation Clause

* **Status:** Verified Blind-Accessibility & State-Machine Audit (`Triangle-Mutiny/accessibility/devnotes` • Non-Activating Specification)  
* **Author & License:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland) • MIT License  
* **DCO Sign-off:** `Signed-off-by: Borealis Serenity Hedling <chguard-sentinel@vaked.dev>`
