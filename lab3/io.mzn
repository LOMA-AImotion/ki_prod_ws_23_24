% io.mzn 
int: n;
% Mgl.1 : output [show(n)];
% Mgl.2 : int: n :: add_to_output;
% Mgl.3 : output ["n = \(n)"];

% ein Array von 1..n das Werte zwischen 1..n annimmt
array[1..n] of var 1..n: element;

% aufsteigend sortiert: Element[i+1] soll >= Element[i] sein
constraint forall(i in 1..n-1) (element[i+1] > element[i]); 
% (element[2] > element[1]) /\
% (element[3] > element[2]) /\
% (element[4] > element[3]) 
% Problem: (element[5] > element[4])


%output ["n = \(n)"];