// Half Adder Module
module half_adder (
    input a,
    input b,
    output sum,
    output carry
);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

// Full Adder Module using Two Half Adders
module full_adder (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    wire sum1, carry1, carry2;

    // First half adder
    half_adder HA1 (
        .a(a),
        .b(b),
        .sum(sum1),
        .carry(carry1)
    );

    // Second half adder
    half_adder HA2 (
        .a(sum1),
        .b(cin),
        .sum(sum),
        .carry(carry2)
    );

    // Final carry out
    assign cout = carry1 | carry2;

endmodule
