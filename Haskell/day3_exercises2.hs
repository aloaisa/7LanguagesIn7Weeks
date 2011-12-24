-- - -- - -- - -- - -- - -- - -- - -- - -- 
-- 
--  Language Haskell.
--  - Day 3
--      Seven Languages in seven weeks
-- 
-- - -- - -- - -- - -- - -- - -- - -- - -- 

-- Represent a maze in Haskell. You’ll need a Maze type and a Item
-- type, as well as a function to return a node given its coordinates.
-- The node should have a list of exits to other nodes.

module Maze where

import Data.List
import Control.Monad

type Maze = [[Item]]

data Item = Exits [(Int, Int)]
  deriving (Show)

okMaze :: Maze -> (Int, Int) -> (Int, Int)-> Maybe [(Int, Int)]

okMaze ant position (positionition1, positionition2) =

  case loop [position] of

    [] -> Nothing
    (head:_) -> Just $ head

  where 

    loop path@((x, y):_) = 

      if x == positionition1 && y == positionition2
      then return $ reverse path
      else

        let (Exits ok) = ((ant !! x) !! y)
            positions = ok \\ path

        in do guard (not $ null positions)
              position <- positions
              loop (position:path)

analyzeMaze :: [String] -> Maze

analyzeMaze txt =

  let xs = floor $ (fromIntegral $ length txt) / 2
      ys = floor $ (fromIntegral $ length $ head txt) / 2

  in [[makeItem a b | b <- [1..ys]] | a <- [1..xs]]

 where 
  makeItem a b = Exits $ concatMap (makeExit a b) 
                           [(-1,0), (0,1), (1,0), (0,-1) ] 

  makeExit a b (y, x) = if (txt !! (2*a + y - 1) !! (2*b + x - 1)) == ' '
                        then [(a+y-1, b+x-1)]
                        else []


data Issue = Prob (Int, Int) (Int, Int) [String]
  deriving (Show)


change n f ls = 
  case splitAt n ls of
    (pre, (u:tail)) -> pre ++ ((f u):tail)


printAsterisk prob asterisk =
  foldl' update prob asterisk

 where
  update prob (x,y) = change (2*x+1) (change (2*y+1) (const '*')) prob


solveIssue :: FilePath -> IO ()

solveIssue openfile =

  do (Prob start end prob) <- loadIssue openfile

     let maze   = analyzeMaze prob
     case okMaze maze start end of

       Just asterisk -> putStrLn $ unlines $ printAsterisk prob asterisk
       Nothing  -> putStrLn "¡No solution!"


loadIssue :: FilePath -> IO Issue

loadIssue file = 

  do txt <- readFile file

     let filtered = case cleanMaze txt of
                      (line:lines) -> ((init $ init line):lines)
         (x, y) = (length filtered, length (head filtered))

     return $ Prob ((x `div` 2) - 1, 0) (0, (y `div` 2) - 1) filtered


divideAll :: Int -> [i] -> [[i]]

divideAll _ [] = []

divideAll y lines = 

  case splitAt y lines of
    (pre, tail) -> pre:divideAll y tail

quitSpaces (line:lines) = line:(concatMap tail $ divideAll 3 lines)

cleanMaze = map quitSpaces . map (drop 5) . lines


