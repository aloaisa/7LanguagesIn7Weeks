-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
--
-- Solve the map-coloring problem in Prolog using Haskell.
-- 
import Data.List

colors = ["Red", "Green", "Blue"]
states = ["Alabama", "Mississippi", "Georgia", "Tennessee", "Florida"]

neighbor :: String -> String -> Bool
neighbor a b = neighbor' a b || neighbor' b a
    where neighbor' "Mississippi" "Tennessee" = True
          neighbor' "Mississippi" "Alabama" = True
          neighbor' "Alabama" "Tennessee" = True
          neighbor' "Alabama" "Georgia" = True
          neighbor' "Alabama" "Florida" = True
          neighbor' "Georgia" "Florida" = True
          neighbor' "Georgia" "Tennessee" = True
          neighbor' _ _ = False

freeColors :: [(String, String)] -> String -> [String]
freeColors states state = colors \\ occupiedColors
    where neighbor' (s, _) = neighbor s state
          occupiedColors = map snd $ filter neighbor' states

mapColors :: [String] -> [(String, String)]
mapColors = foldl f []
    where f result state = (state, freeColor result state) : result
          freeColor r s = head $ freeColors r s

-- :load day1_exercises5.hs
-- [1 of 1] Compiling Main             ( day1_exercises5.hs, interpreted )
-- Ok, modules loaded: Main.

-- mapColors states
-- [("Florida","Blue"),("Tennessee","Blue"),("Georgia","Green"),("Mississippi","Green"),("Alabama","Red")]

