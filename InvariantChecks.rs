// Triangle Mutiny — Rust Runtime v1.3
// InvariantChecks.rs (Skeleton)

pub fn curvature_invariant(curv_delta: f64) -> bool {
    curv_delta.abs() < THETA_CURV
}

pub fn spectral_invariant(spec_mismatch: f64) -> bool {
    spec_mismatch < THETA_SPEC
}

pub fn modal_invariant(dist: u32) -> bool {
    dist < THETA_MODAL
}

pub fn drift_invariant(drift: f64) -> bool {
    drift < THETA_DRIFT
}

pub fn stable(state: &RuntimeState) -> bool {
    curvature_invariant(state.curvature)
        && spectral_invariant(state.spectral_mismatch)
        && modal_invariant(state.modal_distance)
        && drift_invariant(state.drift_norm)
}
