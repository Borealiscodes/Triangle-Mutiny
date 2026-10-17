// Triangle Mutiny — Invariant Population v1.5
// RustInvariants.rs (Stubs)

pub fn curvature_invariant(curv: f64, threshold: f64) -> bool {
    curv.abs() < threshold
}

pub fn spectral_invariant(spec: f64, threshold: f64) -> bool {
    spec < threshold
}

pub fn modal_invariant(adj: bool) -> bool {
    adj
}

pub fn drift_invariant(drift: f64, threshold: f64) -> bool {
    drift < threshold
}

pub fn stable(
    curv: f64,
    spec: f64,
    drift: f64,
    adj: bool,
    t_curv: f64,
    t_spec: f64,
    t_drift: f64,
) -> bool {
    curvature_invariant(curv, t_curv)
        && spectral_invariant(spec, t_spec)
        && modal_invariant(adj)
        && drift_invariant(drift, t_drift)
}

