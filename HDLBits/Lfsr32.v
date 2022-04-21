module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output reg [31:0] q
); 
    reg [31:0] q_nxt;
    always@(*)begin
        q_nxt=q[31:1];
        q_nxt[31]=q[0];
        q_nxt[0]=q[0]^q[1];
        q_nxt[1]=q[0]^q[2];
        q_nxt[21]=q[0]^q[22];
        //q_nxt[31]=q[31]^q[0];
    end
    always@(posedge clk)begin
        if(reset) q<=32'h1;
        else q<=q_nxt;
    end
endmodule
