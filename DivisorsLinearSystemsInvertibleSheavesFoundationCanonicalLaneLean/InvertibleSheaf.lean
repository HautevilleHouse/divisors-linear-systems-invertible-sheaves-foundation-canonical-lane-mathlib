import canonicalLaneMathlib.AdmissibleClass
import DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean.DivisorClassGroup

namespace HautevilleHouse
namespace DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean

structure InvertibleSheafPackage where
  sheaf : Type u
  rankOne : Prop
  tensorProductDefined : Prop
  dualExists : Prop
  transitionFunctionsDefined : Prop

def InvertibleSheafClosed (I : InvertibleSheafPackage) : Prop :=
  I.rankOne ∧ I.tensorProductDefined ∧ I.dualExists

theorem invertible_sheaf_closed (I : InvertibleSheafPackage) : InvertibleSheafClosed I := by
  exact And.intro I.rankOne (And.intro I.tensorProductDefined I.dualExists)

end DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean
end HautevilleHouse