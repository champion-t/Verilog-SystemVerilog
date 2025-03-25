module slave(ms_if.slave sif);
    reg [7:0] reg_a;
    reg [7:0] reg_b;
    reg [7:0] reg_c;
    reg [7:0] reg_d;

    reg [1:0] addr_dly;
    reg       dly;

    always @(posedge sif.clk) begin
        if(!sif.rstn) begin
            addr_dly <= 0;
        end
        else begin
            addr_dly <= sif.addr;
        end
    end

    always @(posedge sif.clk) begin
        if (!sif.rstn) begin
            reg_a <= 0;
            reg_b <= 0;
            reg_c <= 0;
            reg_d <= 0;
        end
        else begin
            case(addr_dly)
                0: reg_a <= sif.data;
                1: reg_b <= sif.data;
                2: reg_c <= sif.data;
                3: reg_d <= sif.data;
            endcase
        end
    end

    assign sif.sready = ~(sif.data[1] & sif.data[0]) | ~dly;

    always @(posedge sif.clk) begin
        if(!sif.rstn) begin
            dly <= 1;
        end
        else begin
            dly <= sif.sready;
        end
    end
endmodule