cmake_minimum_required(VERSION 3.10)
project(BioDynaMoSimulation VERSION 1.0)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED True)

find_package(BioDynaMo REQUIRED)

# set(pybind11_DIR "<PATH_HERE; FIND WITH `python -m pybind11 --includes`>")
find_package(pybind11 REQUIRED)

include_directories(${BIODYNAMO_INCLUDE_DIRS} ${pybind11_INCLUDE_DIRS})

add_executable(biodynamo_simulation biodynamo_simulation.cpp)

target_link_libraries(biodynamo_simulation ${BIODYNAMO_LIBRARIES} pybind11::embed)
