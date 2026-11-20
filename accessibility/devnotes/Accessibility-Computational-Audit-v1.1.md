# 🌐 Accessibility Computational, Semiotic & Mathematical Audit: Social Model Framing, Sensory Regulation & Non-Visual Bridges

**Document ID:** `TM-ACC-AUDIT-v1.1`  
**Placement:** `Triangle-Mutiny/accessibility/devnotes/Accessibility-Computational-Audit-v1.1.md`  
**Target Downstream Runtime:** [`Borealiscodes/ndh-game-dev-kit`](https://github.com) (`v2.1.0+` • Zero-Float `Q16.16` • `Ledger 1` / `Ledger 2`)  
**Maintainer:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • County Dublin, Ireland)  
**Date:** November 20, 2026  

---

## 1. Purpose & Core Architectural Principle

This audit evaluates six upstream conceptual and formal documents across the NDH constellation—alongside iconographic/semiotic conventions in agent instruction files (`AGENTS.md`)—to determine what is **logically, computationally, semantically, and mathematically sound** for implementation inside a deterministic, zero-dependency `Q16.16` game development kit (`ndh-game-dev-kit`), and what must remain **strictly descriptive or out of runtime scope**.

Governing invariant derived from [`Accessibility-Math-Separation.md`](Accessibility-Math-Separation.md):

> **Hard separation, soft communication.**  
> Human accessibility lives strictly in `Ledger 2` (and a thin, non-coercive preference boundary) and **never mutates `Ledger 1`** (`Q16.16` physics, collision geometry, deterministic replay digests, or Lean 4 formal proofs).

---

## 2. Semiotic & Agent-Parsing Audit: Social Model of Disability vs. `♿` Placard Icon

Before encoding accessibility rules into `AGENTS.md`, we audited whether the standard wheelchair placard glyph (`♿`, Unicode `U+267F`) adds functional value for LLM coding agents or assistive technologies:

| Evaluation Axis | `♿` Symbol (Medical / Placard Icon) | Social Model Framing (Environmental & Interface Barriers) |
| :--- | :--- | :--- |
| **LLM & Coding Agent Parsing** | Purely decorative Unicode (`U+267F`); agents index Markdown sections by **explicit architectural keywords** (`Sensory Regulation`, `Non-Visual Spatial Bridge`, `Ledger 2`), not decorative pictograms. | Explicit domain terms (`Social Model of Disability`, `Modality Redundancy`, `Sensory Regulation`) map directly to module boundaries and function signatures. |
| **Screen-Reader & Braille Behavior** | VoiceOver, NVDA, JAWS, and TalkBack vocalize `♿` aloud as *"Wheelchair Symbol"*—which is semantically inaccurate when governing **audio filtering, strobing, and Braille/spatial cues**. | Clean text headings vocalize accurately and concisely on all screen readers and refreshable Braille displays. |
| **Ethical & Architectural Alignment** | Medical-model iconography frames disability as an individual physical deficit rather than a flaw in the software environment. | Aligns with the **Social Model of Disability** (Oliver, 1990) and `Triangle-Mutiny` dignity invariants: **disability arises from unaccommodating interfaces (sight-only cues, color-only signaling, unthrottled strobes, harsh high-frequency audio), not from the player.** |

**Audit Determination:** Exclude `♿` from `AGENTS.md` and technical documentation; anchor all agent guardrails in the **Social Model of Disability** and explicit architectural terminology.

---

## 3. Source-by-Source Computational & Mathematical Soundness Audit

