#const visit=0.
#const follow=0.

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
visit(P,U) :- start(P,U), visit=1.
visit(P,V) :- visit(P,U), move(P,U,V), visit=1.
:- move(P,U,_), not visit(P,U), visit=1.

% ORDERING

% start/end conflicts
resolve(P,Q,U) :-  goal(Q,U), move(P,_,U), P!=Q.
resolve(P,Q,U) :- start(P,U), move(Q,_,U), P!=Q.

% vertex conflicts
1 { resolve(P,Q,U);
    resolve(Q,P,U) } :- move(P,_,U), move(Q,_,U), P<Q.

% discard conflicting resolutions
:- resolve(P,Q,U), resolve(Q,P,U).

% edge conflicts
:- move(P,U,V), move(Q,V,U), P<Q,
   not resolve(P,Q,V), not resolve(Q,P,U).

% establish dependency relation
sequence((P,U),(P,V),1) :- move(P,U,V).
sequence((P,V),(Q,U),1) :- resolve(P,Q,U), move(P,U,V), follow=0.
sequence((P,V),(Q,U),0) :- resolve(P,Q,U), move(P,U,V), follow=1.
sequence((P,U),(Q,U),1) :- resolve(P,Q,U), follow=1.

#show move/3.
#show sequence/3.
