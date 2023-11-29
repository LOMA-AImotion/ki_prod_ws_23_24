# importing image object from PIL
import math, os
from PIL import Image, ImageDraw, ImageFont

# first let's get the coordinates from MiniZinc
model_file = "tsp.mzn"
# make sure the path is set relative to the current file
model_file = os.path.join(os.path.dirname(__file__), model_file)

import minizinc
from minizinc import Model, Status
import tsp_visualizer

if __name__ == "__main__":

    tsp_model = Model(model_file)
    # make sure the path is set relative to the current file
    data_file = os.path.join(os.path.dirname(__file__), "tsp_2.dzn")

    tsp_model.add_file(data_file)
    solver = minizinc.Solver.lookup("chuffed")
    for solver_ in ["chuffed", "gecode", "or-tools"]:
        solver = minizinc.Solver.lookup(solver_)
        # run ...
        
    inst = minizinc.Instance(solver, tsp_model)
    #inst["n_locations"] = n

    #inst["widths"] = widths
    #inst["heights"] = heights
    inst.add_string("constraint tour[n_locations] = 4;")
    # now actually solve the optimization problem!
    result = inst.solve()

    loc_names = ["HQ", "Edeka", "Burger King", "Audi Forum", "Klinikum"];
    
    if result.status == Status.SATISFIED or result.status == Status.OPTIMAL_SOLUTION:
        print("sounds good")
        tour = result["tour"]
        print("Tour is: ", tour)

        tour_length = result["tour_length"]
        tour = [loc_names[t-1] for t in tour]
        locations = tsp_visualizer.locations
        tsp_visualizer.draw_map(locations, tour, tour_length)
    else:
        print("Unsatisfiable!")





