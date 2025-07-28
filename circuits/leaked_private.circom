pragma circom 2.0.0;

template LeakySecret() {
    signal input secret;
    signal output out;

    // Should NOT expose the secret, but does
    out <== secret;
}

component main = LeakySecret();