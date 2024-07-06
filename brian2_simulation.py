import numpy as np
import tensorflow as tf
import matplotlib.pyplot as plt
from brian2 import *


# Load the trained AI model
model = tf.keras.models.load_model('mlp_model.h5')

# Define OI model (neuron)
eqs = '''
dv/dt = (1.1 - v)/tau : 1 (unless refractory)
tau : second
'''

# Create neuron group (organoid)
G = NeuronGroup(1000, eqs, threshold='v>1', reset='v=0', refractory=5*ms, method='exact')

# Set initial membrane time constant
G.tau = '10*ms'

# Monitor membrane potential v of all neurons
mon = StateMonitor(G, 'v', record=True)

# Create a Network object to explicitly manage simulation objects
net = Network(G, mon)

# Run initial simulation to stabilize the network
net.run(1000*ms)

# Influence neuron spiking based on ML model output
def influence_neurons(input_data):
    prediction = model.predict(input_data)
    for i, neuron in enumerate(G):
        # Adjust neuron's membrane time constant based on model output
        if prediction > 0.5:
            neuron.tau = '5*ms'  # Faster response
        else:
            neuron.tau = '15*ms'  # Slower response

# Apply influence at each timestep
@network_operation(dt=1*second)
def update():
    # Generate synthetic data as input to the MLP model
    input_data = np.random.random((1, 10))
    influence_neurons(input_data)

# Add the update operation to the Network
net.add(update)

# Run the full simulation for an additional 1000 ms
net.run(1000*ms)

# Plot the resulting organoid spikes
plt.figure(figsize=(10, 6))
plt.plot(mon.t/ms, mon.v[0])  # Line plot of the potential of the first neuron
plt.xlabel('Time (ms)')
plt.ylabel('Membrane potential (v)')
plt.title('Membrane Potential of First Neuron Over Time')
plt.savefig('membrane_potential.png')
plt.close()