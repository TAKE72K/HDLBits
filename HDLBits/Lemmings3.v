module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output reg walk_left,
    output reg walk_right,
    output reg aaah,
    output reg digging ); 
    reg dir;
    always@(posedge clk or posedge areset)begin
        if(areset)begin
            walk_left<=1;
            walk_right<=0;
            aaah<=0;
            digging<=0;
            dir<=0;
        end
        else begin
            if(ground==0) begin
            	walk_left<=0;
            	walk_right<=0;
            	aaah<=1;
            	digging<=0;
            end
            else if(dig&&aaah==0) begin
                walk_left<=0;
            	walk_right<=0;
            	digging<=1;
            end
            else if(digging) begin
                walk_left<=0;
            	walk_right<=0;
            	digging<=1;
            end
            else if(ground==1&&aaah==1)begin
                aaah<=0;
                walk_right<=dir;
                walk_left<=~dir;
            end
            else if(bump_left&&walk_left)begin
                walk_right<=1;
                walk_left<=0;
                dir<=1;
            end
            else if(bump_right&&walk_right)begin
                walk_right<=0;
                walk_left<=1;
                dir<=0;
            end
        end
    end
endmodule
