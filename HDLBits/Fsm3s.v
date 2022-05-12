module top_module(
    input clk,
    input in,
    input reset,
    output out); //
    reg [1:0] cs,ns;
    parameter [1:0] A=0, B=1, C=2, D=3;
    // State transition logic
    always@(*)begin
        case(cs)
            A: ns = in ? B : A;
            B: ns = in ? B : C;
            C: ns = in ? D : A;
            D: ns = in ? B : C;
        endcase
    end
    // State flip-flops with synchronous reset
    always@(posedge clk) begin
        if(reset) cs <= A;
        else cs <= ns;
    end
    // Output logic
    assign out = (cs==D);
endmodule
