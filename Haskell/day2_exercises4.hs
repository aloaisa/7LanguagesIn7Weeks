-- - -- - -- - -- - -- - -- - -- - -- - -- 
-- 
--  Language Haskell.
--  - Day 2
--  	Seven Languages in seven weeks
-- 
-- - -- - -- - -- - -- - -- - -- - -- - -- 

-- Write a function that takes an argument x and returns a lazy
-- sequence that has every third number, starting with x. Then, write
-- a function that includes every fifth number, beginning with y.
-- Combine these functions through composition to return every
-- eighth number, beginning with x + y.


module Main where
 
	every3 x = [x, (x + 3) ..]
 
	every5 y = [y, (y + 5) ..]
 
	every8 x y = (zipWith (+) (every3 x) (every5 y))

-- take 10 (every3 1)
-- [1,4,7,10,13,16,19,22,25,28]

-- take 10 (every5 1)
-- [1,6,11,16,21,26,31,36,41,46]

-- take 10 (every8 1 5)
-- [6,14,22,30,38,46,54,62,70,78]

