%Trail making

{ trail(A,garage,S,V) : edge(S,V)   ; trail(A,garage,S,garage) }=1 :- robot(A,S).
{ trail(A,V2,V3,V4)   : edge(V3,V4) ; trail(A,V2,V3,garage)    }=1 :- trail(A,V1,V2,V3), V3!=garage.

:- trail(A,V,V',V''), trail(A,V2,V',V''), V<V2.
:- goal(A,G), not trail(A,_,G,garage).

%Output
%#show trail/4.
%#show.
