-- - -- - -- - -- - -- - -- - -- - -- - -- 
-- 
--  Language Haskell.
--  - Day 3
--  	Seven Languages in seven weeks
-- 
-- - -- - -- - -- - -- - -- - -- - -- - -- 

-- 

do x <- [1..5]
   y <- [1..5]
   if x < y
     then return (x,y)
     else fail "Not a valid pair"
