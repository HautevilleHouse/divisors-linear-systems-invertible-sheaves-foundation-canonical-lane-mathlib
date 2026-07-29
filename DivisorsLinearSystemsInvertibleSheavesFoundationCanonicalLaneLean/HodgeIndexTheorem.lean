import canonicalLaneMathlib.AdmissibleClass
import DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean.AdjunctionClifford

/-!
# Hodge Index Theorem Package
-/

namespace HautevilleHouse
namespace DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean

structure HodgeIndexPackage {D : DivisorFoundationPackage}
    {L : LinearSystemPackage D} {S : InvertibleSheafPackage D}
    {R : RiemannRochPackage D L S} {A : AdjunctionPackage R}
    (C : CliffordPackage A) where
  intersectionForm : Type u
  signature : ℤ
  hodgeIndexTheorem : Prop
  positiveDefiniteOnAmple : Prop
  orthogonalDecomposition : Prop

structure HodgeIndexEvidence {D : DivisorFoundationPackage}
    {L : LinearSystemPackage D} {S : InvertibleSheafPackage D}
    {R : RiemannRochPackage D L S} {A : AdjunctionPackage R}
    {C : CliffordPackage A} (H : HodgeIndexPackage C) where
  hodgeIndexTheoremClosed : H.hodgeIndexTheorem
  positiveDefiniteOnAmpleClosed : H.positiveDefiniteOnAmple
  orthogonalDecompositionClosed : H.orthogonalDecomposition

def HodgeIndexClosed {D : DivisorFoundationPackage}
    {L : LinearSystemPackage D} {S : InvertibleSheafPackage D}
    {R : RiemannRochPackage D L S} {A : AdjunctionPackage R}
    {C : CliffordPackage A} (H : HodgeIndexPackage C) : Prop :=
  H.hodgeIndexTheorem ∧ H.positiveDefiniteOnAmple ∧ H.orthogonalDecomposition

theorem hodge_index_closed_from_evidence {D : DivisorFoundationPackage}
    {L : LinearSystemPackage D} {S : InvertibleSheafPackage D}
    {R : RiemannRochPackage D L S} {A : AdjunctionPackage R}
    {C : CliffordPackage A} (H : HodgeIndexPackage C)
    (E : HodgeIndexEvidence H) : HodgeIndexClosed H := by
  exact And.intro E.hodgeIndexTheoremClosed (And.intro E.positiveDefiniteOnAmpleClosed E.orthogonalDecompositionClosed)

end DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean
end HautevilleHouse
