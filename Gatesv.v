module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );
    assign out_both={in[3]&in[2], in[2]&in[1], in[1]&in[0]};
    assign out_any[3:1]={in[3]|in[2], in[2]|in[1], in[1]|in[0]};
    assign out_different={in[3]^in[0], in[2]^in[3], in[1]^in[2], in[0]^in[1]};
endmodule

//assign out_any = in[3:1] | in[2:0];

	//assign out_both = in[2:0] & in[3:1];
	
	// XOR 'in' with a vector that is 'in' rotated to the right by 1 position: {in[0], in[3:1]}
	// The rotation is accomplished by using part selects[] and the concatenation operator{}.
	//assign out_different = in ^ {in[0], in[3:1]};