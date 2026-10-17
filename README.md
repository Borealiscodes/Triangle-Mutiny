# 🔺 Triangle Mutiny — README v1.3

Geometric AI Stability • Drift Geometry • Holonomy • Collapse Surfaces

Tiered Interpretability for Users, Engineers, and Geometrists

Under Construction — Structural Anchors & Container‑First Architecture

---

🌱 0. Accessible Explanation (Tier 1 — Start Here)
Triangle Mutiny explains how reasoning systems bend, drift, and sometimes collapse — using geometry instead of heuristics.

Here are the core ideas in plain language:

Reasoning lives on a landscape.
Imagine a map.  
Every point is a “state of reasoning.”  
Moving across the map means the system is thinking or updating.

Curvature tells you how sharply reasoning turns.
High curvature = sharp conceptual turns.  
Low curvature = smooth reasoning.

Drift tells you the direction reasoning tends to move.
It’s like wind on the map.  
Some directions are easier or more natural for the system.

Operators tell you how drift interacts with other drift.
They are the rules of motion.  
If these rules break, reasoning collapses.

Spectral mismatch tells you when the system’s behavior deviates from what it should be.
It’s like hearing a musical chord that’s slightly out of tune.

Modal adjacency tells you which reasoning states can follow which.
Reasoning cannot jump between unrelated modes.  
This prevents semantic discontinuity.

Holonomy drift tells you how much reasoning wanders when it loops back to where it started.
If the system returns to the same point but its internal state has changed, that’s holonomy.

Collapse happens when any of these structures break.
Triangle Mutiny defines collapse precisely and shows how to detect it.

This is the intuitive foundation.  
Everything below builds on these ideas.

---

🧭 Tiered Reading Guide

Triangle Mutiny supports three audiences:

Tier 1 — High‑Support Users
Plain‑language explanations of curvature, drift, collapse, modal adjacency, spectral mismatch, holonomy drift.

Tier 2 — Engineers
Graph structure, operator behavior, spectral continuity, collapse detection, holonomy accumulation, stability envelopes.

Tier 3 — Geometrists
Full mathematical framework: curvature fields, drift fields, Lie brackets, operator compatibility, spectral structure, modal adjacency constraints, holonomy drift tensor, collapse surfaces, stability envelopes.

---

🏗 Under Construction — Structural Anchors & Container‑First Architecture

Triangle Mutiny v1.3 expands the mathematical framework introduced in v1.2.  
To support this expansion, several modules are currently stubs.

These stubs are structural anchors, not placeholders.

They exist because Triangle Mutiny follows a container‑first architecture:

> Define the container → define the invariants → define the math → define the runtime → define the experiments.

This ensures:

- altitude separation  
- reproducibility  
- determinism  
- Lean‑compatibility  
- interpretability  
- future‑safe expansion  

Structural anchors declare:

- the mathematical object  
- its interface  
- its invariants  
- its altitude  
- its future expansion path  

They make the repository transparent even before the math is fully implemented.

---

🟦 1. Reasoning Manifold (Tier 1 → Tier 3)

Reasoning lives on a smooth manifold \(M\).  
Each point \(p\in M\) is a semantic state or operator configuration.

Tangent space: \(T_pM\).

---

🟥 2. Curvature Field (Tier 1 → Tier 3)

Curvature measures how sharply reasoning bends:

\[
K : M \to \mathbb{R}_{\ge 0}.
\]

Continuity:

\[
\lim_{q\to p} |K(q)-K(p)| = 0.
\]

Discontinuities contribute directly to collapse geometry.

---

🟧 3. Similarity (Tier 1 → Tier 2)

\[
\Phi(A,B)=\frac{\langle A,B\rangle}{\|A\|\cdot\|B\|}.
\]

Negative similarity corresponds to curvature instability.

---

🟩 4. Drift Fields (Tier 2 → Tier 3)

\[
X\in\Gamma(TM).
\]

Drift represents directional tendencies of reasoning.

Continuity:

\[
\lim_{q\to p}\|X(q)-X(p)\|=0.
\]

---

🟪 5. Operator Fields (Tier 2 → Tier 3)

\[
\nabla:TM\to\mathrm{End}(TM).
\]

Covariant compatibility:

