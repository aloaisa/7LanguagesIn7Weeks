%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Language Prolog.
%% - Day 2
%%      Seven Languages in seven weeks
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

count(0, []).
count(Count, [Head|Tail]) :- count(TailCount, Tail), Count is TailCount + 1.

sum(0, []).
sum(Total, [Head|Tail]) :- sum(Sum, Tail), Total is Head + Sum.

average(Average, List) :- sum(Sum, List), count(Count, List), Average is Sum/Count.

count(What, [1]).
% => What = 1 ? ;
% => no

sum(What, [1, 2, 3]).
% => What = 6 ? ;
% => no

average(What, [1, 2, 3]).
% => What = 2.0 ? ;
% => no

append([oil], [water], [oil, water]).
% => yes

append([oil], [water], [oil, slick]).
% => no

append([tiny], [bubbles], What).
% => What = [tiny,bubbles]
% => yes

append([dessert_topping], Who, [dessert_topping, floor_wax]).
% => Who = [floor_wax]
% => yes

append(One, Two, [apples, oranges, bananas]).
% => One = []
% => Two = [apples,oranges,bananas] ? a
%
% => One = [apples]
% => Two = [oranges,bananas]
%
% => One = [apples,oranges]
% => Two = [bananas]
%
% => One = [apples,oranges,bananas]
% => Two = []
%
% => no






