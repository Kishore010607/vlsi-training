`timescale 1ns / 1ps

module tb_moore_fsm;

    // Testbench signals
    reg clk;
    reg reset;
    reg x;
    wire z;

    // Instantiate the Moore FSM
    moore_fsm uut (
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

        // Apply input sequence: 1 0 1 → should trigger z = 1
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;  // Expect z = 1 after this clock cycle
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;  // Another detection

        // End simulation
        #20 $finish;
    end

endmodule
