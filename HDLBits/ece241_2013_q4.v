module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    parameter s0=2'b00, s1=2'b01, s2=2'b10, s3=2'b11;
    reg [1:0] ns,cs;
    reg [2:0] pre_s;
    
    always@(posedge clk)begin
        if(reset) begin
            cs<=s0;
        	pre_s<=0;
        end
        else begin
            cs<=ns;
            pre_s<=s;
        end
    end
    
    always@(*)begin
        if(s[3]) ns=s3;
        else if(s[2]) ns=s2;
        else if(s[1]) ns=s1;
        else ns=s0;
    end
    
    
    always@(*)begin
        case(cs)
            s0: begin
                
                fr1=1;
                fr2=1;
                fr3=1;
            end
            s1: begin
                
                fr1=1;
                fr2=1;
                fr3=0;
            end
            s2: begin
              
                fr1=1;
                fr2=0;
                fr3=0;
            end
            s3: begin
               
                fr1=0;
                fr2=0;
                fr3=0;
            end
        endcase
    end
    always@(posedge clk)begin
        if(reset) dfr<=1;
        else if(pre_s>s) dfr<=1;
        else if(pre_s<s) dfr<=0;
        else dfr<=dfr;
    end
    
endmodule
