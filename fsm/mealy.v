// Mealy FSM to detect sequence 101
module mealy_fsm (
    input clk,
    input reset,
    input x,         // Serial input
    output reg z     // Output goes high when sequence 101 is detected
);

    // State encoding
    typedef enum reg [1:0] {
        S0 = 2'b00,   // Initial state
        S1 = 2'b01,   // Detected '1'
        S2 = 2'b10    // Detected '10'
    } state_t;

    state_t current_state, next_state;

    // State transition logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end
endmodule
    // Next state and output logic (Mealy)
   
