#!/bin/bash
# curl https://biodynamo.github.io/install | bash

set -e
export DEBIAN_FRONTEND=noninteractive

apt-get update && apt-get install -y \
    clang \
    freeglut3-dev \
    wget \
    clang-format \
    g++ \
    zlib1g-dev \
    clang-tidy \
    gcc \
    libbz2-dev \
    doxygen \
    git \
    libffi-dev \
    graphviz \
    libblas-dev \
    liblzma-dev \
    libxml2-dev \
    libbz2-dev \
    libreadline-dev \
    llvm-7 \
    liblapack-dev \
    libnuma-dev \
    libssl-dev \
    llvm-7-dev \
    libomp5 \
    python-openssl \
    valgrind \
    libomp-dev \
    tk-dev \
    libgsl-dev \
    libopenmpi-dev \
    xz-utils \
    cmake \
    libpthread-stubs0-dev \
    curl \
    make \
    python3-setuptools \
    python3-wheel \
    python3-pip

git clone https://github.com/BioDynaMo/biodynamo.git /biodynamo
cd /biodynamo
git checkout v1.04-patches

mkdir build
cd build
cmake ..
make -j4
make install

cd /
rm -rf /biodynamo
