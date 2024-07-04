cmake_minimum_required(VERSION 3.10)
project(BioDynaMoSimulation)

# BioDynaMo setup
find_package(BioDynaMo REQUIRED)

# Pybind11 setup
find_package(PythonLibs 3 REQUIRED)
find_package(pybind11 REQUIRED)

include_directories(${PYTHON_INCLUDE_DIRS})

add_executable(biodynamo_simulation biodynamo_simulation.cpp)
target_link_libraries(biodynamo_simulation ${PYTHON_LIBRARIES} pybind11::embed BioDynaMo::BioDynaMo)
