import canonicalLaneMathlib.AdmissibleClass
import DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean.DivisorLinearSystemsInvertibleSheavesFoundation

namespace HautevilleHouse
namespace DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  InvertibleSheafClosed (A.object.invertibleSheaf)

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.invertibleSheafClosed

end DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean
end HautevilleHouse