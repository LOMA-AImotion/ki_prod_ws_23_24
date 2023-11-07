% Use this editor as a MiniZinc scratch book
int: n_workers = 6; 
set of int: Workers = 1..n_workers;
int: n_tasks = 3;
set of int: Tasks = 1 .. n_tasks;

array[Workers] of bool: available;
available = [false, true, false, true, true, true];
set of int: Workers_Available = {w | w in Workers where available[w] = true};

array[Tasks] of var set of Workers_Available: worked_on_by;


constraint forall(w in Workers where available[w]) ( % bei uns: 2, 4, 5, 6
             exists(t in Tasks) (w in worked_on_by[t])
           );
           
% alle Arbeiter die NICHT verfügbar sind -> ihr dürft in keinem Team vorkommen
           
output ["\(worked_on_by)\nWorkers_Available: \(Workers_Available)"];