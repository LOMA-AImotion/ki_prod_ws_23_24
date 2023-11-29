int : n_Loc = 4;
set of int: Locations = 1..n_Loc;

include "circuit.mzn";
array[Locations] of var Locations: next;
constraint circuit(next);

% invalid choice - two subtours (1,2) and (3,4)
constraint next = [2, 1, 4, 3];