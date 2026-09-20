module relu(input wire signed [31:0] in_data,output wire signed [31:0] out_data); assign out_data=in_data[31]?32'sd0:in_data; endmodule
