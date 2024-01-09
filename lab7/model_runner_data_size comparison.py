from minizinc import Model, Status, Solver, Instance
import minizinc 
import os 
model_file = os.path.join(os.path.dirname(__file__), "model2.mzn")
model = Model(model_file)


#solver = minizinc.Solver.lookup("chuffed")
# löse mit mehreren Solvern:
solvers = ["com.google.ortools.sat", "gecode"]

import matplotlib.pyplot as plt

def plot_runtimes(problem_sizes, runtimes, solver_id):
    from datetime import timedelta

   
    # Convert timedeltas to seconds for plotting
    runtimes_seconds = [runtime.total_seconds() for runtime in runtimes]

    # Create a Matplotlib plot

    plt.plot(problem_sizes, runtimes_seconds, marker='o', linestyle='-', label=solver_id)

    # Add labels and title
    plt.xlabel('Problem Sizes')
    plt.ylabel('Runtimes (seconds)')
    plt.title(f'Problem Sizes vs Runtimes')

    # Show the plot
    plt.grid(True)
    plt.legend()
    #plt.show()

plt.figure(figsize=(10, 6))
for solver_id in solvers:
    print("Solving with ... ", solver_id)
    solver = Solver.lookup(solver_id)
    problem_sizes = [10, 20, 30, 50, 100]
    runtimes = []
    for n_elements in problem_sizes:
        inst = Instance(solver, model)
        inst["n_elements"] = n_elements
         
        result = inst.solve()
        solve_time = result.statistics["solveTime"]
        runtimes.append(solve_time)
        print(result)
        print("solve_time:", solve_time)
    plot_runtimes(problem_sizes, runtimes, solver_id)
plt.show()