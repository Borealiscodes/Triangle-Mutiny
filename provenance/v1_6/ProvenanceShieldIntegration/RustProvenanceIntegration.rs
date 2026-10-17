// Triangle Mutiny — Provenance Shield Integration v1.6
// RustProvenanceIntegration.rs (Stubs)

use crate::RustModal::*;
use crate::RustState::*;

pub struct ProvenanceRecord {
    pub point: f64,
    pub prev_mode: Mode,
    pub next_mode: Mode,
    pub allowed: bool,
    pub spectral_diff: f64,
    pub collapse_surface: bool,
    pub collapse_neighborhood: bool,
}

pub fn emit_provenance(
    state: &RuntimeState,
    next_mode: Mode,
    allowed: bool,
    spectral_diff: f64,
    collapse_surface: bool,
    collapse_neighborhood: bool,
) -> ProvenanceRecord {
    ProvenanceRecord {
        point: state.point,
        prev_mode: state.mode,
        next_mode,
        allowed,
        spectral_diff,
        collapse_surface,
        collapse_neighborhood,
    }
}

// Invariant Report Stub
pub fn report_invariant(_ok: bool) {}

// Collapse Report Stub
pub fn report_collapse(_surface: bool, _neighborhood: bool) {}

// Drift Report Stub
pub fn report_drift(_drift: f64) {}

// Modal Report Stub
pub fn report_modal(_prev: Mode, _next: Mode) {}

// Spectral Report Stub
pub fn report_spectral(_diff: f64) {}

// Stability Report Stub
pub fn report_stability(_stable: bool) {}
