import canonicalLaneMathlib.AdmissibleClass
import DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean.RiemannRochBridge

/-!
# Adjunction and Clifford Package
-/

namespace HautevilleHouse
namespace DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean

structure AdjunctionPackage {D : DivisorFoundationPackage}
    {L : LinearSystemPackage D} {S : InvertibleSheafPackage D}
    (R : RiemannRochPackage D L S) where
  adjunctionFormula : Prop
  canonicalClassAdjunction : Prop
  cliffordTheorem : Prop
  specialDivisorBound : Prop

structure CliffordPackage {D : DivisorFoundationPackage}
    {L : LinearSystemPackage D} {S : InvertibleSheafPackage D}
    {R : RiemannRochPackage D L S} (A : AdjunctionPackage R) where
  cliffordInequality : ∀ (div : D.divisorGroup), D.linearEquivalence D.canonicalDivisor div → 
    (let n := S.dimensionOfGlobalSections; n ≤ 1 + A.cliffordTheorem)
  equalityForCanonical : Prop

structure AdjunctionEvidence {D : DivisorFoundationPackage}
    {L : LinearSystemPackage D} {S : InvertibleSheafPackage D}
    {R : RiemannRochPackage D L S} (A : AdjunctionPackage R) where
  adjunctionFormulaClosed : A.adjunctionFormula
  canonicalClassAdjunctionClosed : A.canonicalClassAdjunction
  cliffordTheoremClosed : A.cliffordTheorem
  specialDivisorBoundClosed : A.specialDivisorBound

structure CliffordEvidence {D : DivisorFoundationPackage}
    {L : LinearSystemPackage D} {S : InvertibleSheafPackage D}
    {R : RiemannRochPackage D L S} {A : AdjunctionPackage R}
    (C : CliffordPackage A) where
  cliffordInequalityClosed : C.cliffordInequality
  equalityForCanonicalClosed : C.equalityForCanonical

def AdjunctionClosed {D : DivisorFoundationPackage}
    {L : LinearSystemPackage D} {S : InvertibleSheafPackage D}
    {R : RiemannRochPackage D L S} (A : AdjunctionPackage R) : Prop :=
  A.adjunctionFormula ∧ A.canonicalClassAdjunction ∧ A.cliffordTheorem ∧ A.specialDivisorBound

def CliffordClosed {D : DivisorFoundationPackage}
    {L : LinearSystemPackage D} {S : InvertibleSheafPackage D}
    {R : RiemannRochPackage D L S} {A : AdjunctionPackage R}
    (C : CliffordPackage A) : Prop :=
  C.cliffordInequality ∧ C.equalityForCanonical

theorem adjunction_closed_from_evidence {D : DivisorFoundationPackage}
    {L : LinearSystemPackage D} {S : InvertibleSheafPackage D}
    {R : RiemannRochPackage D L S} (A : AdjunctionPackage R)
    (E : AdjunctionEvidence A) : AdjunctionClosed A := by
  exact And.intro E.adjunctionFormulaClosed (And.intro E.canonicalClassAdjunctionClosed
    (And.intro E.cliffordTheoremClosed E.specialDivisorBoundClosed))

theorem clifford_closed_from_evidence {D : DivisorFoundationPackage}
    {L : LinearSystemPackage D} {S : InvertibleSheafPackage D}
    {R : RiemannRochPackage D L S} {A : AdjunctionPackage R}
    (C : CliffordPackage A) (E : CliffordEvidence C) : CliffordClosed C := by
  exact And.intro E.cliffordInequalityClosed E.equalityForCanonicalClosed

end DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean
end HautevilleHouse
