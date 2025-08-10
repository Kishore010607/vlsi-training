module nor_gate (
    input wire a,
    input wire b,
    output wire y
);
    assign y = ~(a | b);  // NOR is the inverse of OR
endmodule
