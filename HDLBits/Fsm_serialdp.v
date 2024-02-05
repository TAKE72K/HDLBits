module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output reg [7:0] out_byte,
    output done
); //

	parameter idle=2'b00, receive=2'b01, check=2'b10, halt=2'b11, ok=3'b100;
    reg [2:0] cs,ns;
    reg [3:0] cnt;
    reg par;
    // Use FSM from Fsm_serial
    always@(posedge clk)begin
        if(reset) begin 
            cs<=0;
            cnt<=0;
            done<=0;
            par<=0;
        end
        else begin
            cs<=ns;

            if(cs==receive) begin
                cnt<=cnt+1;
                out_byte<=(cnt==8)?out_byte:{in, out_byte[7:1]};
                par<=(cnt==0)?in:par^in;
            end
            else if(cs==check) begin
                cnt<=0;
                done<=(in)?par:0;
            end
            else if(cs==idle) begin
                done<=0;
                out_byte<=8'b0;
                par<=0;
            end
        end
    end
    always@(*)begin
        case(cs)
            idle: begin
                ns=(in)?idle:receive;
            end
            receive: ns=(cnt==8)?check:receive;
            check: begin
                ns=(in)?idle:halt;
            end
            halt: ns=(in)?idle:halt;
        endcase
    end
    // New: Add parity checking.

endmodule
