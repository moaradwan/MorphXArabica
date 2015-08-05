append([],L,L).
   append([A|L1],L2,[A|L3]) :- append(L1,L2,L3).