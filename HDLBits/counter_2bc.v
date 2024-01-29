module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);
    reg [1:0] count;
    assign state=count;
    always@(posedge clk or posedge areset)begin
        if(areset) count<=2'b01;
        else if(!train_valid) count<=count;
        else begin
            if(train_taken)count<=(count!=2'b11)?count+1'b1:count;
            else count<=(count!=2'b00)?count-1'b1:count;
        end
    end
endmodule
