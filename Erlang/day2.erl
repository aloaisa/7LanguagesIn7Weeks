%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Language Earlang.
%% - Day 2
%%      Seven Languages in seven weeks
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Animal = "dog".

case Animal of
	"dog" -> underdog;
	"cat" -> thundercat
end.
%underdog

case Animal of
	"elephant" -> dumbo;
	_ -> something_else
end.
%something_else


if
	ProgramsTerminated > 0 ->
		success;
	ProgramsTerminated < 0 ->
		error
end.


X = 0.

if
	X > 0 -> positive;
	X < 0 -> negative
end.
%** exception error: no true branch found when evaluating an if expression

if
	X > 0 -> positive;
	X < 0 -> negative;
	true -> zero
end.
%zero

Negate = fun(I) -> -I end.
%#Fun<erl_eval.6.13229925>
Negate(1).
%-1
Negate(-1).
%1

Numbers = [1, 2, 3, 4].
%[1,2,3,4]
lists:foreach(fun(Number) -> io:format("~p~n", [Number]) end, Numbers).
%1
%2
%3
%4
%ok

Print = fun(X) -> io:format("~p~n", [X]) end.
%#Fun<erl_eval.6.13229925>

lists:foreach(Print, Numbers).
%1
%2
%3
%4
%ok

lists:map(fun(X) -> X + 1 end, Numbers).
%[2,3,4,5]

map(F, [H|T]) -> [F(H) | map(F, T)];
map(F, [])    -> [].

Small = fun(X) -> X < 3 end.
%#Fun<erl_eval.6.13229925>
Small(4).
%false
Small(1).
%true

lists:filter(Small, Numbers).
%[1,2]

lists:all(Small, [0, 1, 2]).
%true
lists:all(Small, [0, 1, 2, 3]).
%false

lists:any(Small, [0, 1, 2, 3]).
%true
lists:any(Small, [3, 4, 5]).
%false

lists:any(Small, []).
%false
lists:all(Small, []).
%true

lists:takewhile(Small, Numbers).
%[1,2]
lists:dropwhile(Small, Numbers).
%[3,4]
lists:takewhile(Small, [1, 2, 1, 4, 1]).
%[1,2,1]
lists:dropwhile(Small, [1, 2, 1, 4, 1]).
%[4,1]


Numbers.
%[1,2,3,4]
lists:foldl(fun(X, Sum) -> X + Sum end, 0, Numbers).
%10

Adder = fun(ListItem, SumSoFar) -> ListItem + SumSoFar end.
%#Fun<erl_eval.12.113037538>

InitialSum = 0.
%0
lists:foldl(Adder, InitialSum, Numbers).
%10


Fibs = [1, 1, 2, 3, 5].
%[1,1,2,3,5]

Double = fun(X) -> X * 2 end.
%#Fun<erl_eval.6.13229925>

lists:map(Double, Fibs).
%[2,2,4,6,10]


[Double(X) || X <- Fibs].
%[2,2,4,6,10]

[X * 2 || X <- [1, 1, 2, 3, 5]].
%[2,2,4,6,10]


map(F, L) -> [ F(X) || X <- L].


Cart = [{pencil, 4, 0.25}, {pen, 1, 1.20}, {paper, 2, 0.20}].
%[{pencil,4,0.25},{pen,1,1.2},{paper,2,0.2}]

WithTax = [{Product, Quantity, Price, Price * Quantity * 0.08} || {Product, Quantity, Price} <- Cart].
%[{pencil,4,0.25,0.08},{pen,1,1.2,0.096},{paper,2,0.2,0.032}]


Cat = [{Product, Price} || {Product, _, Price} <- Cart].
%[{pencil,0.25},{pen,1.2},{paper,0.2}]


DiscountedCat = [{Product, Price / 2} || {Product, Price} <- Cat].
%[{pencil,0.125},{pen,0.6},{paper,0.1}]


[X || X <- [1, 2, 3, 4], X < 4, X > 1].
%[2,3]

[{X, Y} || X <- [1, 2, 3, 4], X < 3, Y <- [5, 6]].
%[{1,5},{1,6},{2,5},{2,6}]




























