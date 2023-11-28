% Use this editor as a MiniZinc scratch book
int: n = 4;
array[1..n] of var 1..n: x;
include "alldifferent.mzn";
constraint alldifferent(x);
%constraint forall(i in 1..n, j in 1..n where i != j) (
%  x[i] != x[j]
%);