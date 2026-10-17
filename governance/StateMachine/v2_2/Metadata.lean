-- Triangle Mutiny — State Machine v2.2
-- Metadata.lean (Skeleton)

structure Provenance :=
  (timestamp : Nat)
  (location : String)
  (artifact : String)
  (version : String)

def TMMetadata : Provenance :=
  { timestamp := 20261017,
    location := "Dublin, Ireland",
    artifact := "StateMachine-v2.2",
    version := "v1.2" }
