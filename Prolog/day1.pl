%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Language Prolog.
%% - Day 1
%%      Seven Languages in seven weeks
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Make a simple knowledge base. Represent some of your favorite
%%  books and authors.
%%
book( 'The lord of the rings' ).
book( 'The hobbit' ).
book( 'The Sandman' ).
book( 'American Gods' ).
book( 'From Hell' ).
book( 'Watchmen' ).
book( 'V for Vendetta' ).
book( 'Divina Commedia' ).

author( 'J.R.R. Tolkien' ).
author( 'Neil Gaiman' ).
author( 'Alan Moore' ).
author( 'Dante Alighieri' ).
 
author_book( 'J.R.R. Tolkien', 'The lord of the rings' ).
author_book( 'J.R.R. Tolkien', 'The hobbit' ).
author_book( 'Neil Gaiman', 'The Sandman' ).
author_book( 'Neil Gaiman', 'American Gods' ).
author_book( 'Alan Moore', 'From Hell' ).
author_book( 'Alan Moore', 'Watchmen' ).
author_book( 'Alan Moore', 'V for Vendetta' ).
author_book( 'Dante Alighieri', 'Divina Commedia' ).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Find all books in your knowledge base written by one author.
%%

% | ?- ['day1.pl'].

author_book('J.R.R. Tolkien', X).
% => X = 'The lord of the rings' ? a
% => X = 'The hobbit'
% => yes

author_book('Alan Moore', X).    
% => X = 'From Hell' ? a
% => X = 'Watchmen'
% => X = 'V for Vendetta'
% => yes



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Make a knowledge base representing musicians and instruments.
%%   Also represent musicians and their genre of music.
%%

musician( 'Bruce Springsteen', 'Guitar' ).
musician( 'Bob Dylan', 'Guitar' ).
musician( 'Jimi Hendrix', 'Guitar' ).
musician( 'Bob Marley', 'Guitar' ).
musician( 'Bob Marley', 'Vocalist' ).
musician( 'Robert Plant', 'Vocalist').
musician( 'Mick Jagger', 'Vocalist' ).
musician( 'Bono', 'Vocalist' ).

gender( 'Bruce Springsteen', 'Pop-Rock' ).
gender( 'Bob Dylan', 'Pop-Rock' ).
gender( 'Jimi Hendrix', 'Rock' ).
gender( 'Bob Marley', 'Reggae' ).
gender( 'Robert Plant', 'Rock' ).
gender( 'Mick Jagger', 'Rock').
gender( 'Bono', 'Pop-Rock' ).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Find all musicians who play the guitar.
%%

% | ?- ['day1.pl'].

musician( Who, 'Guitar' ).
% => Who = 'Bruce Springsteen' ? a
% => Who = 'Bob Dylan'
% => Who = 'Jimi Hendrix'
% => Who = 'Bob Marley'
% => no

