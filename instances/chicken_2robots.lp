edge((1, 1), (2, 1)). edge((2, 1), (1, 1)).
edge((2, 1), (2, 2)). edge((2, 2), (2, 1)).
edge((2, 1), (3, 1)). edge((3, 1), (2, 1)).

robot(1,(1,1)).
robot(2,(3,1)).

goal(1,(3,1)).
goal(2,(1,1)).

task(A,S,G) :- robot(A,S), goal(A,G).
