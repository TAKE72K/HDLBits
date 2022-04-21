module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg [3:0] q;
    assign out=q[0];
    always@(posedge clk)begin
        if(!resetn)q<='0;
        else begin
            q<=q[3:1];
            q[3]<=in;
        end
    end
    
endmodule