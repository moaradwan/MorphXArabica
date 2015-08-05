% Define the infix operator for Network: State notation 
?- op(300, xfx, : ).


% Load the lexicon and definition of RTNs 
?- reconsult('lex.pl'). 
?- reconsult('rtn_parse.pl'). 
:- encoding(utf8).

% Drive predicate which sets up initial configuration 
recognise(String):- 
initial(s, State),
config(s:State, String, [], Parse).


parse('', []).
parse(' ', []).
parse(String, Parse) :- 
	N = w,
	initial(N, State), 
	atom_chars(String, SList),
	config(N:State, SList, [], P, []),
	last(P, T), 
	getFeats(P, F),
	getTypeFeats(T, P, F2),
	Parse = [[String,F2,  P, F]].

config(w:State, [],[],Parse, Parsel):- 
	final(w, State),
	Parse = Parsel.

/*

parse(String, Parse) :- 
	initial(part , State), 
	atom_chars(String, SList),
	config(part:State, SList, [], Parse, []).

config(part:State, [],[],Parse, Parsel):- 
	final(part, State),
	Parse = Parsel.


parse(String, Parse) :- 
	initial(name , State), 
	atom_chars(String, SList),
	config(name:State, SList, [], Parse, []).

config(name:State, [],[],Parse, Parsel):- 
	final(name, State),
	Parse = Parsel.



parse(String, Parse) :- 
	initial(verb , State), 
	atom_chars(String, SList),
	config(verb:State, SList, [], Parse, []).
*/
/*config(verb(_) :State, [], [],[], []):- 
final(verb,State). 
*/

% Final verb configuration 
config(verb:State, [],[],Parse, Parsel):- 
final(verb, State),
Parse = Parsel.


% If in final state for network pop back to previous 
% network
config(Network:State, String, [Networkl:Statel | Stack], Parse, Parsel):- 
	final(Network, State), 
	config(Networkl:Statel, String, Stack, Parse, Parsel). 



% Process next lexical item 
config(Network:State, [Word | String],Stack, Parse, Parsel):- 
	%word(Word, Cat), 
	arc(Network, State, Word, Statel, NewParse, Parsel), 
	config(Network: Statel, String, Stack, Parse, NewParse).

config(Network: State, String, Stack, Parse, Parsel) :- 
	arc(Network, State, jump, Statel, NewParse, Parsel), 
	config(Network: Statel, String, Stack, Parse, NewParse).


% If next arc label refers to a network push to it 
config(Network:State, String, Stack, Parse, Parsel):-
	arc(Network, State, Networkl, Statel,  NewParse, Parsel), 
	initial(Networkl, State2),
	config(Networkl:State2, String, [Network:Statel| Stack],  Parse, NewParse).


getFeats([], []).
getFeats([Let1 ,Let2, Let3, Let4 | Parse], Feats):-
	feats(Let1, Let2, Let3, Let4, F),
	getFeats(Parse, Fl),
	concat(F, Fl, Feats).
getFeats([Let1 ,Let2, Let3 | Parse], Feats):-
	feats(Let1, Let2, Let3, F),
	getFeats(Parse, Fl),
	concat(F, Fl, Feats).
getFeats([Let1 ,Let2 | Parse], Feats):-
	feats(Let1, Let2, F),
	getFeats(Parse, Fl),
	concat(F, Fl, Feats).
getFeats([Let1 | Parse], Feats):-
	feats(Let1, F),
	getFeats(Parse, Fl),
	concat(F, Fl, Feats).
getFeats([Let1 | Parse], Feats):-
	getFeats(Parse, Feats).


feats(proc(أ), proc(L1), proc(L2), proc(L3), F):-
	atomic_list_concat([أ, L1, L2, L3], L),
	F = [[question, proc(L)]].
feats(proc(أ), proc(L1), proc(L2), F):-
	atomic_list_concat([أ, L1, L2], L),
	F = [[question, proc(L)]].
feats(proc(أ), proc(L1), F):-
	 atomic_list_concat([أ, L1], L),
	F = [[question, proc(L)]].
feats(proc(أ), F):-
	F = [[question, proc(أ)]].
feats(proc(ا), proc(ل), F):-
	F = [[det, proc(ال)]].



feats(pref(ت), pref(o), F):-
	F = [[aspect, present], [mood, passive]].
feats(pref(ي), pref(o), F):-
	F = [[aspect, present], [mood, passive]].
feats(pref(أ), pref(o), F):-
	F = [[aspect, present], [mood, passive]].
feats(pref(ن), pref(o), F):-
	F = [[aspect, present], [number, plural], [mood, passive]].
feats(pref(ت), pref(a), F):-
	F = [[aspect, present]].
feats(pref(ي), pref(a), F):-
	F = [[aspect, present]].
