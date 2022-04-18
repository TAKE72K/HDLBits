module top_module( 
    input [254:0] in,
    output [7:0] out );
    always @(*)begin
        out=0;
        for(integer j=0;j<255;j++)begin
            out=out+in[j];
        end
        
    end
endmodule