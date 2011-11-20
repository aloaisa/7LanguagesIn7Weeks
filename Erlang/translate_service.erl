%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Language Earlang.
%% - Day 3
%%      Seven Languages in seven weeks
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(translate_service).
-export([loop/0, translate/2]).

loop() ->
	receive

		{From, "casa" } ->
			From ! "house" ,
			loop();

		{From, "blanca" } ->
			From ! "white" ,
			loop();

		{From, _} ->
			From ! "I don't understand." ,
			loop()
	end
.

translate(To, Word) ->

	To ! {self(), Word},

	receive
		Translation -> Translation
	end
.


%c(translate_service).
%{ok,translate_service}

%Translator = spawn(fun translate_service:loop/0).
%<0.52.0>

%translate_service:translate(Translator, "blanca").
%"white"

translate_service:translate(Translator, "casa").
"house"

