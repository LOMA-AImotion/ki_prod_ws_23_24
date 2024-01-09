int: n_elements;
array[1..n_elements] of var 1..n_elements: values;

include "globals.mzn";
constraint alldifferent(values);

constraint forall(i in 1..n_elements-1)(
               abs(values[i] - values[i+1]) > 4);
