/********************************************************
FILE NAME: lex.pl 
DESCRIPTION: A sample lexical database giving the 
lexical category of each word (roughly based on the 
SFG defined in question 6.1) 
*********************************************************/

word(مدرسة, name, [noun(مدرسة), [number, singular], [gender, female]]).
word(علم, name, [noun(علم), [number, singular], [gender, male]]).
word(محمد, name, [noun(محمد), [number, singular], [gender, male]]).
word(علم, verb, [verb(علم), [number, singular], [gender, male], [aspect, past]]).
word(ذهب, verb, [verb(ذهب), [number, singular], [gender, male], [aspect, past]]).
word(الى, part, [particule(الى)]).
/**********************************************************/
