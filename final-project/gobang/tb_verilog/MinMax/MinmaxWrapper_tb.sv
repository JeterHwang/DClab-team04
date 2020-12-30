`timescale 1ns/100ps

`define CLK 10
`define HCLK 5
typedef logic [1:0] board [225];

module minmax_tb;
    board i_board;
    logic clk;
    logic start;
    logic rst_n;
    logic [4:0] depth;
    logic [3:0] X_output;
    logic [3:0] Y_output;
    logic finish;
    logic kill;
    int fp_i, fp_o;
    int status;
    
    DFS minmax(
        .i_clk(clk),
        .i_rst_n(rst_n),
        .i_start(start),
        .i_depth(depth),
        .i_board(i_board),
        .o_Xpos(X_output),
        .o_Ypos(Y_output),
        .o_finish(finish),
        .o_kill(kill)
    );

    initial clk = 0;
    always #(`HCLK) clk = ~clk;

    initial begin
        $fsdbDumpfile("MinmaxWrapper.fsdb");
        $fsdbDumpvars;
        fp_i = $fopen("../../pattern/PG_test1_i.txt", "r");

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

        for(int i = 0; i < 6; i = i + 2) begin
            depth = i[4:0];
            start = 0;
            rst_n = 1;
            #(`CLK) rst_n = 0;
            #(`CLK) rst_n = 1;
            #(`CLK) start = 1;
            #(`CLK) start = 0;

            @(posedge finish) begin
                $display("(X, Y) = (%d, %d)\n", X_output, Y_output);
            end

            if(kill)
                $finish;
        end 
        
    end
    initial begin
		#(100000000 * (`CLK))
		$display("Too slow, abort.");
		$finish;
	end
endmodule