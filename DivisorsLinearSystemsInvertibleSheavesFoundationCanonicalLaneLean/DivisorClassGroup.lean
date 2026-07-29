import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean

structure DivisorClassGroupPackage where
  scheme : Type u
  topology : TopologicalSpace scheme
  divisorClassGroup : Type v
  picardGroup : Type w
  exactSequence : Prop
  intersectionTheory : Prop

structure DivisorClassGroupEvidence (D : DivisorClassGroupPackage) where
  exactSequenceClosed : D.exactSequence
  intersectionTheoryClosed : D.intersectionTheory

def DivisorClassGroupClosed (D : DivisorClassGroupPackage) : Prop :=
  D.exactSequence ∧ D.intersectionTheory

theorem divisor_class_group_closed_from_evidence (D : DivisorClassGroupPackage)
    (E : DivisorClassGroupEvidence D) : DivisorClassGroupClosed D := by
  exact And.intro E.exactSequenceClosed E.intersectionTheoryClosed

end DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean
end HautevilleHouse