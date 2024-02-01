module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    reg [2:0] cs,ns;
    reg [4:0] cnt;
    parameter WL=3'd0, WR=3'd1, DL=3'd2, DR=3'd3, FL=3'd4, FR=3'd5, DEAD=3'd6;
    wire [3:0] io;
    assign {walk_left, walk_right,aaah,digging}=io;
    always@(posedge clk or posedge areset)begin
        if(areset) begin
            cs<=3'b0;
        end
        else cs<=ns;
    end
    //death count
    always@(posedge clk or posedge areset)begin
        if(areset) cnt<=0;
        else if(ground==1) cnt<=(cnt>20)?cnt:0;
        else cnt<=(cnt==5'd21)?5'd21:cnt+1;
    end
    //ns
    always@(*)begin
        case(cs)
            WL: begin
                ns=(ground)?(dig)?DL:(bump_left)?WR:WL:FL; //wl
                io=4'b1000;
            end
            WR: begin
                ns=(ground)?(dig)?DR:(bump_right)?WL:WR:FR; //wr
                io=4'b0100;
            end
            DL: begin
                ns=(ground)?DL:FL; //dl
                io=4'b0001;
            end
            DR: begin
                ns=(ground)?DR:FR;
                io=4'b0001;            
            end
            FL: begin
                ns=(ground)?(cnt>20)?DEAD:WL:FL;
                io=4'b0010;
            end
            FR: begin
                ns=(ground)?(cnt>20)?DEAD:WR:FR;
                io=4'b0010;
            end
            DEAD: begin
                ns=DEAD;
                io=4'b0000;
            end
        endcase
    end
endmodule
