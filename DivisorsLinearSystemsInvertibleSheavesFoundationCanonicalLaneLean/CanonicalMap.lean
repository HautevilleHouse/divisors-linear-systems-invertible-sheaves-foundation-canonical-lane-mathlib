import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean

open InvertibleSheaf
open LinearSystem
open Divisor

structure CanonicalMapPackage where
  baseVariety : Type u
  topology : TopologicalSpace baseVariety
  canonicalSheaf : InvertibleSheaf baseVariety
  canonicalLinearSystem : LinearSystem canonicalSheaf
  canonicalMap : Type v
  embeddedImage : Type w
  birationalEquivalence : Prop
  veryAmpleProperty : Prop

structure CanonicalMapEvidence (P : CanonicalMapPackage) where
  canonicalLinearSystemClosed : P.canonicalLinearSystem.complete ∧ P.canonicalLinearSystem.generatedByGlobalSections
  canonicalMapDefined : Prop
  birationalEquivalenceClosed : P.birationalEquivalence
  veryAmplePropertyClosed : P.veryAmpleProperty

def CanonicalMapClosed (P : CanonicalMapPackage) : Prop :=
  (P.canonicalLinearSystem.complete ∧ P.canonicalLinearSystem.generatedByGlobalSections) ∧
  P.birationalEquivalence ∧ P.veryAmpleProperty

theorem canonical_map_closed_from_evidence (P : CanonicalMapPackage) (E : CanonicalMapEvidence P) : CanonicalMapClosed P := by
  exact And.intro E.canonicalLinearSystemClosed (And.intro E.birationalEquivalenceClosed E.veryAmplePropertyClosed)

end DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean
end HautevilleHouse