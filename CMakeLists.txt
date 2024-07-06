cmake_minimum_required(VERSION 3.10)

project(BioDynaMoSimulation VERSION 1.0)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

find_package(BioDynaMo REQUIRED)
include_directories("/root/biodynamo-v1.05.112/include")

# Find ROOT
set(ROOT_DIR $ENV{ROOTSYS})
include_directories(${ROOT_DIR}/include)
link_directories(${ROOT_DIR}/lib)

# Set pybind11_DIR to the directory containing pybind11Config.cmake
# set(pybind11_DIR "<PATH_HERE; FIND WITH `python -m pybind11 --includes`>")
find_package(pybind11 REQUIRED)

include_directories(${BIODYNAMO_INCLUDE_DIRS} ${pybind11_INCLUDE_DIRS})
add_executable(biodynamo_simulation biodynamo_simulation.cpp)
target_link_libraries(biodynamo_simulation ${BIODYNAMO_LIBRARIES} pybind11::embed)
