# 🛡️ Accessibility Computational & Mathematical Audit: Translating Dignity, Trauma-Informed & Sensory Primitives into `ndh-game-dev-kit`

**Document ID:** `TM-ACC-AUDIT-v1.0`  
**Placement:** `Triangle-Mutiny/accessibility/devnotes/Accessibility-Computational-Audit-v1.0.md`  
**Target Downstream Runtime:** [`Borealiscodes/ndh-game-dev-kit`](https://github.com) (`v2.1.0+` • Zero-Float `Q16.16` • `Ledger 1` / `Ledger 2`)  
**Maintainer:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • County Dublin, Ireland)  
**Date:** November 20, 2026  

---

## 1. Purpose & Core Architectural Principle

This audit evaluates six upstream conceptual and formal documents across the NDH constellation to determine which primitives are **logically, computationally, and mathematically sound** for implementation inside a deterministic, zero-dependency `Q16.16` game development kit (`ndh-game-dev-kit`), and which elements must remain **strictly descriptive, metaphorical, or out of runtime scope**.

Governing invariant derived from [`Accessibility-Math-Separation.md`](Accessibility-Math-Separation.md):

> **Hard separation, soft communication.**  
> Human accessibility lives strictly in `Ledger 2` (and a thin, non-coercive preference boundary) and **never mutates `Ledger 1`** (`Q16.16` physics, collision geometry, deterministic replay digests, or Lean 4 formal proofs).

---

## 2. Source-by-Source Soundness Audit

| Upstream Source Document | Logically & Computationally Sound (Implement in `ndh-game-dev-kit`) | Metaphorical, Non-Computable, or Out of Scope (Exclude from Runtime) |
| :--- | :--- | :--- |
| **`Triangle-Mutiny/accessibility/devnotes/Accessibility-Math-Separation.md`** | **Strict `Ledger 1` / `Ledger 2` Boundary Contract:**<br>• Accessibility settings transform **how state is rendered, sounded, or paced**, never underlying `Q16.16` equations or `SHA-256` state hashes.<br>• Prevents semantic contamination of geometric invariants and preserves Lean 4 verifiability. | Conflating Kripke modal accessibility $R(w_1, w_2)$ with UI/human accessibility—keep modal logic and interaction design in disjoint manifolds. |
| **`Triangle-Mutiny/accessibility/trauma-informed-systems.tex`** | **One-Way Constraints, Non-Captivity & Non-Calcification:**<br>• **Immediate Exit / Pause / Reset** at any tick (zero unskippable traps).<br>• **Mute-by-Default & Smooth Gain Ramps** (preventing startle audio spikes or strobing visual flashes).<br>• **User Override Primacy:** Soft assist settings (e.g., adjustable `timeScaleQ16` or hold-to-toggle inputs) never lock out standard controls or harden over time. | Continuous differential manifolds $TI$, tangent bundles $\Gamma(TI)$, and Lie brackets $[\Lambda_{D_1}, \Lambda_{D_2}]$—these are structural analogies, not discrete `Q16.16` data types. |
| **`NDH-Simulation-Suite/.../CA-RNIB-Crossmap-v1.0.md` & `AccessibilityResonance-...-CombinedPrecursor-v1.0.md`** | **Chromatic Optionality & Audio-First Spatial Signposting:**<br>• **Never rely on color alone:** Pair every color token with distinct geometric shapes (`CIRCLE`, `TRIANGLE`, `DIAMOND`, `CROSS`), pattern fills, and text labels.<br>• **Spatial Sonification (`A` + `T` Fallback):** Map entity distance and bearing `(dx, dy)` deterministically in `Q16.16` to stereo pan (`[-1, +1]`), proximity pitch (`220 Hz → 660 Hz`), and optional `navigator.vibrate()` tactile pulses.<br>• **WCAG AAA High-Contrast & Colorblind-Safe Palettes** (Okabe–Ito / `≥ 7:1` contrast). | "50D sensory ecosystems" and "Axis 15–18 Holonomy"—keep high-dimensional conceptual framing in architectural docs, never inside game-loop code. |
| **`NDH-Constellation/invariants/Intersectionality-Invariant_v1_0.md` & `Triangle-Mutiny/accessibility/intersectional-dignity-systems.tex`** | **Composable, Orthogonal Accessibility Profiles:**<br>• A player may simultaneously require *low-vision spatial audio*, *reduced motion*, *one-handed hold-to-toggle inputs*, and *slower pacing*.<br>• Flags must compose **orthogonally** (independent boolean/integer fields) so enabling one accommodation never disables or degrades another. | High-altitude governance gates (`VM-VEX`) and explicit identity-axis tracking (`Axis A–H`: gender, race, neurotype, etc.)—games must **never collect, infer, or model user identity attributes**. |
| **`art.vaked.dev`** | **Theme Switcher & Live Signal Preview:**<br>• Zero-dependency theme tokens (*Verdant*, *Breeze*, *Ember*, *High-Contrast Void*) and an optional visual oscilloscope/waveform readout showing audio output before sound plays. | Secret-key IRC authentication or "God Mode" metaphors. |

