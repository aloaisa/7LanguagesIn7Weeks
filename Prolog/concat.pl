%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Language Prolog.
%% - Day 1
%%      Seven Languages in seven weeks
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Step 1
concatenate([], List, List).

%concatenate([], [harry], What).
% => What = [harry]
% => yes

%%%%%%%%%%%%%%%%%%%%%%%
% Step 2
concatenate([Head|[]], List, [Head|List]).

%concatenate([malfoy], [potter], What).
% => What = [malfoy,potter]
% => yes

%%%%%%%%%%%%%%%%%%%%%%
% Step 3
concatenate([Head1|[Head2|[]]], List, [Head1, Head2|List]).
concatenate([Head1|[Head2|[Head3|[]]]], List, [Head1, Head2, Head3|List]).

% concatenate([malfoy, granger], [potter], What).
% => What = [malfoy,granger,potter]
% => yes

%%%%%%%%%%%%%%%%%%%%%%
% Finaly
concatenate([], List, List).
concatenate([Head|Tail1], List, [Head|Tail2]) :-
	concatenate(Tail1, List, Tail2).

% concatenate([1, 2], [3], What).
% => What = [1,2,3]
% => yes








