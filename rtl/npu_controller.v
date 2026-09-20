module npu_controller #(
    parameter MAC_CYCLES = 8
) (
    input  wire clk,
    input  wire rst,
    input  wire start,
    output reg  busy,
    output reg  done,
    output reg  compute_en,
    output reg [15:0] cycle_count
);

    always @(posedge clk) begin
        if (rst) begin
            busy       <= 1'b0;
            done       <= 1'b0;
            compute_en <= 1'b0;
            cycle_count <= 16'd0;
        end else begin
            done <= 1'b0;

            if (start && !busy) begin
                busy        <= 1'b1;
                compute_en  <= 1'b1;
                cycle_count <= 16'd0;
            end else if (busy) begin
                compute_en <= 1'b1;

                if (cycle_count == MAC_CYCLES-1) begin
                    busy        <= 1'b0;
                    compute_en  <= 1'b0;
                    done        <= 1'b1;
                    cycle_count <= 16'd0;
                end else begin
                    cycle_count <= cycle_count + 1'b1;
                end
            end else begin
                compute_en <= 1'b0;
            end
        end
    end

endmodule
