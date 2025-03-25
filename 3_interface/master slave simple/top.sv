module d_top(ms_if tif);
    master m0(tif.master);
    slave s0(tif.slave);
endmodule