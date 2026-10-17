// Triangle Mutiny — Provenance Shield v1.3
// Lineage.rs (Skeleton)

#[derive(Clone)]
pub struct Lineage {
    pub parent_state_id: u64,
    pub child_state_id: u64,
    pub timestamp: u64,
}

pub fn record_lineage(parent: u64, child: u64) -> Lineage {
    Lineage {
        parent_state_id: parent,
        child_state_id: child,
        timestamp: 20261017,
    }
}
