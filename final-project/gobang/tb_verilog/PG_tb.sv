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
    logic [4:0] X;
    logic [4:0] Y;
    logic PG_finish;
    int fp_i, fp_o;
    int status;

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

    initial clk = 0;
    always #HCLK clk = ~clk;

    initial begin
        $fsdbDumpfile("PointGenerator.fsdb");
        $fsdbDumpvars;
        fp_i = $fopen("../pattern/PG_test1_i.txt", "r");
        fp_o = $fopen("../output/PG_test1_o.txt", "w");
        
        if(fp_i) 
            $display("File was opened successfully : %0d", fp_i);
        else
            $display("File was not opened successfully : %0d", fp_i);

        for(int i = 0; i < 15; i++) begin
            status = $fscanf(fp_i, "%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d ", i_board[i * 15 + 0], i_board[i * 15 + 1], i_board[i * 15 + 2], i_board[i * 15 + 3], i_board[i * 15 + 4], i_board[i * 15 + 5], i_board[i * 15 + 6], i_board[i * 15 + 7], i_board[i * 15 + 8], i_board[i * 15 + 9], i_board[i * 15 + 10], i_board[i * 15 + 11], i_board[i * 15 + 12], i_board[i * 15 + 13], i_board[i * 15 + 14]);
            if(status != 15) begin
                $display("Error !! : %d", status);
            end
        end

        
        

        rst_n = 1;
        #CLK rst_n = 0;
        rst_n = 1;

        #CLK start = 1;
        start = 0;

        @(posedge PG_finish) begin
            for(int i = 399; i > buffer_size; i = i - 5) begin
                X = X_output[i -: 5];
                Y = Y_output[i -: 5];
                $fwrite(fp_o, "%d %d\n", X, Y);
            end
        end
        $finish;
    end  
    
    initial begin
		#(50*CLK)
		$display("Too slow, abort.");
		$finish;
	end  
endmodule