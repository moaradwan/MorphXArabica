% Define the infix operator for Network: State notation 
?- op(300, xfx, : ).


% Load the lexicon and definition of RTNs 
?- reconsult('lex.pl'). 
?- reconsult('rtn_parse.pl'). 


% Drive predicate which sets up initial configuration 
recognise(String):- 
initial(s, State),
config(s:State, String, []).

parse(String, Parse) :- 
initial(s(_) , State), 
config(s(Parse):State, String, [ ] ).

 
config(s(_) :State, [],[]):- 
final(s(_),State). 


% Final configuration 
config(s:State, [], []):- 
final(s, State).


% If in final state for network pop back to previous 
% network
config(Network:State, String, [Networkl:Statel | Stack]):- 
final(Network, State), 
config(Networkl:Statel, String, Stack). 


% Process next lexical item 
config(Network:State, [Word | String],Stack):- 
word(Word, Cat), 
arc(Network, State, Cat, Statel), 
config(Network:Statel, String, Stack). 


% If next arc label refers to a network push to it 
config(Network:State, String, Stack):- 
arc(Network, State, Networkl, Statel), 
initial(Networkl, State2), 
config(Networkl:State2, String, [Network:Statel| Stack]). 
