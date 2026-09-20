module object_detection_npu_tb;

    reg clk;
    reg rst;
    reg start;

    reg signed [7:0] a [0:7];
    reg signed [7:0] w [0:7];

    wire signed [31:0] y [0:7];
    wire busy;
    wire done;

    integer i;

    object_detection_npu_top dut (
        .clk(clk),
        .rst(rst),
        .start(start),

        .a_in_0(a[0]), .a_in_1(a[1]),
        .a_in_2(a[2]), .a_in_3(a[3]),
        .a_in_4(a[4]), .a_in_5(a[5]),
        .a_in_6(a[6]), .a_in_7(a[7]),

        .w_in_0(w[0]), .w_in_1(w[1]),
        .w_in_2(w[2]), .w_in_3(w[3]),
        .w_in_4(w[4]), .w_in_5(w[5]),
        .w_in_6(w[6]), .w_in_7(w[7]),

        .y_0(y[0]), .y_1(y[1]), .y_2(y[2]), .y_3(y[3]),
        .y_4(y[4]), .y_5(y[5]), .y_6(y[6]), .y_7(y[7]),

        .busy(busy),
        .done(done)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        rst = 1'b1;
        start = 1'b0;

        for (i = 0; i < 8; i = i + 1) begin
            a[i] = i + 1;
            w[i] = 1;
        end

        #20;
        rst = 1'b0;

        #10;
        start = 1'b1;
        #10;
        start = 1'b0;

        wait(done);

        $display("NPU completed.");
        for (i = 0; i < 8; i = i + 1)
            $display("Y[%0d] = %0d", i, y[i]);

        #20;
        $finish;
    end

endmodule
