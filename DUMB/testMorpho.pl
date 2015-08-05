initial(1).
final(9).
arc(1,np,3).
arc(1,det,2).
arc(2,n,3).
arc(3,pv,4).
arc(4,adv,5).
arc(4,’#’,5).
arc(5,det,6).
arc(5,det,7).
arc(5,’#’,8).
arc(6,adj,7).
arc(6,mod,6).
arc(7,n,9).
arc(8,adj,9).
arc(8,mod,8).
arc(9,cnj,4).
arc(9,cnj,1).
macro(np,kim).
macro(np,sandy).
macro(np,lee).
macro(det,a).
macro(det,the).
macro(det,her).
macro(n,consumer).
macro(n,man).
macro(n,woman).
macro(pv,is).
macro(pv,was).
macro(cnj,and).
macro(cnj,or).
macro(adj,happy).
macro(adj,stupid).
macro(mod,very).
macro(adv,often).
macro(adv,always).
macro(adv,sometimes).









test(Words):-
initial(Node),
recognize(Node,Words).


recognize(Node,[]):-
final(Node).


recognize(FromNode,String):-
arc(FromNode,Label,ToNode),
traverse(Label,String,NewString),
recognize(ToNode,NewString).

traverse(Label,[Label|RestString],RestString):-
\+ special(Label).


traverse(Abbrev,[Label|RestString],RestString):-
macro(Abbrev,Label).
traverse(’#’,String,String).
special(’#’).


special(X):-
macro(X,_).