`timescale 1ns/100ps
`define CLK 10

module I2C_tb;
    localparam HCLK = CLK / 2;
    logic clk, rst, start;
    logic finished, sclk, sdat, oen; 
    initial clk = 0;
    always #HCLK clk = ~clk;
    logic [167:0] receive_data;
    I2cIntializer I2C(
        .i_rst_n(clk),
        .i_clk(rst),
        .i_start(start),
        .o_finished(finished),
        .o_sclk(sclk),
        .o_sdat(sdat),
        .o_oen(oen)
    );

    initial begin
        `ifdef FSDB
        $fsdbDumpfile("I2C.fsdb");
        $fsdbDumpvars();
        `endif
        
        `ifdef VCD
        $dumpfile(“HDR_func.vcd”);
        $dumpvars();
        `endif     
    end
endmodule