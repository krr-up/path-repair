#const horizon = 5.

visit(A,V) :- spath(A,V,_).
visit(A,V) :- spath(A,_,V).

%intervals assignements
{presence(A,V,(T,T')) :      T=0..horizon, T'=T..horizon}=1 :- visit(A,V).
{presence(A,V,(0,T')) :                    T'=0..horizon}=1 :- visit(A,V), task(A,V,_).
{presence(A,V,(T,horizon)) : T=0..horizon               }=1 :- visit(A,V), task(A,_,V).

%The agent can't disapear
:- spath(A,V,V'), presence(A,V,(_,T)), not presence(A,V',(T+1,_)).

%vertice conflict
:- presence(A,V,(T1,T2)), presence(A',V,(T1',T2')), A!=A', T1'<=T2, T2'>=T1.

%edge conflict
:- spath(A,V,V'), spath(A',V',V), A!=A', presence(A,V,(_,T)), presence(A',V,(T+1,_)).
