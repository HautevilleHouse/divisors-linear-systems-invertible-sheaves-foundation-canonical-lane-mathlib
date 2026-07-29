import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean

structure LinearSystemPackage where
  divisorClass : Type u
  baseLocus : Type v
  completeLinearSystemDefined : Prop
  basePointFree : Prop
  veryAmpleCondition : Prop
  mapToProjectiveSpaceDefined : Prop
  dimensionFormula : Prop

structure LinearSystemEvidence (L : LinearSystemPackage) where
  completeLinearSystemDefinedClosed : L.completeLinearSystemDefined
  basePointFreeClosed : L.basePointFree
  veryAmpleConditionClosed : L.veryAmpleCondition
  mapToProjectiveSpaceDefinedClosed : L.mapToProjectiveSpaceDefined
  dimensionFormulaClosed : L.dimensionFormula

def LinearSystemClosed (L : LinearSystemPackage) : Prop :=
  L.completeLinearSystemDefined ∧ L.basePointFree ∧ L.veryAmpleCondition ∧
  L.mapToProjectiveSpaceDefined ∧ L.dimensionFormula

theorem linear_system_closed_from_evidence (L : LinearSystemPackage)
    (E : LinearSystemEvidence L) : LinearSystemClosed L := by
  exact And.intro E.completeLinearSystemDefinedClosed
    (And.intro E.basePointFreeClosed
      (And.intro E.veryAmpleConditionClosed
        (And.intro E.mapToProjectiveSpaceDefinedClosed E.dimensionFormulaClosed)))

end DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean
end HautevilleHouse