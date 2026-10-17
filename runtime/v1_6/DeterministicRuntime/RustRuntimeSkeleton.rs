// Triangle Mutiny — Deterministic Runtime v1.6
// RustRuntimeSkeleton.rs (Skeleton)

use crate::RustKernelIntegration::*;
use crate::RustProvenance::*;
use crate::RustState::*;

pub struct RuntimeState {
    pub point: f64,
    pub mode: Mode,
    pub drift: f64,
}

pub fn evaluate_transition(
    state: &RuntimeState,
    next_mode: Mode,
    spectral_diff: f64,
    spectral_thresh: f64,
    collapse_surface: bool,
    collapse_neighborhood: bool,
) -> bool {
    let invariant_ok = kernel_invariant_eval(state.point);
    let stable = kernel_stability(state.point, 1.0);
    let modal_ok = kernel_modal_legal(state.mode, next_mode);
    let spectral_ok = kernel_spectral_safe(spectral_diff, spectral_thresh);
    let collapse = kernel_collapse(collapse_surface, collapse_neighborhood);

    kernel_transition(
        invariant_ok,
        stable,
        modal_ok,
        spectral_ok,
        collapse,
    )
}

pub fn apply_transition(
    state: &mut RuntimeState,
    next_mode: Mode,
    spectral_diff: f64,
    spectral_thresh: f64,
    collapse_surface: bool,
    collapse_neighborhood: bool,
) {
    let allowed = evaluate_transition(
        state,
        next_mode,
        spectral_diff,
        spectral_thresh,
        collapse_surface,
        collapse_neighborhood,
    );

    emit_provenance(
        state,
        next_mode,
        allowed,
        spectral_diff,
        collapse_surface,
        collapse_neighborhood,
    );

    if allowed {
        state.mode = next_mode;
        state.drift = kernel_drift(state.drift, state.point);
        update_state(state);
    }
}
