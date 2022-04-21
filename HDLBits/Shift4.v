module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 
    integer i;
    always@(posedge clk or posedge areset)begin
        if(areset) q<='0;
        else begin
            if(load) begin
                q<=data;
            end
            else begin
                if(ena) begin
                    for(i=0;i<3;i=i+1)begin
                        q[i]<=q[i+1];
                    end
                    q[3]<=0;
                end
                else q<=q;
            end
        end
    end
endmodule
/*
module top_module(
	input clk,
	input areset,
	input load,
	input ena,
	input [3:0] data,
	output reg [3:0] q);
	
	// Asynchronous reset: Notice the sensitivity list.
	// The shift register has four modes:
	//   reset
	//   load
	//   enable shift
	//   idle -- preserve q (i.e., DFFs)
	always @(posedge clk, posedge areset) begin
		if (areset)		// reset
			q <= 0;
		else if (load)	// load
			q <= data;
		else if (ena)	// shift is enabled
			q <= q[3:1];	// Use vector part select to express a shift.
	end
	
endmodule
*/