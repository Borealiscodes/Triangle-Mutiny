-- Triangle Mutiny — Activation Formalism v2.8.1
-- Lemma Layer
-- LeanActivationFormalismLemmas.lean

namespace TM

import TM.LeanActivationFormalismDefinitions

/-
  Lemma: Boolean monotonicity of ActivationOp
-/
lemma activationOp_monotone_bool
  (M : Model) (S : State) :
  (ActivationOp M S).stable = (M.stable ∧ S.stable) :=
by rfl

lemma activationOp_monotone_spectral
  (M : Model) (S : State) :
  (ActivationOp M S).spectral = (M.spectral ∧ S.spectral) :=
by rfl

lemma activationOp_monotone_collapse
  (M : Model) (S : State) :
  (ActivationOp M S).collapse = (M.collapse ∧ S.collapse) :=
by rfl

/-
  Lemma: ActivationRelation is reflexive when modelValid holds
-/
lemma activationRelation_reflexive
  (M : Model) :
  M.modelValid → ActivationRelation M M :=
by intro h; unfold ActivationRelation; exact And.intro h h

/-
  Lemma: ActivationRelation is symmetric
-/
lemma activationRelation_symmetric
  (M1 M2 : Model) :
  ActivationRelation M1 M2 → ActivationRelation M2 M1 :=
by intro h; unfold ActivationRelation at *; exact And.intro h.right h.left

/-
  Lemma: ActivationRelation is transitive
-/
lemma activationRelation_transitive
  (M1 M2 M3 : Model) :
  ActivationRelation M1 M2 →
  ActivationRelation M2 M3 →
  ActivationRelation M1 M3 :=
by intro h12 h23; unfold ActivationRelation at *;
   exact And.intro h12.left h23.right

/-
  Lemma: Ordering respects stability implication
-/
lemma modelOrder_stability
  (M1 M2 : Model) :
  ModelOrder M1 M2 →
  (M1.stable → M2.stable) :=
by intro h; unfold ModelOrder at h; exact h.left

/-
  Lemma: KernelGeom implies KernelProv
-/
lemma kernelGeom_implies_kernelProv
  (M : Model) :
  KernelGeom M →
  M.simulationValid →
  M.representationValid →
  KernelProv M :=
by intro hgeom hsim hrep;
   unfold KernelProv; exact And.intro hgeom (And.intro hsim hrep)

/-
  Lemma: KernelProv implies KernelSem
-/
lemma kernelProv_implies_kernelSem
  (M : Model) :
  KernelProv M →
  M.modelValid →
  KernelSem M :=
by intro hprov hmodel;
   unfold KernelSem; exact And.intro hprov hmodel

/-
  Lemma: KernelSem implies KernelAlg
-/
lemma kernelSem_implies_kernelAlg
  (M : Model) :
  KernelSem M → KernelAlg M :=
by intro h; unfold KernelAlg; exact h

/-
  Lemma: SemanticLift preserves model validity
-/
lemma semanticLift_valid
  (M : Model) :
  SemanticLift M = M.modelValid :=
by rfl

/-
  Lemma: ProvenanceLift preserves provenance validity
-/
lemma provenanceLift_valid
  (M : Model) :
  ProvenanceLift M = (M.simulationValid ∧ M.representationValid) :=
by rfl

end TM
