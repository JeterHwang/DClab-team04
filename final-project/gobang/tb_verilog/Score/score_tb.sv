`timescale 1ns/100ps

`define CLK 10
`define HCLK 5
typedef logic [1:0] board [225];

module Score_tb;
    board i_board;
    logic clk;
    logic start;
    logic rst_n;
    logic turn;
    logic SC_finish;
    logic signed [31:0] score;
    int fp_i, fp_o;
    int status;

    Score score(
        .i_clk(clk),
        .i_rst_n(rst_n),
        .i_start(start),
        .i_board(i_board),
        .i_turn(1'b0),
        .o_score(score),
        .o_finish(SC_finish)
    );

    initial clk = 0;
    always #(`HCLK) clk = ~clk;

    initial begin
        $fsdbDumpfile("PointGenerator.fsdb");
        $fsdbDumpvars;
        fp_i = $fopen("../../pattern/PG_test1_i.txt", "r");
        fp_o = $fopen("../../output/PG_test1_o.txt", "w");
        
        if(fp_i) 
            $display("Read file was opened successfully : %0d", fp_i);
        else
            $display("Read file was not opened successfully : %0d", fp_i);

        if(fp_o) 
            $display("Write file was opened successfully : %0d", fp_o);
        else
            $display("Write file was not opened successfully : %0d", fp_o);

        for(int i = 0; i < 15; i++) begin
            status = $fscanf(fp_i, "%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d ", i_board[i * 15 + 0], i_board[i * 15 + 1], i_board[i * 15 + 2], i_board[i * 15 + 3], i_board[i * 15 + 4], i_board[i * 15 + 5], i_board[i * 15 + 6], i_board[i * 15 + 7], i_board[i * 15 + 8], i_board[i * 15 + 9], i_board[i * 15 + 10], i_board[i * 15 + 11], i_board[i * 15 + 12], i_board[i * 15 + 13], i_board[i * 15 + 14]);
            if(status != 15) begin
                $display("Error !! : %d", status);
            end
        end

        
        
        start = 0;
        rst_n = 1;
        turn = 1'b0;    // default calculate black chess score

        #(`CLK) rst_n = 0;
        #(`CLK) rst_n = 1;
        #(`CLK) start = 1;
        #(`CLK) start = 0;

        @(posedge SC_finish) begin
            $display("     Simulation Complete !!   ");
            $display("==============================");
            $display("The score is : %d\n", score);
            $display("==============================");
        end
        $finish;
    end  
    
    initial begin
		#(50 * (`CLK))
        $display("==============================");
		$display("Too slow, abort.");
		$display("==============================");
        $finish;
	end  
endmodule