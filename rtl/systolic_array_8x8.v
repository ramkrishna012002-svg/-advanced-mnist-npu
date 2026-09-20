module systolic_array_8x8 (
    input  wire                clk,
    input  wire                rst,
    input  wire                en,

    input  wire signed [7:0]   a_in_0,
    input  wire signed [7:0]   a_in_1,
    input  wire signed [7:0]   a_in_2,
    input  wire signed [7:0]   a_in_3,
    input  wire signed [7:0]   a_in_4,
    input  wire signed [7:0]   a_in_5,
    input  wire signed [7:0]   a_in_6,
    input  wire signed [7:0]   a_in_7,

    input  wire signed [7:0]   w_in_0,
    input  wire signed [7:0]   w_in_1,
    input  wire signed [7:0]   w_in_2,
    input  wire signed [7:0]   w_in_3,
    input  wire signed [7:0]   w_in_4,
    input  wire signed [7:0]   w_in_5,
    input  wire signed [7:0]   w_in_6,
    input  wire signed [7:0]   w_in_7,

    output wire signed [31:0]  y_0,
    output wire signed [31:0]  y_1,
    output wire signed [31:0]  y_2,
    output wire signed [31:0]  y_3,
    output wire signed [31:0]  y_4,
    output wire signed [31:0]  y_5,
    output wire signed [31:0]  y_6,
    output wire signed [31:0]  y_7
);

    wire signed [7:0] a [0:7][0:7];
    wire signed [7:0] w [0:7][0:7];
    wire signed [31:0] acc [0:7][0:7];

    wire signed [7:0] a_left [0:7];
    wire signed [7:0] w_top  [0:7];

    assign a_left[0] = a_in_0;
    assign a_left[1] = a_in_1;
    assign a_left[2] = a_in_2;
    assign a_left[3] = a_in_3;
    assign a_left[4] = a_in_4;
    assign a_left[5] = a_in_5;
    assign a_left[6] = a_in_6;
    assign a_left[7] = a_in_7;

    assign w_top[0] = w_in_0;
    assign w_top[1] = w_in_1;
    assign w_top[2] = w_in_2;
    assign w_top[3] = w_in_3;
    assign w_top[4] = w_in_4;
    assign w_top[5] = w_in_5;
    assign w_top[6] = w_in_6;
    assign w_top[7] = w_in_7;

    genvar r, c;
    generate
        for (r = 0; r < 8; r = r + 1) begin : ROW
            for (c = 0; c < 8; c = c + 1) begin : COL
                if (c == 0 && r == 0) begin : PE00
                    mac_pe pe (
                        .clk(clk), .rst(rst), .en(en),
                        .a_in(a_left[r]), .w_in(w_top[c]),
                        .a_out(a[r][c]), .w_out(w[r][c]),
                        .acc_out(acc[r][c])
                    );
                end else if (c == 0) begin : PE_ROW
                    mac_pe pe (
                        .clk(clk), .rst(rst), .en(en),
                        .a_in(a_left[r]), .w_in(w[r-1][c]),
                        .a_out(a[r][c]), .w_out(w[r][c]),
                        .acc_out(acc[r][c])
                    );
                end else if (r == 0) begin : PE_COL
                    mac_pe pe (
                        .clk(clk), .rst(rst), .en(en),
                        .a_in(a[r][c-1]), .w_in(w_top[c]),
                        .a_out(a[r][c]), .w_out(w[r][c]),
                        .acc_out(acc[r][c])
                    );
                end else begin : PE_MIDDLE
                    mac_pe pe (
                        .clk(clk), .rst(rst), .en(en),
                        .a_in(a[r][c-1]), .w_in(w[r-1][c]),
                        .a_out(a[r][c]), .w_out(w[r][c]),
                        .acc_out(acc[r][c])
                    );
                end
            end
        end
    endgenerate

    assign y_0 = acc[7][0];
    assign y_1 = acc[7][1];
    assign y_2 = acc[7][2];
    assign y_3 = acc[7][3];
    assign y_4 = acc[7][4];
    assign y_5 = acc[7][5];
    assign y_6 = acc[7][6];
    assign y_7 = acc[7][7];

endmodule
