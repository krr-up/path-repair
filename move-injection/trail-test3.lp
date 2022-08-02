%Trail making

{ trail(A,start,S,V) : edge(S,V)   ; trail(A,start,S,end) }=1 :- robot(A,S).
{ trail(A,V2,V3,V4)   : edge(V3,V4) ; trail(A,V2,V3,end)    }=1 :- trail(A,V1,V2,V3), V3!=end.

:- trail(A,V,V',V''), trail(A,V2,V',V''), V<V2.
:- goal(A,G), not trail(A,_,G,end).

%Output
%#show trail/4.
%#show.
