#include "biodynamo.h"
#include <pybind11/embed.h>

namespace py = pybind11;
using namespace bdm;


struct NeuralNetworkModule : public BaseBiologyModule {
  BDM_STATELESS_BM_HEADER(NeuralNetworkModule, BaseBiologyModule, 1);

  NeuralNetworkModule() : BaseBiologyModule() {}

  void Run(Agent* agent) override {
    auto* cell = bdm_static_cast<Cell*>(agent);

    // Generate synthetic data as input to the MLP model
    std::vector<float> input_data(10, 0.5);  // Example input

    // Call the Python script to get the output from the MLP model
    static py::scoped_interpreter guard{};  // Start the interpreter and keep it alive
    py::object main = py::module_::import("__main__");
    py::object globals = main.attr("__dict__");
    py::object result = py::eval_file("mlp_inference.py", globals);
    py::object output = result.attr("run_inference")(input_data);

    float mlp_output = output.cast<float>();

    // Use the MLP output to influence the cell behavior
    if (mlp_output > 0.5)
      cell->ChangeVolume(400);   // Growth
    else
      cell->ChangeVolume(-400);  // Shrinkage
  }
};


int main(int argc, const char** argv) {
  // Initialize the BioDynaMo environment
  InitializeBiodynamo(argc, argv);

  // Start the Python interpreter
  py::scoped_interpreter guard{};

  // Create an initial set of cells
  ModelInitializer::CreateAgentsRandom(
    1, 1, 1000, [](const Real3& position) {
      auto* cell = new Cell(position);
      cell->SetDiameter(7.5);
      cell->AddBiologyModule(NeuralNetworkModule());
      return cell;
    });

  // Run the simulation for a specified number of steps
  Scheduler scheduler;
  scheduler.Simulate(1000);

  return 0;
}
