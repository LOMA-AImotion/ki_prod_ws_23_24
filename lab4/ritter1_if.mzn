%Ritter und Schurken: Auf der Insel der Ritter und Schurken sagen die Ritter immer die
%Wahrheit und die Schurken l¨ugen immer. Jeder Inselbewohner ist entweder ein Ritter oder
%ein Schurke.

%Ein Besucher trifft drei Bewohner, die die folgenden Aussagen machen:
%A: Genau einer von uns ist ein Schurke.
%B: Genau zwei von uns sind Schurken.
%C: Wir sind alle Schurken.
int: nPeople = 3;
set of int: People = 1..nPeople;

array[People] of var 0..1: ist_schurke;
var People: schurkensumme = sum(p in People)(ist_schurke[p]);

% ACHTUNG: If deckt nur Implikation ab, wir wollen aber Äquivalenz
% If können Sie dazu nutzen, nur eingeschränkte Constraints zu vergeben
%A: Genau einer von uns ist ein Schurke.
constraint if ist_schurke[1] = 0 then 
                schurkensumme = 1
           else
                schurkensumme != 1
           endif;


%B: Genau zwei von uns sind Schurken.
constraint if (ist_schurke[2] = 0) then
               schurkensumme = 2
           else 
               schurkensumme != 2
           endif;

%C: Wir sind alle Schurken.
constraint if (ist_schurke[3] = 0) then 
              schurkensumme = nPeople
           else 
              schurkensumme != nPeople
           endif;