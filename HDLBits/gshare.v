module top_module(
    input clk,
    input areset,

    input  predict_valid,
    input  [6:0] predict_pc,
    output predict_taken,
    output [6:0] predict_history,

    input train_valid,
    input train_taken,
    input train_mispredicted,
    input [6:0] train_history,
    input [6:0] train_pc
);
    integer i;
    reg [1:0] pht [128];
    reg [6:0] history;
    
    wire [6:0] train_i;
    reg [6:0] predict_i;
    assign train_i=train_pc^train_history;
    assign predict_i=predict_pc^predict_history;
    
    
    assign predict_taken= pht[predict_history^predict_pc][1];
 
    assign predict_history = history;
    
    always@(posedge areset or posedge clk)begin
        if(areset) begin
            for(i=0;i<128;i=i+1) pht[i]<=2'b01;
            //history<=7'b0;
        end
        else if(!train_valid) pht[train_i]<=pht[train_i];
		else begin
        	if(train_taken) pht[train_i]<=(pht[train_i]!=2'b11)?pht[train_i]+1'b1:2'b11;
        	else pht[train_i]<=(pht[train_i]!=2'b00)?pht[train_i]-1'b1:2'b00;
        end
    end
    
    always@(posedge areset or posedge clk)begin
        if(areset) history<=7'b0;
        else if(train_valid&&train_mispredicted) history<={train_history[5:0],train_taken}; //key &&
        else if(predict_valid) history<={history[5:0],predict_taken};
        else history<=history;
    end
endmodule
