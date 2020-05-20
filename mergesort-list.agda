open import Relation.Binary.PropositionalEquality using (_≡_)
open import Data.Unit using (⊤; tt)
open import Data.List
open import Data.Product
open import Data.Nat using (ℕ; zero; suc; _+_; _>_; _>?_; _≤_; _≤?_)
open import Data.Nat.Properties
--open import Data.Bool
open import Data.Nat.DivMod
open import Relation.Nullary

data Sorted : List ℕ → Set where
  []  : Sorted []
  [1] : {x : ℕ} → Sorted (x ∷ [])
  _•_ : {x y : ℕ} {ys : List ℕ}→ x ≤ y → Sorted (y ∷ ys) → Sorted (x ∷ y ∷ ys)

merge : (xs : List ℕ) → (ys : List ℕ) → Sorted xs → Sorted ys → ∃[ zs ] (Sorted zs)
merge [] ys [] sys = ys , sys
merge xs [] sxs [] = xs , sxs
merge (x ∷ []) (y ∷ []) [1] [1] with x ≤? y
...                           | yes p = x ∷ [ y ] , (p • [1])
...                           | no ¬p = y ∷ [ x ] , (≰⇒≥ ¬p • [1])
merge (x ∷ xs) (y ∷ []) (sx • sxs) [1] with x ≤? y
...                                  | yes p = x ∷ y ∷ xs , {!!}
...                                  | no ¬p = x ∷ y ∷ xs , {!!}
merge (x ∷ []) (y ∷ ys) [1] sys with x ≤? y
...                           | yes p = x ∷ y ∷ ys , {!!}
...                           | no ¬p = x ∷ y ∷ ys , {!!}
merge (x ∷ x' ∷ xs) ys (sx • sxs) sys = {!!}
