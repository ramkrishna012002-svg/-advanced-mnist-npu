module maxpool2x2 (
    input  wire signed [7:0] p00,
    input  wire signed [7:0] p01,
    input  wire signed [7:0] p10,
    input  wire signed [7:0] p11,
    output reg  signed [7:0] y
);

    reg signed [7:0] m0;
    reg signed [7:0] m1;

    always @* begin
        m0 = (p00 > p01) ? p00 : p01;
        m1 = (p10 > p11) ? p10 : p11;
        y  = (m0  > m1)  ? m0  : m1;
    end

endmodule
