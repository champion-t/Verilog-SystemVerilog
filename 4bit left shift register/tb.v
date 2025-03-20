module tb();
    reg clk;
    reg rstn;
    reg d;
    wire [3:0] out;
    integer i;

    lshift_4b_reg dut(
        .clk(clk),
        .rstn(rstn),
        .d(d),
        .out(out)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("design.vcd");
        $dumpvars(0, tb);

        {clk, rstn, d} <= 0;
        #10 rstn <= 1;

        for (i = 0; i < 20; i = i + 1) begin
            @(posedge clk) d <= $random;
        end

        #10 $finish();
    end
endmodule