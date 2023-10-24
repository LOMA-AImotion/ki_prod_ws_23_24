% Parameter
int: n; % Anzahl Roboter
int: m; % Anzahl Tasks
set of int: Roboter = 1..n;
set of int: Tasks = 1..m;
array[Roboter, Tasks] of int: kosten;

% Entscheidungsvariablen
var int: gesamtkosten;
% Aufgabenbelegung 
array[Roboter] of var Tasks: roboter2task;
% array[Tasks] of var Roboter: task2roboter;
