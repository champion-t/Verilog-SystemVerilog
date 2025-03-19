module tb();
    reg a;
    reg b;
    wire sum;
    wire cout;
    integer i;

    ha dut(
        .a(a),
        .b(b),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("design.vcd");
        $dumpvars(0, tb);

        a <= 0;
        b <= 0;

        $monitor("a=%0b b=%0b sum=%0b cout=%0b", a, b, sum, cout);

        for (i = 0; i < 4; i = i + 1) begin
            {a, b} = i;
            #10;
        end
    end
endmodule