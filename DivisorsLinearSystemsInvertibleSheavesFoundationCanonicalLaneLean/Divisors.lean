import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean

open InvertibleSheaf

structure Divisor (X : Type u) [TopologicalSpace X] where
  support : Set X
  multiplicity : X → ℤ
  locallyFinite : Prop

structure WeilDivisor (X : Type u) [TopologicalSpace X] where
  divisor : Divisor X
  codimOneSubvarieties : Set X
  coefficients : X → ℤ
  finiteSupport : Prop

structure CartierDivisor (X : Type u) [TopologicalSpace X] where
  localData : Set (Set X × (X → ℤ))
  gluingCondition : Prop

structure DivisorPackage (X : Type u) [TopologicalSpace X] where
  weilDivisor : WeilDivisor X
  cartierDivisor : CartierDivisor X
  divisorClassGroup : Type v
  canonicalDivisor : WeilDivisor X
  principalDivisor : WeilDivisor X
  linearEquivalence : WeilDivisor X → WeilDivisor X → Prop

structure DivisorEvidence (X : Type u) [TopologicalSpace X] (P : DivisorPackage X) where
  weilDivisorClosed : P.weilDivisor.divisor.locallyFinite ∧ P.weilDivisor.finiteSupport
  cartierDivisorClosed : P.cartierDivisor.gluingCondition
  divisorClassGroupClosed : P.divisorClassGroup = P.divisorClassGroup
  canonicalDivisorClosed : P.canonicalDivisor.divisor.locallyFinite ∧ P.canonicalDivisor.finiteSupport
  principalDivisorClosed : P.principalDivisor.divisor.locallyFinite ∧ P.principalDivisor.finiteSupport
  linearEquivalenceClosed : P.linearEquivalence P.canonicalDivisor P.canonicalDivisor

def DivisorClosed (X : Type u) [TopologicalSpace X] (P : DivisorPackage X) : Prop :=
  (P.weilDivisor.divisor.locallyFinite ∧ P.weilDivisor.finiteSupport) ∧
  P.cartierDivisor.gluingCondition ∧
  (P.canonicalDivisor.divisor.locallyFinite ∧ P.canonicalDivisor.finiteSupport) ∧
  (P.principalDivisor.divisor.locallyFinite ∧ P.principalDivisor.finiteSupport) ∧
  P.linearEquivalence P.canonicalDivisor P.canonicalDivisor

theorem divisor_closed_from_evidence (X : Type u) [TopologicalSpace X] (P : DivisorPackage X) (E : DivisorEvidence X P) : DivisorClosed X P := by
  exact And.intro E.weilDivisorClosed (And.intro E.cartierDivisorClosed (And.intro E.canonicalDivisorClosed (And.intro E.principalDivisorClosed E.linearEquivalenceClosed)))

end DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean
end HautevilleHouse