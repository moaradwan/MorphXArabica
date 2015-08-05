/*************************************************
FILENAME: fsg_rec.pl 
DESCRIPTION: A recogniser based on the FSTN notation. 
Definition of the FSTN is defined in two separate files 
********************************************************/ 
% Load the lexical and FSTN files. 
?- reconsult('lex.pl'). 
?- reconsult('fstn.pl'). 


% Drive predicate which sets up initial configuration. 
recognise(String, Output) :- 
initial(State) , 
config(String, State, Output). 


recognise(String) :- 
initial(State) , 
config(String, State). 

% Check whether in final configuration; if not, move to 
% next configuration if allowed by network. 
config(State, Output, []):-
final(State),
Output = [State|Output]. 


config(State, []):-
final(State).

config(State, Output, [Word | Rest]):- 
word(Word, Cat), 
arc(State, Cat, Statel), 
Output = [State|Output],
config(Rest, Statel). 


config(State, [Word | Rest]):- 
word(Word, Cat), 
arc(State, Cat, Statel), 
config(Rest, Statel). 
/****************************************************/
