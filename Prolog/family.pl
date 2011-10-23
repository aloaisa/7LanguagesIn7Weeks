%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Language Prolog.
%% - Day 2
%%      Seven Languages in seven weeks
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

father(zeb,         john_boy_sr).
father(john_boy_sr, john_boy_jr).

ancestor(X, Y) :-
	father(X, Y).

ancestor(X, Y) :-
	father(X, Z), ancestor(Z, Y).

ancestor(john_boy_sr, john_boy_jr).
% => true ?
% => yes

ancestor(zeb, john_boy_jr).
% => true ?
% yes

ancestor(zeb, Who).
% => Who = john_boy_sr ? a
% => Who = john_boy_jr
% => no

ancestor(Who, john_boy_jr).
% => Who = john_boy_sr ? a
% => Who = zeb
% => no







