% Parameter
enum Roboter;
enum Tasks;
array[Roboter, Tasks] of int: kosten;

% Entscheidungsvariablen
var int: gesamtkosten;
% Aufgabenbelegung 
array[Roboter] of var Tasks: roboter2task;
% array[Tasks] of var Roboter: task2roboter;

% Constraints 
% 1. Jeder Roboter führt genau eine Aufgabe aus
constraint forall(r1 in Roboter, r2 in Roboter 
                  where r1 != r2) (
  roboter2task[r1] != roboter2task[r2]
);

% 2. Die Gesamtkosten sind die Summe der Kosten, 
% die durch die Zuweisung entstehen
constraint gesamtkosten = 
   sum(r in Roboter) (kosten[r, roboter2task[r] ] );
   
% Zielfunktion:
% Minimiere Kosten
solve minimize gesamtkosten;