// Triangle Mutiny — Provenance Shield v1.3
// InvariantReport.rs (Skeleton)

pub struct InvariantReport {
    pub curvature_ok: bool,
    pub spectral_ok: bool,
    pub modal_ok: bool,
    pub drift_ok: bool,
}

pub fn build_invariant_report(
    curv: bool,
    spec: bool,
    modal: bool,
    drift: bool,
) -> InvariantReport {
    InvariantReport {
        curvature_ok: curv,
        spectral_ok: spec,
        modal_ok: modal,
        drift_ok: drift,
    }
}
