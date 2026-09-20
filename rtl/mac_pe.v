module mac_pe (
    input  wire               clk,
    input  wire               rst,
    input  wire               en,
    input  wire signed [7:0]  a_in,
    input  wire signed [7:0]  w_in,
    output reg  signed [7:0]  a_out,
    output reg  signed [7:0]  w_out,
    output reg  signed [31:0] acc_out
);

    reg signed [15:0] product;

    always @(posedge clk) begin
        if (rst) begin
            a_out   <= 8'sd0;
            w_out   <= 8'sd0;
            acc_out <= 32'sd0;
        end else if (en) begin
            a_out   <= a_in;
            w_out   <= w_in;
            product = a_in * w_in;
            acc_out <= acc_out + {{16{product[15]}}, product};
        end
    end

endmodule
