module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
	parameter idle=1, a=2,b=3,c=4,d=5,e=6,f=7,dis=8,fl=9,errr=10;
    reg [3:0] ns,cs;
    
    assign disc=(cs==dis)?1:0;
    assign flag=(cs==fl)?1:0;
    assign err=(cs==errr)?1:0;
    always@(posedge clk)begin
        if(reset) begin
            cs<=idle;
        end
        else begin
            cs<=ns;
        end
    end
    
    always@(*)begin
        case(cs)
            idle:
                ns=(in)?a:idle;
            a:
                ns=(in)?b:idle;
            b:
                ns=(in)?c:idle;
            c:
                ns=(in)?d:idle;
            d:
                ns=(in)?e:idle;
            e:
                ns=(in)?f:dis;
            f:
                ns=(in)?errr:fl;
            dis:
                ns=(in)?a:idle;
            fl:
                ns=(in)?a:idle;
            errr:
                ns=(in)?errr:idle;
        endcase
    end
endmodule
