-- Triangle Mutiny — Activation Gating Logic v1.9
-- LeanActivationGating.lean

namespace TM

-- Import readiness + evaluation layers
import TM.LeanActivationReadiness
import TM.LeanActivationEval
import TM.LeanActivationPreEval

-- Import geometric layers
import TM.LeanStability
import TM.LeanCollapse
import TM.LeanDrift
import TM.LeanModal
import TM.LeanSpectral

-- Activation blockers (stubs)
def blockerRuntimeIncomplete : Bool :=
  ¬ evalRuntimeComplete

def blockerSafety : Bool :=
  ¬ evalSafetyLimits

def blockerDrift : Bool :=
  ¬ evalDriftLimits

def blockerModal : Bool :=
  ¬ evalModalLimits

def blockerSpectral : Bool :=
  ¬ evalSpectralLimits

def blockerCollapse : Bool :=
  ¬ evalCollapseLimits

-- Combined blocker predicate
def activationBlocked : Bool :=
  blockerRuntimeIncomplete ∨
  blockerSafety ∨
  blockerDrift ∨
  blockerModal ∨
  blockerSpectral ∨
  blockerCollapse

-- Activation gating predicate
def activationGateOpen : Bool :=
  activationReadiness ∧ ¬ activationBlocked

-- Activation gating report
def activationGateReport : String :=
  if activationGateOpen then
    "Activation gate: OPEN (activation still not permitted)"
  else
    "Activation gate: CLOSED"

end TM
