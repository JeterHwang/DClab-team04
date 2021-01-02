`timescale 1ns/100ps

`define CLK 20
`define HCLK 10
typedef logic [1:0] board [225];

module TH_tb;
    board i_board;
    logic clk;
    logic start;
    logic rst_n;
    logic return_result;
    logic Kill_finish;
    logic [3:0] Kill_x, Kill_y;

    int fp_i, fp_o;
    int status;

    parameter i_depth = 5'd4;  // only even numbers are allowed !!

    Suansha SS(
        .i_clk(clk),
        .i_rst_n(rst_n),
        .i_start(start),
        .i_depth(i_depth),
        .i_board(i_board),
        .o_sha(return_result),
        .o_finish(Kill_finish),
        .o_Xpos(Kill_x),
        .o_Ypos(Kill_y)
    ); 

    initial clk = 0;
    always #(`HCLK) clk = ~clk;

    initial begin
        $fsdbDumpfile("KillWrapper.fsdb");
        $fsdbDumpvars;
        fp_i = $fopen("../../pattern/SS_test1_i.txt", "r");
        
        if(fp_i) 
            $display("Read file was opened successfully : %0d", fp_i);
        else
            $display("Read file was not opened successfully : %0d", fp_i);
        
        for(int i = 0; i < 25; i++) begin
            status = $fscanf(fp_i, "%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d", i_board[i * 25 + 0], i_board[i * 25 + 1], i_board[i * 25 + 2], i_board[i * 25 + 3], i_board[i * 25 + 4], i_board[i * 25 + 5], i_board[i * 25 + 6], i_board[i * 25 + 7], i_board[i * 25 + 8], i_board[i * 25 + 9], i_board[i * 25 + 10], i_board[i * 25 + 11], i_board[i * 25 + 12], i_board[i * 25 + 13], i_board[i * 25 + 14], i_board[i * 25 + 15], i_board[i * 25 + 16], i_board[i * 25 + 17], i_board[i * 25 + 18], i_board[i * 25 + 19], i_board[i * 25 + 20], i_board[i * 25 + 21], i_board[i * 25 + 22], i_board[i * 25 + 23], i_board[i * 25 + 24]);
            if(status != 25) begin
                $display("Error !! : %d", status);
            end
        end

        start       = 0;
        rst_n       = 1;

        #(`CLK) rst_n = 0;
        #(`CLK) rst_n = 1;
        #(`CLK) start = 1;
        #(`CLK) start = 0;

    end  
    
    initial begin
		#(100000000 * (`CLK))
		$display("Too slow, abort.");
		$finish;
	end  

    
    always@(posedge Kill_finish) begin
        $display("========= output result =========");
        if(return_result) begin
            $display("AI got a kill !!");
            $display("The point is : (%d, %d)\n", Kill_x, Kill_y);
        end
        else begin
            $display("AI can not kill @@");
        end
        $display("============= end ==============");
        $finish;
    end
endmodule