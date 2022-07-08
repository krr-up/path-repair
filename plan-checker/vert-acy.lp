visit(A,V) :- spath(A,V,_).
visit(A,V) :- spath(A,_,V).

{prio((A,V),(A',V))}:- spath(A,V,V'), spath(A',V'',V).
:- visit(A,V), visit(A',V), not prio((A,V),(A',V)), not prio((A',V),(A,V)), A<A'.

#edge((A,V),(A,V')) : spath(A,V,V').
#edge((A,V),(A',V)) : prio((A,V),(A',V)).
