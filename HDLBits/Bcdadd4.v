
module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire [3:0] carry;
    bcd_fadd b0(.a(a[0+:4]), .b(b[0+:4]),.cin(cin), .cout(carry[0]), .sum(sum[0+:4]));
    bcd_fadd b1(.a(a[4+:4]), .b(b[4+:4]),.cin(carry[0]), .cout(carry[1]), .sum(sum[4+:4]));
    bcd_fadd b2(.a(a[8+:4]), .b(b[8+:4]),.cin(carry[1]), .cout(carry[2]), .sum(sum[8+:4]));
    bcd_fadd b3(.a(a[12+:4]), .b(b[12+:4]),.cin(carry[2]), .cout(cout), .sum(sum[12+:4]));
endmodule





/*



module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire [3:0] carry;
    bcd bcd0(a[0 +:4],b[0 +:4],cin,sum[0 +:4], carry[0]);
    bcd bcd1(a[4 +:4],b[4 +:4],carry[0],sum[4 +:4], carry[1]);
    bcd bcd2(a[8 +:4],b[8 +:4],carry[1],sum[8 +:4], carry[2]);
    bcd bcd3(a[12 +:4],b[12 +:4],carry[2],sum[12 +:4], cout);
endmodule
module bcd(input [3:0] a,b,cin,
           output [3:0] s, output cout);
    always@(*)begin
        if(a+b+cin>5'd9)begin
            cout=1'b1;
            s=(a+b)-4'd10+cin;
        end
        else begin
            cout=1'b0;
            s=a+b+cin;
        end
    end
endmodule*/