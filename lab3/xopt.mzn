% xopt.mzn

% einer Entscheidungsvariablen x, die Werte von 0 bis 10 annimmt
var 0 .. 10: x;

% x soll durch 4 teilbar sein
constraint x mod 4 == 0; 

% der minimale Wert von (x − 7)^2 soll bestimmt werden.
% solve minimize (x - 7)*(x - 7);
solve minimize (x - 7)^2;