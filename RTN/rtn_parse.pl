% S-network 
initial(s(Parse), 1). 
final(s(Parse), 3). 
arc(s(s(NP,VP)), 1, np(NP), 2).
arc(s(s(NP,VP)), 2, vp(VP), 3).

% NP-network 
initial(np(Parse), 1) . 
final(np(Parse), 3 ) . 
arc(np(np(DET,N)), 1, det(DET), 2). 
arc(np(np(DET,N)), 2, n(N), 3). 
arc(np(np(N)), 1, n(N), 3). 


% VP-network 
initial(vp(Parse), 1) . 
final(vp(Parse), 3) . 
final(vp(Parse), 2) . 
%arc(vp(vp(VI)), 1, vi(VI), 3).
arc(vp(vp(V, _)), 1, v(V), 2).   
arc(vp(vp(V,NP)), 2, np(NP), 3).
