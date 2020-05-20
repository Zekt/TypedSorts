open import Relation.Binary.PropositionalEquality using (_≡_)
open import Data.Vec
open import Data.Nat using (ℕ; zero; suc; _+_; _>_; _>?_)
open import Data.Bool
open import Data.Nat.DivMod
open import Relation.Nullary
--{-# BUILTIN NATPLUS _+_ #-}

private
  variable
    k m n : ℕ

data Sorted : Vec ℕ n → Set where
  ∅    : Sorted []
  base : ∀ (n : ℕ) → Sorted (n ∷ [])
  --ind  : ∀ (m n : ℕ) → {{m }}

merge : Vec ℕ m → Vec ℕ n → {{_ : k ≡ m + n}} → Vec ℕ k
merge [] [] ⦃ _≡_.refl ⦄ = []
merge []  ys ⦃ _≡_.refl ⦄ = ys
merge xs [] ⦃ _≡_.refl ⦄ = {!xs!}
merge (x ∷ xs) (x₁ ∷ ys) = {!!}
--merge (x ∷ xs) (y ∷ ys) with (x >? y)
--...                     | Dec.no  _ = x ∷ (merge xs (y ∷ ys))
--...                     | Dec.yes _ = y ∷ (merge (x ∷ xs) ys)

--mergePairs : Vec (Vec ℕ) → Vec (Vec ℕ)
--mergePairs [] = []
--mergePairs (xs ∷ []) = [ xs ]
--mergePairs (xs ∷ ys ∷ yss) = (merge xs ys) ∷ (mergePairs yss)
--
--mergeAll : Vec (Vec ℕ) → Vec ℕ
--mergeAll [] = []
--mergeAll (xs ∷ []) = xs
--mergeAll (xs ∷ ys ∷ yss) = mergeAll {!!}


--sortedMerge : (m n : List ℕ) → Sorted m → Sorted n → (Sorted (merge m n))