feats(pref(أ), pref(a), F):-
	F = [[aspect, present]].
feats(pref(ن), pref(a), F):-
	F = [[aspect, present], [number, plural]].
feats(pref(ت), F):-
	F = [[aspect, present]].
feats(pref(ي), F):-
	F = [[aspect, present]].
feats(pref(أ), F):-
	F = [[aspect, present]].
feats(pref(ن), F):-
	F = [[aspect, present], [number, plural]].
feats(pref(ا), F):-
	F = [[aspect, present]].
feats(pref(إ), F):-
	F = [[aspect, command]].


feats(suf(ت), suf(ا), suf(ن), F):-
	F = [[number, dual], [gender, female]].
feats(suf(ت), suf(ي), suf(ن), F):-
	F = [[number, dual], [gender, female]].
feats(suf(ت), suf(م), suf(ا), F):-
	F = [[number, dual], [gender, male], [person, second]].
feats(suf(ا), suf(ت), F):-
	F = [[number, plural], [gender, female]].
feats(suf(ي), suf(ن), F):-
	F = [[number, plural], [gender, male]].
feats(suf(ت), suf(ي), F):-
	F = [[gender, female], [person, second]].
feats(suf(ت), suf(ا), F):-
	F = [[number, dual], [gender, female]].
feats(suf(ا), suf(ن), F):-
	F = [[number, dual], [gender, male]].
feats(suf(ن), suf(ا), F):-
	F = [[number, plural], [person, first]].
feats(suf(ت), suf(ن), F):-
	F = [[number, dual], [gender, female]].
feats(suf(ت), suf(م), F):-
	F = [[number, plural], [gender, male], [person, second]].
feats(suf(ي), suf(ن), F):-
	F = [[number, plural], [gender, male]].
feats(suf(ي), suf(ن), F):-
	F = [[gender, female], [person, second]].
feats(suf(و), suf(ن), F):-
	F = [[number, plural], [gender, male]].
feats(suf(و), suf(ا), F):-
	F = [[number, plural], [gender, male]].
feats(suf(ة), F):-
	F = [[gender, female]].
feats(suf(ت), F):-
	F = [[number, plural], [gender, female], [aspect, past]].
feats(suf(ا), F):-
	F = [[number, dual], [gender, male]].
feats(suf(و), F):-
	F = [[number, plural], [gender, male]].
feats(suf(ي), F):-
	F = [[number, plural], [gender, male]].
feats(suf(ن), F):-
	F = [[number, plural], [gender, female]].








getTypeFeats(verb,P , F):-
	on(asl(a1(A1)), P),
	on(asl(a2(A2)), P),
	on(asl(a3(A3)), P),
	atomic_list_concat([A1, A2, A3], WW),
	word(WW, verb, F).
getTypeFeats(verb, P , F):-
	on(asl(a1(A1)), P),
	on(asl(a2(A2)), P),
	on(asl(a3(A3)), P),
	on(asl(a4(A4)), P),
	atomic_list_concat([A1, A2, A3, A4], WW),
	word(WW, verb, F).	

getTypeFeats(name,P , F):-
	on(nom(A1), P),
	word(A1, name, F).


getTypeFeats(part,P , F):-
	on(particule(p1(A1)), P),
	on(particule(p2(A2)), P),
	let(A1), let(A2), 
	atomic_list_concat([A1, A2, A3], WW),
	word(WW, part, F).
getTypeFeats(part ,P , F):-
	on(particule(p1(A1)), P),
	on(particule(p2(A2)), P),
	on(particule(p3(A3)), P),
	atomic_list_concat([A1, A2, A3], WW),
	word(WW, part,F).
getTypeFeats(part, P , F):-
	on(particule(p1(A1)), P),
	on(particule(p2(A2)), P),
	on(particule(p3(A3)), P),
	on(particule(p4(A4)), P),
	atomic_list_concat([A1, A2, A3, A4], WW),
	word(WW, part, F).
getTypeFeats(verb, _ , []):-
	1=2.
getTypeFeats(name, _ , []).
getTypeFeats(particule, _ , []).






% concat(List1, List2, Concat_List1_List2):
%   Concat_List1_List2 is the concatenation of List1 & List2
concat([], List2, List2).
concat([Item | Tail1], List2, [Item | Concat_Tail1_List2]) :-
      concat(Tail1, List2, Concat_Tail1_List2).

reverse([],[]).
reverse([X|Xs],YsX) :- reverse(Xs,Ys), append(Ys,[X],YsX).	
revappend([], Ys, Ys).
revappend([X|Xs], Ys, Zs) :- revappend(Xs, [X|Ys], Zs).

on(Item,[Item|Rest]).  

on(Item,[DisregardHead|Tail]):-
	on(Item,Tail).

last([Elem], Elem).
 last([_|Tail], Elem) :- last(Tail, Elem).