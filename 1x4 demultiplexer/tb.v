module tb();
    reg f;
    reg [1:0] sel;
    wire a;
    wire b;
    wire c;
    wire d;
    integer i;

    demux_1x4 dut(
        .f(f),
        .sel(sel),
        .a(a),
        .b(b),
        .c(c),
        .d(d)
    );

    initial begin
        $dumpfile("design.vcd");
        $dumpvars(0, tb);

        f <= 0;
        sel <= 0;

        $monitor("f=%0b sel=%2b a=%0b b=%0b c=%0b d=%0b", f, sel, a, b, c, d);

        for (i = 0; i < 8; i = i + 1) begin
            {f, sel} = i;
            #10;
        end
    end
endmodule