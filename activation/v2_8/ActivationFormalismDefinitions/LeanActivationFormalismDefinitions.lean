-- Triangle Mutiny — Activation Formalism v2.8.0
-- Definitions Layer
-- LeanActivationFormalismDefinitions.lean

namespace TM

/-
  Core Types
-/

structure Model :=
  (stable : Bool)
  (spectral : Bool)
  (collapse : Bool)
  (drift : Bool)
  (modal : Bool)
  (simulationValid : Bool)
  (representationValid : Bool)
  (modelValid : Bool)

structure State :=
  (stable : Bool)
  (spectral : Bool)
  (collapse : Bool)
  (drift : Bool)
  (modal : Bool)

/-
  Activation Operator
-/

def ActivationOp (M : Model) (S : State) : Model :=
  { stable := M.stable ∧ S.stable,
    spectral := M.spectral ∧ S.spectral,
    collapse := M.collapse ∧ S.collapse,
    drift := M.drift ∧ S.drift,
    modal := M.modal ∧ S.modal,
    simulationValid := M.simulationValid,
    representationValid := M.representationValid,
    modelValid := M.modelValid }

/-
  Activation Relation
-/

def ActivationRelation (M1 M2 : Model) : Bool :=
  M1.modelValid ∧ M2.modelValid

/-
  Ordering Predicate
-/

def ModelOrder (M1 M2 : Model) : Bool :=
  (M1.stable → M2.stable) ∧
  (M1.spectral → M2.spectral) ∧
  (M1.collapse → M2.collapse)

/-
  Kernel Predicates
-/

def KernelGeom (M : Model) : Bool :=
  M.stable ∧ M.spectral ∧ M.collapse

def KernelProv (M : Model) : Bool :=
  KernelGeom M ∧ M.simulationValid ∧ M.representationValid

def KernelSem (M : Model) : Bool :=
  KernelProv M ∧ M.modelValid

def KernelAlg (M : Model) : Bool :=
  KernelSem M

/-
  Lifting Functions
-/

def SemanticLift (M : Model) : Bool :=
  M.modelValid

def ProvenanceLift (M : Model) : Bool :=
  M.simulationValid ∧ M.representationValid

/-
  Bundle Structure
-/

structure Bundle :=
  (A : Model → State → Model)
  (R : Model → Model → Bool)

/-
  Activation Algebra Object
-/

structure ActivationAlgebra :=
  (M : Type)
  (S : Type)
  (A : M → S → M)
  (R : M → M → Bool)
  (order : M → M → Bool)
  (geom : M → Bool)
  (prov : M → Bool)
  (sem : M → Bool)
  (alg : M → Bool)
  (semanticLift : M → Bool)
  (provenanceLift : M → Bool)

end TM
