#!/bin/bash

build_dir=$(pwd)/build
install_dir=$(pwd)/install

# set up build dir
mkdir -p ${build_dir}
cd ${build_dir}

# configure
cmake -DCMAKE_INSTALL_PREFIX=${install_dir} \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_C_COMPILER=gcc \
      -DCMAKE_CXX_COMPILER=g++ \
      -DPYTHON_EXECUTABLE=$(which python) \
      -DCMAKE_CUDA_ARCHITECTURES=75 \
      #-DCUDA_COMPUTE_CAPABILITY=75 \
      ..

# compile
make && make install