-- :load day3_exercises2.hs
-- [1 of 1] Compiling Maze             ( day3_exercises2.hs, interpreted )
-- Ok, modules loaded: Maze.
-- *Maze> solveIssue "maze.txt"
--
--  _____________________________________________________________________
-- | |         |                   |   | |   |   |   |       |   |   |* *|
-- | | ____  __|_  ____  __    ____| __| |   | __|_  |   ____|_  | __| __|
-- | |   | |           | | | |   |         |   |   |   |   |   |* * * *  |
-- | |_  | |___    ____|_| |_|___|   ______|_  |_  | __|___| __| ______  |
-- |   |       | |     |   |     | | |     |         |   | | |  *| | | | |
-- | __|___    |_|   __|_  |_  __|_|_|_    |_____  __|_  | | |_  | | | |_|
-- |       | | |   |               | |   |           |         |*  |     |
-- | ______| |_|_  | __________    | |___|___  __    | __      | __|_    |
-- |   |     |     | |     | |   | | | | |   |   | | | |   | | |* *    | |
-- |_  | ____|_    |_|_  __| |___| | | | | __| __|_|_|_|___|_| |_  ____| |
-- | | |   | |   |     | |     |           |   |       | | |  * * *|   | |
-- | | |___| |_  | ____| |___  |_____  ____|_  | ______| | |_  __  |   |_|
-- | | |     |   |         |   |     |       |   |    * * * * *  | | |   |
-- | | | ____|   |___  ____|_  |_  __|_____  | __|_        ______|_|_|_  |
-- |   |     | | | | |       | |    * *|           | |*| | |     | | |   |
-- | __|___  |_|_| | | ____  | |_      |_______  __|_| |_|_|_  __| | |_  |
-- |         |             |   |   |*|* * * * * * * * *    | | | |   |   |
-- |___  ____| ____  ____  |___| __| |_  ______________  __| | | | __| __|
-- |   |   | |   |   | | |   |     |*|     |         |       |   |       |
-- | __| __| | __|_  | | |___|_____| |_    |   ______|_______|_  |   __  |
-- | |       |     | | |* * * * *| |*  | | | |       |     |       | |   |
-- | |___    |_____|_| | ______  | | __| | | |___  __| ____|   ____|_|_  |
-- |   | | |   |      * *| |    * * *|   | | |     |   |     |   |       |
-- | __| | |_  |_____  __| |_      __|_  |_| |_____|   |   __|___| ____  |
-- |     | |     |   |*| |   | | | |         | |     | | |       |   |   |
-- |___  | |___  |_  | | | __|_| |_|_______  | | ____|_|_| ____  |___| __|
-- |       | |     |* *|   |         |   |         |           | | | |   |
-- | ____  | |_  __|   | __|___  ____| __|_  __    |   ________| | | |_  |
-- | |   | |   |   |*|   | |   | |         |   | | | | |         | |   | |
-- |_| __| | __|_  | |   | | __| |_    ____|   | |_| |_|   __  __| |_  | |
-- |   |   |       |*| |       | | | |     | | |     | | |   | |     |   |
-- |_  | __|_  __  | |_|_____  | | |_|_  __| | |___  | | |_  |_| ____|_  |
-- |   |     | | | |*| |   |   | | |   |     | |     |     | |   | |   | |
-- |_  |_____| | |_| | | __| __| | |_  | __  |_|_  __|_  __|_| __| |   |_|
-- |     |* * * * * *    |   |   |   | |   | |   | | | |   |     |   |   |
-- |_  __|   __  ________|___|_  | __| |   |_| __|_| | |_  |   __| __|___|
-- |    * *| |   |     |   |       | |   |   |   |     |   | |     | |   |
-- |     __| |_  |_  __| __|___    | | __|   |   |   __| __|_|     | |_  |
-- | | |*  |   |   |   |   |     |   | | | | | |   | |     |   | |       |
-- | |_| __|___| __|_  | __|___  | __|_| |_| | |___|_|_  __| __|_|_  __  |
-- |   |* *|   | |       | | |   |     | |           |           | |   | |
-- |___|   |   |_| ______| | |_  |___  | |   ______  |___        | |___| |
-- | | | |* *|       | |       | |   |   | | |   | | | | | | | |     |   |
-- | | | |_  |___    | | __  __|_| __|   |_| | __| |_| | |_| |_|_    | __|
-- |       |*| | | |   | |         | | | |   | |   | | |   | |     | | | |
-- |_______| | | |_|___|_|_        | |_| |_  | |   | | | __|_| ____|_| | |
-- |* * *  |*  |             | | |         |   | | |           |         |
-- | __  __|   |_    ______  |_|_| __  __  |_  | |_|     ______| ______  |
-- |*  |* * *| |   | |         |   |     |   |   |   | | |           |   |
-- |___|_____|_|___|_|_________|___|_____|___|___|___|_|_|___________|___|
-- 

