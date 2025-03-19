module mux_2x1(
    input a,
    input b,
    input sel,
    output c
);

    assign c = sel ? a : b;
endmodule