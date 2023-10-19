enum colors = {rot, gruen, blau};
var colors: by;
var colors: bw;
var colors: ch;
var colors: at;

constraint by != bw;
constraint ch != by;
constraint by != at;
constraint at != ch;
constraint bw != ch;

solve satisfy;