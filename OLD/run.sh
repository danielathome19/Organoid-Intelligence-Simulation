#!/bin/bash


# Step 1
echo "Training the MLP model..."
python3 mlp_model.py


# Step 2
echo "Preparing the build directory..."
rm -rf build
mkdir build
cd build


# Step 3
echo "Building the BioDynaMo simulation..."
cmake ..
make


# Step 4
echo "Running the BioDynaMo simulation..."
./biodynamo_simulation


echo "Simulation completed."
