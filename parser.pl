
?- reconsult('pdr.pl'). 
:- encoding(utf8).



parseText([], []).
parseText([' '| Chars], Out):-
	parseText(Chars, Out).

parser(Text, Out):-
	atom_chars(Text, TextChars),
	parseText(TextChars, Out).

/*parseText(Chars, Out):-
	getNextLex(Chars, Lex, CharsRemain),
	parseText(CharsRemain, O2),
	parse(Lex, P),
	length(P, L),
	L = 0.*/

parseText(Chars, Out):-
	getNextLex(Chars, Lex, CharsRemain),
	parseText(CharsRemain, O2),
	parse(Lex, P),
	concat(O2, [P], Out).

getNextLex([' '|Chars], '', Chars).
getNextLex([], '', []).
getNextLex([C|Chars], LexN, CharsRemain):-
	getNextLex(Chars, LexN2, CharsRemain),
	atom_concat(C, LexN2,LexN).
