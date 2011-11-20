%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Language Earlang.
%% - Day 3
%%      Seven Languages in seven weeks
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(doctor).
-export([loop/0]).

loop() ->
	process_flag(trap_exit, true),
	
	receive
		new ->
			io:format("Creating and monitoring process.~n" ),
			register(revolver, spawn_link(fun roulette:loop/0)),
			loop();

		{'EXIT', From, Reason} ->
			io:format("The shooter ~p died with reason ~p." , [From, Reason]),
			io:format(" Restarting. ~n" ),
			self() ! new,
			loop()
	end
.


%c(doctor).
%{ok,doctor}

%Doc = spawn(fun doctor:loop/0).
%<0.43.0>

%revolver ! 1.
%** exception error: bad argument in operator !/2 called as revolver ! 1

%Doc ! new.
%Creating and monitoring process.
%new

%revolver ! 1.
%click
%1

%revolver ! 3.
%bang.
%3
%The shooter <0.47.0> died with reason {roulette,die,at,{8,53,40}}. Restarting. Creating and monitoring process.

%revolver ! 4.
%click
%4

