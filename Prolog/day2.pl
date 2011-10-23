%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Language Prolog.
%% - Day 1
%%      Seven Languages in seven weeks
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(1, 2, 3) = (1, 2, 3).
% => yes

(1, 2, 3) = (1, 2, 3, 4).
% => no

(1, 2, 3) = (3, 2, 1).
% => no

(A, B, C) = (1, 2, 3).
% => A = 1
% => B = 2
% => C = 3
% => yes

(1, 2, 3) = (A, B, C).
% => A = 1
% => B = 2
% => C = 3
% => yes

(A, 2, C) = (1, B, 3).
% => A = 1
% => B = 2
% => C = 3
% => yes

[1, 2, 3] = [X, Y, Z].
% => X = 1
% => Y = 2
% => Z = 3
% => yes

[2, 2, 3] = [X, X, Z].
% => X = 2
% => Z = 3
% => yes

[1, 2, 3] = [X, X, Z].
% => no

[] = [].
% => yes

[a, b, c] = [Head|Tail].
% => Head =a
% => Tail = [b,c]
% => yes

[] = [Head|Tail].
% => no

[a] = [Head|Tail].
% => Head =a
% => Tail = []
% => yes

[a, b, c] = [a|Tail].
% => Tail = [b,c]
% => yes

[a, b, c] = [a|[Head|Tail]].
% => Head = b
% => Tail = [c]
% => yes

[a, b, c, d, e] = [_, _|[Head|_]].
% => Head = c
% => yes



