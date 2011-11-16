%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Language Earlang.
%% - Day 1
%%      Seven Languages in seven weeks
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(matching_function).
-export([number/1]).

number(one) -> 1;
number(two) -> 2;
number(three) -> 3.


%8> c(matching_function).
%{ok,matching_function}

%9> matching_function:number(one).
%1

%10> matching_function:number(two).
%2

%11> matching_function:number(three).
%3

%12> matching_function:number(four).
%** exception error: no function clause matching matching_function:number(four)

