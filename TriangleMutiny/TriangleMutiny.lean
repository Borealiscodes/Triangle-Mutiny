namespace TriangleMutiny

/--
Core geometric primitives shared across all Triangle Mutiny modules.
These definitions act as the backbone for collapse geometry, spectral
operators, modal adjacency, stability envelopes, and drift tensors.
-/

/-- Reasoning manifold typeclass placeholder. -/
class Manifold (M : Type) :=
  (dim : Nat)

/-- Modal label type. -/
structure ModalLabel :=
  (id : Nat)

/-- Operator field local linearization placeholder. -/
structure OperatorField :=
  (eval : Nat → Nat)

/-- Curvature primitive. -/
structure Curvature :=
  (deltaK : Nat)

/-- Spectral mismatch primitive. -/
structure SpectralMismatch :=
  (deltaSpec : Nat)

/-- Modal drift primitive. -/
structure ModalDrift :=
  (deltaModal : Nat)

/-- Unified drift primitive. -/
structure Drift :=
  (value : Nat)

end TriangleMutiny
