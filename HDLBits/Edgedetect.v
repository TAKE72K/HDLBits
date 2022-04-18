module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] in_prev;
    always@(posedge clk)begin
        
        for(int i=0;i<8;i=i+1)begin
            pedge[i]=(in[i]==1&&in_prev[i]==0)?1:0;
        end
        in_prev=in;
    end
    
endmodule
/*
module top_module(
	input clk,
	input [7:0] in,
	output reg [7:0] pedge);
	
	reg [7:0] d_last;	
			
	always @(posedge clk) begin
		d_last <= in;			// Remember the state of the previous cycle
		pedge <= in & ~d_last;	// A positive edge occurred if input was 0 and is now 1.
	end
	
endmodule

*/