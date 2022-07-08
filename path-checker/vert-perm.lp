visit(A,V) :- spath(A,V,_).
visit(A,V) :- spath(A,_,V).

{ prio((A,V),(A',V)), prio((A',V),(A,V)) }=1 :- visit(A,V), visit(A',V), A<A'.
prio((A,V'),(A',V')) :- spath(A,V,V'), spath(A',V,V'), prio((A,V),(A',V)).
prio((A,V'),(A',V')) :- spath(A,V,V'), spath(A',V',V), prio((A,V),(A',V)).

:- task(A,V,_), prio((A',V),(A,V)).
:- task(A,_,V), prio((A,V),(A',V)).
