-- Triangle Mutiny — State Machine v2.2
-- Traversal.lean (Skeleton)

def traverse (s : TMState) : TMState :=
  if Stable s then
    Kernel.next s
  else
    governanceCorrection s
