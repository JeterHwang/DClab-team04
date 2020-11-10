module Top (
	input i_rst_n,
	input i_clk,
	input i_key_0,
	input i_key_1,
	input i_key_2,
	input [3:0] i_speed, // design how user can decide mode on your own
	
	// AudDSP and SRAM
	output [19:0] o_SRAM_ADDR,
	inout  [15:0] io_SRAM_DQ,
	output        o_SRAM_WE_N,
	output        o_SRAM_CE_N,
	output        o_SRAM_OE_N,
	output        o_SRAM_LB_N,
	output        o_SRAM_UB_N,
	
	// SDRAM
	// output [12:0] o_DRAM_ADDR,
	// output [1:0]  o_DRAM_BA,
	// inout  [31:0] io_DRAM_DQ,
	// output [3:0]  o_DRAM_DQM,
	// output 		  o_DRAM_CAS_N,
	// output		  o_DRAM_CKE,
	// output		  o_DRAM_CLK,
	// output		  o_DRAM_CS_N,
	// output 		  o_DRAM_RAS_N,
	// output 		  o_DRAM_WE_N,

	// I2C
	input  i_clk_100k,
	output o_I2C_SCLK,
	inout  io_I2C_SDAT,
	
	// AudPlayer
	input  i_AUD_ADCDAT,
	inout  i_AUD_ADCLRCK,
	inout  i_AUD_BCLK,
	inout  i_AUD_DACLRCK,
	output o_AUD_DACDAT

	// SEVENDECODER (optional display)
	// output [5:0] o_record_time,
	// output [5:0] o_play_time,

	//LCD (optional display)
	input        i_clk_800k,
	inout  [7:0] io_LCD_DATA,
	output       o_LCD_EN,
	output       o_LCD_RS,
	output       o_LCD_RW,
	output       o_LCD_ON,
	output       o_LCD_BLON,

	//LED
	output  [8:0] o_ledg,
	output [17:0] o_ledr
);

// design the FSM and states as you like
parameter S_LCD_INIT    = 3'd0;
parameter S_I2C        	= 3'd1;
parameter S_STOP		= 3'd2;
parameter S_RECD       	= 3'd3;
parameter S_RECD_PAUSE 	= 3'd4;
parameter S_PLAY       	= 3'd5;
parameter S_PLAY_PAUSE 	= 3'd6;
parameter S_LCD_RENDER 	= 3'd7;

// modes
parameter M_INIT 		= 3'd0;
parameter M_STOP 		= 3'd1;
parameter M_PLAY_PAUSE 	= 3'd2;
parameter M_RECD_PAUSE  = 3'd3;
parameter M_PLAY 		= 3'd4;
parameter M_RECD 		= 3'd5;

logic [2:0] state_r, state_w;
logic i2c_start_r, i2c_start_w;

logic fast_r, fast_w;
logic slow0_r, slow0_w;
logic slow1_r, slow1_w;
logic player_en_r, player_en_w;

// i2C interface
logic i2c_finish;
logic i2c_oen, i2c_sdat;

// recorder interface
logic record_finish;

logic [19:0] addr_record, addr_play;
logic [15:0] data_record, data_play, dac_data;
logic sda_data; 	// useless

logic dsp2player_en;			// new added
logic dsp_to_player_finished; 	// new added 

logic [2:0] LCD_mode_r, LCD_mode_w;
logic LCD_wr_enable_r, LCD_wr_enable_w;
logic LCD_init_finish;
logic LCD_render_finish;
logic [7:0] LCD_data;


assign o_LCD_ON    = 1'b1;
assign o_LCD_BLON  = 1'b1;
assign io_LCD_DATA = LCD_data;

assign io_I2C_SDAT = (i2c_oen) ? i2c_sdat : 1'bz;

assign o_SRAM_ADDR = (state_r == S_RECD) ? addr_record : addr_play[19:0];
assign io_SRAM_DQ  = (state_r == S_RECD) ? data_record : 16'dz; // sram_dq as output
assign data_play   = (state_r != S_RECD) ? io_SRAM_DQ : 16'd0; // sram_dq as input

assign o_SRAM_WE_N = (state_r == S_RECD) ? 1'b0 : 1'b1;
assign o_SRAM_CE_N = 1'b0;
assign o_SRAM_OE_N = 1'b0;
assign o_SRAM_LB_N = 1'b0;
assign o_SRAM_UB_N = 1'b0;

// below is a simple example for module division
// you can design these as you like

// === I2cInitializer ===
// sequentially sent out settings to initialize WM8731 with I2C protocal
I2cInitializer init0(
	.i_rst_n(i_rst_n),
	.i_clk(i_clk_100K),
	.i_start(i2c_start_r),
	.o_finished(i2c_finish),
	.o_sclk(o_I2C_SCLK),
	.o_sdat(i2c_sdat),
	.o_oen(i2c_oen) // you are outputing (you are not outputing only when you are "ack"ing.)
);

// === AudDSP ===
// responsible for DSP operations including fast play and slow play at different speed
// in other words, determine which data addr to be fetch for player 
AudDSP dsp0(
	.i_rst_n(i_rst_n),
	.i_clk(i_clk),
	.i_start(i_key_1),
	.i_pause(i_key_1),
	.i_stop(i_key_2),
	.i_speed(i_speed),
	.i_fast(fast_r),
	.i_slow_0(slow0_r), // constant interpolation
	.i_slow_1(slow1_r), // linear interpolation
	.i_daclrck(i_AUD_DACLRCK),
	.i_record_counter(addr_record),
	.i_sram_data(data_play),
	.o_dac_data(dac_data),
	.o_sram_addr(addr_play),
	.i_sent_finished(dsp_to_player_finished),
	.o_player_en(dsp2player_en),
	.o_finish(player_finish)
);

