#const follow=0.
#const detour=1.

% BASE

% guess moves
{ move(P,U,V) : edge(U,V) } 1 :- agent(P), vertex(U).
{ move(P,U,V) : edge(U,V) } 1 :- agent(P), vertex(V).

% discard disconnected paths
:- move(P,U,_), not start(P,U), not move(P,_,U).
:- move(P,_,U), not  goal(P,U), not move(P,U,_).

% ensure that goal positions are reached
:- goal(P,U), not start(P,U), not move(P,_,U).
:- goal(P,U), move(P,U,_).

% REDUNDANT CONSTRAINTS

% ensure that moves are connected
visit(P,U) :- start(P,U).
visit(P,V) :- visit(P,U), move(P,U,V).
:- move(P,U,_), not visit(P,U).

% DETOUR

{ det(P,V) : move(P,_,V), not goal(P,V) }detour :- agent(P).
{ move_(P,(V,p),(W,p)) : edge(V,W), edge(W,V), not visit(_,W), det(P,V) }=1 :- det(P,V).
move_(P,(W,p),(V,r)) :- move_(P,(V,p),(W,p)), det(P,V).
move_(P,(U,r),(V,p)) :- move(P,U,V), det(P,U).
move_(P,(U,p),(V,p)) :- move(P,U,V), not det(P,U).

% ORDERING

% start/end conflicts
resolve(P,(U,S),Q,(U,p)) :-  goal(Q,U), move_(P,_,(U,S)), P!=Q.
resolve(P,(U,p),Q,(U,S)) :- start(P,U), move_(Q,_,(U,S)), P!=Q.

% vertex conflicts
1 { resolve(P,(U,S) ,Q,(U,S'));
    resolve(Q,(U,S'),P,(U,S )) } :- move_(P,_,(U,S)), move_(Q,_,(U,S')), P<Q.

% discard conflicting resolutions
:- resolve(P,U,Q,U'), resolve(Q,U',P,U).

% edge conflicts
:- move_(P,(U,p),(V,p)), move_(Q,(V,p),(U,p)), P<Q,
   not resolve(P,(V,p),Q,(V,p)), not resolve(Q,(U,p),P,(U,p)).

% establish dependency relation
sequence((P, U    ),(P, V    ),1) :- move_(P,U,V).
sequence((P,(V,Sv)),(Q,(U,Sq)),1) :- resolve(P,(U,Sp),Q,(U,Sq)), move_(P,(U,Sp),(V,Sv)), follow=0.
sequence((P,(V,Sv)),(Q,(U,Sq)),0) :- resolve(P,(U,Sp),Q,(U,Sq)), move_(P,(U,Sp),(V,Sv)), follow=1.
sequence((P, U    ),(Q, U    ),1) :- resolve(P,Q,U), follow=1.

#show move_/3.
%#show sequence/3.
%#show resolve/4.

edge(a,b).
edge(c,b).
edge(c,d).
edge(b,e).
edge(A,B) :- edge(B,A).
vertex(V) :- edge(V,_).

agent(r1).
start(r1,a).
goal(r1,d).
agent(r2).
start(r2,d).
goal(r2,a).

% ACYC CHECK

% zero propagation
zsequence(U,V) :- sequence(U,V,0).
zsequence(U,W) :- zsequence(U,V), sequence(V,W,0).

% sequentialization
sequence(U,V) :- sequence(U,V,1).
sequence(U,W) :- zsequence(U,V), sequence(V,W,1).
sequence(U,W) :- sequence(U,V,1), zsequence(V,W).

#edge (U,V) : sequence(U,V).
