module model #(parameter
  DATA_WIDTH = 16
) (
  input clk,
  input resetn,
  input din,
  output logic [DATA_WIDTH-1:0] dout
);
  logic [DATA_WIDTH-1:0] d;
  assign dout=d;
  always@(posedge clk) begin
    if(!resetn) d<='0;
    else begin
      d<=d<<1;
      d[0]<=din;
    end
  end
endmodule