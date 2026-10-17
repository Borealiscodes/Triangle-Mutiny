import TriangleMutiny.TriangleMutiny
import Collapse.Collapse
import Spectral.Spectral
import Modal.Modal

namespace Stability

open TriangleMutiny
open Collapse
open Spectral
open Modal

/--
Stability geometry integrates curvature, spectral, modal, and drift
primitives into a unified stability predicate. This module mirrors the
structure defined in stability-envelope.tex.
-/

/-- Stability threshold parameters. Placeholder for future refinement. -/
structure StabilityParams :=
  (θ : Nat)   -- spectral threshold
  (τ : Nat)   -- drift threshold

/-- Curvature stability: true when ΔK = 0. -/
def curvatureStable (c : Curvature) : Bool :=
  c.deltaK = 0

/-- Spectral stability: mismatch below threshold and operator non-degenerate. -/
def spectralStable (s : SpectralMismatch) (op : OperatorField) (θ : Nat) : Bool :=
  ¬ spectralMismatch s θ ∧ ¬ operatorDegenerate op

/-- Modal stability: transition between modal points is valid. -/
def modalStable (p₁ p₂ : ModalPoint) : Bool :=
  validTransition p₁ p₂

/-- Drift stability: unified drift value below threshold τ. -/
def driftStable (d : Drift) (τ : Nat) : Bool :=
  d.value ≤ τ

/--
Unified stability predicate S(p): true when all structural invariants hold.
This mirrors the math definition in stability-envelope.tex.
-/
def stable
    (c : Curvature)
    (s : SpectralMismatch)
    (op : OperatorField)
    (p₁ p₂ : ModalPoint)
    (d : Drift)
    (params : StabilityParams)
    : Bool :=
  curvatureStable c
  ∧ spectralStable s op params.θ
  ∧ modalStable p₁ p₂
  ∧ driftStable d params.τ

end Stability
