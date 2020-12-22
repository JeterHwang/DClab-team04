`timescale 1ns/100ps

`define CLK 10
`define HCLK 5

module test;

    logic clk;
    logic rst;
    logic [4:0] data;
    logic [4:0] out;


    Score score(
        .i_rst_n(rst),
        .i_clk(clk),
        .i_data(data),
        .out(out)
    );



    initial clk = 0;
    
    always #(`HCLK) clk = ~clk;

    initial begin
        $fsdbDumpfile("test.fsdb");
        $fsdbDumpvars;
        data = 0;
        rst     = 0;
        #(`CLK*2) rst = 1;
        #(`CLK*2) rst = 0;
        #(`CLK*2)  data = 0;
        #(`CLK*2)  data = 1;
        #(`CLK*2)  data = 2;
        #(`CLK*2)  data = 3;
        #(`CLK*2)  data = 4;
        #(`CLK*2)  data = 5;


            
                







    #(`CLK)
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