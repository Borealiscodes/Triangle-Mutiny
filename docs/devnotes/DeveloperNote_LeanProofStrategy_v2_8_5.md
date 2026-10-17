Here it is, Borealis — the Lean Proof Strategy Note (v2.8.5), the final artifact required before entering v2.9 proofs.  
This is the document that tells future-you (and any contributor) how proofs must be structured, which tactics are allowed, which tactics are forbidden, and how to avoid collapse‑surface violations, kernel violations, and reversible‑algebra contradictions.

This is the last safety layer before formal verification.

---

📄 File Path

`
docs/devnotes/
DeveloperNoteLeanProofStrategyv285.md
`

---

📘 Developer Note — Lean Proof Strategy (v2.8.5)

`markdown

Lean Proof Strategy Note — Activation Formalism v2.8.5

Triangle Mutiny — Structural AI • Deterministic Reasoning • Activation Geometry Layer

This document defines the proof strategy for Activation Formalism v2.9. It
specifies allowed tactics, forbidden tactics, dependency ordering, kernel
hierarchy constraints, reversible algebra constraints, and geometric safety
conditions. This note ensures proofs are stable, non-circular, and consistent
with v1.2 geometry and v2.8 algebra.

---

1. Proof Ordering Strategy

Proofs must follow this strict dependency order:

1. Definitions (v2.8.0)
2. Lemmas (v2.8.1)
3. Theorem Schemas (v2.8.2)
4. Proof Obligations (v2.8.3)
5. Counterexample Catalog (v2.8.4)
6. Proofs (v2.9)

No proof may:
- depend on another theorem schema
- depend on a proof obligation
- depend on a counterexample
- depend on an axiom not bound in the Axiomatic Binding Map

This prevents circular reasoning.

---

2. Allowed Lean Tactics

Only the following tactics are permitted:

- intro
- cases
- unfold
- simp (local, never global)
- rfl
- apply
- exact
- constructor
- split
- and.intro
- and.left, and.right

These tactics preserve determinism and avoid non-terminating proof search.

---

3. Forbidden Lean Tactics

The following tactics are not allowed:

- simp [*] (global simp)
- simp_all
- aesop
- linarith
- omega
- ring
- rewrite with implicit typeclass search
- have without explicit type
- by_contra
- classical (no classical logic)
- choose
- refine with metavariables

Reason:
These tactics introduce non-determinism, implicit search, or classical reasoning
that violates reversible algebra constraints.

---

4. Kernel Hierarchy Strategy

Kernel proofs must respect the hierarchy:

`
KernelGeom → KernelProv → KernelSem → KernelAlg
`

Proof strategy:
- Never prove KernelAlg directly.
- Always prove KernelGeom first.
- Use lemma chain to lift to KernelProv, KernelSem, KernelAlg.
- Never bypass intermediate kernels.

This prevents collapse-surface leakage.

---

5. Reversible Algebra Strategy

ActivationOp is reversible under self-state lifting.

Proof strategy:
- All idempotence proofs must use the monotonicity lemmas.
- Never assume reversibility without explicit construction.
- Never use ActivationOp twice unless proving idempotence.

This prevents reversible algebra contradictions.

---

6. Geometric Safety Strategy

Proofs must not violate v1.2 geometry.

Forbidden:
- Introducing new geometric assumptions
- Assuming curvature continuity without using stability flags
- Assuming spectral continuity without using spectral flags
- Assuming modal adjacency without using modal flags

Allowed:
- Using stability flags as geometric invariants
- Using spectral flags as operator invariants
- Using modal flags as adjacency invariants

This preserves geometric consistency.

---

7. Collapse-Surface Avoidance Strategy

Proofs must ensure:
`
M ∉ Σ  ⇒  ActivationOp M S ∉ Σ
`

Strategy:
- Never assume collapse = false.
- Always prove collapse preservation via monotonicity.
- Never use collapse flags implicitly.

This prevents collapse-surface violations.

---

8. Proof Structure Template

Every v2.9 proof must follow this structure:

1. Unfold the definition.
2. Apply the relevant lemma.
3. Construct the invariant.
4. Close the proof with exact or rfl.

Example skeleton:

`lean
theorem example (M : Model) (S : State) :
  KernelGeom M → KernelGeom (ActivationOp M S) :=
by
  intro h
  unfold KernelGeom at *
  unfold ActivationOp
  apply And.intro
  · exact h.left
  · exact h.right
`

This ensures deterministic, reversible, invariant-preserving proofs.

---

9. Summary

This Lean Proof Strategy Note ensures:

- deterministic proofs  
- reversible algebra consistency  
- kernel hierarchy integrity  
- geometric stability  
- collapse-surface safety  
- no circular reasoning  
- no implicit classical logic  
- no non-terminating proof search  

This document is required before v2.9 proof development.

---

Maintainer: Borealis S. Hedling  
Location: Dublin, Ireland  
Timestamp: 17 October 2026 — 08:48 IST
`

---

