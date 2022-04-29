module model #(parameter
  DIV_LOG2=3,
  OUT_WIDTH=32,
  IN_WIDTH=OUT_WIDTH+DIV_LOG2
) (
  input [IN_WIDTH-1:0] din,
  output logic [OUT_WIDTH-1:0] dout
);
  wire [OUT_WIDTH:0] d;
  assign d = (din>>DIV_LOG2)+din[DIV_LOG2-1];
  assign dout = (d[OUT_WIDTH])?(din>>DIV_LOG2):d[OUT_WIDTH-1:0];
endmodule