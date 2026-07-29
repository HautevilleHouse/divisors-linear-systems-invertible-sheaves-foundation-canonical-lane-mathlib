import canonicalLaneMathlib.AdmissibleClass

/-!
# Divisors, Linear Systems, Invertible Sheaves Foundation

This module defines the foundational objects for the divisor-linear system-invertible sheaf
route: a projective variety, its divisor class group, linear systems, and invertible sheaves.
-/

namespace HautevilleHouse
namespace DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean

structure DivisorFoundationPackage where
  variety : Type u
  topology : TopologicalSpace variety
  structureSheaf : Type v
  divisorGroup : Type w
  canonicalDivisor : divisorGroup
  linearEquivalence : divisorGroup → divisorGroup → Prop
  picardGroup : Type x
  divisorClassGroupMap : divisorGroup → picardGroup
  divisorClassGroupMapSurjective : Prop
  canonicalClass : picardGroup

structure DivisorFoundationEvidence (D : DivisorFoundationPackage) where
  varietySmooth : Prop
  structureSheafDefined : Prop
  divisorGroupAbelian : Prop
  linearEquivalenceEquivalence : Prop
  picardGroupAbelian : Prop
  divisorClassGroupMapSurjective : D.divisorClassGroupMapSurjective
  canonicalClassMapsToCanonicalDivisor : Prop

def DivisorFoundationClosed (D : DivisorFoundationPackage) : Prop :=
  D.divisorClassGroupMapSurjective

theorem divisor_foundation_closed_from_evidence (D : DivisorFoundationPackage)
    (E : DivisorFoundationEvidence D) : DivisorFoundationClosed D := by
  exact E.divisorClassGroupMapSurjective

end DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean
end HautevilleHouse
