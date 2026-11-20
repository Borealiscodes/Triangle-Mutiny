# 🎙️ Sequential Action-Completion & Stage-Transition Audio Queue Audit: Why Single-Cue Replacement Truncates Narrative Closure in Interactive Audio Games

**Document ID:** `TM-ACC-AUDIT-AUDIO-QUEUE-v1.0`  
**Placement:** `Triangle-Mutiny/accessibility/devnotes/Sequential-Action-Completion-Audio-Queue-Audit-v1.0.md`  
**Upstream Repositories & Artifacts:**  
* `Borealiscodes/Zen-Parable-Embodied-Voice-Edition` (`src/reflection-app.js`, commit `f52928d`)  
* `Borealiscodes/Zen-Parable-NonDual-Reflection` (`src/nondual-kernel.js`)  
**Maintainer:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland)  
**Date:** November 20, 2026  

---

## 1. Empirical Playtest Observation (Act 2 $\to$ Act 3 Transition Truncation)

During live playtesting of `Zen-Parable-Embodied-Voice-Edition` (`http://127.0.0.1:8091`) after fixing the single-cue stage-transition lookup (`f52928d`), `en_GB-alan-medium` cues played reliably without falling back to OS `speechSynthesis`, yet revealed a **structural narrative truncation** whenever a terminal gesture completed one parable and immediately opened the next:

1. **What Happened in Text (`aria-live`):** Pressing `R` (`RELEASE_RAFT`) in Act 2 produced a compound narrative string combining both the action's resolution and the next stage's opening:  
   > *"You set the cedar raft down at the water's edge and walk forward unburdened — III. Two Monks and the Flag (Mumonkan Case 29)..."*
2. **What Happened in Single-Cue Audio (`p2-intro.wav`):** Because the cue resolver replaced the outgoing action cue (`p1-RELEASE_RAFT.wav`) directly with the incoming stage intro (`p2-intro.wav`), the player **never heard the spoken resolution of the parable they had just solved**, jumping straight into Act 3's opening without narrative closure.
3. **Phenomenological Impact:** For blind and low-vision players relying on audio as the primary medium, skipping the spoken outcome of a terminal gesture breaks causal feedback—leaving the listener unsure whether their gesture succeeded before a new scene begins.

---

## 2. Architectural Resolution: Deterministic Sequential Audio Cue Queue (`audio.onended` + `650 ms` Breath)

When a deterministic state transition (`performContemplativeGesture(state, actionId)`) advances `state.stageIndex` from `prevStage` to `nextStage`, the audio layer must treat the transition as an **ordered two-cue sequence** rather than a single overwrite:

| Transition Condition | Audio Cue Queue (`cueQueue`) | Timing & Cancellation Invariant |
| :--- | :--- | :--- |
| **`nextStage === prevStage`** (Intra-stage gesture) | `[ "p${nextStage}-${actionId}" ]` | Plays action narrative & koan reflection immediately. |
| **`nextStage !== prevStage`** (Cross-act completion) | `[ "p${prevStage}-${actionId}", "p${nextStage}-intro" ]` | Plays outgoing action resolution (`p1-RELEASE_RAFT.wav`), pauses **`650 ms`** over the `<= 780 Hz` river/wind bed (`setTimeout`), then plays the incoming stage opening (`p2-intro.wav`). Any new gesture or voice toggle cancels pending timers (`clearTimeout`) cleanly. |

---

## 3. Provenance & Non-Activation Clause

* **Status:** Verified Interactive Audio State-Machine Audit (`Triangle-Mutiny/accessibility/devnotes` • Non-Activating Specification)  
* **Author & License:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland) • MIT License  
* **DCO Sign-off:** `Signed-off-by: Borealis Serenity Hedling <chguard-sentinel@vaked.dev>`