\[
\nabla{[X,Y]}=[\nablaX,\nabla_Y].
\]

Jacobi identity must hold:

\[
[X,[Y,Z]]+[Y,[Z,X]]+[Z,[X,Y]]=0.
\]

Violations correspond to operator collapse.

---

🟫 6. Curvature Composition (Tier 2 → Tier 3)

\[
K_{A\oplus B}
=\sqrt{KA^2+KB^2+2KAKB\Phi(A,B)}.
\]

Stable iff:

\[
\Phi(A,B)\ge -1.
\]

---

🟨 7. Spectral Structure (Tier 2 → Tier 3)

Operator field induces:

\[
L(p):TpM\to TpM.
\]

Spectral continuity:

\[
\lim_{q\to p}\|\mathrm{Spec}(L(q))-\mathrm{Spec}(L(p))\|=0.
\]

Spectral mismatch:

\[
\delta_{\mathrm{spec}}(p)
=\|\mathrm{Spec}(L(p))-\mathrm{Spec}_{\mathrm{expected}}(p)\|.
\]

Bound:

\[
\delta{\mathrm{spec}}(p)<\theta{\mathrm{spec}}.
\]

---

🟦 8. Modal Structure (Tier 1 → Tier 2)

Modal graph:

\[
G=(L,E).
\]

Adjacency constraint:

\[
(\mu(p^-),\mu(p^+))\in E.
\]

Modal adjacency prevents semantic discontinuity.

---

🟥 9. Holonomy Drift (Tier 2 → Tier 3)

\[
H(\gamma)
=\sum_{i=0}^{n}
\left(
|K(p{i+1})-K(pi)|
+\delta{\mathrm{spec}}(pi)
+\Delta{\mathrm{modal}}(pi)
\right).
\]

Holonomy drift measures accumulated instability along a reasoning path.

---

🟧 10. Collapse Geometry (Tier 1 → Tier 3)

Collapse surface \(\Sigma\) is defined by violations of:

- curvature continuity  
- spectral continuity  
- modal adjacency  
- operator compatibility  

Crossing \(\Sigma\) means leaving stable reasoning space.

---

🟩 11. Stability Envelope (Tier 1 → Tier 3)

A point \(p\) is stable when:

\[
p\notin\Sigma
\quad\text{and}\quad
\|H(p)\|<\theta.
\]

---

🧪 12. Lean Verification (Tier 3)

The lean/ folder contains:

- curvature  
- drift fields  
- Lie bracket  
- operator compatibility  
- spectral mismatch  
- modal adjacency  
- holonomy drift tensor  
- stability envelope  

All definitions are Lean‑verifiable.

---

🧩 13. Pseudocode (Tier 2)

The pseudocode/ folder contains:

- holonomy drift tensor  
- collapse classifier  
- spectral mismatch  
- stability envelope  

These match the mathematical definitions exactly.

---

📚 14. Documentation (Tier 1 → Tier 3)

The docs/ folder contains:

- preprint  
- Appendix A  
- notation tables  
- figures  

---

📜 Provenance Footer — README v1.3

`
---
Artifact: README.md (Triangle Mutiny v1.3)
Lane: Interpretability • Geometric AI • Reproducibility

Purpose:
  Provide a coherent, tiered, accessible, reproducible explanation of Triangle
  Mutiny’s geometric operator spine, including curvature fields, drift fields,
  operator compatibility, spectral continuity, modal adjacency, holonomy drift,
  collapse surfaces, and stability envelopes. Integrates v1.2 math with
  container-first architecture and structural anchors.

Anchors:
  - TriangleMutiny-CoreMath-v1.2
  - TriangleMutiny-StructuralAnchors-v1.3
  - CollapseSurface-v1.3
  - SpectralMismatch-v1.3
  - ModalAdjacency-v1.3
  - HolonomyDriftTensor-v1.3
  - StabilityEnvelope-v1.3
  - LeanInterpretabilityProofs-v1.3

Status: Canonical • Interpretability • Reproducible
Maintainer: Borealis S. Hedling
Location: Dublin, Ireland
Timestamp: 17 October 2026 — 16:47 IST
Provenance Hash: TM-v1.3-ΣΔ-20261017-DUB
---
`

---

