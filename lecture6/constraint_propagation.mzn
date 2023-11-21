var 1..3: x1;
var 1..3: x2;
var 1..3: x3;

constraint x1 = x2; 
constraint x2 < x3;

% run with Gecode Gist to see search tree