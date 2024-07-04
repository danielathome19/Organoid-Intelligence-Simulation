#include "biodynamo.h"
#include <pybind11/embed.h>
namespace py = pybind11;


struct NeuralNetworkModule : public bdm::BaseBiologyModule {
  BDM_STATELESS_BM_HEADER(NeuralNetworkModule, BaseBiologyModule, 1);

  NeuralNetworkModule() : BaseBiologyModule(gAllEventIds) {}

  void Run(bdm::Agent* agent) override {
    auto* cell = bdm_static_cast<bdm::Cell*>(agent);
    
    // Generate synthetic data as input to the MLP model
    std::vector<float> input_data(10, 0.5);  // Example input

    // Call the Python script to get the output from the MLP model
    py::scoped_interpreter guard{};  // Start the interpreter and keep it alive
    py::object main = py::module_::import("__main__");
    py::object globals = main.attr("__dict__");
    py::object result = py::eval_file("mlp_inference.py", globals);
    py::object output = result.attr("run_inference")(input_data);

    float mlp_output = output.cast<float>();

    // Use the MLP output to influence the cell behavior
    // The organoid grows/shrinks in response to the binary classification output from the AI model
    if (mlp_output > 0.5) {
      cell->ChangeVolume(400);
    } else {
      cell->ChangeVolume(-400);
    }
  }
};


int main(int argc, const char** argv) {
  bdm::InitializeBdm(&argc, argv);

  // Create an initial set of cells
  bdm::ModelInitializer::CreateAgentsRandom(100, [](bdm::Agent* agent) {
    bdm::Cell* cell = bdm_static_cast<bdm::Cell*>(agent);
    cell->SetDiameter(7.5);
    cell->AddBiologyModule(NeuralNetworkModule());
  });

  // Run the simulation for a specified number of steps
  bdm::Scheduler<> scheduler;
  scheduler.Simulate(1000);

  return 0;
}
