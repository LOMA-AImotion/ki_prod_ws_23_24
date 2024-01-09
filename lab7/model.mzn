var 0..10: x;
var 0..10: y;

constraint x + y = 12;
constraint x < y;

solve satisfy;