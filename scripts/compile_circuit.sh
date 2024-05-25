#!/bin/bash

for circuit in $(ls ../circom/*.circom); do
    circom $circuit --r1cs --wasm --sym -o ../build/circuits
    snarkjs groth16 setup ../build/circuits/$(basename $circuit .circom).r1cs ../build/circuits/$(basename $circuit .circom).zkey
done
