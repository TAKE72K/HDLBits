module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    parameter LEFT=0, RIGHT=1;
    reg cs, ns;

    always @(*) begin
        case(cs)
            LEFT: ns=(bump_left)?RIGHT:LEFT;
            RIGHT: ns=(bump_right)?LEFT:RIGHT;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset) cs<=LEFT;
        else cs<=ns;
    end

    // Output logic
    assign walk_left = (cs==LEFT);
    assign walk_right = (cs==RIGHT);

endmodule
