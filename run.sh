#!/bin/bash


# Step 1
echo "Training the MLP model..."
python3 mlp_model.py


# Step 2
echo "Building the BioDynaMo simulation..."
mkdir -p build
cd build
cmake ..
make


# Step 3
echo "Running the BioDynaMo simulation..."
./biodynamo_simulation


echo "Simulation completed."