// === AudPlayer ===
// receive data address from DSP and fetch data to sent to WM8731 with I2S protocal
AudPlayer player0(
	.i_rst_n(i_rst_n),
	.i_bclk(i_AUD_BCLK),
	.i_daclrck(i_AUD_DACLRCK),
	.i_en(dsp2player_en), // enable AudPlayer only when playing audio, work with AudDSP
	.i_dac_data(dac_data), //dac_data
	.o_aud_dacdat(o_AUD_DACDAT),
	.o_sent_finished(dsp_to_player_finished)
);

// === AudRecorder ===
// receive data from WM8731 with I2S protocal and save to SRAM
AudRecorder recorder0(
	.i_rst_n(i_rst_n), 
	.i_clk(i_AUD_BCLK),
	.i_lrc(i_AUD_ADCLRCK),
	.i_start(i_key_0),
	.i_pause(i_key_0),
	.i_stop(i_key_2),
	.i_data(i_AUD_ADCDAT),
	.o_address(addr_record),
	.o_data(data_record),
	.o_finish(record_finish)
);
LCD_Top LCDtop(
	.i_clk(i_clk_800k),
	.i_start(LCD_wr_enable_r),
	.i_rst_n(i_rst_n),
	.i_mode(LCD_mode_r),
	.o_LCD_data(LCD_data),
	.o_LCD_EN(o_LCD_EN),
	.o_LCD_RS(o_LCD_RS),
	.o_LCD_RW(o_LCD_RW),
	.o_init_finish(LCD_init_finish),
	.o_render_finish(LCD_render_finish)
);

always_comb begin
	// design your control here
	case (state_r)
		S_LCD_INIT: begin
			if(LCD_init_finish) begin
				state_w 		= S_LCD_RENDER;
				LCD_wr_enable_w = 1'b1;
				LCD_mode_w		= M_INIT;
				i2c_start_w		= 1'b1;
			end
		end
		S_I2C: begin
			if(i2c_finish) begin
				state_w			= S_LCD_RENDER;
				LCD_wr_enable_w	= 1'b1;
				LCD_mode_w		= M_STOP;		
			end
		end
		S_STOP: begin
			if(i_key_0) begin
				state_w			= S_LCD_RENDER;
				LCD_wr_enable_w	= 1'b1;
				LCD_mode_w		= M_RECD;	
			end	
			else if(i_key_1) begin
				state_w			= S_LCD_RENDER;
				LCD_wr_enable_w	= 1'b1;
				LCD_mode_w	 	= M_PLAY;
			end
		end
		S_RECD: begin
			if(record_finish) begin
				state_w			= S_LCD_RENDER;
				LCD_wr_enable_w	= 1'b1;
				LCD_mode_w		= M_STOP;
			end
			else if(i_key_0) begin
				state_w			= S_LCD_RENDER;
				LCD_wr_enable_w	= 1'b1;
				LCD_mode_w		= M_RECD_PAUSE;
			end
		end
		S_RECD_PAUSE: begin
			if(i_key_0) begin
				state_w			= S_LCD_RENDER;
				LCD_wr_enable_w	= 1'b1;
				LCD_mode_w		= M_RECD;
			end
			else if(i_key_2) begin
				state_w			= S_LCD_RENDER;
				LCD_wr_enable_w	= 1'b1;
				LCD_mode_w		= M_STOP;
			end
		end
		S_PLAY: begin
			if(player_finish) begin
				state_w			= S_LCD_RENDER;
				LCD_wr_enable_w	= 1'b1;
				LCD_mode_w		= M_STOP;
			end
			else if(i_key_1) begin
				state_w			= S_LCD_RENDER;
				LCD_wr_enable_w	= 1'b1;
				LCD_mode_w		= M_PLAY_PAUSE;	
			end
		end
		S_PLAY_PAUSE: begin
			if(i_key_1) begin
				state_w			= S_LCD_RENDER;
				LCD_wr_enable_w	= 1'b1;
				LCD_mode_w		= M_PLAY;
			end
		end
		S_LCD_RENDER: begin
			LCD_wr_enable_w = 1'b0;
			if(LCD_render_finish) begin
				case (LCD_mode_r)
					M_INIT:
						state_w	= S_I2C;
					M_STOP: 
						state_w	= S_STOP;
					M_PLAY:
						state_w = S_PLAY;
					M_RECD:
						state_w	= S_RECD;
					M_PLAY_PAUSE:
						state_w	= S_PLAY_PAUSE;
					M_RECD_PAUSE:
						state_w	= S_RECD_PAUSE;
				endcase
			end
		end
	endcase
end

always_ff @(posedge i_AUD_BCLK or posedge i_rst_n) begin
	if (!i_rst_n) begin
		sda_data 		<=	io_I2C_SDAT;
		state_r 		<=  S_LCD_INIT;
		i2c_start_r		<= 	1'b0;
		fast_r			<= 	1'b0;
		slow0_r			<= 	1'b0;
		slow1_r			<= 	1'b0;
		player_en_r		<= 	1'b0;
		LCD_mode_r		<= 	3'd0;
		LCD_wr_enable_r	<= 	1'b0;
	end
	else begin
		sda_data 		<=	io_I2C_SDAT; 
		state_r 		<=  state_w;
		i2c_start_r		<= 	i2c_start_w;
		fast_r			<= 	fast_w;
		slow0_r			<= 	slow0_w;
		slow1_r			<= 	slow1_w;
		player_en_r		<= 	player_en_w;
		LCD_mode_r		<= 	LCD_mode_w;
		LCD_wr_enable_r	<=  LCD_wr_enable_w;
	end
end

endmodule
