#const visit=0.
#const follow=0.

% BASE

% move(P,U,V,W):
% - move P from V to W coming from U
% - moves from the start satisfy U=V while V is the start node
% - moves to the goal satisfy V=W while V is the goal node

% guess moves
% the start vertex has exactly one outgoing edge
1 { move(P,V,V,W) : edge(V,W);
    move(P,V,V,V) : goal(P,V) } 1 :- start(P,V).
% intermediate edges have at most one outgoing edge
{ move(P,U,V,W) : edge(V,W);
  move(P,U,V,V) : goal(P,V) } 1 :- edge(U,V), agent(P).
% the goal vertex has exactly one incoming edge
1 { move(P,U,V,V) : edge(U,V);
    move(P,V,V,V) : start(P,V) } 1 :- goal(P,V).
% intermediate vertices have at most one incoming edge
{ move(P,U,V,W) : edge(U,V);
  move(P,V,V,W) : start(P,V) } 1 :- edge(V,W), agent(P).

% discard disconnected paths
:- move(P,U,V,_), U!=V, not move(P,_,U,V).
:- move(P,_,U,V), U!=V, not move(P,U,V,_).

% REDUNDANT CONSTRAINTS

% ensure that moves are connected
visit(P,U,V) :- move(P,U,U,V), visit=1.
visit(P,V,W) :- visit(P,U,V), move(P,U,V,W), visit=1.
:- move(P,U,V,_), not visit(P,U,V), visit=1.

% ORDERING

% resolve(P,U,W,Q,V,W):
% - P has to move from U to W before Q is moved from V to W

% start/end conflicts
resolve(P,U,U,Q,W,U) :- move(P,U,U,V), U!=V, move(Q,_,W,U), W!=U, P!=Q.
resolve(Q,W,V,P,U,V) :- move(P,U,V,V), U!=V, move(Q,_,W,V), W!=V, P!=Q.
:- move(P,U,U,U), move(Q,_,_,U), P!=Q.

% vertex conflicts
1 { resolve(P,U,W,Q,V,W);
    resolve(Q,V,W,P,U,W) } :- move(P,_,U,W), U!=W, move(Q,_,V,W), V!=W, P<Q.

% discard conflicting resolutions
:- resolve(P,U,W,Q,V,W), resolve(Q,V,W,P,U,W).

% edge conflicts:
%   P               Q
%   X -> U <-> V <- Y
% prevent:
%   move P from U to V before moving Y to V, or the other way round
:- move(P,X,U,V), move(Q,Y,V,U), U!=V, P<Q,
   not resolve(P,U,V,Q,Y,V), not resolve(Q,V,U,P,X,U).

% zero propagation of conflicts
zseq((P,W,X),(Q,V,W)) :- resolve(P,U,W,Q,V,W), move(P,U,W,X), W!=X, follow=1.
zresolve(U,V) :- zseq(U,V), follow=1.
zresolve(U,W) :- zresolve(U,V), zseq(V,W), follow=1.

% establish dependency relation
sequence((P,U,V),(P,V,W)) :- move(P,U,V,W), V!=W.
sequence((P,W,X),(Q,V,W)) :- resolve(P,U,W,Q,V,W), move(P,U,W,X), W!=X, follow=0.
sequence((P,U,W),(Q,V,W)) :- resolve(P,U,W,Q,V,W), follow=1.
sequence((P,U,W),(Q,X,Y)) :- zresolve((P,U,W),(Q,V,X)), move(Q,V,X,Y), X!=Y, follow=1.

#show move/4.
#show sequence/2.
