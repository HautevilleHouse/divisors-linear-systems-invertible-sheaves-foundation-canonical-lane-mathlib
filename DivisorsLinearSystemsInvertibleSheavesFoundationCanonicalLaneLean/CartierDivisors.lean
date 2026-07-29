import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean

structure CartierDivisorsPackage where
  scheme : Type u
  topology : TopologicalSpace scheme
  structureSheaf : Type v
  cartierDivisorGroup : Type w
  principalDivisors : Prop
  weilDivisorMap : Prop
  invertibleSheafAssociated : Prop

structure CartierDivisorsEvidence (C : CartierDivisorsPackage) where
  principalDivisorsClosed : C.principalDivisors
  weilDivisorMapClosed : C.weilDivisorMap
  invertibleSheafAssociatedClosed : C.invertibleSheafAssociated

def CartierDivisorsClosed (C : CartierDivisorsPackage) : Prop :=
  C.principalDivisors ∧ C.weilDivisorMap ∧ C.invertibleSheafAssociated

theorem cartier_divisors_closed_from_evidence (C : CartierDivisorsPackage)
    (E : CartierDivisorsEvidence C) : CartierDivisorsClosed C := by
  exact And.intro E.principalDivisorsClosed
    (And.intro E.weilDivisorMapClosed E.invertibleSheafAssociatedClosed)

end DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean
end HautevilleHouse