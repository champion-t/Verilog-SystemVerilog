module tb();
    reg clk;
    reg rstn;
    wire [3:0] out;

    mod10_counter dut(
        .clk(clk),
        .rstn(rstn),
        .out(out)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("design.vcd");
        $dumpvars(0, tb);

        {clk, rstn} <= 0;

        #10 rstn <= 1;
        #400 $finish;
    end
endmodule