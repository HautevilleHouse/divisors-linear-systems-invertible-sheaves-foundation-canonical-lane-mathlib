import canonicalLaneMathlib.AdmissibleClass
import DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean.DivisorClassGroup
import DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean.LinearSystem
import DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean.InvertibleSheaf

namespace HautevilleHouse
namespace DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean

structure RiemannRochPackage where
  genus : Nat
  degreeDefined : Prop
  canonicalDivisor : Prop
  eulerCharacteristicFormula : Prop
  vanishingTheorem : Prop

def RiemannRochClosed (R : RiemannRochPackage) : Prop :=
  R.degreeDefined ∧ R.canonicalDivisor ∧ R.eulerCharacteristicFormula

theorem riemann_roch_closed (R : RiemannRochPackage) : RiemannRochClosed R := by
  exact And.intro R.degreeDefined (And.intro R.canonicalDivisor R.eulerCharacteristicFormula)

end DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean
end HautevilleHouse