| Upstream Source Document | Logically & Computationally Sound (Implement in `ndh-game-dev-kit`) | Metaphorical, Non-Computable, or Out of Scope (Exclude from Runtime) |
| :--- | :--- | :--- |
| **`Triangle-Mutiny/accessibility/devnotes/Accessibility-Math-Separation.md`** | **Strict `Ledger 1` / `Ledger 2` Boundary Contract:**<br>• Accessibility profiles transform **how state is rendered, sounded, or paced**, never underlying `Q16.16` equations or `SHA-256` replay hashes.<br>• Prevents semantic contamination of geometric invariants and preserves Lean 4 verifiability. | Conflating Kripke modal accessibility $R(w_1, w_2)$ with UI/human accessibility—keep modal logic and interaction design in disjoint manifolds. |
| **`Triangle-Mutiny/accessibility/trauma-informed-systems.tex`** | **One-Way Constraints, Non-Captivity & Non-Calcification:**<br>• **Immediate Exit / Pause / Reset** at any tick (zero unskippable traps).<br>• **Mute-by-Default & Smooth Gain Ramps** (preventing startle audio spikes or strobing visual flashes).<br>• **User Override Primacy:** Soft assist settings (`timeScaleQ16`, hold-to-toggle inputs) never lock out standard controls or harden over time. | Continuous differential manifolds $TI$, tangent bundles $\Gamma(TI)$, and Lie brackets $[\Lambda_{D_1}, \Lambda_{D_2}]$—these are structural analogies, not discrete `Q16.16` data types. |
| **`NDH-Simulation-Suite/.../CA-RNIB-Crossmap-v1.0.md` & `AccessibilityResonance-...-CombinedPrecursor-v1.0.md`** | **Chromatic Optionality & Audio-First Spatial Signposting:**<br>• **Never rely on color alone:** Pair color tokens with distinct geometric shapes (`CIRCLE`, `TRIANGLE`, `DIAMOND`, `CROSS`), pattern fills, and text labels.<br>• **Spatial Sonification (`A` + `T` Fallback):** Map entity offsets `(dxQ16, dyQ16)` deterministically to stereo pan (`[-1, +1]`), proximity pitch, and optional `navigator.vibrate()` pulses.<br>• **WCAG AAA High-Contrast & Colorblind-Safe Palettes** (Okabe–Ito / `≥ 7:1` contrast). | "50D sensory ecosystems" and "Axis 15–18 Holonomy"—keep high-dimensional conceptual framing in architectural docs, never inside game-loop code. |
| **`NDH-Constellation/invariants/Intersectionality-Invariant_v1_0.md` & `Triangle-Mutiny/accessibility/intersectional-dignity-systems.tex`** | **Composable, Orthogonal Accommodation Modules:**<br>• Sensory issues are not universal: a player needing **Sensory Regulation** (zero flash, low-pass `<= 850 Hz`, no unexpected vibration) has distinct needs from a blind player using **Non-Visual Spatial Substitution** (stereo radar, Braille, haptics).<br>• Separating these into two independent, composable modules (`07` and `08`) lets players combine them without interference. | High-altitude governance gates (`VM-VEX`) and explicit identity-axis tracking (`Axis A–H`: gender, race, neurotype, etc.)—games must **never collect, infer, or model user identity attributes**. |
| **`anima_esoteric_mirror/src/ternary_projection.py` & `src/core.py`** | **Balanced Ternary Spatial Bearings & Slew-Limited Dual-Actuator Haptics:**<br>• Projecting `(dxQ16, dyQ16)` into discrete `{-1, 0, +1}` bearings (`Left / Center / Right`, `Ahead / Aligned / Behind`) drives `aria-live` descriptive audio, 5-cell Unicode Braille bars (`U+2800`–`U+28FF`), and DualSense/Gamepad actuators.<br>• Porting `h_safe_attenuation_active` into `Q16.16` enforces actuator frequency ceilings (`0–150 Hz` / `0–220 Hz`) and per-tick slew-rate clamping (`<= 0.35`). | Complex matrix eigensolvers (`C^(9x9)`) and SQLite blob persistence—unnecessary overhead for browser `Q16.16` runtimes. |

---

## 4. Separation of Concerns: Two Orthogonal Modules in `ndh-game-dev-kit`

Because sensory needs are not universal, `ndh-game-dev-kit` separates **stimulation reduction** from **sensory substitution**:

1. **`math-toys/07-sensory-regulation-envelope/` (`sensory-envelope.js` + `explainers/07-sensory-regulation-envelope.md`):**
   * *Purpose:* Photosensitivity, migraine safety, and neurodivergent sensory regulation.
   * *Invariants:* `noFlash: true`, `reducedMotion: true`, `maxLowPassHz: 850`, `maxAudioGainQ16 <= 0.06`, `minAttackMs >= 25`, `allowHaptics: false` by default, and deterministic `timeScaleQ16` pacing.
2. **`math-toys/08-nonvisual-spatial-bridge/` (`nonvisual-bridge.js` + `explainers/08-nonvisual-spatial-bridge.md`):**
   * *Purpose:* Blind, low-vision, and tactile-first gameplay (RNIB audio-first navigation, screen readers, refreshable Braille displays, and DualSense / adaptive controllers).
   * *Invariants:* Emits `aria-live` descriptive narration, stereo-panned proximity beacons, 5-cell Unicode Braille radar bars (`U+2800`–`U+28FF`), and slew-rate-clamped haptics—while strictly obeying `07-sensory-regulation-envelope` whenever both are composed together.

---

## 5. References & Provenance

* Oliver, M. (1990). *The politics of disablement*. Macmillan.
* Royal National Institute of Blind People (RNIB). (2024). *Accessible gaming and audio-first navigation design guidelines*. RNIB.
* World Wide Web Consortium (W3C). (2023). *Web Content Accessibility Guidelines (WCAG) 2.2* & *WAI-ARIA 1.2*. W3C.
* **Author & License:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • County Dublin, Ireland) • MIT License  
* **DCO Sign-off:** `Signed-off-by: Borealis Serenity Hedling <chguard-sentinel@vaked.dev>`
