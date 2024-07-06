#!/bin/bash


# Step 1
echo "Training the MLP model..."
python3 mlp_model.py


# Step 2
echo "Running the Brian2 simulation..."
python3 brian2_simulation.py


echo "Simulation completed. Check 'membrane_potential.png' for output plot."
