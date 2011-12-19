-- - -- - -- - -- - -- - -- - -- - -- - -- 
-- 
--  Language Haskell.
--  - Day 2
--  	Seven Languages in seven weeks
-- 
-- - -- - -- - -- - -- - -- - -- - -- - -- 

-- Write a Haskell function to convert a string to a number. The string
-- should be in the form of $2,345,678.99 and can possibly have leading
-- zeros.

module Main where
 
	moneyParse :: String -> Float
	moneyParse value = read strippedValue :: Float
		where
 		strippedValue =
			foldl
				(\ text c ->
					if (c == '$' || c == ',') then
						text
					else
						text ++ [c]
				)
				""
				value


-- moneyParse("$5,985,547.05")
-- 5985547.0

