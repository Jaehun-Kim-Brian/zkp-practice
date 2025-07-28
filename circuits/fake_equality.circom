pragma circom 2.0.0;

template FakeEquality() {
    signal input a;
    signal input b;
    signal output out;

    // No constraint between a and between b
    // Verifier won't check if a==b
    out <== 1;
}

component main = FakeEquality();