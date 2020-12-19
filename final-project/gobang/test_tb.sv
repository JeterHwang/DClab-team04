`timescale 1ns/100ps

`define CLK 10
`define HCLK 5

module test;

    logic clk;
    logic start;
    logic rst_n;

    logic [24:0] out;

    Score score(
        .i_rst_n(rst_n), 
        .i_start(start),
        .i_clk(clk),
        .out(out)
    );



    initial clk = 0;
    always #(`HCLK) clk = ~clk;

    initial begin
        $fsdbDumpfile("test.fsdb");
        $fsdbDumpvars;
        start = 1;
        rst_n = 1;

        #(`CLK) rst_n = 0;
        #(`CLK) rst_n = 1;
        #(`CLK) start = 1;
        #(`CLK*5) start = 0;


        $display("     Simulation Complete !!   ");
        $display("==============================");
        
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