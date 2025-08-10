module xnor_gate (
    input wire a,
    input wire b,
    output wire y
);
    assign y = ~(a ^ b);  // XNOR is the inverse of XOR
endmodule
