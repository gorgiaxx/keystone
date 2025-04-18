#!/bin/sh -ex

cmake -DCMAKE_C_COMPILER=afl-clang -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -DLLVM_TARGETS_TO_BUILD="all" -G "Unix Makefiles" ..
NUM_CORES=$(nproc)
time make -j"$NUM_CORES"

