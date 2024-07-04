# About

This project is to simulate Organoid Intelligence (OI), a new emerging field where organoids, which are three-dimensional structures grown from stem cells that can mimic certain aspects of human organs, are integrated with technologies to potentially perform computational tasks or interact with their environments in intelligent ways. This concept is quite novel and speculative, blending biotechnology with artificial intelligence.

As such, this project demonstrates the integration of a neural network with a biological simulation using [BioDynaMo](https://www.biodynamo.org/). We train a simple Multi-Layer Perceptron (MLP) using TensorFlow to influence the behavior of cells in a BioDynaMo simulation. The organoid grows/shrinks in response to the binary classification output from the AI model, similar to biological system responses like neural plasticity and stem cell differentiation (see `NOTES.md`).

The simulation can be ran using the `run.sh` file. Ensure **tensorflow** and **pybind11** have been installed using `pip` first before running.


# Project Structure

```
project-root/
├── CMakeLists.txt                # CMake configuration file
├── build/                        # Directory for build files
├── mlp_model.py                  # Script to create and train the MLP model
├── mlp_inference.py              # Script to load the model and perform inference
├── biodynamo_simulation.cpp      # BioDynaMo simulation code integrating the MLP model
├── install_biodynamo.sh          # Shell script to install the BioDynaMo library
└── run.sh                        # Shell script to automate the build and run process
```


# Requirements

* Python 3
* TensorFlow
* BioDynaMo
* CMake
* Pybind11


# License

This project is licensed under the CC0 1.0 Universal License.
