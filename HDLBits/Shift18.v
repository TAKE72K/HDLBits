module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
    always@(posedge clk)begin
        if(load) q<=data;
        else if(ena) begin
            case(amount)
                2'h0: q<=q<<<1;
                2'h1: q<=q<<<8;
                2'h2: q<={q[63],q[63:1]};
                2'h3: q<={{8{q[63]}},q[63:8]};
            endcase
        end
    end
endmodule
