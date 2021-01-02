`timescale 1ns/100ps

`define CLK 10
`define HCLK 5
typedef logic [1:0] board [625];

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

    Score sc(
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
        $fsdbDumpfile("Score.fsdb");
        $fsdbDumpvars;
        // fp_i = $fopen("~/home/team04/peter/DClab-team04/final-project/gobang/pattern/SC_test1_i.txt", "r");
        fp_i = $fopen("../../pattern/SC_test1_i.txt", "r");

        if(fp_i) 
            $display("Read file was opened successfully : %0d", fp_i);
        else
            $display("Read file was not opened successfully : %0d", fp_i);

        for(int i = 0; i < 25; i++) begin
            status = $fscanf(fp_i, "%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d", i_board[i *  25 + 0], i_board[i * 25 + 1], i_board[i * 25 + 2], i_board[i * 25 + 3], i_board[i * 25 + 4], i_board[i * 25 + 5], i_board[i * 25 + 6], i_board[i * 25 + 7], i_board[i * 25 + 8], i_board[i * 25 + 9], i_board[i * 25 + 10], i_board[i * 25 + 11], i_board[i * 25 + 12], i_board[i * 25 + 13], i_board[i * 15 + 14], i_board[i *  25 + 15], i_board[i * 25 + 16], i_board[i * 25 + 17], i_board[i * 25 + 18], i_board[i * 25 + 19], i_board[i * 25 + 20], i_board[i * 25 + 21], i_board[i * 25 + 22], i_board[i * 25 + 23], i_board[i * 25 + 24]);
            if(status != 25) begin
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
            // for(int i=0; i<120; i++) begin
            //     $display()
            // end
            $display("     Simulation Complete !!   ");
            $display("==============================");
            $display("The score is : %d\n", score);
            $display("==============================");
        end
        $finish;
    end  
    
    initial begin
		#(10000 * (`CLK))
        $display("==============================");
		$display("Too slow, abort.");
		$display("==============================");
        $finish;
	end  
endmodule