#const horizon = 10.

%At each timepoint, I take an action
{ plan(A,move(V,V'),T) : spath(A,V,V') ; plan(A,wait,T)}=1 :- spath(A,_,_), T=1..horizon.

:- spath(A,V,V'), not plan(A,move(V,V'),_).
:- plan(A,move(V,V'),T), plan(A,move(V,V'),T'), T<T'.
:- plan(A,move(V,V'),T), plan(A,move(V',V''),T'), T>T'.
:- plan(A,move(V,V'),T), plan(A',move(V',V),T), A>A'. %edge constraint

pos(A,V,0) :- spath(A,V,V'), not spath(A,_,V).
pos(A,V,T) :- plan(A,move(_,V),T).
pos(A,V,T) :- pos(A,V,T-1), plan(A,wait,T).
:- pos(A,V,T), pos(A',V,T), A<A'. %Vertice constraint

#show plan/3.
