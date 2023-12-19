enum Tage = {Mon, Die, Mi};
enum Faecher;
array[Tage] of var Faecher: plan;

include "alldifferent.mzn";
constraint alldifferent(plan);