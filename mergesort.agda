open import Data.List
open import Data.Nat using (ℕ; zero; suc; _>_)
open import Data.Bool

data Sorted : List ℕ → Set where
  ∅    : Sorted []
  base : ∀ (n : ℕ) → Sorted (n ∷ [])
  ind  : ∀ (m n : ℕ) → {{m }}

--_>_ : ℕ → ℕ → Bool
--zero > n = false
--suc m > zero = true
--suc m > suc n = m > n

merge : List ℕ → List ℕ → List ℕ
merge [] [] = []
merge xs [] = xs
merge [] ys = ys
merge (x ∷ xs) (y ∷ ys) with (x > y)
...                   | false = x ∷ (merge xs (y ∷ ys))
...                   | true  = y ∷ (merge (x ∷ xs) ys)

sortedMerge : (m n : List ℕ) → Sorted m → Sorted n → (Sorted (merge m n))
