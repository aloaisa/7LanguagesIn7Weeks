-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
--
-- Write a function that takes a list and returns the same list in
-- reverse.

module Main where

        reverse1 :: [a] -> [a]
        reverse1 values = reverse1 values

        reverse2 :: [a] -> [a]
        reverse2 values =
                foldl
                        (\newList value -> value:newList)
                        []
                        values

        reverse3 :: [a] -> [a]
        reverse3 [] = []

-- :load day1_exercises2.hs
-- [1 of 1] Compiling Main ( day1_exercises2.hs, interpreted )
-- Ok, modules loaded: Main.

-- reverse1( [ "a", "b", "c", "d" ] )
-- ["d","c","b","a"]

-- reverse2( [ "a", "b", "c", "d" ] )
-- ["d","c","b","a"]

-- reverse3( [ "a", "b", "c", "d" ] )
-- ["d","c","b","a"]

