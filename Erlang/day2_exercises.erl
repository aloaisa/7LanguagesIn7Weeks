%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Language Earlang.
%% - Day 2
%%      Seven Languages in seven weeks
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Consider a list of keyword-value tuples, such as [{erlang, "a func-
%% tional language"}, {ruby, "an OO language"}]. Write a function that ac-
%% cepts the list and a keyword and returns the associated value for
%% the keyword.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(day2_exercises).
-export([getValue/2]).
-export([totalPrice/1]).
-export([tic_tac_toe_board/1]).


 
getValue(List, Key) ->
 
	Tuple = lists:keyfind(Key, 1, List),
 
		case Tuple of
 
			{Key, Value} 	-> Value;
 
			_ 		-> false
		end
 
.

%c(day2_exercises)
%{ok,day2_exercises}

%Languages = [{erlang, "a functional language"}, {ruby, "an OO language"}].
%[{erlang,"a functional language"},{ruby,"an OO language"}]

%day2_exercises:getValue(Languages, ruby).
%"an OO language"

%day2_exercises:getValue(Languages, erlang).
%"a functional language"

%day2_exercises:getValue(Languages, other). 
%false


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Consider a shopping list that looks like [{item quantity price}, ...].
%% Write a list comprehension that builds a list of items of the form
%% [{item total_price}, ...], where total_price is quantity times price.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

totalPrice(ItemList) ->

	[{Item, (Quantity * Price)} || {Item, Quantity, Price} <- ItemList]
.


%c(day2_exercises).                                                        
%{ok,day2_exercises}

%Items = [{bread, 2, 1.20}, {milk, 6, 0.52}, {sugar, 2, 0.99}].
%[{bread,2,1.2},{milk,6,0.52},{sugar,2,0.99}]

%day2_exercises:totalPrice(Items).
%[{bread,2.4},{milk,3.12},{sugar,1.98}]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Write a program that reads a tic-tac-toe board presented as a list
%% or a tuple of size nine. Return the winner (x or o) if a winner
%% has been determined, cat if there are no more possible moves,
%% or no_winner if no player has won yet.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
tic_tac_toe_board(Board) ->
 
	PossibleWinningPaths = [
				{1,2,3},
				{4,5,6},
				{7,8,9},
				{1,4,7},
				{2,5,8},
				{3,6,9},
				{1,5,9},
				{3,5,7}
			],
 
	WinningPaths = lists:filter(

		fun(Path) ->
			A = lists:nth(element(1, Path), Board),
			B = lists:nth(element(2, Path), Board),
			C = lists:nth(element(3, Path), Board),
 
			(A /= " ") and (A == B) and (A == C)
		end,
		PossibleWinningPaths
	),
 
	case WinningPaths of
 
		[WinningPath | _] -> lists:nth(element(1, WinningPath), Board);
 
		[] -> 
			HasSpaces = lists:any(

				fun(X) -> (X == " ") end,
				Board

			),
 
			if (HasSpaces) -> "There aren't winner yet";
 
			true -> draw 
 
			end
	end
.




%c(day2_exercises).
%{ok,day2_exercises}

%day2_exercises:tic_tac_toe_board([" "," "," "," "," "," "," "," "," "]).
%"There aren't winner yet"

%day2_exercises:tic_tac_toe_board([" "," "," "," "," "," ","X","X","X"]).   
%"X"

%day2_exercises:tic_tac_toe_board(["O","O","O"," "," "," "," "," "," "]).
%"O"

%day2_exercises:tic_tac_toe_board(["O","X","O","X","O","X","O"," "," "] ).
%"O"

%day2_exercises:tic_tac_toe_board(["O","X","O","X","O","X","X","O","X"]). 
%draw


