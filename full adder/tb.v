module tb();
    reg a;
    reg b;
    reg cin;
    wire sum;
    wire cout;
    integer i;

    fa dut(
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("design.vcd");
        $dumpvars(0, tb);

        a <= 0;
        b <= 0;
        cin <= 0;

        $monitor("a=%0b b=%0b cin=%0b sum=%0b cout=%0b", a, b, cin, sum, cout);

        for (i = 0 ; i < 8; i = i + 1) begin
            {a, b, cin} = i;
            #10;
        end
    end
endmodule