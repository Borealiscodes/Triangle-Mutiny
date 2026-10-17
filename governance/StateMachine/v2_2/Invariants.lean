-- Triangle Mutiny — State Machine v2.2
-- Invariants.lean (Skeleton)

def CurvatureInvariant (s : TMState) : Bool :=
  |s.curv - expectedCurvature s.p| < θ_curv

def SpectralInvariant (s : TMState) : Bool :=
  spectralMismatch s.spec (expectedSpectrum s.p) < θ_spec

def ModalInvariant (s : TMState) : Bool :=
  (s.mode, nextMode s.p) ∈ adjacencyGraph

def DriftInvariant (s : TMState) : Bool :=
  norm s.drift < θ_drift

def Stable (s : TMState) : Bool :=
  CurvatureInvariant s ∧
  SpectralInvariant s ∧
  ModalInvariant s ∧
  DriftInvariant s
