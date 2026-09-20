module relu (
    input  wire signed [31:0] data_in,
    output wire signed [31:0] data_out
);

    assign data_out = data_in[31] ? 32'sd0 : data_in;

endmodule
