-- - -- - -- - -- - -- - -- - -- - -- - -- 
-- 
--  Language Haskell.
--  - Day 3
--  	Seven Languages in seven weeks
-- 
-- - -- - -- - -- - -- - -- - -- - -- - -- 

--  Write a function that looks up a hash table value that uses the
-- Maybe monad. Write a hash that stores other hashes, several lev-
-- els deep. Use the Maybe monad to retrieve an element for a hash
-- key several levels deep.

module Looks where

	looks value [] = Nothing
	looks value ((x, head):tail)
		| value == x  = Just head
		| otherwise = looks value tail

	try = [(1, []), (2, [("a", [("i", "OK!")]), ("b", [("j", "NOT :(")])]), (3, [("c", [("k", "OK!")])])]


-- :load day3_exercises.hs
-- [1 of 1] Compiling Looks            ( day3_exercises.hs, interpreted )
-- Ok, modules loaded: Looks.

-- looks 2 try >>= looks "b" >>= looks "i"
-- Nothing
-- it :: Maybe [Char]

-- looks 2 try >>= looks "a" >>= looks "i"
-- Just "OK!"
-- it :: Maybe [Char]
