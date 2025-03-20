module lshift_4b_reg(
    input clk,
    input rstn,
    input d,
    output reg [3:0] out
);

    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            out <= 0;
        end
        else begin
            out <= {out[2:0], d};
        end
    end
endmodule