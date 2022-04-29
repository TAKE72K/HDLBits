module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg cs, ns;

    always @(posedge clk) begin
        if(reset) cs=OFF;
        else cs=ns;
    end

    always @(*) begin
        case(cs)
            OFF: ns=(j==0)?OFF:ON;
            ON:  ns=(k==0)?ON:OFF;
        endcase
    end

    // Output logic
    assign out=cs;

endmodule
