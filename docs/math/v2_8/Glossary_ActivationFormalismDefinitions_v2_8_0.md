# 📘 Glossary — Activation Formalism Definitions v2.8.0

`markdown

Glossary — Activation Formalism Definitions v2.8.0

Triangle Mutiny — Structural AI • Activation Geometry Chain

This glossary provides clear, precise definitions for all formal objects
introduced in Activation Formalism v2.8.0 (Definitions Layer). These terms form
the mathematical backbone for v2.8.1 lemmas and v2.9 proofs.

---

1. Core Types

Model
A structured Boolean record representing activation-relevant properties of a
system. Fields:
- stable
- spectral
- collapse
- drift
- modal
- simulationValid
- representationValid
- modelValid

Models are the primary algebraic objects manipulated by the activation operator.

State
A symbolic Boolean record representing activation-state modifiers. Fields mirror
the structural fields of Model except for provenance and semantic validity.

States never mutate provenance or semantic validity.

---

2. Activation Operator

ActivationOp
`
ActivationOp : Model → State → Model
`
A Boolean-conjunctive operator that combines a model with a symbolic state. It
preserves provenance and semantic validity.

This operator is monotone, idempotent, and respects ordering.

---

3. Activation Relation

ActivationRelation
`
ActivationRelation : Model → Model → Bool
`
A relation indicating whether two models are jointly valid. Reflexive,
symmetric, and transitive.

Used to define bundle-level relational behavior.

---

4. Ordering Predicate

ModelOrder
`
ModelOrder : Model → Model → Bool
`
A partial order defined by implication across the structural fields:
- stable
- spectral
- collapse

Used to express monotonicity of the activation operator.

---

5. Kernel Predicates

KernelGeom
Geometric invariants:
`
stable ∧ spectral ∧ collapse
`

KernelProv
Geometric invariants + provenance invariants:
`
KernelGeom ∧ simulationValid ∧ representationValid
`

KernelSem
Provenance invariants + semantic validity:
`
KernelProv ∧ modelValid
`

KernelAlg
The full algebraic kernel:
`
KernelSem
`

These kernels define the invariant layers preserved by activation.

---

6. Lifting Functions

SemanticLift
`
SemanticLift : Model → Bool
`
Extracts semantic validity.

ProvenanceLift
`
ProvenanceLift : Model → Bool
`
Extracts provenance validity.

These functions define how semantic and provenance information propagate through
the algebra.

---

7. Bundle Structure

Bundle
`
structure Bundle :=
  (A : Model → State → Model)
  (R : Model → Model → Bool)
`

A bundle pairs an activation operator with an activation relation. Bundles
compose associatively.

---

8. Activation Algebra Object

ActivationAlgebra
`
structure ActivationAlgebra :=
  (M : Type)
  (S : Type)
  (A : M → S → M)
  (R : M → M → Bool)
  (order : M → M → Bool)
  (geom : M → Bool)
  (prov : M → Bool)
  (sem : M → Bool)
  (alg : M → Bool)
  (semanticLift : M → Bool)
  (provenanceLift : M → Bool)
`

This object defines the full activation algebra. All axioms, lemmas, and proofs
reference this structure.

---

9. Summary

This glossary provides the semantic and structural grounding required for:
- v2.8.1 Lemma Layer  
- v2.8.2 Theorem Schemas  
- v2.9 Proofs  

It ensures mathematical clarity and prevents drift across the activation
geometry chain.

---

Maintainer: Borealis S. Hedling  
Location: Dublin, Ireland  
Timestamp: 17 October 2026 — 08:23 IST
`

---

