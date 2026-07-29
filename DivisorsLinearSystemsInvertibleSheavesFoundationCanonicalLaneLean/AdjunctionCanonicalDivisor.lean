import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean

structure AdjunctionCanonicalDivisorPackage where
  canonicalSheafDefined : Prop
  dualizingSheafDefined : Prop
  adjunctionFormula : Prop
  kodairaVanishingStatement : Prop
  canonicalDivisorClass : Prop
  adjunctionIso : Prop

structure AdjunctionCanonicalDivisorEvidence (A : AdjunctionCanonicalDivisorPackage) where
  canonicalSheafDefinedClosed : A.canonicalSheafDefined
  dualizingSheafDefinedClosed : A.dualizingSheafDefined
  adjunctionFormulaClosed : A.adjunctionFormula
  kodairaVanishingStatementClosed : A.kodairaVanishingStatement
  canonicalDivisorClassClosed : A.canonicalDivisorClass
  adjunctionIsoClosed : A.adjunctionIso

def AdjunctionCanonicalDivisorClosed (A : AdjunctionCanonicalDivisorPackage) : Prop :=
  A.canonicalSheafDefined ∧ A.dualizingSheafDefined ∧ A.adjunctionFormula ∧
  A.kodairaVanishingStatement ∧ A.canonicalDivisorClass ∧ A.adjunctionIso

theorem adjunction_canonical_divisor_closed_from_evidence
    (A : AdjunctionCanonicalDivisorPackage) (E : AdjunctionCanonicalDivisorEvidence A) :
    AdjunctionCanonicalDivisorClosed A := by
  exact And.intro E.canonicalSheafDefinedClosed
    (And.intro E.dualizingSheafDefinedClosed
      (And.intro E.adjunctionFormulaClosed
        (And.intro E.kodairaVanishingStatementClosed
          (And.intro E.canonicalDivisorClassClosed E.adjunctionIsoClosed))))

end DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean
end HautevilleHouse