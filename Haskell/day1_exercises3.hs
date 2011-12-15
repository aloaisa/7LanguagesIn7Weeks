-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
--
-- Write a function that builds two-tuples with all possible combina-
-- tions of two of the colors black, white, blue, yellow, and red. Note
-- that you should include only one of (black, blue) and (blue, black).

colors :: [String] -> [(String, String)]
colors colorList = [(a, b) | a <- colorList, b <- colorList, (a < b)]

-- :load day1_exercises3.hs
-- [1 of 1] Compiling Main ( :load day1_exercises3.hs, interpreted )
-- Ok, modules loaded: Main.

-- getColors( [ "black", "white", "blue", "yellow", "red" ] )
-- [("black","white"), ("black","blue"), ("black","yellow"), ("black","red"), ("white","yellow"), ("blue","white"), ("blue","yellow"), ("blue","red"), ("red","white"), ("red","yellow")]


