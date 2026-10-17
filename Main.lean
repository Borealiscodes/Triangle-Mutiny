import Collapse.Collapse
import Spectral.Spectral
import Modal.Modal
import Stability.Stability
import Drift.Drift

open Collapse
open Spectral
open Modal
open Stability
open Drift

/--
Main verification harness for Triangle Mutiny.
This file demonstrates how collapse, spectral, modal, stability,
and drift operators interact in a single deterministic reasoning flow.
-/
def main : IO Unit := do
  let p₁ := ModalPoint.mk 0 (ModalLabel.mk 0)
  let p₂ := ModalPoint.mk 1 (ModalLabel.mk 1)

  let curv := Curvature.mk 0
  let spec := SpectralMismatch.mk 0
  let op   := OperatorField.mk (fun x => x + 1)
  let drift := DriftTensor.mk 0

  let params := StabilityParams.mk 5 10

  let drift' := accumulateDrift spec p₁ p₂ drift
  let stableState :=
    stable curv spec op p₁ p₂ { value := drift'.value } params

  IO.println s!"Drift value: {drift'.value}"
  IO.println s!"System stable: {stableState}"
