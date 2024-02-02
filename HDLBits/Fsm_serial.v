module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output reg done
); 
    // caution: this is a very ugly model sim monkey solution
    reg [3:0] cnt;
    
    always@(posedge clk)begin
        if(reset) begin
            cnt<=0;
            done<=0;
        end
        else if(in&&cnt>4'd9) begin
            cnt<=0;
            done<=1'b0;
        end
        else if(in&&cnt==4'd9) begin
            cnt<=0;
            done<=1'b1;
        end
        else if(in==1'b0) begin
            cnt<=(cnt==4'd10)?cnt:cnt+1'b1;
        	done<=1'b0;
        end
        else if(cnt>4'd0) cnt<=(cnt==4'd10)?cnt:cnt+1'b1;
        else done<=0;
    end
endmodule
