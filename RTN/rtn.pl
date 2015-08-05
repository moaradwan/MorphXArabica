% S-network 
initial(s, 1) . 
final(s, 3). 
arc (s, 1, np, 2 ) . 
arc (s, 2 , vp, 3 ) . 
% NP-network 
initial(np, 1) . 
final(np, 5) . 
arc (np, 1, det, 2) . 
arc(np, 2, adj, 3). 
arc(np, 3, n, 5). 
arc(np, 2, n, 5) . 
arc (np, 1, pn, 5) . 
arc (np, 1, adj , 4) . 
arc (np, 4, pen, 5) . 
% VP-network 
initial(vp, 1) . 
final(vp, 3 ) . 
arc (vp, 1, vi, 3) . 
arc (vp, 1, vt, 2 ) . 
arc (vp, 2 , np, 3 ) . 
