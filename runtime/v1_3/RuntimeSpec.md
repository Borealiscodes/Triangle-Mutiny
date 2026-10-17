# Triangle Mutiny — Rust Runtime (v1.3)
## RuntimeSpec.md

The Rust runtime executes deterministic reasoning steps produced by the kernel.
It enforces invariants, evaluates stability envelope conditions, and produces
next-state transitions with full provenance.

### Responsibilities
- Execute deterministic transitions
- Enforce structural invariants at runtime
- Evaluate stability envelope S(p)
- Reject collapse-surface transitions
- Accumulate drift tensors
- Emit provenance metadata
- Provide safe API for higher-level systems

### Runtime Input
- KernelState (from deterministic kernel)
- invariant thresholds
- adjacency table
- spectral mismatch parameters

### Runtime Output
- next KernelState
- stability classification
- provenance record
