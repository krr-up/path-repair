%Trail making

{ trail(A,garage,S,V) : edge(S,V)   ; trail(A,garage,S,garage) : task(A,S,S)  }=1 :- task(A,S,G).
{ trail(A,V,G,garage) : edge(V,G)   ; trail(A,garage,G,garage) : task(A,S,S)  }=1 :- task(A,S,G).
{ trail(A,V2,V3,V4)   : edge(V3,V4) ; trail(A,V2,V3,garage)    : task(A,S,V3) }=1 :- trail(A,V1,V2,V3), V3!=garage.

:- trail(A,V,V',V''), trail(A,V2,V',V''), V<V2.

%Output
#show trail/4.
%#show.
