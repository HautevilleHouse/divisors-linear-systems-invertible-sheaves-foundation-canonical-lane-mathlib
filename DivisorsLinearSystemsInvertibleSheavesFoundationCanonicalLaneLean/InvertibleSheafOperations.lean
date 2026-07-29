import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean

structure InvertibleSheafPackage where
  tensorProductDefined : Prop
  dualSheafDefined : Prop
  pullbackUnderMorphism : Prop
  globalSectionsFunctor : Prop
  cechCohomologyAvailable : Prop
  serreVanishingTheorem : Prop
  riemannRochDefined : Prop

structure InvertibleSheafEvidence (I : InvertibleSheafPackage) where
  tensorProductDefinedClosed : I.tensorProductDefined
  dualSheafDefinedClosed : I.dualSheafDefined
  pullbackUnderMorphismClosed : I.pullbackUnderMorphism
  globalSectionsFunctorClosed : I.globalSectionsFunctor
  cechCohomologyAvailableClosed : I.cechCohomologyAvailable
  serreVanishingTheoremClosed : I.serreVanishingTheorem
  riemannRochDefinedClosed : I.riemannRochDefined

def InvertibleSheafClosed (I : InvertibleSheafPackage) : Prop :=
  I.tensorProductDefined ∧ I.dualSheafDefined ∧ I.pullbackUnderMorphism ∧
  I.globalSectionsFunctor ∧ I.cechCohomologyAvailable ∧ I.serreVanishingTheorem ∧
  I.riemannRochDefined

theorem invertible_sheaf_closed_from_evidence (I : InvertibleSheafPackage)
    (E : InvertibleSheafEvidence I) : InvertibleSheafClosed I := by
  exact And.intro E.tensorProductDefinedClosed
    (And.intro E.dualSheafDefinedClosed
      (And.intro E.pullbackUnderMorphismClosed
        (And.intro E.globalSectionsFunctorClosed
          (And.intro E.cechCohomologyAvailableClosed
            (And.intro E.serreVanishingTheoremClosed E.riemannRochDefinedClosed)))))

end DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean
end HautevilleHouse