%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% = Command-line Arguments =================================
% -x 3 -y 3 -r 2 -s 2
%
% = Instance Statistics ====================================
% Grid Size X:                      3
% Grid Size Y:                      3
% Number of Nodes:                  9
% Number of Highway Nodes:          0
% Number of Robots:                 2
% Number of Shelves:                2
% Number of Picking Stations:       0
% Number of Products:               0
% Number of Product Units in Total: 0
% Number of Orders:                 0
% Number of Orders Lines:           0
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#program base.

% init
init(object(node,1),value(at,(1,1))).
init(object(node,2),value(at,(2,1))).
init(object(node,3),value(at,(3,1))).
init(object(node,4),value(at,(1,2))).
init(object(node,5),value(at,(2,2))).
init(object(node,6),value(at,(3,2))).
init(object(node,7),value(at,(1,3))).
init(object(node,8),value(at,(2,3))).
init(object(node,9),value(at,(3,3))).
init(object(robot,1),value(at,(1,1))).
init(object(robot,2),value(at,(2,1))).
init(object(shelf,1),value(at,(1,1))).
init(object(shelf,2),value(at,(3,2))).
