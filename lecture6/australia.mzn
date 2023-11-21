% possible values
enum color = {blue, green, red};

% decision variables 
var color: WA;
var color: NT;
var color: SA;
var color: QL;
var color: NSW;
var color: VT;

% constraints: bordering 
% countries must be different
constraint WA != NT;
constraint SA != NT;
constraint WA != SA;
constraint SA != NT;
constraint QL != NT;
constraint QL != SA;
constraint NSW != SA;
constraint NSW != VT;
constraint NSW != QL;
constraint VT != SA;

