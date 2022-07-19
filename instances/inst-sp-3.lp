task(r1,s1,g1).
spath(r1,s1,v1).
spath(r1,v1,v2).
spath(r1,v2,g1).

task(r2,s2,g2).
spath(r2,s2,v2).
spath(r2,v2,v1).
spath(r2,v1,g2).

edge(s2,v2).
edge(v2,v1).
edge(v1,g2).
edge(s1,v1).
edge(v2,g1).
edge(v1,v3).
edge(V,V') :- edge(V',V).
