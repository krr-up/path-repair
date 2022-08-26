task(r1,v1,v3).
spath(r1,v1,v2).
spath(r1,v2,v3).

task(r2,v3,v1).
spath(r2,v3,v2).
spath(r2,v2,v1).

edge(v1,v2).
edge(v3,v2).
edge(v4,v2).
edge(X,Y) :- edge(Y,X).

#const nbrd=1.

{detour(R,V,V') : spath(R,_,V), edge(V,V')}nbrd :- task(R,_,_).

:- detour(R,_,V), detour(R',_,V), R'>R.
:- detour(_,_,V), spath(_,_,V).

retour(R,V',V) :- detour(R,V,V').

path(R,V,V',0) :- task(R,V,_), spath(R,V,V').

%path(R,V,V',X)   :- path(R,_,V,X), spath(R,V,V'), not detour(R,V,_), X<nbrd.
%path(R,V,V',X+1) :- path(R,W,V,X), spath(R,V,V'), detour(R,V,_), X<nbrd.
%path(R,V,V',X)   :- path(R,_,V,X), detour(R,V,V'), X<nbrd.
%path(R,V,V',X+1)   :- path(R,_,V',X), retour(R,V,V'), X<nbrd.

{path(R,V,V',X) : X=0..nbrd}=1 :- spath(R,V,V').
{path(R,V,V',X) : X=0..nbrd}=1 :- detour(R,V,V').
{path(R,V,V',X) : X=0..nbrd}=1 :- retour(R,V,V').

:- detour(R,V,V'), retour(R,V',V), path(R,V,V',X), not path(R,V',V,X+1).
:- path(R,V,V',X), spath(R,V,V'), path(R,V',V'',X'), spath(R,V',V''), edge(V',W), not detour(R,V',W), X'!=X, W!=V''.

#show path/4.
