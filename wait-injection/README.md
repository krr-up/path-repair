# Wait merging

The encodings on this repository takes a set of shortest path ('spath/3') and give as an output a plan such that the only authorized move actions are the one present in the original path.

* action-placement.lp give a timepoint to each move action.
  - Edge conflicts are defined by forbiden pair of actions at the same timepoint.
  - The position of the agent is deduced at each timestep to define the vertex conflicts.

* fill-with-wait.lp is a variant of action-placement.lp.

* move-ordering.dlp use difference constraint to assign timepoint to the actions.
  - Edge conflicts and vertex conflicts are prevented with differences constraints too.

* vlp.lp define for every vertices the interval the agent stay on it.
  - Conflicts are describes as properties of pair of intervals.
