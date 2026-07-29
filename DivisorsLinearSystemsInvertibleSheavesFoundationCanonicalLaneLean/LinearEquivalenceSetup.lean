import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean

structure LinearEquivalencePackage where
  baseScheme : Type u
  topology : TopologicalSpace baseScheme
  structureSheaf : Type v
  invertibleSheaf : Type w
  cartierDivisor : Type x
  weilDivisor : Type y
  coefficientRing : Type z
  linearEquivalenceRelation : Prop
  picardGroupDefined : Prop
  invertibleSheafLineBundleCorrespondence : Prop
  divisorClassGroupIsPicard : Prop

structure LinearEquivalenceEvidence (L : LinearEquivalencePackage) where
  linearEquivalenceRelationClosed : L.linearEquivalenceRelation
  picardGroupDefinedClosed : L.picardGroupDefined
  invertibleSheafLineBundleCorrespondenceClosed : L.invertibleSheafLineBundleCorrespondence
  divisorClassGroupIsPicardClosed : L.divisorClassGroupIsPicard

def LinearEquivalenceClosed (L : LinearEquivalencePackage) : Prop :=
  L.linearEquivalenceRelation ∧ L.picardGroupDefined ∧
  L.invertibleSheafLineBundleCorrespondence ∧ L.divisorClassGroupIsPicard

theorem linear_equivalence_closed_from_evidence (L : LinearEquivalencePackage)
    (E : LinearEquivalenceEvidence L) : LinearEquivalenceClosed L := by
  exact And.intro E.linearEquivalenceRelationClosed
    (And.intro E.picardGroupDefinedClosed
      (And.intro E.invertibleSheafLineBundleCorrespondenceClosed
        E.divisorClassGroupIsPicardClosed))

end DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean
end HautevilleHouse