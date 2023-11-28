int: nStudents;
set of int: Students = 1..nStudents;

int: nProjects;
set of int: Projects = 1..nProjects;

array[Students, Projects] of Projects: student_ranks;

% Entscheidungsvariablen: 
% array[Projects] of var Students: projects_to_student;
% Problem: So kann an jedem Projekt nur genau 1 Student arbeiten
% Mgl. 1 umdrehen
% array[Students] of var Projects: student_to_project;

% Mgl. 2 Mengen verwenden
array[Projects] of var set of Students: project_to_students;

% student_ranks =  [| 3, 1, 2 | 
%                     2, 1, 3 |];

% constraints 
% An jedem Projekt müssen mindestens ein Student und h¨ochstens drei Studentinnen oder Studenten arbeiten.
constraint forall(p in Projects) ( card(project_to_students[p]) in 1..3 );

% Jeder Student und jede Studentin dürfen genau an einem Projekt teilnehmen
%constraint forall(s in Students)();
include "disjoint.mzn";
constraint forall(p, p2 in Projects where p != p2) (
    disjoint(project_to_students[p], project_to_students[p2])
);

% alle Studierenden müssen einem Projekt zugewiesen sein
constraint forall(s in Students)(
              exists(p in Projects) (s in project_to_students[p])
);

% Was tun mit StudentRanks?
var int: objective;
constraint objective = sum(p in Projects)(
                          sum(s in project_to_students[p])
                             (student_ranks[s, p])
);

solve minimize objective;

