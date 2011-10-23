%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Language Prolog.
%% - Day 1
%%      Seven Languages in seven weeks
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(1, 2, 3) = (1, 2, 3).
% => yes

(1, 2, 3) = (1, 2, 3, 4).
% => no

(1, 2, 3) = (3, 2, 1).
% => no

(A, B, C) = (1, 2, 3).
% => A = 1
% => B = 2
% => C = 3
% => yes

(1, 2, 3) = (A, B, C).
% => A = 1
% => B = 2
% => C = 3
% => yes

(A, 2, C) = (1, B, 3).
% => A = 1
% => B = 2
% => C = 3
% => yes

[1, 2, 3] = [X, Y, Z].
% => X = 1
% => Y = 2
% => Z = 3
% => yes

[2, 2, 3] = [X, X, Z].
% => X = 2
% => Z = 3
% => yes

[1, 2, 3] = [X, X, Z].
% => no

[] = [].
% => yes

[a, b, c] = [Head|Tail].
% => Head =a
% => Tail = [b,c]
% => yes

[] = [Head|Tail].
% => no

[a] = [Head|Tail].
% => Head =a
% => Tail = []
% => yes

[a, b, c] = [a|Tail].
% => Tail = [b,c]
% => yes

[a, b, c] = [a|[Head|Tail]].
% => Head = b
% => Tail = [c]
% => yes

[a, b, c, d, e] = [_, _|[Head|_]].
% => Head = c
% => yes

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%
%% Fibonacci series and factorials.
%%

% Fibonacci series
fib( 1, 1 ).
fib( 2, 1 ).
 
fib( Index, Value ) :-
	(Index > 2),
	
	IndexSub1 is (Index - 1),
	IndexSub2 is (Index - 2),
 
	fib( IndexSub1, ValueSub1),
	fib( IndexSub2, ValueSub2),
 
	Value is (ValueSub1 + ValueSub2)
	.

% Factorial. 
factorial( 0, 1 ).
factorial( 1, 1 ).
factorial( 2, 2 ).
factorial( 3, 6 ).
 
factorial( N, Value ) :-
	(N > 3),
 	NSub1 is (N - 1),
	factorial( NSub1, ValueSub1 ),
	Value is (N * ValueSub1)
	.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Implementation of the Towers of Hanoi.
%%
hanoi(N) :- move(N,left,center,right).
 
move(0,_,_,_) :- !.
move(N,A,B,C) :-
	M is N-1,
	move(M,A,C,B),
	inform(A,B),
	move(M,C,B,A).
 
inform(X,Y) :- write([move,a,disk,from,the,X,pole,to,Y,pole]), nl.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Reverse the elements of a list.
%%
 
rev( [], [] ).
rev( [X], [Y] ).
rev( [X,Y], [Y,X] ).
 
rev( List, Reversed ) :-
	(List = [Head|Tail]),
	rev( Tail, ReversedTail ),
	append( ReversedTail, [Head], Reversed )
	.

% rev([1,2,3],What).
% => What = [3,2,1]
% => yes

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Find the smallest element of a list.
%%
smallestElement( [X], X ).
smallestElement( List, SmallestElement ) :-
	(List = [Head|Tail]),
	smallestElement( Tail, SmallestTail ),
	SmallestElement is min( Head, SmallestTail )
	.

% smallestElement([5,2,7,10,1,23], What).
% => What = 1 ? 
% => yes


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Sort the elements of a list.
%%
smallest( [A], A ).
smallest( [A, Head|Tail], X ) :-
	A =< Head, smallest( [A|Tail], X )
	.

smallest( [A, Head|Tail], X) :- 
	Head < A, smallest( [Head|Tail], X ).

filter( A, [], B, B, 0 ).
filter( A, [], B, B, 1).
filter( A, [Head|Tail], C, D, 1 ) :-
	A = Head, filter( A, Tail, C, D, 0 ),
	!
	.

filter( A, [Head|Tail], C, D, 1) :-
	A \= Head, filter( A, Tail, [Head|C], D, 1),
	!
	.

filter( A, [Head|Tail], C, D, 0 ) :-
	filter( A, Tail, [Head|C], D, 0 ),
	!
	.

new_sort( [A], [A] ).
new_sort( A, [Head|Tail] ) :-
	smallest( A, Head ),
	filter( Head, A, [], Other, 1 ),
	new_sort( Other, Tail)
	.


% new_sort([6,3,2,7,4,1,5], What).
% => What = [1,2,3,4,5,6,7]
% yes
