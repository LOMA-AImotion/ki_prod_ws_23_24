from minizinc import Model, Status, Solver, Instance
import minizinc 
import os 
model_file = os.path.join(os.path.dirname(__file__), "model2.mzn")
model = Model(model_file)


#solver = minizinc.Solver.lookup("chuffed")
# löse mit mehreren Solvern:
solvers = ["com.google.ortools.sat", "gecode"]

def plot_runtimes(problem_sizes, runtimes, solver_id):
    from datetime import timedelta
    import matplotlib.pyplot as plt
    # Example data
    #problem_sizes = [10, 100, 1000, 10000, 100000]
    #runtimes = [timedelta(seconds=1), timedelta(seconds=10), timedelta(minutes=2), timedelta(minutes=20), timedelta(hours=2)]

    # Convert timedeltas to seconds for plotting
    runtimes_seconds = [runtime.total_seconds() for runtime in runtimes]

    # Create a Matplotlib plot
    plt.figure(figsize=(10, 6))
    plt.plot(problem_sizes, runtimes_seconds, marker='o', linestyle='-', color='b')

    # Add labels and title
    plt.xlabel('Problem Sizes')
    plt.ylabel('Runtimes (seconds)')
    plt.title(f'Problem Sizes vs Runtimes ({solver_id})')

    # Show the plot
    plt.grid(True)
    plt.show()

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
