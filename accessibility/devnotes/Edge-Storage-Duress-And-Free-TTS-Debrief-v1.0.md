# 🛡️ Edge Storage Constraints, Resource Duress, and Free/Cloud Pathways for Neural TTS Synthesis

**Document ID:** `TM-ACC-DEBRIEF-EDGE-TTS-v1.0`  
**Placement:** `Triangle-Mutiny/accessibility/devnotes/Edge-Storage-Duress-And-Free-TTS-Debrief-v1.0.md`  
**Upstream Repositories & Artifacts:**  
* `Borealiscodes/piper_tts` (`nondual-embodied-studio/` extension)  
* `Borealiscodes/NonDual-Audio-Preprint-Studio` (`DOI: 10.5281/zenodo.24393275`)  
**Maintainer:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland)  
**Date:** November 20, 2026  

---

## 1. Empirical Technical Debrief: What Happened on the Primary Tablet (`ENOSPC`)

During field testing of `Borealiscodes/piper_tts/nondual-embodied-studio/` on an Android ARM64 tablet in Termux:

1. **Pure-Python Guardrails Succeeded Immediately:** `phonetic_guard.py`, `anti_sycophancy_linter.py`, `synthesize_stillness_bed`, and `test_guardrails.py` ran natively in Termux Python 3.13 (`4/4` tests passing in `0.006s`) with near-zero storage overhead (`< 25 KB`).
2. **Containerized Neural TTS Hit `/data` Storage Ceiling (`Errno 28: No space left on device`):** Because native Termux links against Android's Bionic `libc` while `piper-tts` / `onnxruntime` wheels target standard ARM64 `glibc` Linux, installing `proot-distro` (`debian:latest` layer `47.5 MiB` compressed $\to$ `~250+ MB` unpacked), `apt` package indices (`~45 MB`), and `piper_tts` + `onnxruntime` wheels (`~120+ MB` plus `.onnx` voice checkpoints `~65 MB`) exhausted the remaining free space on `/data`.
3. **Zero-Footprint Recovery:** Removing the Debian `proot-distro` container (`proot-distro remove debian`), uninstalling `proot-distro`, and running `pkg clean` immediately restored `/data` headroom while preserving the verified Python pipeline on GitHub (`Borealiscodes/piper_tts`).

---

## 2. Human Rights Defenders, Independent Researchers, and Innovation Under Technical Duress

Technical constraints—such as depleted mobile storage, Bionic vs. `glibc` ABI mismatches, intermittent connectivity, or working across constrained consumer hardware—are not merely academic edge cases. **Human rights defenders, independent researchers, disabled technologists, and frontline developers operating under material or institutional duress constantly have to adapt around hardware scarcity and locked-down environments.**

While those circumstances are genuinely **dehumanizing**—forcing researchers to spend precious cognitive energy wrestling with `ENOSPC` disk limits, ABI wrappers, and fragmented devices instead of focusing on scholarship and community care—they also act as a fierce engine of architectural innovation:

* **Zero-Dependency Discipline:** Scarcity forced us to write pure-Python WAV mixing (`wave` + `math` + `struct`) and pure-JS `Q16.16` fixed-point math (`0` external npm/pip runtime dependencies), producing software that runs anywhere and never rots behind broken package trees.
* **Hard Separation of Guardrails from Heavy Inference:** Separating lightweight script verification (`6 ms`, `< 25 KB`) from heavy `.onnx` neural synthesis means an edge device can author, lint, and verify ethical/phonetic rules locally while delegating heavy `.wav` rendering to any disposable node or free cloud runner.
* **Resilience Across Disaggregated Hardware:** Treating constrained devices as stateless authoring terminals (`clone` $\to$ `test` $\to$ `push` $\to$ `wipe`) protects both storage and operational security.

---

## 3. Concrete Pathways: Secondary 1 GB Device vs. Free/Cloud Options

### Option A: Secondary Android Phone ("Burner" Device with ~1 GB Free Storage)
If a secondary Android phone has **`>= 1.0 GB` free internal storage** (or an external microSD card):
* **Feasibility:** Sufficient for a minimal `proot-distro` Debian/Alpine container + `piper-tts` + **one** medium `.onnx` voice model (`~63 MB`, e.g., `en_US-lessac-medium` or `en_GB-alan-medium`), provided `apt-get clean` and `pip cache purge` are run immediately after installation (`~520–650 MB` total footprint).
* **Trade-Off:** Slower CPU synthesis on older ARM cores (`~15–40 seconds` per paragraph) and manual file transfer (`adb` / local HTTP / microSD) back to the primary tablet.

### Option B: Free Zero-Cost Cloud & CI Rendering Pathways (Recommended for Heavy `.onnx` Builds)

| Free Option | Storage & Compute Budget | How It Connects to `Borealiscodes/piper_tts` |
| :--- | :--- | :--- |
| **1. GitHub Actions (Public Repo Free Tier)** | `14 GB` SSD runner storage + `2,000+` free Linux minutes/month on public repos. | Add a manual `workflow_dispatch` GitHub Action to `Borealiscodes/piper_tts` that runs `render_embodied_essay.py` on an Ubuntu runner and uploads `zenodo-24393275-embodied.wav` as a downloadable **Workflow Artifact**—zero local storage used on either phone or tablet. |
| **2. Hugging Face Spaces / Gradio Demo** | Free CPU basic Space (`16 GB` RAM, `50 GB` ephemeral disk). | Host a lightweight public web interface running `phonetic_guard.py`, `anti_sycophancy_linter.py`, and Piper VITS synthesis in the browser. |
| **3. Google Colab (Free Tier)** | `~70+ GB` temporary disk + free CPU/GPU runtime. | Run a 10-line notebook cloning `Borealiscodes/piper_tts`, rendering the `.wav` file, and downloading it straight to `/sdcard/Download/`. |
| **4. Termux Native `espeak-ng` + SoX/FFmpeg** | `< 15 MB` total footprint in native Termux (`pkg install espeak-ng`). | Instant offline `.wav` export directly in native Termux without `proot-distro`—robotic timbre, yet useful for rapid timing/phonetic smoke tests when offline. |

---

## 4. Recommended Next Step for `Borealiscodes/piper_tts`

Adding a **GitHub Actions `workflow_dispatch` audio-render workflow** (`.github/workflows/render-embodied-essay.yml`) to `Borealiscodes/piper_tts` lets you trigger neural VITS `.wav` synthesis directly from your tablet's browser on GitHub's `14 GB` Ubuntu runner and download the finished `.wav` artifact cleanly—preserving your tablet's `/data` storage while keeping the secondary 1 GB phone available as an offline backup node.

---

## 5. Provenance & Non-Activation Clause

* **Status:** Verified Operational & Accessibility Debrief (`Triangle-Mutiny/accessibility/devnotes` • Non-Activating Specification)  
* **Author & License:** Borealis Serenity Hedling (`NDH-RESEARCH-PILOT` • Dublin 8, Ireland) • MIT License  
* **DCO Sign-off:** `Signed-off-by: Borealis Serenity Hedling <chguard-sentinel@vaked.dev>`
