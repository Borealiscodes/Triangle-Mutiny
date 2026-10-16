import Lake
open Lake DSL

package «TriangleMutiny» {
  -- Project metadata can be added here if needed
}

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"

-- Core library: shared definitions and geometric primitives
lean_lib TriangleMutiny {
  srcDir := "TriangleMutiny"
}

-- Collapse geometry: collapse surfaces, predicates, discontinuities
lean_lib Collapse {
  srcDir := "Collapse"
  dependencies := #[«TriangleMutiny»]
}

-- Spectral operators: bundles, mismatch metrics, degeneracy
lean_lib Spectral {
  srcDir := "Spectral"
  dependencies := #[«TriangleMutiny»]
}

-- Modal adjacency: modal graph, adjacency relation, collapse predicate
lean_lib Modal {
  srcDir := "Modal"
  dependencies := #[«TriangleMutiny»]
}

-- Stability envelope: unified stability predicate, envelope boundary
lean_lib Stability {
  srcDir := "Stability"
  dependencies := #[«TriangleMutiny», «Collapse», «Spectral», «Modal»]
}

-- Drift tensors: holonomy drift, accumulated instability metrics
lean_lib Drift {
  srcDir := "Drift"
  dependencies := #[«TriangleMutiny», «Spectral», «Modal»]
}

@[default_target]
lean_exe tm_verify {
  root := "Main"
  dependencies := #[«TriangleMutiny», «Collapse», «Spectral», «Modal», «Stability», «Drift»]
}
