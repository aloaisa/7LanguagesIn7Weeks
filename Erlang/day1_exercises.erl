%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Language Earlang.
%% - Day 1
%%      Seven Languages in seven weeks
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Write a function that uses recursion to return the number of
% words in a string.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(day1_exercises).

-export([wordCount/1]).
-export([separate_words/3]).

-export([ten/0]).
-export([ten/1]).

-export( [print/1] ). 
 
wordCount(Text) ->
 
	length(separate_words(Text, [], []))
.

separate_words(Text, Words, Word) ->
 
	if (length(Text) == 0) ->
 
		if (length(Word) /= 0) ->
			lists:append(Words, [Word]);
		true ->
			Words
		end;
 
	true ->
 
		[FirstCharacter | RestOfText] = Text,
 
		if (FirstCharacter == ($ )) ->
 
			if (length(Word) == 0) ->
				separate_words(RestOfText, Words, Word);
			true ->
				separate_words(RestOfText, lists:append(Words, [Word] ),[])
			end;
 
		true ->
			separate_words(RestOfText, Words, lists:append(Word, [FirstCharacter]))
		end
	end
.

%26>  day1_exercises:wordCount( "Vamos a ver cuantas palabras tiene esta frase.").       
%8



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Write a function that uses recursion to count to ten.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ten() -> ten(1).
 
ten(N) ->
 
	if (N == 10) ->
 
		io:format("10~n"),
		true;
 
	(N < 10) ->
 
		io:format(integer_to_list( N ) ++ "~n"),
		ten(N + 1);
 
	true ->
		false
	end
.


%27> day1_exercises:ten(0).
%0
%1
%2
%3
%4
%5
%6
%7
%8
%9
%10
%true

%28> day1_exercises:ten(5).
%5
%6
%7
%8
%9
%10
%true


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Write a function that uses matching to selectively print “success”
% or “error: message” given input of the form {error, Message} or suc-
% cess.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

print(Text) ->
 
	case Text of
 
		success ->
			io:format( "success~n" );

		{error, Message} ->
			io:format( "error: " ++ Message ++ "~n" );

		_ ->
			false
	end
 
.

%30> day1_exercises:print(success).
%success
%ok

%31> day1_exercises:print({error, "Mensaje de error."}).
%error: Mensaje de error.
%ok



