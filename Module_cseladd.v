module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire c;
    wire [15:0] s1,s2;
    add16 add1(a[15:0],b[15:0],1'b0,sum[15:0],c);
    add16 add2(a[31:16],b[31:16],1'b0,s1);
    add16 add3(a[31:16],b[31:16],1'b1,s2);
    assign sum[31:16]=(c==0)?s1:s2;
    
endmodule
