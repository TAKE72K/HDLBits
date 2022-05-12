module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] a,
  input  [DATA_WIDTH-1:0] b,
  output logic [DATA_WIDTH-1:0] a_plus_b,
  output logic [DATA_WIDTH-1:0] a_minus_b,
  output logic [DATA_WIDTH-1:0] not_a,
  output logic [DATA_WIDTH-1:0] a_and_b,
  output logic [DATA_WIDTH-1:0] a_or_b,
  output logic [DATA_WIDTH-1:0] a_xor_b
);
  assign a_and_b=a&b;
  assign a_minus_b=a-b;
  assign not_a=~a;
  assign a_or_b=a|b;
  assign a_plus_b=a+b;
  assign a_xor_b=a^b;
endmodule