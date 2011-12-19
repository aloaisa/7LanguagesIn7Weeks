-- - -- - -- - -- - -- - -- - -- - -- - -- 
-- 
--  Language Haskell.
--  - Day 2
--  	Seven Languages in seven weeks
-- 
-- - -- - -- - -- - -- - -- - -- - -- - -- 

-- Write a sort that takes a list and returns a sorted list.
module Main where
 
	import Data.List

	sortedList :: (Ord a) => [a] -> [a]
 
	sortedList list =
		sortBy
			(\a b -> if (a < b) then LT else GT)
			list

-- sortedList([ 5, 9, 2, 7, 3, 6, 1, 8, 4, 10])
-- [1,2,3,4,5,6,7,8,9,10]
