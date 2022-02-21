module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] b_sub;
    wire c,d;
    assign b_sub={32{sub}}^b;
    add16 add1(a[15:0],b_sub[15:0],sub,sum[15:0],c);
    add16 add2(a[31:16],b_sub[31:16],c,sum[31:16],d);
endmodule
