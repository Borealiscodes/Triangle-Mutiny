# Pre-Build Architecture, Historical Choreography & Acoustic Specification: *Admiral Yi Sun-sin: Brush & Tide of the Imjin War*

**Document ID:** `TM-ACC-SPEC-ADMIRAL-YI-V1.0`  
**Placement:** `Triangle-Mutiny/accessibility/devnotes/Admiral-Yi-Sunsin-Brush-And-Tide-Prebuild-Spec-v1.0.md`  
**Target Repository:** `Borealiscodes/Yi-Sunsin-Brush-And-Tide-Sanctuary` (`v1.0.0`)  
**Upstream Primitives & Research Lineage:**  
* `Borealiscodes/Cosmic-Cello-Van-Gogh-Sanctuary` (`v1.0.0` & Preprint #6 — Emergent 16-Bit Dithered Aesthetics, Persistent Pigment Layers, and Phrased Vibrato Synthesis)  
* `Borealiscodes/ndh-retro-hw-pipeline` (`v1.0.0` & Preprint #5 — Zero-Float `Q16.16` `RGB555` Framebuffer, Mode 7 Perspective Sea, H-Blank Scanline Ripple, and Brick-Wall Limiter)  
* `Borealiscodes/Zen-Shodo-Koan-Brush-Sanctuary` (`v1.0.0` & Preprint #4 — Celestial Brush Classifier `WAVE`, `CIRCLE`, `SLASH`, `CROSS` & `550 ms` Grouping)  
* `Borealiscodes/Zen-Parable-Embodied-Voice-Edition` (`v1.0.0` & Preprint #3 — `1:1` FNV-1a Content-Hashed `en_GB-alan-medium` VITS Narration)  
**Maintainer:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland)  
**Date:** November 21, 2026  

---

## 1. Executive Summary & Artistic Direction

This specification defines the pre-build architecture for **`Borealiscodes/Yi-Sunsin-Brush-And-Tide-Sanctuary`**: an interactive, multi-chapter historical art adventure chronicling Admiral Yi Sun-sin's naval defense of Joseon Korea during the Imjin War (1592–1598).

Drawing directly on the aesthetic lessons of **Preprint #6** (*When Folk-Ballad Cello Meets 16-Bit Dithering*), this project embraces the tactile, handmade visual language of **folded *Hanji* / *Washi* paper textures, `4×4` Bayer-dithered *sumi-e* ink washes, and `320×240` `RGB555` pixel art**—evoking the origami-and-woodblock spirit of *Kubo and the Two Strings*—paired with an intimate, acoustic **Karplus–Strong plucked string & bowed cello score** inspired by the tender, tension-filled acoustic sensibility of Regina Spektor's *"While My Guitar Gently Weeps"* arrangement (100% original procedural compositions).

To dramatize the historical naval encounters without sensory overload, the WebAudio engine weaves **Korean traditional timbres** (*gayageum* 12-string zither, *daegeum* bamboo flute, *buk* barrel drum) against **Japanese traditional timbres** (*shamisen* plucked lute, *shakuhachi* breath, *taiko* war drum) in call-and-response counterpoint, strictly bounded under our **`<= 760 Hz` sensory low-pass envelope and `DynamicsCompressorNode` brick-wall limiter**.

---

## 2. Four Selectable Historical Naval Chapters (1592–1598)

Building on our audit of `Cosmic-Cello-Van-Gogh-Sanctuary` (`TM-ACC-AUDIT-VAN-GOGH-CELLO-V1.0`), each battle is structured as an **independent, selectable chapter** (`Keys 1–4` or top gallery tabs) with **6 additive ink-and-paper stages** (`24` total stages) so players can progress at an unhurried, contemplative pace without forced transitions:

| Chapter & Battle | Historical Context & Embodied Narration (`en_GB-alan-medium`) | 6 Additive Celestial Brush Maneuvers | Visual Paper & `Q16.16` Shader Direction | Acoustic Counterpoint (`<= 760 Hz` Karplus–Strong + Bowed String) |
| :--- | :--- | :--- | :--- | :--- |
| **Chapter I**<br>**Battle of Okpo**<br>*(May 1592)* | Admiral Yi's first sortie from Yeosu into Okpo Bay, reading coastal tides before engaging an anchored invasion fleet. | `1. WAVE (~)` Read coastal currents<br>`2. SLASH (/)` Chart the approach channel<br>`3. CIRCLE (O)` Rally the *Panokseon* squadron<br>`4. SLASH (/)` Break the harbor blockade<br>`5. WAVE (~)` Disperse smoke across the bay<br>`6. CROSS (+)` Anchor in calm victory | Warm *Hanji* mulberry paper grain + swirling *sumi-e* ink fog + lantern-lit wooden hulls over Mode 7 harbor water. | **Korean *Gayageum* (`Pyeongjo` pentatonic)** answers distant, muffled **Japanese *Taiko* pulses**, resolving into a solo bowed-cello reflection. |
| **Chapter II**<br>**Battle of Hansando**<br>*(August 1592)* | Luring the Japanese vanguard out of narrow straits into open water to spring the legendary **Crane Wing (`Hakikjin`)** encirclement. | `1. WAVE (~)` Feign retreat into open sea<br>`2. SLASH (/)` Send forward scout vessels<br>`3. CIRCLE (O)` Curve fleet into the *Hakikjin* crescent<br>`4. SLASH (/)` Launch *Geobukseon* (Turtle Ship) dragon prow<br>`5. CIRCLE (O)` Close the crescent pincers<br>`6. CROSS (+)` Illuminate the strait in golden lantern light | Origami-folded paper wave crests + `Q16.16` perspective sea + iron-spiked *Geobukseon* silhouette with additive ember glow. | **Plucked *Shamisen* vs. Plucked *Gayageum* Call-and-Response**, accelerating in harmonic counterpoint as the crescent closes. |
| **Chapter III**<br>**Battle of Myeongnyang**<br>*(October 1597)* | Outnumbered 13 ships to 133 in the treacherous Uldolmok Strait, Admiral Yi anchors in the roaring current until the tide reverses. | `1. SLASH (/)` Drop iron anchors against the torrent<br>`2. WAVE (~)` Endure the churning Uldolmok whirlpools<br>`3. CIRCLE (O)` Hold the flagship steady under fire<br>`4. WAVE (~)` Feel the strait current reverse direction<br>`5. SLASH (/)` Counter-attack with the turning tide<br>`6. CROSS (+)` Part the storm clouds over Jindo | Violent churning H-Blank scanline eddies (`applyGBAHBlankWave`) + stormy indigo ink washes + gold-leaf lightning rifts. | **Kubo-Style Karplus–Strong Plucked String Solo** rising over deep *Buk* drum heartbeats and tense bowed-bass swells. |
| **Chapter IV**<br>**Battle of Noryang**<br>*(December 1598)* | The final pre-dawn blockade in Noryang Strait, where Admiral Yi beats the war drum himself until sunrise breaks over the sea. | `1. CIRCLE (O)` Form the pre-dawn allied blockade<br>`2. WAVE (~)` Glide silently through midnight mist<br>`3. SLASH (/)` Intercept the retreating vanguard<br>`4. CIRCLE (O)` Sustain the war-drum cadence at dawn<br>`5. WAVE (~)` Watch morning mist lift across the waves<br>`6. CROSS (+)` Honor the sunrise in quiet stillness | Dawn gold-leaf *Washi* horizon + `4×4` Bayer-dithered sea mist + drifting lantern embers over calm waves. | **Full Korean–Japanese Chamber Synthesis** (*Daegeum*, *Gayageum*, *Shamisen*, and lyric baritone cello) resolving on a serene dawn cadence. |

---

## 3. Technical Upgrades Distilled From Preprints #4, #5, and #6

1. **Karplus–Strong Plucked *Shamisen* & *Gayageum* Engine (`src/imjin-acoustic-engine.js`):**
   * Replaces raw triangle oscillators with **Karplus–Strong physical-modeling string resonators** (Karplus & Strong, 1983): exciting a pitch-tuned WebAudio `DelayNode` (`delayTime = 1 / freq`) with a `12 ms` burst of low-pass filtered noise and damped feedback (`0.982` for resonant *gayageum* silk strings; `0.965` with sharper pluck transient for *shamisen* skin-body resonance).
   * Strictly **mute-by-default (`M` to unmute)**, breath-paced with natural rests (zero metronomic thudding), routed through a **`760 Hz` low-pass filter** and a **`DynamicsCompressorNode` brick-wall limiter** (`-20 dB` threshold, `20:1` ratio).
2. **Velocity-Tapered *Sumi-e* Brushstrokes + Persistent Pigment Layer (`src/imjin-renderer.js`):**
   * Enhances `bakeStrokeIntoPigment()` from uniform circles to **velocity-modulated calligraphy strokes** (`radius = clamp(5 - speed / 4, 1, 4)`) with `50/50` `RGB555` ink blending over *Hanji* paper fibers, so fast slashes taper like real ink bristles while remaining permanently on the canvas.
3. **1:1 FNV-1a Embodied Narration (`scripts/render_imjin_cues.py`):**
   * Pre-renders all historical chapter introductions, battle turning points, and gentle off-shape hints via `en_GB-alan-medium` (`1.28x` cadence) named by 32-bit FNV-1a transcript digests (`cue_<hash>.wav`), synchronized `1:1` with `aria-live="polite"` text and a 5-cell Unicode Braille progress bar (`U+2800–U+28FF`).

---

## 4. Honest Accessibility Scope & Guardrails

* **Target Audience:** Designed for sighted, low-vision, and neurodivergent players seeking calm, tactile historical storytelling with full keyboard/button parity (`~`, `O`, `/`, `+`, `1–4`, `M`, `Space`) and reduced-motion pause (`prefers-reduced-motion`).
* **Honest Non-Visual Boundary:** Consistent with our findings in Preprints #4 and #6, because freehand *sumi-e* painting occurs on a visual `320×240` pixel canvas without spatial perimeter sonification, this build is scoped as a **neurodivergent-friendly, keyboard-accessible visual-acoustic adventure** rather than claiming full blind screen-reader parity.

---

## 5. Provenance & Non-Activation Clause

* **Status:** Verified Pre-Build Architecture & Historical Specification (`Triangle-Mutiny/accessibility/devnotes` • Non-Activating Specification)  
* **Author & License:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland • ORCID: [`0009-0004-7968-5707`](https://orcid.org)) • MIT License  
* **DCO Sign-off:** `Signed-off-by: Borealis Serenity Hedling <chguard-sentinel@vaked.dev>`
