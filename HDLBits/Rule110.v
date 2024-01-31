module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q
); 
    wire [511:0] r,l;
    assign r={q[510:0],1'b0};
    assign l={1'b0,q[511:1]};
    always@(posedge clk)begin
        if(load) q<=data;
        else q<=(q&~r)|(~q&r)|(~l&q&r);
    end
endmodule
