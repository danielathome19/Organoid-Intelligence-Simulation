# Organoid Intelligence Simulation Notes (Brian2 Model)

This simulation models an organoid where the spiking behavior of neurons is influenced by the output of a neural network. This can be seen as a simplified model of several biological systems involving neural activity, decision-making, and adaptive responses to stimuli.


## 1. Neural Plasticity and Activity

In the brain, neural plasticity refers to the ability of neurons to change in response to experience, which includes alterations in synaptic strength and the formation of new connections. The spiking activity influenced by the neural network output in this simulation is analogous to how neuronal activity patterns can modulate neural plasticity.


## 2. Sensory Processing and Response

Neurons in sensory systems respond to environmental stimuli, with their spiking patterns representing the processing of sensory information. The output from the neural network in the simulation can be seen as analogous to sensory input, influencing the spiking behavior of the neurons in the organoid.


## 3. Neural Oscillations and Rhythms

Neural oscillations are rhythmic or repetitive patterns of neural activity in the central nervous system. The spiking behavior observed in the simulation, driven by the neural network output, can be related to these oscillatory patterns which are crucial for various cognitive and motor functions.


## 4. Decision-Making and Action Selection

In the brain, neurons integrate multiple inputs to make decisions and select actions. The neural network output in this simulation influencing spiking activity is a simplified model of how neurons process information and drive decisions, akin to motor planning and execution.


<hr/>


## Summary of Analogous Biological Systems

* **Neural Plasticity and Activity**: Changes in neuronal spiking patterns based on inputs.
* **Sensory Processing and Response**: Neurons responding to sensory inputs with specific spiking patterns.
* **Neural Oscillations and Rhythms**: Rhythmic neural activity crucial for cognitive functions.
* **Decision-Making and Action Selection**: Neurons integrating inputs to drive decisions and actions.

## Simulation Summary

* **Inputs**: Synthetic data representing environmental conditions or internal states.
* **Neural Network**: A trained MLP model that classifies input data and produces an output.
* **Outputs**: The classification output influences the parameters of neurons, affecting their spiking behavior.
* **Biological Behavior**: The output influences the spiking activity of neurons, simulating neural responses to stimuli.

## Biological Implications

* **Adaptation and Learning**: Similar to neural plasticity, where neurons adapt their activity based on stimuli or experience.
* **Sensory Integration**: Mimicking how neurons process sensory inputs and adjust their spiking behavior accordingly.
* **Rhythmic Activity**: Reflecting neural oscillations and their role in cognitive functions.
* **Decision Processes**: Representing how neurons integrate information to influence decisions and actions.

## Conclusion

The simulation captures the essence of decision-making and response in biological systems, where neurons adjust their spiking activity in response to inputs. It provides a simplified yet insightful model of how complex biological behaviors can be influenced by decision-making processes, analogous to neural plasticity, sensory processing, neural oscillations, and decision-making in the brain.


<hr/>


## Brian2 Simulation Model

In the Brian2 organoid model simulates neural activity by adjusting neuronal properties based on machine learning outputs. The output plot demonstrates that the first neuron is actively firing, influenced by the parameters set in the model and the machine learning predictions. This may be useful for studying how external factors impact neuronal behavior and overall network dynamics.

### Organoid:

* **Model**: Uses a neural network (biological neurons) that simulates membrane potential changes over time.
* **Mechanism**: The neurons' properties, such as their membrane time constant, are influenced by the output 
  of a machine learning model. The neurons' behavior is captured through changes in their membrane potential.
* **Interpretation**: Changes in membrane potential can be used to understand neuronal firing patterns 
  and how external influences (simulated by the machine learning model) affect the network's activity.


### Equation and Parameters:

* The differential equation `dv/dt = (1.1 - v)/tau` represents the change in membrane potential `v` over time.
* The constant `1.1` is an arbitrary value that determines the equilibrium potential the neuron is trying to reach.
* The time constant `tau` determines how quickly the neuron responds to changes. Lower `tau` means faster response.
* The threshold `v>1` ensures the neuron fires (spikes) when its membrane potential `v` exceeds `1` (an arbitrary value).
* After a neuron fires, its membrane potential v is reset to 0.
* The refractory period of `5 milliseconds (ms)` (i.e., during which the neuron cannot fire again) 
  is a typical value used in many simulations to prevent the neuron from firing too frequently.
* These parameters can be tuned based on specific biological data or literature to create a more realistic 
  and accurate simulations of neural dynamics and organoid behavior.


### Initial Conditions:

* Initial `tau` is set to 10 milliseconds, which is a reasonable starting point for many neuron types.


### Simulation Dynamics:

* The `influence_neurons` function adjusts the tau of each neuron based on the output of the TensorFlow model. 
  This simulates the effect of external influences (e.g., neurotransmitters) on neuron behavior.


### Resultant Plot:

* The plot output by the simulation shows the membrane potential of the first neuron over time.
* **Oscillations**: The membrane potential oscillates between 0 and 1, indicating that the neuron is repeatedly 
                reaching its threshold and resetting. This is characteristic of a neuron that is firing action potentials (spikes).
* **Frequency**: The frequency of these oscillations is relatively high, suggesting that the neuron is firing at a rapid rate. 
             This could be influenced by the machine learning model output affecting the neuron's membrane time constant.
* **Amplitude**: The amplitude of the oscillations remains constant, indicating consistent firing strength for each action potential.
