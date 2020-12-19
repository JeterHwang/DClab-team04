`timescale 1ns/100ps

`define CLK 10
`define HCLK 5

module test;

    logic clk;
    logic start;
    logic rst_n;
    logic data;
    logic [24:0] out;
    logic [24:0] oo;

    Score score(
        .i_rst_n(rst_n),
        .i_start(start),
        .i_clk(clk),
        .i_data(data),
        .out(out),
    );



    initial clk = 0;
    always #(`HCLK) clk = ~clk;

    initial begin
        $fsdbDumpfile("test.fsdb");
        $fsdbDumpvars;

        rst     = 0;
        #(`CLK*2) rst = 1;
        #(`CLK*2) rst = 0;
        #(`CLK*2) start = 1;
        #(`CLK*3) start = 0;


            @(negedge clk) begin
                
                oo     = 25'd0;
                
            end
            for(int i=0; i<=2; i++) begin
            @(negedge clk) begin
                oo = ((oo << 1) | out);
                data = i;
            end
            end






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