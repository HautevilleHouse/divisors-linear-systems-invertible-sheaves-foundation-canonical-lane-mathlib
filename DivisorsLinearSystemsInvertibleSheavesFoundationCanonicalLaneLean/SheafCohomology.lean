import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean

open InvertibleSheaf

structure CechCohomology (X : Type u) [TopologicalSpace X] (F : InvertibleSheaf X) where
  openCover : Set (Set X)
  cochainComplex : Type v
  cohomologyGroups : ℕ → Type w
  exactnessAt : ℕ → Prop

structure SheafCohomologyPackage where
  baseSpace : Type u
  topology : TopologicalSpace baseSpace
  sheaf : InvertibleSheaf baseSpace
  cechCohomology : CechCohomology baseSpace sheaf
  derivedFunctorCohomology : ℕ → Type v
  comparisonTheorem : Prop
  vanishingProperties : ℕ → Prop

structure SheafCohomologyEvidence (P : SheafCohomologyPackage) where
  cechCohomologyClosed : ∀ n : ℕ, P.cechCohomology.exactnessAt n
  comparisonTheoremClosed : P.comparisonTheorem
  vanishingPropertiesClosed : ∀ n : ℕ, P.vanishingProperties n

def SheafCohomologyClosed (P : SheafCohomologyPackage) : Prop :=
  (∀ n : ℕ, P.cechCohomology.exactnessAt n) ∧ P.comparisonTheorem ∧ (∀ n : ℕ, P.vanishingProperties n)

theorem sheaf_cohomology_closed_from_evidence (P : SheafCohomologyPackage) (E : SheafCohomologyEvidence P) : SheafCohomologyClosed P := by
  exact And.intro E.cechCohomologyClosed (And.intro E.comparisonTheoremClosed E.vanishingPropertiesClosed)

end DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean
end HautevilleHouse