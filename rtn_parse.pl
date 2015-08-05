%w-network 
initial(w, 1). 
final(w, 2). 
final(w, 3). 
final(w, 4). 
arc(w,
  1, part,
  X, Parse,  Parsel):-
  Parse = [part | Parsel],
  X= 2.
arc(w,
  1, name,
  X, Parse,  Parsel):-
  Parse = [name | Parsel],
  X= 3.
arc(w,
  1, verb,
  X, Parse,  Parsel):-
  Parse = [verb | Parsel],
  X= 4.



%VERB
initial(verb, 1) . 
final(verb, 4).
final(verb, 5). 
final(verb, 6). 
arc(verb,
  1, pref,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 3.
arc(verb,
  1, proc,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 2.
arc(verb,
  1, asl,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 4.
arc(verb,
  2, pref,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 3.
arc(verb,
  2, asl,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 4.
arc(verb,
  3, asl,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 4.
arc(verb,
  4, suf,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 5.
arc(verb,
  5, encl,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 6.








%NAME
initial(name, 1) . 
final(name, 4). 
final(name, 5). 

arc(name,
  1, proc,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 2.
arc(name,
  1	, nom,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 3.
arc(name,
  2	, nom,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 3.
arc(name,
  3, suf,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 4.
arc(name,
  4, proc,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 5.





%PART
initial(part, 1) . 
final(part, 3). 
final(part, 4). 
arc(part,
  1, proc,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 2.
arc(part,
  2, particule,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 3.
arc(part,
  3, encl,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 4.
arc(part,
  1, particule,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 3.



%PREF
initial(pref, 1).
final(pref, 7).

arc(pref,
  1, 'ا',
  X,  Parse,  Parsel):-
  Parse = [pref(ا)| Parsel],
  X = 3.
arc(pref,
  1, 'إ',
  X,  Parse,  Parsel):-
  Parse = [pref(إ)| Parsel],
  X = 3.
arc(pref ,
  1, ي,
  X, Parse, Parsel):-
 Parse = [pref(ي)| Parsel],
  X= 2.
arc(pref,
  1, jump,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 3.
arc(pref ,
  2, 'َ',
  X, Parse,  Parsel):-
  Parse = [pref(a)| Parsel],
  X= 3.
arc(pref,
  2, 'ُ',
  X, Parse,  Parsel):-
  Parse = [pref(o)| Parsel],
  X= 3.
arc(pref,
  2, jump,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 3.
arc(pref ,
  3, 'ن',
  X, Parse,  Parsel):-
  Parse = [pref(ن)| Parsel],
  X= 5.
arc(pref ,
  3, ُ,
  X, Parse,  Parsel):-
  Parse = [pref(o)| Parsel],
  X= 5.
arc(pref ,
  3, َ,
  X, Parse,  Parsel):-
  Parse = [pref(a)| Parsel],
  X= 5.
arc(pref ,
  3, س,
  X, Parse,  Parsel):-
  Parse = [pref(س)| Parsel],
  X= 4.
arc(pref,
  4, jump,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 5.
arc(pref,
  3, jump,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 5.
arc(pref ,
  5, ت,
  X, Parse,  Parsel):-
  Parse = [pref(ت)| Parsel],
  X= 6.
arc(pref,
  5, jump,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 6.
arc(pref ,
  6, َ,
  X, Parse,  Parsel):-
  Parse = [pref(a)| Parsel],
  X= 7.
arc(pref ,
  6, ُ,
  X, Parse,  Parsel):-
  Parse = [pref(o)| Parsel],
  X= 7.
arc(pref,
  6, jump,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 7.





%VERB ASL
initial(asl, 1).
final(asl, 8).
final(asl, 10).


arc(asl,
  1, A1,
  X, Parse,  Parsel):-
  let(A1),
  Parse = [asl(a1(A1)) | Parsel],
  X = 2.
arc(asl,
  2, ت,
  X, Parse,  Parsel):-
  Parse = [asl(ت)| Parsel],
  X= 3.
arc(asl,
  2, ا,
  X, Parse,  Parsel):-
  Parse = [asl(ا)| Parsel],
  X= 5.
arc(asl,
  2, jump,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 3.
arc(asl,
  2, jump,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 5.
arc(asl,
  3, ُ,
  X, Parse,  Parsel):-
  Parse = [asl(o) | Parsel],
  X= 4.
arc(asl,
  4,و,
  X, Parse,  Parsel):-
  Parse = [asl(و) | Parsel],
  X= 5.
arc(asl,
  3, َ,
  X, Parse,  Parsel):-
  Parse = [asl(a) | Parsel],
  X= 5.
arc(asl,
  3, jump,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 5.
arc(asl,
  4, jump,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 5.
arc(asl,
  5, A2,
  X, Parse,  Parsel):-
  let(A2),
  Parse = [asl(a2(A2))| Parsel],
  X= 6.
arc(asl,
  6, ُ,
  X, Parse,  Parsel):-
  Parse = [asl(o) | Parsel],
  X= 7.
arc(asl,
  6, َ,
  X, Parse,  Parsel):-
  Parse = [asl(a) | Parsel],
  X= 7.
arc(asl,
  6, ِ,
  X, Parse,  Parsel):-
  Parse = [asl(i) | Parsel],
  X= 7.
arc(asl,
  6, jump,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 7.
arc(asl,
  7, A3,
  X, Parse,  Parsel):-
  let(A3),
  Parse = [asl(a3(A3))| Parsel],
  X= 8.
arc(asl,
  8, َ,
  X, Parse,  Parsel):-
  Parse = [asl(a) | Parsel],
  X= 9.
arc(asl,
  8, ِ,
  X, Parse,  Parsel):-
  Parse = [asl(i) | Parsel],
  X= 9.
arc(asl,
  8, jump,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 9.
arc(asl,
  9, A4,
  X, Parse,  Parsel):-
  let(A4),
  Parse = [asl(a4(A4))| Parsel],
  X= 10.



%PROC
initial(proc, 1).
final(proc, 6).

arc(proc,
  1, أ,
  X, Parse,  Parsel):-
  Parse = [proc(أ)| Parsel],
  X= 2.
arc(proc,
  1, jump,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 2.
arc(proc,
  2, ف,
  X, Parse,  Parsel):-
  Parse = [proc(ف)| Parsel],
  X= 3.
arc(proc,
  2, و,
  X, Parse,  Parsel):-
  Parse = [proc(و)| Parsel],
  X= 3.
arc(proc,
  2, jump,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 3.
arc(proc,
  3, س,
  X, Parse,  Parsel):-
  Parse = [proc(س)| Parsel],
  X= 4.
arc(proc,
  3, ك,
  X, Parse,  Parsel):-
  Parse = [proc(ك)| Parsel],
  X= 4.
arc(proc,
  3, ب,
  X, Parse,  Parsel):-
  Parse = [proc(ب)| Parsel],
  X= 4.
arc(proc,
  3, jump,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 4.
arc(proc,
  4, ل,
  X, Parse,  Parsel):-
  Parse = [proc(ل)| Parsel],
  X= 5.
arc(proc,
  4, ا,
  X, Parse,  Parsel):-
  Parse = [proc(ا)| Parsel],
  X= 5.
arc(proc,
  4, jump,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 5.
arc(proc,
  5, ل,
  X, Parse,  Parsel):-
  Parse = [proc(ل)| Parsel],
  X= 6.
arc(proc,
  5, jump,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 6.



%SUF
initial(suf, 1).
final(suf, 6).

arc(suf,
  1, ا,
  X, Parse,  Parsel):-
  Parse = [suf(ا)| Parsel],
  X= 2.
arc(suf,
  1, ة,
  X, Parse,  Parsel):-
  Parse = [suf(ة)| Parsel],
  X= 2.
arc(suf,
  1, jump,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 2.
arc(suf,
  2, ت,
  X, Parse,  Parsel):-
  Parse = [suf(ت)| Parsel],
  X= 3.
arc(suf,
  2, و,
  X, Parse,  Parsel):-
  Parse = [suf(و)| Parsel],
  X= 3.
arc(suf,
  2, jump,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 3.
arc(suf,
  3, ي,
  X, Parse,  Parsel):-
  Parse = [suf(ي)| Parsel],
  X= 4.
arc(suf,
  3, ا,
  X, Parse,  Parsel):-
  Parse = [suf(ا)| Parsel],
  X= 4.
arc(suf,
  3, jump,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 4.
arc(suf,
  4, ن,
  X, Parse,  Parsel):-
  Parse = [suf(ن)| Parsel],
  X= 5.
arc(suf,
  4, م,
  X, Parse,  Parsel):-
  Parse = [suf(م)| Parsel],
  X= 5.
arc(suf,
  4, jump,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 5.
arc(suf,
  5, ا,
  X, Parse,  Parsel):-
  Parse = [suf(ا)| Parsel],
  X= 6.
arc(suf,
  5, jump,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 6.


  %ENCL
initial(encl, 1).
final(encl, 4).
arc(encl,
  1, ك,
  X, Parse,  Parsel):-
  Parse = [encl(ك)| Parsel],
  X= 2.
arc(encl,
  1, ه,
  X, Parse,  Parsel):-
  Parse = [encl(ه)| Parsel],
  X= 2.
arc(encl,
  1, jump,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 2.
arc(encl,
  2, م,
  X, Parse,  Parsel):-
  Parse = [encl(م)| Parsel],
  X= 3.
arc(encl,
  2, ن,
  X, Parse,  Parsel):-
  Parse = [encl(ن)| Parsel],
  X= 3.
arc(encl,
  2, jump,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 3.
arc(encl,
  3, ي,
  X, Parse,  Parsel):-
  Parse = [encl(ي)| Parsel],
  X= 4.
arc(encl,
  3, ا,
  X, Parse,  Parsel):-
  Parse = [encl(ا)| Parsel],
  X= 4.
arc(encl,
  3, jump,
  X, Parse,  Parsel):-
  Parse = Parsel,
  X= 4.
















%PARTICULE
initial(particule, 1).
final(particule, 2).

arc(particule,
  1, ف,
  X,  Parse,  Parsel):-
  Parse = [particule(p1(ف))| Parsel],
  X = 3.
arc(particule,
  3, ى,
  X,  Parse,  Parsel):-
  Parse = [particule(p2(ى))| Parsel],
  X = 4.
arc(particule,
  4, jump,
  X,  Parse,  Parsel):-
  Parse = Parsel,
  X = 2.
arc(particule,
  1, و,
  X,  Parse,  Parsel):-
  Parse = [particule(p1(و))| Parsel],
  X = 5.
arc(particule,
  5, jump,
  X,  Parse,  Parsel):-
  Parse = Parsel,
  X = 2.
arc(particule,
  1, ث,
  X,  Parse,  Parsel):-
  Parse = [particule(p1(ف))| Parsel],
  X = 6.
arc(particule,
  6, م,
  X,  Parse,  Parsel):-
  Parse = [particule(p2(ى))| Parsel],
  X = 7.
arc(particule,
  7, jump,
  X,  Parse,  Parsel):-
  Parse = Parsel,
  X = 2.
arc(particule,
  1, م,
  X,  Parse,  Parsel):-
  Parse = [particule(p1(م))| Parsel],
  X = 8.
arc(particule,
  8, ت,
  X,  Parse,  Parsel):-
  Parse = [particule(p2(ت))| Parsel],
  X = 9.
arc(particule,
  9, ى,
  X,  Parse,  Parsel):-
  Parse = [particule(p3(ى))| Parsel],
  X = 10.
arc(particule,
  10, jump,
  X,  Parse,  Parsel):-
  Parse = Parsel,
  X = 2.
arc(particule,
  1, م,
  X,  Parse,  Parsel):-
  Parse = [particule(p1(م))| Parsel],
  X = 11.
arc(particule,
  11, ا,
  X,  Parse,  Parsel):-
  Parse = [particule(p2(ا))| Parsel],
  X = 12.
arc(particule,
  12, ذ,
  X,  Parse,  Parsel):-
  Parse = [particule(p3(ذ))| Parsel],
  X = 13.
  arc(particule,
  13, ا,
  X,  Parse,  Parsel):-
  Parse = [particule(p4(ا))| Parsel],
  X = 14.
arc(particule,
  14, jump,
  X,  Parse,  Parsel):-
  Parse = Parsel,
  X = 2.

arc(particule,
  1, ه,
  X,  Parse,  Parsel):-
  Parse = [particule(p1(ه))| Parsel],
  X = 15.
arc(particule,
  15, ل,
  X,  Parse,  Parsel):-
  Parse = [particule(p2(ل))| Parsel],
  X = 16.
arc(particule,
  16, jump,
  X,  Parse,  Parsel):-
  Parse = Parsel,
  X = 2.
arc(particule,
  1, ك,
  X,  Parse,  Parsel):-
  Parse = [particule(p1(ك))| Parsel],
  X = 17.
arc(particule,
  17, ي,
  X,  Parse,  Parsel):-
  Parse = [particule(p2(ي))| Parsel],
  X = 18.
arc(particule,
  18, ف,
  X,  Parse,  Parsel):-
  Parse = [particule(p3(ف))| Parsel],
  X = 19.
arc(particule,
  19, jump,
  X,  Parse,  Parsel):-
  Parse = Parsel,
  X = 2.
arc(particule,
  1, ا,
  X,  Parse,  Parsel):-
  Parse = [particule(p1(ا))| Parsel],
  X = 20.
arc(particule,
  20, ل,
  X,  Parse,  Parsel):-
  Parse = [particule(p2(ل))| Parsel],
  X = 21.
arc(particule,
  21, ى,
  X,  Parse,  Parsel):-
  Parse = [particule(p3(ى))| Parsel],
  X = 22.
arc(particule,
  22, jump,
  X,  Parse,  Parsel):-
  Parse = Parsel,
  X = 2.
arc(particule,
  1, أ,
  X,  Parse,  Parsel):-
  Parse = [particule(p1(أ))| Parsel],
  X = 23.
arc(particule,
  23, ن,
  X,  Parse,  Parsel):-
  Parse = [particule(p2(ن))| Parsel],
  X = 24.
arc(particule,
  24, jump,
  X,  Parse,  Parsel):-
  Parse = Parsel,
  X = 2.
arc(particule,
  1, إ,
  X,  Parse,  Parsel):-
  Parse = [particule(p1(إ))| Parsel],
  X = 25.
arc(particule,
  25, ن,
  X,  Parse,  Parsel):-
  Parse = [particule(p2(ن))| Parsel],
  X = 26.
arc(particule,
  26, jump,
  X,  Parse,  Parsel):-
  Parse = Parsel,
  X = 2.
arc(particule,
  1, ا,
  X,  Parse,  Parsel):-
  Parse = [particule(p1(ا))| Parsel],
  X = 27.
arc(particule,
  27, ن,
  X,  Parse,  Parsel):-
  Parse = [particule(p2(ن))| Parsel],
  X = 28.
arc(particule,
  28, jump,
  X,  Parse,  Parsel):-
  Parse = Parsel,
  X = 2.

  arc(particule,
  1, ل,
  X,  Parse,  Parsel):-
  Parse = [particule(p1(ل))| Parsel],
  X = 29.
arc(particule,
  29, ن,
  X,  Parse,  Parsel):-
  Parse = [particule(p2(ن))| Parsel],
  X = 30.
arc(particule,
  30, jump,
  X,  Parse,  Parsel):-
  Parse = Parsel,
  X = 2.

%NAME
initial(nom, 1) . 
final(nom, 42). 

arc(nom,
  1, A1,
  X, Parse,  Parsel):-
  let(A1),
  Parse = [nom(A1) | Parsel],
  X= 2.
arc(nom,
  2, A2,
  X, Parse,  Parsel):-
  let(A2),
  Parse = [nom(A2) | Parsel],
  X= 3.
arc(nom,
  3, A3,
  X, Parse,  [nom(A2), nom(A1) | Parsel]):-
  let(A3),
  atomic_list_concat([A1, A2, A3], WW),
  word(WW, name, F),
  Parse = [nom(WW) | Parsel],
  X= 42.
arc(nom,
  3, A3,
  X, Parse,  Parsel):-
  let(A3),
  Parse = [nom(A3) | Parsel],
  X= 4.
arc(nom,
  4, A4,
  X, Parse,  [nom(A3), nom(A2), nom(A1) | Parsel]):-
  let(A4),
  atomic_list_concat([A1, A2, A3, A4], WW),
  word(WW,name, F),
  Parse = [nom(WW) | Parsel],
  X= 42.
arc(nom,
  4, A4,
  X, Parse,  Parsel):-
  let(A4),
  Parse = [nom(A4) | Parsel],
  X= 5.
arc(nom,
  5, A5,
  X, Parse,  [nom(A4), nom(A3), nom(A2), nom(A1) | Parsel]):-
  let(A5),
  atomic_list_concat([A1, A2, A3, A4, A5], WW),
  word(WW, name, F),
  Parse = [nom(WW) | Parsel],
  X= 42.



let(ع).
let(ل).
let(م).
let(د).
let(ة).
let(ر).
let(س).
let(ذ).
let(ه).
let(ب).
let(ح).
let(د).
