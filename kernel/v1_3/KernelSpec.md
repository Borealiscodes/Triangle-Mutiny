# Triangle Mutiny — Deterministic Kernel (v1.3)
## KernelSpec.md

The deterministic kernel enforces all structural invariants derived from the
math spine and governance layer. It defines the rules for valid state
transitions and integrates Lean-verified invariants into the Rust runtime.

### Responsibilities
- Evaluate stability envelope S(p)
- Reject transitions that cross collapse surface Σ
- Enforce modal adjacency constraints
- Compute spectral mismatch thresholds
- Accumulate drift tensors
- Produce deterministic next-state transitions
- Emit provenance metadata

### Kernel Input
- TMState (Lean structure)
- geometric primitives (curvature, spectrum, modal label, drift tensor)
- governance invariants

### Kernel Output
- next TMState
- stability classification
- provenance record
