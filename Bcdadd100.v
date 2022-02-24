module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    wire carry[100:0];
    assign carry[0]=cin;
    assign cout=carry[100];
    
	generate
        genvar i;
        for(i=0;i<100;i++)begin : bcd
            bcd_fadd add(a[i*4+3:i*4],b[i*4+3:i*4],carry[i],carry[i+1],sum[i*4+3:i*4]);
        end
    endgenerate
endmodule
