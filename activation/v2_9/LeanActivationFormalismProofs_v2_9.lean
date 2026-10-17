-- Triangle Mutiny — Activation Formalism v2.9
-- Proof Layer
-- LeanActivationFormalismProofs_v2_9.lean

namespace TM

import TM.LeanActivationFormalismDefinitions
import TM.LeanActivationFormalismLemmas
import TM.LeanActivationFormalismTheoremSchemas

/-
  Proof: ActivationOp preserves stability
  Obligation: PO_StabilityPreservation
-/
theorem activationOp_preserves_stability
  (M : Model) (S : State) :
  M.stable → S.stable → (ActivationOp M S).stable :=
by
  intro hM
  intro hS
  unfold ActivationOp
  unfold Model.stable
  apply Lemma_StabilityMonotone
  · exact hM
  · exact hS

/-
  Proof: ActivationOp is idempotent under self-state lifting
  Obligation: PO_Idempotence
-/
theorem activationOp_idempotent
  (M : Model) :
  ActivationOp M (⟨M.stable, M.spectral, M.collapse, M.drift, M.modal⟩) = M :=
by
  unfold ActivationOp
  have h1 := Lemma_StabilityMonotone M ⟨M.stable, M.spectral, M.collapse, M.drift, M.modal⟩ M.stable M.stable
  have h2 := Lemma_SpectralMonotone M ⟨M.stable, M.spectral, M.collapse, M.drift, M.modal⟩ M.spectral M.spectral
  have h3 := Lemma_CollapseMonotone M ⟨M.stable, M.spectral, M.collapse, M.drift, M.modal⟩ M.collapse M.collapse
  have h4 := Lemma_DriftMonotone M ⟨M.stable, M.spectral, M.collapse, M.drift, M.modal⟩ M.drift M.drift
  have h5 := Lemma_ModalAdjacency M ⟨M.stable, M.spectral, M.collapse, M.drift, M.modal⟩ M.modal M.modal
  rfl

/-
  Proof: ActivationOp preserves KernelGeom
  Obligation: PO_KernelGeomPreservation
-/
theorem activationOp_preserves_kernelGeom
  (M : Model) (S : State) :
  KernelGeom M → KernelGeom (ActivationOp M S) :=
by
  intro hGeom
  unfold KernelGeom at *
  unfold ActivationOp
  apply Lemma_KernelHierarchy
  exact hGeom

/-
  Proof: ActivationOp preserves KernelProv
  Obligation: PO_KernelProvPreservation
-/
theorem activationOp_preserves_kernelProv
  (M : Model) (S : State) :
  KernelProv M → KernelProv (ActivationOp M S) :=
by
  intro hProv
  unfold KernelProv at *
  unfold ActivationOp
  apply Lemma_KernelHierarchy
  exact hProv

/-
  Proof: ActivationOp preserves KernelSem
  Obligation: PO_KernelSemPreservation
-/
theorem activationOp_preserves_kernelSem
  (M : Model) (S : State) :
  KernelSem M → KernelSem (ActivationOp M S) :=
by
  intro hSem
  unfold KernelSem at *
  unfold ActivationOp
  apply Lemma_KernelHierarchy
  exact hSem

/-
  Proof: ActivationOp preserves KernelAlg
  Obligation: PO_KernelAlgPreservation
-/
theorem activationOp_preserves_kernelAlg
  (M : Model) (S : State) :
  KernelAlg M → KernelAlg (ActivationOp M S) :=
by
  intro hAlg
  unfold KernelAlg at *
  unfold ActivationOp
  apply Lemma_KernelHierarchy
  exact hAlg

/-
  Proof: ActivationRelation is reflexive
  Obligation: PO_RelationReflexive
-/
theorem activationRelation_is_reflexive
  (M : Model) :
  ActivationRelation M M :=
by
  unfold ActivationRelation
  apply Lemma_RelationReflexive

/-
  Proof: ActivationRelation is symmetric
  Obligation: PO_RelationSymmetric
-/
theorem activationRelation_is_symmetric
  (M1 M2 : Model) :
  ActivationRelation M1 M2 → ActivationRelation M2 M1 :=
by
  intro hRel
  unfold ActivationRelation at *
  apply Lemma_RelationSymmetric
  exact hRel

/-
  Proof: ActivationRelation is transitive
  Obligation: PO_RelationTransitive
-/
theorem activationRelation_is_transitive
  (M1 M2 M3 : Model) :
  ActivationRelation M1 M2 →
  ActivationRelation M2 M3 →
  ActivationRelation M1 M3 :=
by
  intro h12
  intro h23
  unfold ActivationRelation at *
  apply Lemma_RelationTransitive
  · exact h12
  · exact h23

/-
  Proof: ActivationOp preserves ModelOrder
  Obligation: PO_OrderPreservation
-/
theorem activationOp_preserves_order
  (M1 M2 : Model) (S : State) :
  ModelOrder M1 M2 →
  ModelOrder (ActivationOp M1 S) (ActivationOp M2 S) :=
by
  intro hOrder
  unfold ModelOrder at *
  unfold ActivationOp
  apply Lemma_ModelOrderStable
  exact hOrder

/-
  Proof: ActivationOp preserves SemanticLift
  Obligation: PO_SemanticLiftPreservation
-/
theorem activationOp_preserves_semanticLift
  (M : Model) (S : State) :
  SemanticLift M → SemanticLift (ActivationOp M S) :=
by
  intro hSem
  unfold SemanticLift at *
  unfold ActivationOp
  apply Lemma_ModalAdjacency
  exact hSem

/-
  Proof: ActivationOp preserves ProvenanceLift
  Obligation: PO_ProvenanceLiftPreservation
-/
theorem activationOp_preserves_provenanceLift
  (M : Model) (S : State) :
  ProvenanceLift M → ProvenanceLift (ActivationOp M S) :=
by
  intro hProv
  unfold ProvenanceLift at *
  unfold ActivationOp
  apply Lemma_SpectralMonotone
  exact hProv

end TM
