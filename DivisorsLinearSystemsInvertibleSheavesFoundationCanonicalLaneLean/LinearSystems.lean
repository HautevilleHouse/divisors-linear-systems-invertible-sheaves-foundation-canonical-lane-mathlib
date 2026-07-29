import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean

structure LinearSystemsPackage where
  scheme : Type u
  topology : TopologicalSpace scheme
  completeLinearSystem : Type v
  baseLocus : Prop
  veryAmpleCondition : Prop
  projectiveEmbedding : Prop

structure LinearSystemsEvidence (L : LinearSystemsPackage) where
  baseLocusClosed : L.baseLocus
  veryAmpleConditionClosed : L.veryAmpleCondition
  projectiveEmbeddingClosed : L.projectiveEmbedding

def LinearSystemsClosed (L : LinearSystemsPackage) : Prop :=
  L.baseLocus ∧ L.veryAmpleCondition ∧ L.projectiveEmbedding

theorem linear_systems_closed_from_evidence (L : LinearSystemsPackage)
    (E : LinearSystemsEvidence L) : LinearSystemsClosed L := by
  exact And.intro E.baseLocusClosed
    (And.intro E.veryAmpleConditionClosed E.projectiveEmbeddingClosed)

end DivisorsLinearSystemsInvertibleSheavesFoundationCanonicalLaneLean
end HautevilleHouse