`timescale 1ns / 1ps

module tb_full_adder;

    // Testbench signals
    reg a, b, cin;
    wire sum, cout;

    // Instantiate the full adder
    full_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Stimulus block
    initial begin
        $display("Time\tA\tB\tCin\t| Sum\tCout");
        $monitor("%g\t%b\t%b\t%b\t| %b\t%b", $time, a, b, cin, sum, cout);

        // Test all input combinations
        a = 0; b = 0; cin = 0; #10;
        a = 0; b = 0; cin = 1; #10;
        a = 0; b = 1; cin = 0; #10;
        a = 0; b = 1; cin = 1; #10;
        a = 1; b = 0; cin = 0; #10;
        a = 1; b = 0; cin = 1; #10;
        a = 1; b = 1; cin = 0; #10;
        a = 1; b = 1; cin = 1; #10;

        // End simulation
        #10 $finish;
    end

endmodule
