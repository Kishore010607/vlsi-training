`timescale 1ns / 1ps

module or_gate_tb;

    // Testbench signals
    reg a;
    reg b;
    wire y;

    // Instantiate the OR gate
    or_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Display header
        $display("Time\t a\t b\t y");
        $monitor("%g\t %b\t %b\t %b", $time, a, b, y);

        // Test all input combinations
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        // Finish simulation
        $finish;
    end

endmodule
