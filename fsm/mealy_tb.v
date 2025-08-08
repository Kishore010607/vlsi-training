`timescale 1ns / 1ps

module tb_mealy_fsm;

    // Testbench signals
    reg clk;
    reg reset;
    reg x;
    wire z;

    // Instantiate the Mealy FSM
    mealy_fsm uut (
        .clk(clk),
        .reset(reset),
        .x(x),
        .z(z)
    );

    // Clock generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus block
    initial begin
        $display("Time\tReset\tX\tZ");
        $monitor("%g\t%b\t%b\t%b", $time, reset, x, z);

        // Initialize
        reset = 1; x = 0;
        #10 reset = 0;

        // Test input sequence
        // Try sequences like: 1 0 1 → should trigger z = 1 in Mealy FSM
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;  // Expect z = 1 here
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;  // Another detection

        // End simulation
        #20 $finish;
    end

endmodule
