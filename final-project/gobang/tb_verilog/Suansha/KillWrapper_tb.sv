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
        fp_i = $fopen("../../pattern/SS_test2_i.txt", "r");
        
        if(fp_i) 
            $display("Read file was opened successfully : %0d", fp_i);
        else
            $display("Read file was not opened successfully : %0d", fp_i);
        
        for(int i = 0; i < 15; i++) begin
            status = $fscanf(fp_i, "%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d ", i_board[i * 15 + 0], i_board[i * 15 + 1], i_board[i * 15 + 2], i_board[i * 15 + 3], i_board[i * 15 + 4], i_board[i * 15 + 5], i_board[i * 15 + 6], i_board[i * 15 + 7], i_board[i * 15 + 8], i_board[i * 15 + 9], i_board[i * 15 + 10], i_board[i * 15 + 11], i_board[i * 15 + 12], i_board[i * 15 + 13], i_board[i * 15 + 14]);
            if(status != 15) begin
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