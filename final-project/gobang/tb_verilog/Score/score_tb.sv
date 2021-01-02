`timescale 1ns/100ps

`define CLK 20
`define HCLK 10
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
         fsdbDumpfile("Score.fsdb"); fsdbDumpvars;
        // fp_i =  fopen("../../pattern/SCtest1i.txt","r");
        fpi= fopen("../../pattern/SC_test1_i.txt", "r");

        if(fp_i) 
             display("Readfilewasopenedsuccessfully:else display("Read file was not opened successfully : %0d", fp_i);

        for(int i = 0; i < 25; i++) begin
            status =  fscanf(fpi,"if(status!=25)begin display("Error !! : %d", status);
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
            //      display()//end display("     Simulation Complete !!   ");
             display("=============================="); display("The score is : %d\n", score);
             display("==============================");end finish;
    end  
    
    initial begin
		#(10000 * (`CLK))
         display("=============================="); display("Too slow, abort.");
		 display("=============================="); finish;
	end  
endmodule