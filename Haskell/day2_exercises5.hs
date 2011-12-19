-- - -- - -- - -- - -- - -- - -- - -- - -- 
-- 
--  Language Haskell.
--  - Day 2
--  	Seven Languages in seven weeks
-- 
-- - -- - -- - -- - -- - -- - -- - -- - -- 

-- Use a partially applied function to define a function that will re-
-- turn half of a number and another that will append \n to the end
-- of any string.

module Maine where
 
	halfOfANumber = (/ 2)
 
	addReturn = (++ "\n")



-- halfOfANumber 50
-- 25.0

-- halfOfANumber 25
-- 12.5

-- halfOfANumber 12.5
-- 6.25

-- halfOfANumber 6.5
-- 3.25

-- halfOfANumber 3.25
-- 1.625

-- halfOfANumber 1.625
-- 0.8125

