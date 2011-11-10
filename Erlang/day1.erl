%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Language Earlang.
%% - Day 1
%%      Seven Languages in seven weeks
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This is a comment

%1> 2+2.
%* 3: syntax error before: 2

2 + 2.
%4

2 + 2.0.
%4.0

"string".
%"string"

[1, 2, 3].
%[1,2,3]

[72, 97, 32, 72, 97, 32, 72, 97].
%"Ha Ha Ha"

%4 + "string".
%** exception error: bad argument in an arithmetic expression
%     in operator  +/2
%        called as 4 + "string"

%variable = 4.
%** exception error: no match of right hand side value 4

Var = 1.
%1

%Var = 2.
%** exception error: no match of right hand side value 2

Var.
%1

red.
%red

Pill = blue.
%blue

Pill.
%blue

[1, 2, 3].
%[1,2,3]

[1, 2, "three"].
%[1,2,"three"]

List = [1, 2, 3].
%[1,2,3]

{one, two, three}.
%{one,two,three}

Origin = {0, 0}.
%{0,0}

{name, "Spaceman Spiff"}.
%{name,"Spaceman Spiff"}

{comic_strip, {name, "Calvin and Hobbes"}, {character, "Spaceman Spiff"}}.
%{comic_strip,{name,"Calvin and Hobbes"},
%             {character,"Spaceman Spiff"}}

Person = {person, {name, "Agent Smith"}, {profession, "Killing programs"}}.
%{person,{name,"Agent Smith"},
%        {profession,"Killing programs"}}

{person, {name, Name}, {profession, Profession}} = Person.
%{person,{name,"Agent Smith"},
%        {profession,"Killing programs"}}

Name.
%"Agent Smith"

Profession.
%"Killing programs"

[Head | Tail] = [1, 2, 3].
%[1,2,3]

Head.
%1

Tail.
%[2,3]

[One, Two|Rest] = [1, 2, 3].
%[1,2,3]

One.
%1

Two.
%2

Rest.
%[3]

[X|Rest] = [].
%** exception error: no match of right hand side value []

one = 1.
%** exception error: no match of right hand side value 1


