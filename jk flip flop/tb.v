module tb();
    reg clk;
    reg rstn;
    reg j;
    reg k;
    reg [2:0] dly;
    wire q;
    integer i;

    always #5 clk = ~clk;

    jk_ff dut(
        .clk(clk),
        .rstn(rstn),
        .j(j),
        .k(k),
        .q(q)
    );
  
    initial begin
        $dumpfile("design.vcd");
        $dumpvars(0, tb);

        {clk, rstn, j, k} <= 0;
        #10 rstn <= 1;

        for (i = 0; i < 10; i = i+1) begin
			dly = $random;
			#(dly) j <= $random;
			#(dly) k <= $random;
		end

		#20 $finish;
    end
endmodule