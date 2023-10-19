par int: num_items; % Items to be distributed 

var 0..num_items: person_a_carries;
var 0..num_items: person_b_carries;

constraint person_a_carries + person_b_carries == num_items;

output ["Person a carries \(person_a_carries) and person b carries \(person_b_carries)"]