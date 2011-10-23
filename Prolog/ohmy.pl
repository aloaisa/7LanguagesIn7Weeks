%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Language Prolog.
%% - Day 1
%%      Seven Languages in seven weeks
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cat(lion).
cat(tiger).

dorothy(X, Y, Z) :- X = lion, Y = tiger, Z = bear.
twin_cats(X, Y) :- cat(X), cat(Y).

dorothy(lion, tiger, bear).
% => yes

dorothy(One, Two, Three).
% => One = lion
% => Three = bear
% => Two = tiger

twin_cats(One, Two).
% => One = lion
% => Two = lion ? a
%
% => One = lion
% => Two = tiger
%
% => One = tiger
% => Two = lion
%
% => One = tiger
% => Two = tiger
%
% => yes





