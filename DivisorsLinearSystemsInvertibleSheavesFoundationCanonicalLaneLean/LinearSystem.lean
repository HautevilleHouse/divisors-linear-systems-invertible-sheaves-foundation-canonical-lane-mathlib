import canonicalLaneMathlib.AdmissibleClass
import DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean.DivisorClassGroup

namespace HautevilleHouse
namespace DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean

structure LinearSystemPackage {G : DivisorClassGroupPackage} where
  completeLinearSystem : Type u
  dimension : Nat
  baseLocusFree : Prop
  veryAmple : Prop

def LinearSystemClosed {G : DivisorClassGroupPackage} (L : LinearSystemPackage G) : Prop :=
  L.baseLocusFree ∧ L.veryAmple

theorem linear_system_closed {G : DivisorClassGroupPackage} (L : LinearSystemPackage G) : LinearSystemClosed L := by
  exact And.intro L.baseLocusFree L.veryAmple

end DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean
end HautevilleHouse