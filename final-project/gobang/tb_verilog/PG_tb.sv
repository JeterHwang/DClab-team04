`timescale 1ns/100ps

typedef logic [1:0] board [225];
module PG_tb;

    parameter CLK   = 10;
    parameter HCLK  = 5;

    board i_board;
    logic clk;
    logic start;
    logic rst_n;
    logic [399:0] X_output;
    logic [399:0] Y_output;
    logic [8:0] buffer_size;
    logic PG_finish;

    point_generator PG(
        .i_clk(clk),
        .i_rst_n(rst_n),
        .i_start(start),
        .i_board(i_board),
        .o_posX(X_output),
        .o_posY(Y_output),
        .o_size(buffer_size),
        .o_finish(PG_finish)
    );
    always #HCLK CLK = ~CLK;

    initial begin
        $fsdbDumpfile("PointGenerator.fsdb");
        $fsdbDumpvars;
        fp_i = $fopen("../pattern/PG_test1_i.txt");
        fp_o = $fopen("../pattern/PG_test1_o.txt");
        
        
        rst_n = 1;
        #CLK rst_n = 0;
        rst_n = 1;

        #CLK start = 1;
        start = 0;

        @(posedge PG_finish) begin
            
        end
    end    
endmodule