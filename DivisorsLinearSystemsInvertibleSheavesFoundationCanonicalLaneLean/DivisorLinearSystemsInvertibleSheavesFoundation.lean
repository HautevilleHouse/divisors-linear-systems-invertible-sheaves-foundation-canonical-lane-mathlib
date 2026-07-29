import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean

structure InvertibleSheaf (X : Type) [TopologicalSpace X] [Sheaf X] where
  sections : X → Type
  restriction : ∀ {U V : Open X} (h : V ⊆ U), sections U → sections V
  locality : ∀ {U : Open X} (s t : sections U), (∀ x ∈ U, ∃ V ∋ x, V ⊆ U ∧ restriction (by exact ?_) s = restriction (by exact ?_) t) → s = t
  gluing : ∀ {U : Open X} (s : ∀ i : Index, sections (U i)), (∀ i j, restriction (by exact ?_) (s i) = restriction (by exact ?_) (s j)) → ∃ s' : sections U, ∀ i, restriction (by exact ?_) s' = s i

def InvertibleSheafClosed (L : InvertibleSheaf X) : Prop :=
  ∀ U : Open X, IsInvertible (L.sections U)

structure Divisor (X : Type) [TopologicalSpace X] where
  support : Set X
  multiplicity : X → ℤ
  locallyFinite : ∀ x : X, ∃ U ∋ x, multiplicity '' U ⊆ {0, ±1}

structure LinearSystem (X : Type) [TopologicalSpace X] [Sheaf X] where
  base : DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean.InvertibleSheaf X
  sections : Set (Divisor X)
  basePointFree : ∀ x : X, ∃ D ∈ sections, x ∉ D.support

theorem linear_system_base_point_free_closed (X : Type) [TopologicalSpace X] [Sheaf X] (L : LinearSystem X) : Prop :=
  L.basePointFree

end DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean
end HautevilleHouse