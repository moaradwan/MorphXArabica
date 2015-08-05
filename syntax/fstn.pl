/************************************************ 
FILE NAME: fstn.pl 
DESCRIPTION: A Prolog encoding of the FSTN found on 
page 129 
************************************************/
initial(1). 
final(4, 5, 6).
arc(1, proc, 2).
arc(1, pref, 3).
arc(1, verb, 4).
arc(1, nom, 4).
arc(1, part, 5).




arc(2, pref, 3). 
arc(2, verb, 4). 
arc(3 , n, 4). 
arc(4, vi, 5). 
/*************************************************/