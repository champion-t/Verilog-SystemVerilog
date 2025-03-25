interface ms_if(input clk);
    logic sready;
    logic rstn;
    logic [1:0] addr;
    logic [7:0] data;

    modport slave (input clk, rstn, addr, data,
                    output sready);

    modport master (input clk, rstn, sready,
                    output addr, data);
endinterface