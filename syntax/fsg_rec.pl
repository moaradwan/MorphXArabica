/*************************************************
FILENAME: fsg_rec.pl 
DESCRIPTION: A recogniser based on the FSTN notation. 
Definition of the FSTN is defined in two separate files 
********************************************************/ 
% Load the lexical and FSTN files. 
?- reconsult('lex.pl'). 
?- reconsult('fstn.pl'). 





parse(Sentence, Parse, States) :- 
initial(State), 
config(Sentence, State, Parse, States). 


config( [], State, [], [] ) :- 
final(State) . 

config([Word|Rest], State, [Cat | RestCats], [Statel|RestStates]):- 
word(Word, Cat) , 
arc(State, Cat, Statel), 
config(Rest, Statel, RestCats, RestStates). 

/****************************************************/
