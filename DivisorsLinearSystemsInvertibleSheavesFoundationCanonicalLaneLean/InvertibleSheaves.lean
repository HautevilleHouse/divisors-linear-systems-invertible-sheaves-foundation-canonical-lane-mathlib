import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean

structure InvertibleSheavesPackage where
  scheme : Type u
  topology : TopologicalSpace scheme
  structureSheaf : Type v
  invertibleSheaf : Type w
  tensorProduct : Type x
  eulerCharacteristic : Prop
  riemannRochInput : Prop

structure InvertibleSheavesEvidence (I : InvertibleSheavesPackage) where
  tensorProductClosed : I.tensorProduct
  eulerCharacteristicClosed : I.eulerCharacteristic
  riemannRochInputClosed : I.riemannRochInput

def InvertibleSheavesClosed (I : InvertibleSheavesPackage) : Prop :=
  I.tensorProduct ∧ I.eulerCharacteristic ∧ I.riemannRochInput

theorem invertible_sheaves_closed_from_evidence (I : InvertibleSheavesPackage)
    (E : InvertibleSheavesEvidence I) : InvertibleSheavesClosed I := by
  exact And.intro E.tensorProductClosed
    (And.intro E.eulerCharacteristicClosed E.riemannRochInputClosed)

end DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean
end HautevilleHouse