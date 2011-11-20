%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Language Earlang.
%% - Day 3
%%      Seven Languages in seven weeks
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(coroner).
-export([loop/0]).

loop() ->
	process_flag(trap_exit, true),
	
	receive
		{monitor, Process} ->
			link(Process),
			io:format("Monitoring process.~n" ),
			loop();

		{'EXIT', From, Reason} ->
			io:format("The shooter ~p died with reason ~p." , [From, Reason]),
			io:format("Start another one.~n" ),
			loop()
end
.


%c(roulette).
%{ok,roulette}

%c(coroner).
%{ok,coroner}

%Revolver=spawn(fun roulette:loop/0).
%<0.43.0>

%Coroner=spawn(fun coroner:loop/0).
%<0.45.0>

%Coroner ! {monitor, Revolver}.
%Monitoring process.
%{monitor,<0.43.0>}

%Revolver ! 1.
%click
%1

%Revolver ! 3.
%bang.
%3
%The shooter <0.43.0> died with reason {roulette,die,at,{8,48,1}}. Start another one.

