# Execution Model — Deterministic Kernel v1.3

The execution model defines how the kernel evaluates invariants and produces
next-state transitions.

## Step 1 — Import Lean State
Kernel receives TMState via LeanBridge.

## Step 2 — Evaluate Invariants
Kernel checks:
- curvature continuity
- spectral mismatch
- modal adjacency
- drift tensor norm

## Step 3 — Evaluate Stability Envelope
Kernel computes:
H(p) = H_curv + H_spec + H_modal + H_drift

## Step 4 — Determine Classification
- stable
- near-collapse
- collapsed

## Step 5 — Produce Next State
If stable:
    next_state = deterministic_transition(state)
Else:
    next_state = governance_correction(state)

## Step 6 — Emit Provenance
Kernel emits:
- timestamp
- stability classification
- invariant results
