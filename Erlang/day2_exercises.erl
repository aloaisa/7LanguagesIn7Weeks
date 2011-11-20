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









