module model #(parameter
  DATA_WIDTH = 16
) (
  input [DATA_WIDTH-1:0] din,
  output logic [$clog2(DATA_WIDTH):0] dout
);
  integer i;
  reg [$clog2(DATA_WIDTH):0] a;
  assign dout=a;
  always@(*)begin
    a=0;
    for(i=0;i<DATA_WIDTH;i=i+1)begin
      a=a+din[i];
    end
  end
endmodule