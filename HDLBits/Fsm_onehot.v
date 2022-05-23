module top_module(
    input in,
    input [9:0] state,
    output [9:0] next_state,
    output out1,
    output out2);

    always@(in)begin
        next_state=10'h0;
        if(in) begin
            if(state[0]) next_state[1]=1;
            if(state[1]) next_state[2]=1;
            if(state[2]) next_state[3]=1;
            if(state[3]) next_state[4]=1;
            if(state[4]) next_state[5]=1;
            if(state[5]) next_state[6]=1;
            if(state[6]) next_state[7]=1;
            if(state[7]) next_state[7]=1;
            if(state[8]) next_state[1]=1;
            if(state[9]) next_state[1]=1;
        end
        else begin
            if(state[0]) next_state[0]=1;
            if(state[1]) next_state[0]=1;
            if(state[2]) next_state[0]=1;
            if(state[3]) next_state[0]=1;
            if(state[4]) next_state[0]=1;
            if(state[5]) next_state[8]=1;
            if(state[6]) next_state[9]=1;
            if(state[7]) next_state[0]=1;
            if(state[8]) next_state[0]=1;
            if(state[9]) next_state[0]=1;
        end
    end
    assign out1=(state[8]|state[9])?1:0;
    assign out2=(state[7]|state[9])?1:0;
endmodule
