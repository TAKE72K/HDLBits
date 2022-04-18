module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] in_prev;
    always@(posedge clk)begin            
        if(reset)begin
            out='0;
        end
        else begin
            out=(~in&in_prev)|out;

        end
        in_prev=in;
    end
endmodule
