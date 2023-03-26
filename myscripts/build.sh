#!/bin/bash
set -e

NINJA_PARAMS=$1

cd /tmp/symcc_build
cmake -G Ninja \
        -DQSYM_BACKEND=OFF \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DZ3_TRUST_SYSTEM_VERSION=on \
        /tmp/symcc_source \
    && ninja $NINJA_PARAMS \
    && cargo install --path /tmp/symcc_source/util/symcc_fuzzing_helper

cp -r $HOME/.cargo/bin/symcc_fuzzing_helper /tmp/symcc_build/
cp /tmp/symcc_source/util/pure_concolic_execution.sh /tmp/symcc_build/