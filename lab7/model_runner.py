from minizinc import Model, Status, Solver, Instance
import minizinc 
import os 
model_file = os.path.join(os.path.dirname(__file__), "model.mzn")
model = Model(model_file)


#solver = minizinc.Solver.lookup("chuffed")
# löse mit mehreren Solvern:
solvers = ["chuffed", "gecode", "com.google.ortools.sat"]

for solver_id in solvers:
    solver = Solver.lookup(solver_id)
    inst = Instance(solver, model)
    print("Solving with ... ", solver_id)
    result = inst.solve()
    print(result)
