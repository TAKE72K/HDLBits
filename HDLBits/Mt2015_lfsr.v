module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output reg [2:0] LEDR);  // Q
    reg [2:0] q_nxt;
    always@(*)begin
        q_nxt[1]=LEDR[0];
		q_nxt[0]=LEDR[2];
		q_nxt[2]=LEDR[2]^LEDR[1];
    end
    
    always@(posedge KEY[0])begin
        
        if(KEY[1])LEDR<=SW;
        else LEDR<=q_nxt;
    end
endmodule
