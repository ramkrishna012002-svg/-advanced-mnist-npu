module weight_buffer #(
    parameter DEPTH = 8192,
    parameter ADDR_WIDTH = 13
) (
    input  wire               clk,
    input  wire               we,
    input  wire [ADDR_WIDTH-1:0] wr_addr,
    input  wire signed [7:0]  wr_data,
    input  wire [ADDR_WIDTH-1:0] rd_addr,
    output reg  signed [7:0]  rd_data
);

    reg signed [7:0] mem [0:DEPTH-1];

    always @(posedge clk) begin
        if (we)
            mem[wr_addr] <= wr_data;

        rd_data <= mem[rd_addr];
    end

endmodule
