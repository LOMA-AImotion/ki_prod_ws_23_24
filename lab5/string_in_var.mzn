array[1..5] of var 1..3: options;
array[1..3] of string: names = ["Apfel", "Birne", "Clementine"];

constraint forall(option in 1..3) (count(options, option) <= 2);

output ["o \(o): \(options[o]) Name: \(names[fix(options[o])])\n " | o in 1..5];