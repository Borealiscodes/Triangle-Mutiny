-- Triangle Mutiny — Deterministic Kernel v1.3
-- LeanBridge.lean (Skeleton)

structure KernelInput :=
  (state : TMState)
  (stable : Bool)
  (invariants : Bool)

def LeanBridge.export (s : TMState) : KernelInput :=
  { state := s,
    stable := Stable s,
    invariants := Stable s }
