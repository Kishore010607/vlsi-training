module moore_fsm (
    input clk,
    input reset,
    input x,
    output reg z
);

    // State encoding
    typedef enum logic [2:0] {
        S0 = 3'b000, // Initial state
        S1 = 3'b001, // Detected '1'
        S2 = 3'b010, // Detected '10'
        S3 = 3'b011  // Detected '101' → output z = 1
    } state_t;

    state_t current_state, next_state;

    // State transition logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            S0: next_state = x ? S1 : S0;
            S1: next_state = x ? S1 : S2;
            S2: next_state = x ? S3 : S0;
            S3: next_state = x ? S1 : S2;
            default: next_state = S0;
        endcase
    end

    // Output logic (Moore: depends only on state)
    always @(*) begin
        case (current_state)
            S3: z = 1;
            default: z = 0;
        endcase
    end

endmodule
