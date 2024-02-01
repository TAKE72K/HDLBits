module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
    reg [1:0] cs,ns;
    // State transition logic (combinational)
    always@(*)begin
        case(cs)
            2'b00: ns=(in[3])?2'b01:2'b00;
            2'b01: ns=2'b10;
            2'b10: ns=2'b11;    
            2'b11: ns=(in[3])?2'b01:2'b00;
        endcase
    end
    // State flip-flops (sequential)
    always@(posedge clk)begin
        if(reset) cs<=0;
        else cs<=ns;
    end
    // Output logic
    assign done=(cs==2'b11)?1:0;
endmodule
