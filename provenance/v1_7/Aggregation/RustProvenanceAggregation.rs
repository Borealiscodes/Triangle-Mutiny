// Triangle Mutiny — Provenance Aggregation v1.7
// RustProvenanceAggregation.rs (Stubs)

use crate::RustProvenanceIntegration::*;
use crate::RustState::*;
use crate::RustModal::*;

#[derive(Clone)]
pub struct AggregatedProvenance {
    pub records: Vec<ProvenanceRecord>,
    pub drift_series: Vec<f64>,
    pub spectral_series: Vec<f64>,
    pub collapse_series: Vec<bool>,
    pub modal_series: Vec<Mode>,
}

pub fn aggregate_provenance(records: &[ProvenanceRecord]) -> AggregatedProvenance {
    let mut drift_series = Vec::new();
    let mut spectral_series = Vec::new();
    let mut collapse_series = Vec::new();
    let mut modal_series = Vec::new();

    for rec in records {
        drift_series.push(rec.drift);
        spectral_series.push(rec.spectral_diff);
        collapse_series.push(rec.collapse_surface);
        modal_series.push(rec.next_mode);
    }

    AggregatedProvenance {
        records: records.to_vec(),
        drift_series,
        spectral_series,
        collapse_series,
        modal_series,
    }
}

pub fn provenance_summary(agg: &AggregatedProvenance) -> String {
    let drift_len = agg.drift_series.len();
    let spectral_len = agg.spectral_series.len();
    let collapse_count = agg.collapse_series.iter().filter(|x| **x).count();

    format!(
        "Provenance summary: drift points = {}, spectral points = {}, collapse events = {}",
        drift_len, spectral_len, collapse_count
    )
}
