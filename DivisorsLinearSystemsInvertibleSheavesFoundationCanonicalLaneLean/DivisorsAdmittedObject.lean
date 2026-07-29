import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean

structure DivisorsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure DivisorsAdmittedObject where
  space : DivisorsSpace
  cartierDivisor : Prop
  invertibleSheafAssociated : Prop
  lineBundleAssociated : Type
  conclusion : lineBundleAssociated

def DivisorsWitnessClosed (O : DivisorsAdmittedObject) : Prop :=
  O.conclusion

end DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean
end HautevilleHouse