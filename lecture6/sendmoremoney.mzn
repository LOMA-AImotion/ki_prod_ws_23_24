enum Letters = {s,e,n,d,m,o,r,y};
set of int: Digits = 0..9;
array[Letters] of var Digits: value;
array[1..4] of var 0..1: carry;

include "alldifferent.mzn";
constraint alldifferent(value);
constraint value[s] != 0 /\ value[m] != 0;
constraint carry[4] = value[m];
constraint carry[3] + value[s] + value[m] =
	value[o] + 10*carry[4];
constraint carry[2] + value[e] + value[o] =
	value[n] + 10*carry[3];
constraint carry[1] + value[n] + value[r] =
	value[e] + 10*carry[2];
constraint value[d] + value[e] =
	value[y] + 10*carry[1];
solve satisfy;
