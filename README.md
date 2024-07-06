# About

This project is to simulate Organoid Intelligence (OI), a new emerging field where organoids, which are three-dimensional structures grown from stem cells that can mimic certain aspects of human organs, are integrated with technologies to potentially perform computational tasks or interact with their environments in intelligent ways. This concept is quite novel and speculative, blending biotechnology with artificial intelligence.

As such, this project demonstrates the integration of a neural network with a biological simulation using [Brian2](https://github.com/brian-team/brian2). We train a simple Multi-Layer Perceptron (MLP) using TensorFlow to influence the behavior of cells in a Brian2 simulation. The organoid (neuron) spikes in response to the binary classification output from the AI model, similar to biological system responses like neural plasticity and spiking activity (see `NOTES.md`).

Before running, ensure **tensorflow**, **matplotlib**, and **brian2** have been installed using `pip`.

**Note**: This simulation was originally intended to be performed using the BioDynaMo library. However, numerous failed attempts to interface with the library led to the reversion to a simpler system (i.e., Brian2). The previous code can be found in the [OLD](https://github.com/danielathome19/Organoid-Intelligence-Simulation/tree/main/OLD) folder.


# Project Structure

```
project-root/
├── mlp_model.py                  # Script to create and train the MLP model
├── brian2_simulation.py          # Brian2 simulation code integrating the MLP model
└── run.sh                        # Shell script to automate the build and run process
```


# Requirements

* Python 3
* TensorFlow
* Brian2


# License

This project is licensed under the CC0 1.0 Universal License.
