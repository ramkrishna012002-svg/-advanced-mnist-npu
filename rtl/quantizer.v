module quantizer #(
    parameter SHIFT = 5
) (
    input  wire signed [31:0] data_in,
    output reg  signed [7:0]  data_out
);

    reg signed [31:0] scaled;

    always @* begin
        scaled = data_in >>> SHIFT;

        if (scaled > 32'sd127)
            data_out = 8'sd127;
        else if (scaled < -32'sd128)
            data_out = -8'sd128;
        else
            data_out = scaled[7:0];
    end

endmodule
