% Löserauswahl:
% Technologien: LP/MIP -> HiGHs, CBC, Gurobi
%                 wenn ich nur lineare Constraints habe
%                 wenn ich float-Entscheidungsvariablen habe 
%               CP/SAT -> Gecode, OR-Tools, Chuffed
%                 wenn ich viele boolesche oder diskrete Entscheidungen treffen
%                 0/1
%               CP -> Gecode
%                 wenn ich viele gute globale Constraints habe 
%                 Packing-Probleme, Scheduling, Vehicle Routing (subcircuit)
%               andere Solver wie Couenne, wenn ich gemischt-ganzzahlig, 
%                 nicht-linear unterwegs bin 