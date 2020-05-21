import Prelude.Nat

data OList : Nat -> Type where
  Empty : {x : Nat} -> OList x
  Cons  : {b : Nat} -> (x : Nat) -> LTE b x -> OList x -> OList b

merge : {n : Nat} -> OList n -> OList n -> OList n
merge Empty ys = ys
merge xs Empty = xs
merge (Cons x nleqx xs) (Cons y nleqy ys) with (isLTE x y)
  merge (Cons x nleqx xs) (Cons y nleqy ys) | Yes p = Cons x nleqx (merge xs (Cons y p ys))
  merge (Cons x nleqx xs) (Cons y nleqy ys) | No np = Cons y nleqy (merge (Cons x ?what xs) ys)
