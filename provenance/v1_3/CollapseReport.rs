// Triangle Mutiny — Provenance Shield v1.3
// CollapseReport.rs (Skeleton)

pub struct CollapseReport {
    pub on_surface: bool,
    pub near_surface: bool,
    pub severity: f64,
}

pub fn build_collapse_report(
    on_surface: bool,
    near_surface: bool,
    severity: f64,
) -> CollapseReport {
    CollapseReport {
        on_surface,
        near_surface,
        severity,
    }
}
