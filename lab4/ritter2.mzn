%Ritter und Schurken: Auf der Insel der Ritter und Schurken sagen die Ritter immer die
%Wahrheit und die Schurken l¨ugen immer. Jeder Inselbewohner ist entweder ein Ritter oder
%ein Schurke.

%Ein Besucher trifft drei Bewohner, die die folgenden Aussagen machen:
%D: Genau einer von uns ist ein Ritter.
%E: Genau zwei von uns sind Ritter.
%F: Wir sind alle Ritter.

int: nPeople = 3;
set of int: People = 1..nPeople;

array[People] of var 0..1: ist_schurke;
var People: rittersumme = sum(p in People)(1 - ist_schurke[p]);

%D: Genau einer von uns ist ein Ritter.
%E: Genau zwei von uns sind Ritter.
%F: Wir sind alle Ritter.

%D: Genau einer von uns ist ein Ritter
constraint (ist_schurke[1] = 0) == (rittersumme = 1);

%E: Genau zwei von uns sind Ritter.
constraint (ist_schurke[2] = 0) == (rittersumme = 2);

%F: Wir sind alle Ritter.
constraint (ist_schurke[3] = 0) == (rittersumme = nPeople);