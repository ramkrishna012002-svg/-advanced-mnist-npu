module bias_add(input wire signed [31:0] data_in,input wire signed [31:0] bias,output wire signed [31:0] data_out); assign data_out=data_in+bias; endmodule
