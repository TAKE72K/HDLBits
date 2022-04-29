module model #(parameter
  DATA_WIDTH = 32
) (
  input clk,
  input resetn,
  input [DATA_WIDTH-1:0] din,
  output logic [DATA_WIDTH-1:0] dout
);
reg [DATA_WIDTH-1:0] max,min;
assign dout=min;

  always@(posedge clk)begin
    if(!resetn)begin
      max<='0;
      min<='0;
    end
    else begin
      if(din>max) begin
        max<=din;
        min<=max;
      end
      else begin
        min<=(din>min)?din:min;
      end
    end
  end
endmodule