-- - -- - -- - -- - -- - -- - -- - -- - -- 
-- 
--  Language Haskell.
--  - Day 1
--  	Seven Languages in seven weeks
-- 
-- - -- - -- - -- - -- - -- - -- - -- - -- 

4
--  4

4 + 4
--  8

4 + 1
--  5

4 + 1.0
--  5.0

4 + 1
-- 5

4 + 2 * 5
-- 14

4 + 2.0 * 5
-- 14.0

4 * 5 + 1
-- 21

4 * (5 + 1)
-- 24

"hello"
-- "hello"

-- "hello" + " World!."
-- 
--  <interactive>:1:9:
--     No instance for (Num [Char])
--       arising from a use of `+'
--     Possible fix: add an instance declaration for (Num [Char])
--     In the expression: "hello" + " World!."
--     In an equation for `it': it = "hello" + " World!."

"hello" ++ " World!."
-- "hello World!."

'a'
-- 'a'

['a', 'b']
-- "ab"

(4 + 5) == 9
-- True

(5 + 5) /= 10
-- False

-- if (5 == 5) then "true"
--  <interactive>:1:23: parse error (possibly incorrect indentation)

if (5 == 5) then "true" else "false"
-- "true"

-- if 1 then "true" else "false"
-- 
--  <interactive>:1:4:
--     No instance for (Num Bool)
--       arising from the literal `1'
--     Possible fix: add an instance declaration for (Num Bool)
--     In the expression: 1
--     In the expression: if 1 then "true" else "false"
--     In an equation for `it': it = if 1 then "true" else "false"


-- "one" + 1
-- 
--  <interactive>:1:9:
--     No instance for (Num [Char])
--       arising from the literal `1'
--     Possible fix: add an instance declaration for (Num [Char])
--     In the second argument of `(+)', namely `1'
--     In the expression: "one" + 1
--     In an equation for `it': it = "one" + 1

:set +t

5
-- 5
-- it :: Integer

5.0
-- 5.0
-- it :: Double

"hello"
-- "hello"
-- it :: [Char]

(5 == (2 + 3))
-- True
-- it :: Bool

:t 5
-- 5 :: (Num t) => t

let x = 10
x
-- 10

let double x = x * 2
double 2
-- 4


:load double.hs
-- [1 of 1] Compiling Main             ( double.hs, interpreted )
-- Ok, modules loaded: Main.

:load double_with_type.hs
-- [1 of 1] Compiling Main             ( double_with_type.hs, interpreted )
-- Ok, modules loaded: Main.
--  *Main> 1] Compiling Main             ( double_with_type.hs, interpreted )
-- 
--  <interactive>:1:2: parse error on input `]'

:t double
-- double :: Integer -> Integer


let fact x = if x == 0 then 1 else fact (x - 1) * x
fact 3
-- 6

:load fib_tuple.hs
-- [1 of 1] Compiling Main             ( fib_tuple.hs, interpreted )
-- Ok, modules loaded: Main.

fib 100
-- 354224848179261915075

fib 1000
-- 43466557686937456435688527675040625802564660517371780402481729089536555417949051890403879840079255169295922593080322634775209689623239873322471161642996440906533187938298969649928516003704476137795166849228875



let second = head . tail
second [1, 2]
-- 2

second [3, 4, 5]
-- 4

fibNextPair :: (Integer, Integer) -> (Integer, Integer)
fibNextPair (x, y) = (y, x + y)

fibNthPair :: Integer -> (Integer, Integer)
fibNthPair 1 = (1, 1)
fibNthPair n = fibNextPair (fibNthPair (n - 1))

fibNthPair(8)
-- (21,34)

fibNthPair(9)
-- (34,55)

fibNthPair(10)
-- (55,89)

let (h:t) = [1, 2, 3, 4]
h
-- 1

t
-- [2,3,4]

:load lists.hs
-- [1 of 1] Compiling Main             ( lists.hs, interpreted )
-- Ok, modules loaded: Main.

size "Fascinating."
-- 12

zip "kirk" "spock"
-- [('kirk','spock')]

zip ["kirk", "spock"] ["enterprise", "reliant"]
-- [("kirk","enterprise"),("spock","reliant")]


let h:t = [1, 2, 3]
h
-- 1

-- t
[2,3]

1:[2, 3]
-- [1,2,3]

-- [1]:[2, 3]
--  <interactive>:1:8:
-- No instance for (Num [t])
-- arising from the literal `3' at <interactive>:1:8


[1]:[[2], [3, 4]]
-- [[1],[2],[3,4]]

[1]:[]
-- [[1]]

[1..2]
-- [1,2]

[1..4]
-- [1,2,3,4]

[10..4]
-- []

[10, 8 .. 4]
-- [10,8,6,4]

[10, 9.5 .. 4]
-- [10.0,9.5,9.0,8.5,8.0,7.5,7.0,6.5,6.0,5.5,5.0,4.5,4.0]

take 5 [ 1 ..]
-- [1,2,3,4,5]

take 5 [0, 2 ..]
-- [0,2,4,6,8]

[x * 2 | x <- [1, 2, 3]]
-- [2,4,6]


[ (y, x) | (x, y) <- [(1, 2), (2, 3), (3, 1)]]
-- [(2,1),(3,2),(1,3)]

[ (4 - x, y) | (x, y) <- [(1, 2), (2, 3), (3, 1)]]
-- [(3,2),(2,3),(1,1)]

let crew = ["Kirk", "Spock", "McCoy"]

[(a, b) | a <- crew, b <- crew]
-- [("Kirk","Kirk"),("Kirk","Spock"),("Kirk","McCoy"),
-- ("Spock","Kirk"),("Spock","Spock"),("Spock","McCoy"),
-- ("McCoy","Kirk"),("McCoy","Spock"),("McCoy","McCoy")]

[(a, b) | a <- crew, b <- crew, a /= b]
-- [("Kirk","Spock"),("Kirk","McCoy"),("Spock","Kirk"),
-- ("Spock","McCoy"),("McCoy","Kirk"),("McCoy","Spock")]

[(a, b) | a <- crew, b <- crew, a < b]
-- [("Kirk","Spock"),("Kirk","McCoy"),("McCoy","Spock")]

