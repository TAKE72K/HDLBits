module model #(parameter
  DATA_WIDTH = 16
) (
  input clk,
  input resetn,
  input [DATA_WIDTH-1:0] din,
  input din_en,
  output logic dout
);
  reg [DATA_WIDTH-1:0] d;
  always@(posedge clk)begin
    if(!resetn)begin
      dout<=0;
      d<=0;
    end
    else begin
      if(din_en) begin
        dout<=din[0];
        d<=din>>1;
      end
      else begin
        dout<=d[0];
        d<=d>>1;
      end
    end
  end
endmodule