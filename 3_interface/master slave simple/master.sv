module master(ms_if.master mif);
    always @(posedge mif.clk or negedge mif.rstn) begin
        if(!mif.rstn) begin
            mif.addr <= 0;
            mif.data <= 0;
        end
        else begin
            if(mif.sready) begin
                mif.addr <= mif.addr + 1;
                mif.data <= (mif.addr * 4);
            end
            else begin
                mif.addr <= mif.addr;
                mif.data <= mif.data;
            end
        end
    end
endmodule