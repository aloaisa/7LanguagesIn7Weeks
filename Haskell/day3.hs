-- - -- - -- - -- - -- - -- - -- - -- - -- 
-- 
--  Language Haskell.
--  - Day 3
--  	Seven Languages in seven weeks
-- 
-- - -- - -- - -- - -- - -- - -- - -- - -- 

:set +t

'c'
-- 'c'
-- it :: Char

"abc"
-- "abc"
-- it :: [Char]

['a', 'b', 'c']
-- "abc"
-- it :: [Char]


"abc" == ['a', 'b', 'c']
-- True

True
-- True
-- it :: Bool

False
-- False
-- it :: Bool

:load cards.hs
-- [1 of 1] Compiling Main             ( cards.hs, interpreted )
-- Ok, modules loaded: Main.

-- Hearts

-- <interactive>:1:1:
--     No instance for (Show Suit)
--       arising from a use of `print'
--     Possible fix: add an instance declaration for (Show Suit)
--     In a stmt of an interactive GHCi command: print it

:load cards-with-show.hs
-- [1 of 1] Compiling Main             ( cards-with-show.hs, interpreted )
-- Ok, modules loaded: Main.

cardValue (Ten, Hearts)
-- 1
-- it :: Integer

:load triplet.hs
-- [1 of 1] Compiling Main             ( triplet.hs, interpreted )
-- Ok, modules loaded: Main.

:t Trio 'a' 'b' 'c'
-- Trio 'a' 'b' 'c' :: Triplet Char

:load tree.hs
-- [1 of 1] Compiling Main             ( tree.hs, interpreted )
-- Ok, modules loaded: Main.

let leaf = Leaf 1
-- leaf :: Tree Integer

leaf
-- Leaf 1
-- it :: Tree Integer

let (Leaf value) = leaf
-- value :: Integer

value
-- 1
-- it :: Integer

Children[Leaf 1, Leaf 2]
-- Children [Leaf 1,Leaf 2]
-- it :: Tree Integer

let tree = Children[Leaf 1, Children [Leaf 2, Leaf 3]]
-- tree :: Tree Integer

tree
-- Children [Leaf 1,Children [Leaf 2,Leaf 3]]
-- it :: Tree Integer

let (Children ch) = tree
-- ch :: [Tree Integer]

ch
-- [Leaf 1,Children [Leaf 2,Leaf 3]]
-- it :: [Tree Integer]

let (fst:tail) = ch
-- fst :: Tree Integer
-- tail :: [Tree Integer]

fst
-- Leaf 1
-- it :: Tree Integer


let cartesian (xs,ys) = do x <- xs; y <- ys; return (x,y)
-- cartesian :: Monad m => (m t, m t1) -> m (t, t1)

cartesian ([1..2], [3..4])
-- [(1,3),(1,4),(2,3),(2,4)]
it :: [(Integer, Integer)]

Just "some string"
-- Just "some string"
-- it :: Maybe [Char]

Just Nothing
-- Just Nothing
-- it :: Maybe (Maybe a)






