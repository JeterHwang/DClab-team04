`timescale 1ns/100ps

`define CLK 20
`define HCLK 10
typedef logic [1:0] board [625];

module PG_tb;
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
        .o_PGfinish(PG_finish)
    );

    initial clk = 0;
    always #(`HCLK) clk = ~clk;

    initial begin
        $fsdbDumpfile("PointGenerator.fsdb");
        $fsdbDumpvars;
        fp_i = $fopen("../../pattern/PG_test1_i.txt", "r");
        fp_o = $fopen("../../output/PG_test1_o.txt", "w");
        
        if(fp_i) 
            $display("File was opened successfully : %0d", fp_i);
        else
            $display("File was not opened successfully : %0d", fp_i);

        for(int i = 0; i < 25; i++) begin
            status = $fscanf(fp_i, "%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d", i_board[i * 25 + 0], i_board[i * 25 + 1], i_board[i * 25 + 2], i_board[i * 25 + 3], i_board[i * 25 + 4], i_board[i * 25 + 5], i_board[i * 25 + 6], i_board[i * 25 + 7], i_board[i * 25 + 8], i_board[i * 25 + 9], i_board[i * 25 + 10], i_board[i * 25 + 11], i_board[i * 25 + 12], i_board[i * 25 + 13], i_board[i * 25 + 14], i_board[i * 25 + 15], i_board[i * 25 + 16], i_board[i * 25 + 17], i_board[i * 25 + 18], i_board[i * 25 + 19], i_board[i * 25 + 20], i_board[i * 25 + 21], i_board[i * 25 + 22], i_board[i * 25 + 23], i_board[i * 25 + 24]);
            if(status != 25) begin
                $display("Error !! : %d", status);
            end
        end

        start = 0;
        rst_n = 1;

        #(`CLK) rst_n = 0;
        #(`CLK) rst_n = 1;
        #(`CLK) start = 1;
        #(`CLK) start = 0;

        @(posedge PG_finish) begin
            for(int i = 399; i > buffer_size; i = i - 4) begin
                X = X_output[i -: 4];
                Y = Y_output[i -: 4];
                $fwrite(fp_o, "%d %d\n", X, Y);
            end
        end
        $finish;
    end  
    
    initial begin
		#(10000 * (`CLK))
		$display("Too slow, abort.");
		$finish;
	end  
endmodule