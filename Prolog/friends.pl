%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Language Prolog.
%% - Day 1
%%      Seven Languages in seven weeks
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

likes(wallace, cheese).
likes(grommit, cheese).
likes(wendolene, sheep).

friend(X, Y) :- \+(X = Y), likes(X, Z), likes(Y, Z).

% To compile: gprolog
% ['friends.pl'].

% likes(wallace, sheep).
% => yes 

% likes(grommit, cheese).
% => yes

% friend(wallace, wallace).
% => no

% friend(grommit, wallace).
% => yes

% friend(wallace, grommit).
% => yes

% friend(wendolene, grommit).
% => no








