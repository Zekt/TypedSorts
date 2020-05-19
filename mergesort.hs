mergeSort :: (Ord a) => [a] -> [a]
mergeSort xs = mergeAll (map (:[]) xs)

mergeAll :: (Ord a) => [[a]] -> [a]
mergeAll [] = []
mergeAll [x] = x
mergeAll xs = mergeAll (mergeTwo xs)

mergeTwo :: (Ord a) => [[a]] -> [[a]]
mergeTwo []       = []
mergeTwo [x]      = [x]
mergeTwo (x:y:xs) = (merge x y):(mergeTwo xs)

merge :: (Ord a) => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys) | x > y     = y:(merge (x:xs) ys)
                    | otherwise = x:(merge xs (y:ys))
