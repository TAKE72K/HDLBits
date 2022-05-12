module model #(parameter
  DATA_WIDTH=32
) (
  input clk,
  input resetn,
  output logic [DATA_WIDTH-1:0] out
);
  reg [DATA_WIDTH-1:0] f0,f1;
  //assign out=f0+f1;
  always@(posedge clk)begin
    if(!resetn)begin
      out<=1;
      f1<=0;
    end
    else begin
      f1<=out;
      out<=f1+out;
    end
  end
endmodule