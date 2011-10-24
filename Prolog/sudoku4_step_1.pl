%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Language Prolog.
%% - Day 3
%%      Seven Languages in seven weeks
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sudoku(Puzzle, Solution) :-
	Solution = Puzzle.

sudoku([4, 1, 2, 3,
	2, 3, 4, 1,
	1, 2, 3, 4,
	3, 4, 1, 2], Solution).

% Solution = [4,1,2,3,2,3,4,1,1,2,3,4,3,4,1,2]
% => yes

% sudoku([1, 2, 3], Solution).
% => Solution = [1,2,3]
% => yes

% sudoku([1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6], Solution).
% => Solution = [1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6]
% => yes

