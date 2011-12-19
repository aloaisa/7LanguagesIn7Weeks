-- - -- - -- - -- - -- - -- - -- - -- - -- 
-- 
--  Language Haskell.
--  - Day 2
--  	Seven Languages in seven weeks
-- 
-- - -- - -- - -- - -- - -- - -- - -- - -- 

(\x -> x) "Logical."
-- "Logical."

(\x -> x ++ " captain.") "Logical,"
-- "Logical, captain.

map (\x -> x * x) [1, 2, 3]
-- [1,4,9]

map (+ 1) [1, 2, 3]
-- [2,3,4]

:load map.hs
-- [1 of 1] Compiling Main             ( map.hs, interpreted )
-- Ok, modules loaded: Main.

squareAll [1, 2, 3]
-- [1,4,9]

odd 5
-- True

filter odd [1, 2, 3, 4, 5]
-- [1,3,5]

foldl (\x carryOver -> carryOver + x) 0 [1 .. 10]
-- 55

foldl1 (+) [1 .. 3]
-- 6

1 + 2 + 3
-- 6

let prod x y = x * y
prod 3 4
-- 12

:t prod
-- prod :: (Num a) => a -> a -> a

let double = prod 2
let triple = prod 3

double 3
-- 6

triple 4
-- 12

:load my_range.hs
-- [1 of 1] Compiling Main             ( my_range.hs, interpreted )
-- Ok, modules loaded: Main.

take 10 (myRange 10 1)
-- [10,11,12,13,14,15,16,17,18,19]

take 5 (myRange 0 5)
-- [0,5,10,15,20]

:load lazy_fib.hs
-- [1 of 1] Compiling Main             ( lazy_fib.hs, interpreted )
-- Ok, modules loaded: Main.

take 5 (lazyFib 0 1)
-- [0,1,1,2,3]

take 5 (fib)
-- [1,1,2,3,5]

take 5 (drop 20 (lazyFib 0 1))
-- [6765,10946,17711,28657,46368]

fibNth 3
-- 2

fibNth 6
-- 8

take 5 (zipWith (+) fib (drop 1 fib))
-- [2,3,5,8,13]

take 5 (map (*2) [1 ..])
-- [2,4,6,8,10]

take 5 (map ((* 2) . (* 5)) fib)
-- [10,10,20,30,50]

