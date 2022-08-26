#const xsize = 6.
#const ysize = 6.
#const agent = 3.

init(object(node, (X,Y)), value(at, (X,Y))) :- X=1..xsize, Y=1..ysize.

init(object(robot, X), value(at, (1,X))) :- X=1..agent.
goal(X) :- X=1..agent.

init(object(shelf, X), value(at, (xsize,ysize+1-X))) :- goal(X).
init(object(product, X), value(on, (X, X))) :- goal(X).
init(object(order, X), value(line, (X, X))) :- goal(X).
