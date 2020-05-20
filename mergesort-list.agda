open import Relation.Binary.PropositionalEquality using (_≡_)
open import Data.Unit using (⊤; tt)
open import Data.Product
open import Data.Nat using (ℕ; zero; suc; _+_; _>_; _>?_; _≤_; _≤?_)
open import Data.Nat.Properties
--open import Data.Bool
open import Relation.Nullary

data OList : ℕ → Set where
  []      : {x : ℕ} → OList x
  _:[_]:_ : {b : ℕ} → (x : ℕ) → b ≤ x → OList x → OList b

merge : {n : ℕ} → OList n → OList n → OList n
merge [] ys = ys
merge xs [] = xs
merge (x :[ n≤x ]: xs) (y :[ n≤y ]: ys) with x ≤? y
...                                     | yes p = x :[ n≤x ]: merge xs (y :[ p ]: ys)
...                                     | no ¬p = y :[ n≤y ]: merge (x :[ ≰⇒≥ ¬p ]: xs) ys

--data Sorted : {x : ℕ} → OList x → Set where
--  base : {x : ℕ} → Sorted (one x)
--  inc  : {x y : ℕ} → (x≤y : x ≤ y) → (ys : OList y) → Sorted (cons x x≤y ys)

--data All {A : Set} (P : A → Set) : List A → Set where
--  []  : All P []
--  _∷_ : ∀ {x xs} → (px : P x) → (pxs : All P xs) → All P (x ∷ xs)

--weaken : {x y z : ℕ} → x ≤ y → (suc x) ≤ y →  ≤ y

--weaken : {n m : ℕ} → OList n → m ≤ n → OList m
--weaken [] _ = []
--weaken (x :[ x≤b ]: xs) m≤n = x :[ {!!} ]: weaken xs {!!} -- (weaken xs m≤n)


--merge : (xs : List ℕ) → (ys : List ℕ) → Sorted xs → Sorted ys → ∃[ zs ] (Sorted zs)
--merge [] ys tt sys = ys , sys
--merge xs [] sxs tt = xs , sxs
--merge (x ∷ []) (y ∷ ys) [] sys with x ≤? y
--...                          | yes p = x ∷ y ∷ ys , {!!}
--...                          | no ¬p = {!!}
--merge (x ∷ (x' ∷ xs)) (y ∷ ys) (px ∷ sxs) sys = {!!}
--merge [] ys [] sys = ys , sys
--merge xs [] sxs [] = xs , sxs
--merge (x ∷ []) (y ∷ []) [1] [1] with x ≤? y
--...                           | yes p = x ∷ [ y ] , (p • [1])
--...                           | no ¬p = y ∷ [ x ] , (≰⇒≥ ¬p • [1])
--merge (x ∷ xs) (y ∷ []) (sx • sxs) [1] with x ≤? y | merge xs (y ∷ []) sxs [1]
--...                                  | yes p | (zs , szs) = x ∷ zs , {!!}
--...                                  | no ¬p | (zs , szs) = {!!} , {!!}
--merge (x ∷ []) (y ∷ ys) [1] sys with x ≤? y
--...                           | yes p = x ∷ y ∷ ys , {!!}
--...                           | no ¬p = x ∷ y ∷ ys , {!!}
--merge (x ∷ xs) (y ∷ ys) (sx • sxs) (sy • sys) with x ≤? y | merge xs (y ∷ ys) | merge (x ∷ xs) ys = {!!}
