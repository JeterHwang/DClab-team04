`timescale 1ns/10ps
`define CYCLE  10
`define HCYCLE  5

module tb_flip;
   // port declaration for design-under-test
    logic          rst;
    logic          clk;
    logic          cal_start;
    logic  [7:0]   in_data,out_data;
    logic          flip_finish;
	
   // instantiate the design-under-test
	Flip f0(
        .i_clk(clk),
        .i_rst(rst),
        .i_start(cal_start),
        .i_data(in_data),
        .o_data(out_data),
        .o_finished(flip_finish)
    );
			  
	// define clock signal
	always  begin
		#(`HCYCLE) clk=~clk;
	end

	initial begin
		rst = 1;
        clk = 0;
        cal_start = 0;
        in_data = 8'h00;
        
		#(`CYCLE*2) rst = 0;
		#(`CYCLE) rst = 1;
		#(`CYCLE*4) 
        cal_start = 1;
        in_data = 8'h23;
        #(`CYCLE*4) 
        cal_start = 0;
        in_data = 8'hab;
        #(`CYCLE*4) 
        cal_start = 1;
        in_data = 8'h5d;
		#(`CYCLE*2) $finish;
	end
	
	initial begin
		$dumpfile("flip.fsdb");
		$dumpvars;	
	end
endmodule