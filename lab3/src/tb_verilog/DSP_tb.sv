`timescale 1ns/10ps
`define CYCLE  10
`define HCYCLE  5
//`include "AudDSP.sv"

module dsp_tb;
   // port declaration for design-under-test
   	reg 		i_clk, clk, rst_n;
   	reg         fast, slow_0, slow_1, stop, pause, i_start, o_finished, i_playstart;
	reg  [2:0]  control_speed;
	reg  [15:0] sram_data;
	wire [15:0] dac_data;
   	wire [19:0] sram_current;
	logic sent_finish,player_en,record_counter;
	
   // instantiate the design-under-test
	AudDSP dsp0(
		.i_rst_n(rst_n),
		.i_clk(i_clk),
		.i_start(i_start),
		.i_pause(pause),
		.i_stop(stop),
		.i_speed(control_speed),//[3:0]
		.i_fast(fast),
		.i_slow_0(slow_0),
		.i_slow_1(slow_1),
		.i_daclrck(clk), // This clk is 1/(17*2) bclk, so can wait for sender to send out left and right channel bit by bit.
		.i_sent_finish(sent_finish),
		.i_record_counter(record_counter),
		.i_sram_data(sram_data),//[15:0] 
		.o_dac_data(dac_data),//[15:0] 
		.o_sram_addr(sram_current),//[19:0] 
		.o_finish(o_finished),
		.o_player_en(player_en)
	);
			  
	// define clock signal
	always 
	begin
		#(`HCYCLE) clk=~clk;
	end


	initial begin
		clk = 0;
		rst_n = 1;

		stop = 0;
		pause = 0;

		fast = 0;
		slow_0 = 0;
		slow_1 = 0;
		i_start = 0 ;

		control_speed = 2;

		#(`CYCLE*1.5) rst_n = 0;
		#(`CYCLE*3.5) rst_n = 1;

		#(`CYCLE*2) sram_data = 0;
		#(`CYCLE*3) record_counter = 0;
		#(`CYCLE*6) fast = 1;
		i_start = 1 ;
		#(`CYCLE) i_start = 0 ;
		#(`CYCLE*2) fast = 0;
		i_start = 1 ;
		#(`CYCLE) i_start = 0 ;

		#(`CYCLE*600) pause = 1;
		control_speed = 5;
		#(`CYCLE*2) pause = 0;

		#(`CYCLE*600) slow_0 = 1;
		#(`CYCLE*2) slow_0 = 0;

		#(`CYCLE*300) pause = 1;
		control_speed = 7;
		#(`CYCLE*2) pause = 0;

		#(`CYCLE*500) slow_1 = 1;
		i_start = 1 ;
		#(`CYCLE) i_start = 0 ;
		#(`CYCLE*2) slow_1 = 0;
		i_start = 1 ;
		#(`CYCLE) i_start = 0 ;

		#(`CYCLE*600) stop = 1;
		#(`CYCLE*2) stop = 0;
		#(`CYCLE*10.5) rst_n = 0;
		#(`CYCLE*2) rst_n = 1;

		#(`CYCLE*3) slow_1 = 1;
		i_start = 1 ;
		#(`CYCLE) i_start = 0 ;
		#(`CYCLE*2) slow_1 = 0;
		i_start = 1 ;
		#(`CYCLE) i_start = 0 ;

		#(`CYCLE*500) pause = 1;
		control_speed = 1;
		#(`CYCLE*2) pause = 0;

		#(`CYCLE*6) fast = 1;
		i_start = 1 ;
		#(`CYCLE) i_start = 0 ;
		#(`CYCLE*2) fast = 0;
		i_start = 1 ;
		#(`CYCLE) i_start = 0 ;
      
      #(`CYCLE*100) control_speed = 3;
 
		#(`CYCLE*1000) $finish;
	end
	
	initial begin
		$fsdbDumpfile("dsp0.fsdb");
		$fsdbDumpvars;	
	end
endmodule