---

## 3. Formal Runtime Invariants for `ndh-game-dev-kit` (`07-accessibility-bridge`)

To translate the audited principles into verifiable code (`node --test`), any accessibility adapter added to `ndh-game-dev-kit` must satisfy four testable invariants:

1. **Ledger 1 Hash Invariance:**  
   For any `Ledger 1` state $S_t$ and any visual/audio/haptic accessibility profile $P_{\text{vis/aud}}$ (with neutral game speed `timeScaleQ16 === 65536`), the canonical state digest remains identical:
   $$\text{SHA256}(\text{step}(S_t, \text{input}_t)) \text{ is invariant under } P_{\text{vis/aud}}.$$
2. **Profile Orthogonality (Non-Interference):**  
   Toggling any flag $f_i \in \{\text{highContrast}, \text{chromaticShapes}, \text{reducedMotion}, \text{audioNavigation}, \text{hapticPulse}, \text{holdToToggle}\}$ leaves every other flag $f_j$ ($j \neq i$) unchanged.
3. **Bounded Audio & Visual Energy (Trauma-Informed Safety):**  
   * Audio initializes strictly muted (`muted === true`).
   * Gain envelopes enforce minimum attack ramps ($\ge 10\text{ ms}$) and hard peak clamping ($\text{gain} \le 0.12$).
   * When `reducedMotion === true`, screen-shake, parallax velocity, and decorative particle emitters clamp to zero.
4. **Chromatic Redundancy & Deterministic Spatial Cues:**  
   * Every semantic entity class maps to a tuple `(colorHex, shapePrimitive, textLabel)`—never `colorHex` alone.
   * Spatial audio cues `(panQ16, pitchHz, pulseMs)` are computed purely from integer `(dxQ16, dyQ16)` offsets with zero floating-point drift.

---

## 4. Recommended Implementation Layout in `ndh-game-dev-kit`

* **`math-toys/07-accessibility-bridge/accessibility-bridge.js`** — Zero-float `Q16.16` orthogonal profile builder, Okabe–Ito + WCAG AAA shape-redundant palettes, audio gain safety limiter, and integer spatial radar cues.
* **`math-toys/07-accessibility-bridge/accessibility-bridge.test.mjs`** — Built-in `node --test` suite verifying the four invariants above.
* **`explainers/07-accessible-by-design.md`** — Altitude `A7` plain-language guide explaining *"Hard separation, soft communication"* and non-visual spatial navigation.
* **`AGENTS.md` Addendum** — Explicit rule forbidding AI agents from putting accessibility flags inside `Ledger 1` physics kernels or collecting user demographic/identity data.

---

## 5. Provenance & Non-Activation Clause

* **Status:** Verified Architectural Audit (`Triangle-Mutiny/accessibility/devnotes` • Non-Activating Specification)  
* **Author & License:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • County Dublin, Ireland) • MIT License  
* **DCO Sign-off:** `Signed-off-by: Borealis Serenity Hedling <chguard-sentinel@vaked.dev>`
