// Triangle Mutiny — Provenance Shield v1.3
// Integration.rs (Skeleton)

use crate::State::RuntimeState;
use crate::InvariantReport::build_invariant_report;
use crate::CollapseReport::build_collapse_report;
use crate::AuditTrail::create_audit_entry;

pub fn integrate(
    id: u64,
    state: &RuntimeState,
    on_surface: bool,
    near_surface: bool,
    severity: f64,
) -> crate::AuditTrail::AuditTrailEntry {
    let inv = build_invariant_report(
        state.curvature.abs() < THETA_CURV,
        state.spectral_mismatch < THETA_SPEC,
        state.modal_distance < THETA_MODAL,
        state.drift_norm < THETA_DRIFT,
    );

    let col = build_collapse_report(on_surface, near_surface, severity);

    create_audit_entry(id, inv, col)
}
