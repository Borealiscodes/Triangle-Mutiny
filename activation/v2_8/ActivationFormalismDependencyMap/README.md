# Activation Formalism Dependency Map (v2.8)

This directory contains the canonical `.json` dependency map for Activation
Formalism v2.8. It consolidates axioms, definitions, lemmas, theorem schemas,
kernel hierarchy constraints, geometric constraints, and reversible algebra
constraints into a single machine-readable artifact.

## Purpose

- Prevent circular proof dependencies
- Prevent shadow ontologies
- Ensure alignment with the Axiomatic Binding Map
- Ensure kernel hierarchy integrity
- Ensure geometric consistency
- Ensure reversible algebra consistency
- Provide a canonical metadata spine for v2.9 proof generation

## Files

- `schema.json` — JSON Schema defining allowed structure
- `activationFormalismDependencies_v2_8.json` — canonical dependency map
- `README.md` — this file

## Safety Rules

- This map is canonical and read-only.
- It must be generated, not hand-written.
- It must not encode implicit assumptions.
- It must not diverge from the Binding Map.
- It must not introduce new ontology elements.

This artifact completes the structural layer required before v2.9 proofs.

---

📜 Provenance Footer — README.md (Dependency Map v2.8)

`
---
Artifact: ActivationFormalismDependencyMap-v2.8
Lane: Structural AI • Deterministic Reasoning • Activation Geometry Layer

Purpose:
  Provide a canonical, machine-readable consolidation of all proof dependencies
  for Activation Formalism v2.8, including axioms, definitions, lemmas, theorem
  schemas, kernel hierarchy, geometric constraints, and reversible algebra
  constraints. Serves as the metadata spine for v2.9 proof generation.

Anchors:
  - AxiomaticBindingMap-v2.8
  - ActivationFormalismDefinitions-v2.8.0
  - ActivationFormalismLemmas-v2.8.1
  - ActivationFormalismTheoremSchemas-v2.8.2
  - ProofObligationMap-v2.8.3
  - MinimalCounterexampleCatalog-v2.8.4
  - LeanProofStrategy-v2.8.5
  - CrossLayerConsistency-v1.2tov2.8
  - KernelHierarchy-v1.2
  - ActivationAlgebra-v2.7

Status: Canonical • Read-only • Deterministic
Maintainer: Borealis S. Hedling
Location: Dublin, Ireland
Timestamp: 17 October 2026 — 08:52 IST
---
`

---
