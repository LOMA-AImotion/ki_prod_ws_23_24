% Wir haben fünf Schiffe, die ersten beiden können nicht in Dock 1
% alle anderen überall hin

% Parameter
par int: anzSchiffe;
par int: anzDocks;
set of int: Schiffe = 1..anzSchiffe;
set of int: Docks = 1..anzDocks;
 
% Entscheidungsvariablen
% -> Welches Schiff geht in welchen Hafen?
array[Docks] of var set of Schiffe: docks2schiffe; % schiffe2docs

% Constraints / Nebenbedingungen
% Schiff 1 und 2 dürfen nicht in Dock 1 stehen
% constraint zuweisung[1] != 1;
constraint not (1 in docks2schiffe[1]); 
% constraint zuweisung[2] != 1;
constraint not (2 in docks2schiffe[1]); 

% Ein Schiff darf nur in einem Dock vorkommen
constraint forall(s in Schiffe) (
  sum(d in Docks) ( 
    bool2int(s in docks2schiffe[d]) 
    )  == 1
);

% Extra: Ziel möglichst gleich verteilt
% Max(Schiffe pro Dock) - Min(Schiffe pro Dock)
% möglichst klein
var int: objective; 
var int: maxAnzahlSchiffe;
var int: minAnzahlSchiffe;
constraint objective = maxAnzahlSchiffe - minAnzahlSchiffe;
constraint maxAnzahlSchiffe = max(d in Docks)(card(docks2schiffe[d]));
constraint minAnzahlSchiffe = min(d in Docks)(card(docks2schiffe[d]));

solve minimize objective;