%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Language Earlang.
%% - Day 3
%%      Seven Languages in seven weeks
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(roulette).
-export([loop/0]).

% send a number, 1-6
loop() ->
	receive

	3 -> io:format("bang.~n" ), exit({roulette,die,at,erlang:time()});

	_ -> io:format("click~n" ), loop()
end.



%c(roulette).
%{ok,roulette}

%Gun = spawn(fun roulette:loop/0).
%<0.60.0>

%Gun ! 1.
%"click"
%1

%Gun ! 3.
%"bang"
%3

%Gun ! 4.
%4

%Gun ! 1.
%1

%erlang:is_process_alive(Gun).
%false











