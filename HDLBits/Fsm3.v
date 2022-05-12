module top_module(
    input clk,
    input in,
    input areset,
    output out); //
    reg [1:0] ns,cs;
    // State transition logic
    always@(posedge clk or posedge areset)begin
        if(areset) cs<=0;
        else cs<=ns;
    end
    // State flip-flops with asynchronous reset
    always@(*)begin
        if(cs==0) ns=in? 1:0;
        else if(cs==1) ns=in?1:2;
        else if(cs==2) ns=in?3:0;
        else if(cs==3) ns=in?1:2;
    end
    // Output logic
	assign out=cs==3?1:0;
endmodule
