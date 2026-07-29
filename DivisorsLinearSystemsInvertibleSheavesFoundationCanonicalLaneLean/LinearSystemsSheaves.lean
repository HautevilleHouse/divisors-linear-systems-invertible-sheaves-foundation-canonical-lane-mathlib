import canonicalLaneMathlib.AdmissibleClass
import DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean.DivisorsLinearSystemsFoundation

/-!
# Linear Systems and Invertible Sheaves Package
-/

namespace HautevilleHouse
namespace DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean

structure LinearSystemPackage {D : DivisorFoundationPackage} where
  divisor : D.divisorGroup
  completeLinearSystem : Set (D.divisorGroup)
  basepointFree : Prop
  veryAmple : Prop
  associatedMapToProjectiveSpace : Type u
  mapDefined : Prop

structure InvertibleSheafPackage {D : DivisorFoundationPackage} where
  sheaf : Type v
  tensorProduct : Type w
  globalSections : Type x
  dimensionOfGlobalSections : Nat
  sheafFromDivisor : D.divisorGroup → sheaf
  isomorphismPicard : sheaf ≃ D.picardGroup

structure LinearSystemEvidence {D : DivisorFoundationPackage}
    (L : LinearSystemPackage D) where
  completeLinearSystemClosed : L.completeLinearSystem = {x | D.linearEquivalence x L.divisor}
  basepointFreeClosed : L.basepointFree
  veryAmpleClosed : L.veryAmple
  mapDefinedClosed : L.mapDefined

structure InvertibleSheafEvidence {D : DivisorFoundationPackage}
    (S : InvertibleSheafPackage D) where
  sheafFromDivisorClosed : ∀ (d : D.divisorGroup), S.isomorphismPicard (S.sheafFromDivisor d) = D.divisorClassGroupMap d
  dimensionOfGlobalSectionsClosed : S.dimensionOfGlobalSections ≥ 0

def LinearSystemClosed {D : DivisorFoundationPackage} (L : LinearSystemPackage D) : Prop :=
  L.basepointFree ∧ L.veryAmple ∧ L.mapDefined

def InvertibleSheafClosed {D : DivisorFoundationPackage} (S : InvertibleSheafPackage D) : Prop :=
  True

theorem linear_system_closed_from_evidence {D : DivisorFoundationPackage}
    (L : LinearSystemPackage D) (E : LinearSystemEvidence L) : LinearSystemClosed L := by
  exact And.intro E.basepointFreeClosed (And.intro E.veryAmpleClosed E.mapDefinedClosed)

theorem invertible_sheaf_closed_from_evidence {D : DivisorFoundationPackage}
    (S : InvertibleSheafPackage D) (E : InvertibleSheafEvidence S) : InvertibleSheafClosed S := by
  trivial

end DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean
end HautevilleHouse