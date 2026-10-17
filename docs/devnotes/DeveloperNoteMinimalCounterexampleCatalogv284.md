# 📘 Developer Note — Minimal Counterexample Catalog (v2.8.4)

`markdown

Minimal Counterexample Catalog — Activation Formalism v2.8.4

Triangle Mutiny — Structural AI • Deterministic Reasoning • Activation Geometry Layer

This catalog lists minimal counterexamples for theorem schemas in v2.8.2. These
counterexamples prevent attempts to prove statements that are false, overly
strong, or violate geometric or algebraic constraints. Deterministic reasoning
is brittle; this catalog ensures v2.9 proofs target only valid theorems.

Each counterexample is minimal: removing any condition makes it no longer a
counterexample.

---

1. Operator Preservation Counterexamples

1.1 Stability Preservation
Schema:
`
activationOppreservesstability
`
Counterexample:
- Let M.stable = true, S.stable = false.
- Then (ActivationOp M S).stable = false.
Meaning:
- Stability preservation requires both M and S to be stable.
- Cannot prove unconditional stability preservation.

---

1.2 Idempotence
Schema:
`
activationOp_idempotent
`
Counterexample:
- Let M.spectral = false.
- Let S.spectral = true.
- Then ActivationOp M S ≠ M.
Meaning:
- Idempotence only holds when S is derived from M.
- Cannot prove general idempotence.

---

1.3 Kernel Preservation
Schemas:
`
activationOppreserveskernelGeom
activationOppreserveskernelProv
activationOppreserveskernelSem
activationOppreserveskernelAlg
`
Counterexample:
- Let M be in KernelGeom.
- Let S.collapse = false.
- Then ActivationOp M S collapses the kernel.
Meaning:
- Kernel preservation requires S to satisfy kernel conditions.
- Cannot prove unconditional kernel preservation.

---

2. Relation Structure Counterexamples

2.1 Reflexivity
Schema:
`
activationRelationisreflexive
`
Counterexample:
- Let M.modelValid = false.
- Then ActivationRelation M M = false.
Meaning:
- Reflexivity requires modelValid.
- Cannot prove unconditional reflexivity.

---

2.2 Symmetry
Schema:
`
activationRelationissymmetric
`
Counterexample:
- None.
Meaning:
- Symmetry always holds.
- Safe to prove.

---

2.3 Transitivity
Schema:
`
activationRelationistransitive
`
Counterexample:
- None.
Meaning:
- Transitivity always holds.
- Safe to prove.

---

3. Ordering Interaction Counterexamples

3.1 Order Preservation
Schema:
`
activationOppreservesorder
`
Counterexample:
- Let M1.stable = true, M2.stable = false.
- Let S.stable = false.
- Then ActivationOp M1 S.stable = false, ActivationOp M2 S.stable = false.
Meaning:
- Order preservation requires monotonicity in both M and S.
- Cannot prove unconditional order preservation.

---

4. Lifting Invariant Counterexamples

4.1 SemanticLift Preservation
Schema:
`
activationOppreservessemanticLift
`
Counterexample:
- Let M.modelValid = true.
- Let S.modal = false.
- If modal validity is required for semantic validity, semanticLift may fail.
Meaning:
- SemanticLift preservation requires modal compatibility.
- Cannot prove unconditional semantic preservation.

---

4.2 ProvenanceLift Preservation
Schema:
`
activationOppreservesprovenanceLift
`
Counterexample:
- Let M.simulationValid = true, M.representationValid = true.
- Let S.spectral = false.
- If spectral mismatch invalidates provenance, provenanceLift may fail.
Meaning:
- ProvenanceLift preservation requires spectral compatibility.
- Cannot prove unconditional provenance preservation.

---

5. Summary

This catalog prevents:
- attempting to prove false theorems  
- attempting to prove overly strong theorems  
- violating geometric stability envelope  
- violating kernel hierarchy  
- violating reversible algebra constraints  

These counterexamples ensure v2.9 proofs target only valid, provable statements.

---

Maintainer: Borealis S. Hedling  
Location: Dublin, Ireland  
Timestamp: 17 October 2026 — 08:45 IST
`

---

