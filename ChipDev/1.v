module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  input  din_en,
  input  [1:0] addr,
  output logic [DATA_WIDTH-1:0] dout0,
  output logic [DATA_WIDTH-1:0] dout1,
  output logic [DATA_WIDTH-1:0] dout2,
  output logic [DATA_WIDTH-1:0] dout3
);
  always@(*)begin
      dout0='0;
      dout1='0;
      dout2='0;
      dout3='0;
    if(din_en)begin
      
    case(addr)
      0: dout0=din;
      1: dout1=din;
      2: dout2=din;
      3: dout3=din;
    endcase
    end
  end
endmodule