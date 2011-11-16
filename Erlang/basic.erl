%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Language Earlang.
%% - Day 1
%%      Seven Languages in seven weeks
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(basic).
-export([mirror/1]).

mirror(Anything) -> Anything.

%1> c(basic).
%{ok,basic}

%2> mirror(smiling_mug).
%** exception error: undefined shell command mirror/1

%3> basic:mirror(smiling_mug).
%smiling_mug

%4>basic:mirror(1).
%basic:mirror(1).


