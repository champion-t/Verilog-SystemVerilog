module tb();
    reg             en;
    reg     [3:0]   in;
    wire    [15:0]  out;
    integer         i;

    dec_4x16 dut(
        .en(en),
        .in(in),
        .out(out)
    );

    initial begin
        $dumpfile("design.vcd");
        $dumpvars(0, tb);

        en <= 0;
        in <= 0;

        $monitor("en=%0b in=%4b out=%16b", en, in, out);

        for (i = 0; i < 32; i = i + 1) begin
            {en, in} = i;
            #10;
        end
    end
endmodule