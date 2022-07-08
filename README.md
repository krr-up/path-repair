# Path repair

This repository contains encodings based of reparation of conflicting MAPF plans and paths.

## Wait injection

The encodings on this folder takes a set of shortest path ('spath/3') and give as an output a plan such that the only authorized move actions are the one present in the original path.
To solve the potential conflicts between those plans, the only

* action-placement.lp give a timepoint to each move action.
  - Edge conflicts are defined by forbidden pair of actions at the same timepoint.
  - The position of the agent is deduced at each timestep to define the vertex conflicts.

* fill-with-wait.lp is a variant of action-placement.lp.

* move-ordering.dlp use difference constraint to assign timepoint to the actions.
  - Edge conflicts and vertex conflicts are prevented with differences constraints too.

* vlp.lp define for every vertices the interval the agent stay on it.
  - Conflicts are describes as properties of pair of intervals.
  - To get the plan, we need to convert it from the intervals...

## Goal swapping

In anonymous MAPF, it is possible to solve an edge conflict by removing the conflicting action from the plan of the agents, and exchanging the subplan from after the conflict to the end of both agent together.

## Move injection

To extend the possibility of repair, we can define "detour" for the agents to create new plans.
Thoses plans may give better results.

## Plan checker

It may be interesting to define the properties of repairable plans.
This folder contains encodings to represent it.

* vert-acy.lp
  - From the initial paths, we take a node per agent for each vertex he visit.
  - We add edge between those nodes to represent the order of events, to assess there is no circle in the resulting graph.
  - This encoding assume acyclic path as an input.

* vert-perm.lp
  - From every vertex, we define a permutation of every agent that has to visit him.
  - We explicit the restrictions on those permutations
  - This encoding assume acyclic path as an input.

## TODO
[ ] Add plan (path) checkers, to define the properties of repairable plan (path).
[ ] Goal swapping
[ ] Move injection
[ ] Position ordering / move+position ordering
