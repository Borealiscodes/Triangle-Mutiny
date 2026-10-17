-- Triangle Mutiny — Activation Surface Geometry v2.1
-- LeanActivationSurfaces.lean

namespace TM

-- Import activation logic + error surfaces
import TM.LeanActivationLogic
import TM.LeanErrorSurfaces

-- Import geometric primitives
import TM.LeanStability
import TM.LeanCollapse
import TM.LeanDrift
import TM.LeanModal
import TM.LeanSpectral

-- Stability activation surface
def activationSurfaceStability : Bool :=
  evalSafetyLimits ∧ ¬ stabilityErrorSurface

-- Spectral activation surface
def activationSurfaceSpectral : Bool :=
  evalSpectralLimits ∧ ¬ spectralErrorSurface

-- Collapse activation surface
def activationSurfaceCollapse : Bool :=
  evalCollapseLimits ∧ ¬ collapseErrorSurface

-- Drift activation surface
def activationSurfaceDrift : Bool :=
  evalDriftLimits ∧ ¬ driftErrorSurface

-- Modal activation surface
def activationSurfaceModal : Bool :=
  evalModalLimits ∧ ¬ modalErrorSurface

-- Combined activation surface predicate
def allActivationSurfacesClear : Bool :=
  activationSurfaceStability ∧
  activationSurfaceSpectral ∧
  activationSurfaceCollapse ∧
  activationSurfaceDrift ∧
  activationSurfaceModal

-- Activation surface report (stub)
def activationSurfaceReport : String :=
  if allActivationSurfacesClear then
    "Activation surfaces: CLEAR (activation still not performed)"
  else
    "Activation surfaces: BLOCKED"

end TM
