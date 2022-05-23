module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output reg aaah ); 
    reg [1:0] cs,ns;
    parameter LEFT=0, RIGHT=1, FALL=2;
    always@(posedge clk,posedge areset)begin
        if(areset) cs<=LEFT;
        else cs<=ns;
    end
    
    always@(*)begin
        case(cs)
            LEFT: ns=(bump_left&~aaah&ground)?RIGHT:LEFT;
            RIGHT: ns=(bump_right&~aaah&ground)?LEFT:RIGHT;
        endcase
    end
    
    always@(posedge clk,posedge areset)begin
        if(areset)begin
            //walk_left<=1;
            //walk_right<=0;
            aaah<=0;
        end
        else begin
            aaah<=(ground)?0:1;
            //walk_right<=(cs==RIGHT&ground);
           // walk_left<=(cs==LEFT&ground);
        end
    end
    
    assign walk_right=(cs==RIGHT&~aaah);
    assign walk_left=(cs==LEFT&~aaah);
    
endmodule
