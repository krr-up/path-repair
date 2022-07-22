edge(X,X+1;X+1,X) :- C=1..2, R=0..2, X=C+3*R.
edge(Y,Y+3;Y+3,Y) :- Y=1..6.

robot(X,9-X) :- X=1..8.
goal(X,X) :- X=1..8.


