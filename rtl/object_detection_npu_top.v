module object_detection_npu_top (
    input  wire               clk,
    input  wire               rst,
    input  wire               start,

    input  wire signed [7:0]  a_in_0,
    input  wire signed [7:0]  a_in_1,
    input  wire signed [7:0]  a_in_2,
    input  wire signed [7:0]  a_in_3,
    input  wire signed [7:0]  a_in_4,
    input  wire signed [7:0]  a_in_5,
    input  wire signed [7:0]  a_in_6,
    input  wire signed [7:0]  a_in_7,

    input  wire signed [7:0]  w_in_0,
    input  wire signed [7:0]  w_in_1,
    input  wire signed [7:0]  w_in_2,
    input  wire signed [7:0]  w_in_3,
    input  wire signed [7:0]  w_in_4,
    input  wire signed [7:0]  w_in_5,
    input  wire signed [7:0]  w_in_6,
    input  wire signed [7:0]  w_in_7,

    output wire signed [31:0] y_0,
    output wire signed [31:0] y_1,
    output wire signed [31:0] y_2,
    output wire signed [31:0] y_3,
    output wire signed [31:0] y_4,
    output wire signed [31:0] y_5,
    output wire signed [31:0] y_6,
    output wire signed [31:0] y_7,

    output wire               busy,
    output wire               done
);

    wire compute_en;

    npu_controller #(
        .MAC_CYCLES(8)
    ) controller (
        .clk(clk),
        .rst(rst),
        .start(start),
        .busy(busy),
        .done(done),
        .compute_en(compute_en),
        .cycle_count()
    );

    systolic_array_8x8 systolic (
        .clk(clk),
        .rst(rst),
        .en(compute_en),

        .a_in_0(a_in_0), .a_in_1(a_in_1),
        .a_in_2(a_in_2), .a_in_3(a_in_3),
        .a_in_4(a_in_4), .a_in_5(a_in_5),
        .a_in_6(a_in_6), .a_in_7(a_in_7),

        .w_in_0(w_in_0), .w_in_1(w_in_1),
        .w_in_2(w_in_2), .w_in_3(w_in_3),
        .w_in_4(w_in_4), .w_in_5(w_in_5),
        .w_in_6(w_in_6), .w_in_7(w_in_7),

        .y_0(y_0), .y_1(y_1), .y_2(y_2), .y_3(y_3),
        .y_4(y_4), .y_5(y_5), .y_6(y_6), .y_7(y_7)
    );

endmodule
