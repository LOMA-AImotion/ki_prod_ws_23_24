% Wir haben fünf Schiffe, die ersten beiden können nicht in Dock 1
% alle anderen überall hin

% Parameter
par int: anzSchiffe;
par int: anzDocks;
set of int: Schiffe = 1..anzSchiffe;
set of int: Docks = 1..anzDocks;
 
% Entscheidungsvariablen
% -> Welches Schiff geht in welchen Hafen?
array[Schiffe] of var Docks: zuweisung; % schiffe2docs

% Constraints / Nebenbedingungen
% Schiff 1 und 2 dürfen nicht in Dock 1 stehen
constraint zuweisung[1] != 1;
constraint zuweisung[2] != 1;