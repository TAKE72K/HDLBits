module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //
    reg [3:0] c_q;
    count4 the_counter (clk, c_enable, c_load, c_d, c_q);
    assign Q=c_q;
    assign c_enable=enable;
    always @(*)begin
        if(reset)begin
            c_load=1'b1;
            c_d=4'd1;
        end
        else begin
            if(enable) begin
                if(c_q==4'd12)begin
                    c_load=1'd1;
                    c_d=4'd1;
                end
                else begin
                    c_load=0;
                end
            end
            else begin
                c_load=0;
            end
        end
    end
    

endmodule
