module model (
  input clk,
  input resetn,
  input din,
  output dout
);
  reg q;
  reg rdout;
  assign dout=rdout;
  always@(posedge clk)begin
    if(!resetn)begin
      q<=0;
      rdout<=0;
    end
    else begin
      rdout<=(din>q)?1:0;
      q<=din;
    end
  end
endmodule