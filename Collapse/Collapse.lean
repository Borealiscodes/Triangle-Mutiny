import TriangleMutiny.TriangleMutiny

namespace Collapse

open TriangleMutiny

/--
Collapse geometry formalizes discontinuities in the reasoning manifold.
This module defines the collapse predicate, collapse surface, and basic
structural invariants used by spectral, modal, and stability modules.
-/

/-- A point on the reasoning manifold. Placeholder for future structure. -/
structure Point :=
  (id : Nat)

/-- Collapse predicate: true when the point lies on a collapse surface. -/
def isCollapsed (p : Point) : Bool :=
  -- Placeholder: collapse detection logic will be added later
  false

/-- Collapse surface: the set of points where collapse occurs. -/
def collapseSurface : Set Point :=
  { p | isCollapsed p }

/--
Curvature discontinuity primitive: true when curvature delta is nonzero.
This integrates with the Stability module.
-/
def curvatureDiscontinuous (c : Curvature) : Bool :=
  c.deltaK ≠ 0

/--
Unified collapse indicator combining curvature discontinuity and collapse
predicate. This mirrors the math definition in collapse-geometry.tex.
-/
def collapseIndicator (p : Point) (c : Curvature) : Bool :=
  isCollapsed p ∨ curvatureDiscontinuous c

end Collapse
