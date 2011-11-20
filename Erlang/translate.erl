%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Language Earlang.
%% - Day 3
%%      Seven Languages in seven weeks
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(translate).
-export([loop/0]).

loop() -> 
	receive

	"casa" 	-> 
		io:format("house~n" ), 
		loop();

	"blanca" -> 
		io:format("white~n" ), 
		loop();

	_ 	-> 
		io:format("I don't understand.~n" ), 
		loop()

end
.

%c(translate).
%{ok,translate}

%Pid = spawn(fun translate:loop/0).
%<0.42.0>

%Pid ! "casa".
%"house"
%"casa"

%Pid ! "blanca".
%"white"
%"blanca"

%Pid ! "loco".
%"I don't understand."
%"loco"

