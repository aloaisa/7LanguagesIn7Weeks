%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Language Earlang.
%% - Day 2
%%      Seven Languages in seven weeks
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(double).
-export([double_all/1]).

double_all([]) -> [];
double_all([First|Rest]) -> [First + First|double_all(Rest)].


%c(double).
%{ok,double}

%double:double_all([1, 2, 3]).
%[2,4,6]

%[1| [2, 3]].
%[1,2,3]

%[[2, 3] | 1].
%[[2,3]|1]

%[[] | [2, 3]].
%[[],2,3]

%[1 | []].
%[1]

