# Invariant Map — Deterministic Kernel v1.3

This document maps Lean invariants to Rust runtime checks.

## Curvature Invariant
Lean: |K(p+) - K(p-)| < θ_curv  
Rust: abs(curvature_delta) < THETA_CURV

## Spectral Invariant
Lean: δ_spec(p) < θ_spec  
Rust: spectral_mismatch < THETA_SPEC

## Modal Invariant
Lean: (mode_prev, mode_next) ∈ E  
Rust: adjacency_table[mode_prev][mode_next] == true

## Drift Invariant
Lean: ||J(p)|| < θ_drift  
Rust: drift_norm < THETA_DRIFT
