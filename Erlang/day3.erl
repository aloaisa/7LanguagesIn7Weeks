%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Language Earlang.
%% - Day 3
%%      Seven Languages in seven weeks
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Monitor the translate_service and restart it should it die.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(day3).
-export([translate/1, wait_for_translate/0, translator/0]).
 
 
translate(Word) ->
 
	translation_service ! {self(), Word},
 
	receive
 
		{translation, From, To} -> {From, To}
 
		after 3000 -> "Service is not responding."
end
.
 
 
wait_for_translate() ->
 
	receive
 
		{From, "casa"} ->
			From ! {translation, "casa", "house"},
			wait_for_translate();
 
		{From, "blanca"} ->
			From ! {translation, "casa", "white"},
			wait_for_translate();
 
		{From, "blam"} ->
			exit({day3, die, at, erlang:time()});
 
		{From, Word} ->
			From ! {translation, Word, "I don't know what that means!"},
			wait_for_translate()
end
.
 
 
translator() ->
 
	process_flag(trap_exit, true),
 
	receive
 
		start_service ->
			io:format("Translation server has been started.~n"),
			register(
				translation_service,
				spawn_link(fun wait_for_translate/0)
			),
			translator();
 
		{'EXIT', From, Reason} ->
			io:format("Translation service has died.~n"),
			self() ! start_service,
			translator()
end
.


c(day3).
%./day3.erl:44: Warning: variable 'From' is unused
%./day3.erl:68: Warning: variable 'From' is unused
%./day3.erl:68: Warning: variable 'Reason' is unused
%{ok,day3}

%Translator2 = spawn(fun day3:translator/0).
%<0.47.0>

%Translator2 ! start_service.
%Translation server has been started.
%start_service

%day3:translate( "casa" ).
%{"casa","house"}

%day3:translate( "blanca" ).
%{"casa","white"}

%day3:translate( "foozie" ). 
%{"foozie","I don't know what that means!"}

%day3:translate( "blam" ). 
%Translation service has died.
%Translation server has been started.
%"Service is not responding."

%day3:translate( "casa" ).    
%{"casa","house"}

