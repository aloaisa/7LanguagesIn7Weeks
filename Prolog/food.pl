%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Language Prolog.
%% - Day 1
%%      Seven Languages in seven weeks
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

food_type(velveeta, cheese).
food_type(ritz, cracker).
food_type(spam, meat).
food_type(sausage, meat).
food_type(jolt, soda).
food_type(twinkie, dessert).


flavor(sweet, dessert).
flavor(savory, meat).
flavor(savory, cheese).
flavor(sweet, soda).

food_flavor(X, Y) :- food_type(X, Z), flavor(Y, Z).

%
%| ?- food_type(What, meat).
%
% => What = spam ? ;
% => What = sausage ? ;
% => no

%
%| ?- food_flavor(sausage, meat).
%
% => no

%
%| ?- flavor(sweet, What).
%
% => What = dessert ? ;
% => What = soda
% => yes

%| ?- food_flavor(What, savory).
%
% => What = velveeta ? ;
% => What = spam ? ;
% => What = sausage ? ;
% => no











