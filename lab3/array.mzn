% array.mzn,
%Definieren Sie ein MiniZinc-Modell array.mzn, das einen ganzzahligen Parameter n annimmt, der die L¨ange eines Arrays von Zahlen values mit Werten von 0 bis 9 definiert. 
int: n;
array[1..n] of var 0..9: values;

% Beschr¨anken Sie das Array so, dass die Summe der Zahlen in Array gleich dem Produkt der Zahlen im Array ist. Geben Sie das resultierende Array aus.
constraint sum(values) == product(values);
