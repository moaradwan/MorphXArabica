test(Input,Output) :-
initial(Node),
transduce(Node,Input,Output),
write(Output),nl.


transduce(Node,[],[]) :-
final(Node).



transduce(Node1,String1,String2) :-
arc(Node1,Node2,Label1,Label2),
traverse2(Label1,Label2,String1,NewString1,String2,NewString2),
transduce(Node2,NewString1,NewString2).
traverse2(Word1,Word2,[Word1|RestString1],RestString1,
[Word2|RestString2],RestString2)



s([x|l]):-
initial(0),
final(2),
arc(0, 1, np(x)), 
arc(1,2, vp(l)).


np(y):-
initial(0),
final(2),
arc(0,1, det(y)),
arc(1,2, n(y)),
arc(2, 3, wh(y)),
arc(3, 2, vp(y)).

vp([z|l]):-
initial(0),
final(1),
final(2),
arc(0,1, v(z)),
arc(1, 2, np(l)),
arc(1, 3, that(l)),
arc(3, 2, s(l)).


that(that).
n(woman).
n(house).
n(table).
n(mouse).
n(man).
np(mayumi).
np(maria).
np(washington).
np(john).
np(mary).
det(a).
det(the).
cet(that).
v(sees).
v(hits).
v(sings).
v(lacks).
v(saw).
wh(who).
wh(which).
wh(that). 
