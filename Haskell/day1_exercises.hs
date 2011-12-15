---------------------------------------------
--
-- Language Haskell.
-- - Day 1
-- 	Seven Languages in seven weeks
--
--------------------------------------------

-- How many different ways can you find to write allEven?

module Main where
 
	allEven :: [Integer] -> [Integer]
	allEven [] = []

	allEven (head:tail) =
		if (even head) then
			head:allEven(tail)
		else
			allEven(tail)
 
	allEven2 :: [Integer] -> [Integer]
	allEven2 paramlist =
		foldr
			(\n evens -> if (even n) then (n:evens) else evens)
			[]
			paramList	
 

	allEven3 :: [Integer] -> [Integer]
	allEven3 paramList = filter even paramList

 
	allEven4 :: [Integer] -> [Integer]
	allEven4 paramList = [n | n <- paramList, (even n)]



 
--:load day2_exercises.hs
--[1 of 1] Compiling Main ( day2_exercises.hs, interpreted )
--Ok, modules loaded: Main.

allEven([1, 2, 3, 4, 5])
--[2,4]

allEven2([1, 2, 3, 4, 5])
--[2,4]

allEven3([1, 2, 3, 4, 5])
--[2,4]

allEven4([1, 2, 3, 4, 5])
--[2,4]



