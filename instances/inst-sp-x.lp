edge((X,Y),(X+1,Y)) :- X=0..6, Y=0..7.
edge((X,Y),(X,Y+1)) :- X=0..7,Y=0..6.

edge(V,V') :- edge(V',V).

%task(r1,(0,0),(2,7)).
task(r2,(1,1),(7,7)).
task(r3,(7,0),(1,1)).
task(r4,(7,7),(2,6)).
%task(r5,(0,1),(7,7)).
%task(r6,(0,2),(7,6)).
%task(r7,(0,3),(7,5)).

spath(R,(X,Y),(X+1,Y)) :- task(R,(X,Y),(X',Y')), X'>X.
spath(R,(X,Y),(X-1,Y)) :- task(R,(X,Y),(X',Y')), X'<X.
spath(R,(X,Y),(X,Y-1)) :- task(R,(X,Y),(X ,Y')), Y'<Y.
spath(R,(X,Y),(X,Y+1)) :- task(R,(X,Y),(X ,Y')), Y'>Y.

spath(R,(X,Y),(X+1,Y)) :- task(R,_,(X',Y')), spath(R,_,(X,Y)), X'>X.
spath(R,(X,Y),(X-1,Y)) :- task(R,_,(X',Y')), spath(R,_,(X,Y)), X'<X.
spath(R,(X,Y),(X,Y-1)) :- task(R,_,(X ,Y')), spath(R,_,(X,Y)), Y'<Y.
spath(R,(X,Y),(X,Y+1)) :- task(R,_,(X ,Y')), spath(R,_,(X,Y)), Y'>Y.
