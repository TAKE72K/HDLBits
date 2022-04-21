// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations

    reg cs, ns;

    always @(posedge clk) begin
        if (reset) begin  
            cs='1;
        end 
        else begin
            cs=ns;
        end
    end
    always@(*)begin
        ns=(in)?cs:~cs;
    end
	assign out=cs;
endmodule
