/********************************************************
FILE NAME: lex.pl 
DESCRIPTION: A sample lexical database giving the 
lexical category of each word (roughly based on the 
SFG defined in question 6.1) 
*********************************************************/
word(the, det). 
word(a, det). 
word(these, det). 
word(king, n). 
word(queen, n(n(queen))). 
word(bacon, n). 
word(box, n). 
word(left, vi). 
word(put, v). 
word(fly, v). 
word(stole, vt). 
word(saw, vt). 
word(large, adj). 
word(warm, adj).
word(slowly, adv). 
word(up, prep). 
word(on, prep). 
word(and, conj). 
word(or, conj). 
word(he, pro). 
word(we, pro). 
word(they, pro). 
word(مبانى, n(n(مبانى))).
word(بعض, det(det(بعض))).
word(انهارت, v(v(انهارت))).
word(انهارت, vi(vi(انهارت))).
word(buildings, n(n(buildings))).
word(some, det(det(some))).
word(collapsed, v(v(collapsed))).
word(collapsed, vi(vi(collapsed))).
/**********************************************************/
/* parse([بعض, مبانى, انهارت], P). */
/* parse([some, buildings, collapsed], P). */