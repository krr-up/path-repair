#const horizon = 5.

{ plan(A,move(V,V'),T) : T=1..horizon }=1:- spath(A,V,V').

:- plan(A,M,T), plan(A,M',T), M<M'.
:- plan(A,move(V,V'),T), plan(A,move(V',V''),T'), T>T'.
:- plan(A,move(V,V'),T), plan(A',move(V',V),T), A>A'. %edge constraint

pos(A,V,0) :- spath(A,V,V'), not spath(A,_,V).
pos(A,V,T) :- plan(A,move(_,V),T).
pos(A,V,T) :- pos(A,V,T-1), not plan(A,_,T).
:- pos(A,V,T), pos(A',V,T), A<A'. %Vertice constraint

#show plan/3.
