module jk_ff(
    input clk,
    input rstn,
    input j,
    input k,
    output reg q
);

    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            q <= 0;
        end
        else begin
            q <= (j & ~q) | (~k & q);
        end
    end
endmodule