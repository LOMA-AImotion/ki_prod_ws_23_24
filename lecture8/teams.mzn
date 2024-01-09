set of int: Persons = 1..10;
enum Roles = {engineer, scientist, manager, sales};
array[Persons] of Roles: ist = 
  [engineer, engineer, scientist, manager, manager,
   sales, sales, sales, sales, engineer];
   
% Die Hauptentscheidung: Wen schicken wir? 
array[Persons] of var 0..1: team; 
var 0..10: anz_engineers; 
var 0..10: anz_scientists;
var 0..10: anz_managers;
var 0..10: anz_sales;
 
% Constraints um Team und Anzahl zu verknüpfen
% anz_engineers = Anzahl der Personen, die im Team sind und Engineer
%constraint anz_engineers = 
%  sum(p in Persons) ( bool2int(ist[p] == engineer 
%                               /\ team[p] == 1 ) );
% jetzt mit Count
include "count.mzn";                               
constraint anz_engineers = count(
                        [ist[p] | p in Persons where team[p] == 1],
                         engineer);
constraint anz_scientists = count(
                        [ist[p] | p in Persons where team[p] == 1],
                         scientist);                               

constraint anz_managers = 
  sum(p in Persons) ( bool2int(ist[p] == manager
                               /\ team[p] == 1 ) );
                               
                             

constraint anz_sales = 
  sum(p in Persons) ( bool2int(ist[p] == sales
                               /\ team[p] == 1 ) );
    
  

% Variante 1: if 
%constraint if anz_engineers == 2 then 
%            anz_scientists == 1 /\ anz ...

% Variante 2: Logisch aufzählen

% constraint 
%  (anz_engineers == 2 /\ anz_scientists == 1 /\        
%   anz_managers == 1 /\ anz_sales == 2) \/
%  (anz_engineers == 1 /\ anz_scientists == 0 /\        
%   anz_managers == 2 /\ anz_sales == 2) \/
%  (anz_engineers == 3 /\ anz_scientists == 1 /\        
%   anz_managers == 0 /\ anz_sales == 1);

% Variante 3: Table constraint 
array[int, 1..4] of int: gueltige_teams;

include "table.mzn";
constraint table(
  [anz_engineers, anz_scientists, anz_managers, anz_sales],
  gueltige_teams); 
 
 constraint anz_sales == 0;