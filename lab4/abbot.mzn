% Wenn 100 Scheffel Mais unter 100 Personen so verteilt w¨urden, dass jeder Mann drei Scheffel,jede Frau zwei und jedes Kind einen halben Scheffel erh¨alt, wie viele M¨anner, Frauen und Kinder wenn es f¨unfmal so viele Frauen wie M¨anner g¨abe?

% Variablen
var 0..100: men;
var 0..100: women;
var 0..100: kids;

% Domänen
int: nPeople = 100;
set of int: People = 0..nPeople;

% Constraints
%dass jeder Mann drei Scheffel,jede Frau zwei und jedes Kind einen halben Scheffel erh¨alt, wie viele M¨anner, Frauen und Kinder wenn es f¨unfmal so viele Frauen wie M¨anner g¨abe?
constraint women = 5*men;
constraint men + women + kids = 100;

% dass jeder Mann drei Scheffel,jede Frau zwei und jedes Kind einen halben Scheffel erh¨alt,
% constraint men*3 + women*2 + kids/2 = 100;
constraint men*6 + women*4 + kids = 200;