`timescale 1ns / 1ps

module not_gate_tb;

    // Testbench signals
    reg a;
    wire y;

    // Instantiate the NOT gate
    not_gate uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Display header
        $display("Time\t a\t y");
        $monitor("%g\t %b\t %b", $time, a, y);

        // Test both input values
        a = 0; #10;
        a = 1; #10;

        // Finish simulation
        $finish;
    end

endmodule
