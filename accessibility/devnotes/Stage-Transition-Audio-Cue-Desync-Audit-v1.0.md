# 🎙️ State-Transition Audio Cue Desynchronization Audit: Resolving Cross-Act `stageIndex` vs. `actionId` Collisions in Interactive Audio Games

**Document ID:** `TM-ACC-AUDIT-STAGE-TRANSITION-v1.0`  
**Placement:** `Triangle-Mutiny/accessibility/devnotes/Stage-Transition-Audio-Cue-Desync-Audit-v1.0.md`  
**Upstream Repositories & Artifacts:**  
* `Borealiscodes/Zen-Parable-Embodied-Voice-Edition` (`src/reflection-app.js`, commit `a565488`)  
* `Borealiscodes/Zen-Parable-NonDual-Reflection` (`src/nondual-kernel.js`)  
**Maintainer:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland)  
**Date:** November 20, 2026  

---

## 1. Empirical Playtest Observation (Act 1 $\to$ Act 2 Transition)

During live playtesting of `Zen-Parable-Embodied-Voice-Edition` (`http://127.0.0.1:8091`) with pre-rendered canonical `en_GB-alan-medium` `.wav` cues:

1. **Act 1 (`stageIndex = 0`) Played Cleanly:** `p0-intro.wav` and `p0-CLAP_TWO.wav` rendered at `1.28x` Roundhouse cadence over the `<= 780 Hz` WebAudio river/wind soundscape with full gameplay key prompts (`"Press A to Clap Two Hands Together. Press D to Listen to One Hand"`).
2. **Act 2 Immediately Triggered Graceful Fallback to OS `speechSynthesis`:** Pressing `D` (`ONE_HAND`) completed Act 1 and immediately transitioned the kernel state (`state.stageIndex` incremented from `0` to `1`), yet the UI cue resolver paired the **new** `state.stageIndex` (`1`) with the **outgoing** `lastActionId` (`"ONE_HAND"`).
3. **Resulting 404 & Jarring Timbre Shift:** The browser requested `/audio/p1-ONE_HAND.wav` (HTTP `404`), causing `audio.play().catch(fallbackSpeech)` to fire `window.speechSynthesis`—abruptly switching from the warm `en_GB-alan-medium` VITS voice back to the metallic Android screen-reader voice at the exact moment Act 2 opened.

---

## 2. Root-Cause State Machine Analysis & Deterministic Fix

In a finite-state narrative kernel (`performContemplativeGesture(state, actionId)`), user actions fall into two distinct topological classes:

| Transition Class | Kernel Behavior (`prevStage` vs. `nextStage`) | Required Audio Cue Key |
| :--- | :--- | :--- |
| **Intra-Stage Reflection** | `nextStage === prevStage` (user explores an action within the current parable, e.g., `CLAP_TWO`, `ARGUE_WIND`, `ADD_OPINION`). | `p${nextStage}-${actionId}.wav` (speaks the action's narrative & koan reflection). |
| **Inter-Stage Advancement** | `nextStage !== prevStage` (terminal gesture completes Parable $N$ and opens Parable $N+1$, e.g., `ONE_HAND`, `RELEASE_RAFT`, `REST_STILL`, `POUR_MEASURE`). | `p${nextStage}-intro.wav` (speaks the new stage's title, koan, scene opening, and available gesture keys). |

### Reference Guard Implementation (`src/reflection-app.js`)
```javascript
const triggerGesture = (actionId) => {
  const prevStage = state.stageIndex;
  state = performContemplativeGesture(state, actionId);
  lastActionId = state.stageIndex !== prevStage ? "intro" : actionId;
  // ...
};
```

*(Note: Furthermore, when a terminal gesture both completes Parable $N$ and advances to Parable $N+1$, queueing `p${prevStage}-${actionId}.wav` followed by `p${nextStage}-intro.wav`—or ensuring `p${nextStage}-intro.wav` plays cleanly without 404 fallback—prevents sudden voice timbre whiplash across stage boundaries.)*

---

## 3. Provenance & Non-Activation Clause

* **Status:** Verified Interactive Audio State-Machine Audit (`Triangle-Mutiny/accessibility/devnotes` • Non-Activating Specification)  
* **Author & License:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland) • MIT License  
* **DCO Sign-off:** `Signed-off-by: Borealis Serenity Hedling <chguard-sentinel@vaked.dev>`
