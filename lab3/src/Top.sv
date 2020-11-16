module Top (
	input i_rst_n,
	input i_clk,
	input i_key_0,
	input i_key_1,
	input i_key_2,
	input [3:0] i_speed, // design how user can decide mode on your own
	input i_fast,
	input i_slow_0,
	input i_slow_1,

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
	output o_AUD_DACDAT,

	// SEVENDECODER (optional display)
	output [5:0] o_record_time,
	output [5:0] o_play_time,

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

// debounce buttons
logic key0_r, key0_w;
logic key1_r, key1_w;
logic key2_r, key2_w;
logic LCD_Wfin_r, LCD_Wfin_w;
logic player_fin_r, player_fin_w;
logic recorder_fin_r, recorder_fin_w;

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
logic [2:0] LCD_state;
logic [27:0] rec_count_r, rec_count_w;
logic [27:0] play_count_r, play_count_w;
logic [5:0] rectime_r, rectime_w;
logic [5:0] playtime_r, playtime_w;
logic count_upper_r, count_upper_w;

assign o_LCD_ON    = 1'b1;
assign o_LCD_BLON  = 1'b0;
assign io_LCD_DATA = LCD_data;	// only output end will open 

assign io_I2C_SDAT = (i2c_oen) ? i2c_sdat : 1'bz;
 
assign o_SRAM_ADDR = (state_r == S_RECD || (state_r == S_LCD_RENDER && LCD_mode_r == M_RECD)) ? addr_record : addr_play[19:0];
assign io_SRAM_DQ  = (state_r == S_RECD || (state_r == S_LCD_RENDER && LCD_mode_r == M_RECD)) ? data_record : 16'dz; // sram_dq as output
assign data_play   = (!(state_r == S_RECD || (state_r == S_LCD_RENDER && LCD_mode_r == M_RECD))) ? io_SRAM_DQ : 16'd0; // sram_dq as input

assign o_SRAM_WE_N = (state_r == S_RECD) ? 1'b0 : 1'b1;
assign o_SRAM_CE_N = 1'b0;
assign o_SRAM_OE_N = 1'b0;
assign o_SRAM_LB_N = 1'b0;
assign o_SRAM_UB_N = 1'b0;
assign o_ledg = {6'b11111, state_r, LCD_render_finish};
assign o_record_time = rectime_r;
assign o_play_time = playtime_r;

// below is a simple example for module division
// you can design these as you like

// === I2cInitializer ===
// sequentially sent out settings to initialize WM8731 with I2C protocal
I2cInitializer init0(
	.i_rst_n(i_rst_n),
	.i_clk(i_clk_100k),
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
	.i_start(key1_r),
	.i_pause(key1_r),
	.i_stop(i_key_2),
	.i_speed(i_speed),
	.i_fast(i_fast),
	.i_slow_0(i_slow_0), // constant interpolation
	.i_slow_1(i_slow_1), // linear interpolation
	.i_daclrck(i_AUD_DACLRCK),
	.i_sent_finish(dsp_to_player_finished),
	.i_record_counter(addr_record),
	.i_sram_data(data_play),
	.o_dac_data(dac_data),
	.o_sram_addr(addr_play),
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
	.o_render_finish(LCD_render_finish),
	.o_state(LCD_state)
);

task playcount(
	input [3:0] speed,
	input fast,
	input slow0,
	input slow1,
	output [27:0] count_upper
);
	if(fast) begin
		case(speed)
			4'd1: count_upper = 28'h0B71B00;
			4'd2: count_upper = 28'h05B8D80;
			4'd3: count_upper = 28'h03D0900;
			4'd4: count_upper = 28'h02DC6C0;
			4'd5: count_upper = 28'h0249F00;
			4'd6: count_upper = 28'h01E8480;
			4'd7: count_upper = 28'h001A286;
		endcase
	end
	else if(slow0 || slow1) begin
		case(speed)
			4'd1: count_upper = 28'h0B71B00;
			4'd2: count_upper = 28'h16E3600;
			4'd3: count_upper = 28'h2255100;
			4'd4: count_upper = 28'h2DC6C00;
			4'd5: count_upper = 28'h3938700;
			4'd6: count_upper = 28'h44AA200;
			4'd7: count_upper = 28'h501BD00;
		endcase
	end
endtask
always_comb begin
	// design your control here
	state_w 		=  	state_r;
	i2c_start_w		= 	i2c_start_r;
	LCD_mode_w		= 	LCD_mode_r;
	LCD_wr_enable_w	= LCD_wr_enable_r;
	key0_w			= 	i_key_0;
	key1_w			= 	i_key_1;
	key2_w			= 	i_key_2;
	LCD_Wfin_w		= 	LCD_render_finish;
	player_fin_w	= 	player_finish;
	recorder_fin_w	= 	record_finish;
	rec_count_w 	= rec_count_r;
	rectime_w		= rectime_r;
	play_count_w    = play_count_r;
	playtime_w	    = playtime_r;
	count_upper_w   = count_upper_r;
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
			playcount(i_speed, i_fast, i_slow_0, i_slow_1, count_upper_w);
			if(key0_w && !key0_r) begin
				state_w			= S_LCD_RENDER;
				LCD_wr_enable_w	= 1'b1;
				LCD_mode_w		= M_RECD;
				rec_count_w = 0;	
				rectime_w = 0;
			end	
			else if(key1_w && !key1_r) begin
				state_w			= S_LCD_RENDER;
				LCD_wr_enable_w	= 1'b1;
				LCD_mode_w	 	= M_PLAY;
				play_count_w = 0;	
				playtime_w = 0;
			end
		end
		S_RECD: begin
			if(recorder_fin_w && !recorder_fin_r) begin
				state_w			= S_LCD_RENDER;
				LCD_wr_enable_w	= 1'b1;
				LCD_mode_w		= M_STOP;
				if(rec_count_r == 28'h0b71b00) begin
					rec_count_w = 0;
					rectime_w = rectime_r+1;
				end
				else begin
					rec_count_w = 0;
					rectime_w = rectime_r;
				end
			end
			else if(key0_w && !key0_r) begin
				state_w			= S_LCD_RENDER;
				LCD_wr_enable_w	= 1'b1;
				LCD_mode_w		= M_RECD_PAUSE;
				if(rec_count_r == 28'h0b71b00) begin
					rec_count_w = 0;
					rectime_w = rectime_r+1;
				end
				else begin
					rec_count_w = rec_count_r;
					rectime_w = rectime_r;
				end
			end
			else if(rec_count_r == 28'h0b71b00) begin
				rec_count_w = 0;
				rectime_w = rectime_r+1;
			end
			else begin
				rec_count_w = rec_count_r+1;
				rectime_w = rectime_r;
			end
		end
		S_RECD_PAUSE: begin
			if(key0_w && !key0_r) begin
				state_w			= S_LCD_RENDER;
				LCD_wr_enable_w	= 1'b1;
				LCD_mode_w		= M_RECD;
				if(rec_count_r == 28'h0b71b00) begin
					rec_count_w = 0;
					rectime_w = rectime_r+1;
				end
				else begin
					rec_count_w = rec_count_r;
					rectime_w = rectime_r;
				end
			end
			else if(key2_w && !key2_r) begin
				state_w			= S_LCD_RENDER;
				LCD_wr_enable_w	= 1'b1;
				LCD_mode_w		= M_STOP;
				if(rec_count_r == 28'h0b71b00) begin
					rec_count_w = 0;
					rectime_w = rectime_r+1;
				end
				else begin
					rec_count_w = rec_count_r;
					rectime_w = rectime_r;
				end
			end
			else if(rec_count_r == 28'h0b71b00) begin
				rec_count_w = 0;
				rectime_w = rectime_r+1;
			end
			else begin
				rec_count_w = rec_count_r;
				rectime_w = rectime_r;
			end
		end
		S_PLAY: begin
			if(player_fin_w && !player_fin_r) begin
				state_w			= S_LCD_RENDER;
				LCD_wr_enable_w	= 1'b1;
				LCD_mode_w		= M_STOP;
				if(play_count_r == count_upper_r) begin
					play_count_w = 0;
					playtime_w = playtime_r+1;
				end
				else begin
					play_count_w = 0;
					playtime_w = playtime_r;
				end
			end
			else if(key1_w && !key1_r) begin
				state_w			= S_LCD_RENDER;
				LCD_wr_enable_w	= 1'b1;
				LCD_mode_w		= M_PLAY_PAUSE;	
				if(play_count_r == count_upper_r) begin
					play_count_w = 0;
					playtime_w = playtime_r+1;
				end
				else begin
					play_count_w = play_count_r;
					playtime_w = playtime_r;
				end
			end
			else if(play_count_r == count_upper_r) begin
				play_count_w = 0;
				playtime_w = playtime_r+1;
			end
			else begin
				play_count_w = play_count_r + 1;
				playtime_w = playtime_r;
			end
		end
		S_PLAY_PAUSE: begin
			if(key1_w && !key1_r) begin
				state_w			= S_LCD_RENDER;
				LCD_wr_enable_w	= 1'b1;
				LCD_mode_w		= M_PLAY;
				if(play_count_r == count_upper_r) begin
					play_count_w = 0;
					playtime_w = playtime_r+1;
				end
				else begin
					play_count_w = play_count_r;
					playtime_w = playtime_r;
				end
			end
			else if(key2_w && !key2_r) begin
				state_w			= S_LCD_RENDER;
				LCD_wr_enable_w	= 1'b1;
				LCD_mode_w		= M_STOP;
				if(play_count_r == count_upper_r) begin
					play_count_w = 0;
					playtime_w = playtime_r+1;
				end
				else begin
					play_count_w = play_count_r;
					playtime_w = playtime_r;
				end
			end
			else if(play_count_r == count_upper_r) begin
				play_count_w = 0;
				playtime_w = playtime_r+1;
			end
			else begin
				play_count_w = play_count_r;
				playtime_w = playtime_r;
			end
		end
		S_LCD_RENDER: begin
			if(LCD_render_finish) begin	// rising edge triggered
				LCD_wr_enable_w = 1'b0;	  // LCD write sigmal must be longer !!
				i2c_start_w		= 1'b0;   
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

always_ff @(posedge i_clk or negedge i_rst_n) begin
	if (!i_rst_n) begin
		sda_data 		<=	io_I2C_SDAT;
		state_r 		<=  S_LCD_INIT;
		i2c_start_r		<= 	1'b0;
		LCD_mode_r		<= 	3'd0;
		LCD_wr_enable_r	<= 	1'b0;
		key0_r			<= 	1'b0;
		key1_r			<= 	1'b0;
		key2_r			<= 	1'b0;
		LCD_Wfin_r		<= 	1'b0;
		player_fin_r	<= 	1'b0;
		recorder_fin_r	<= 	1'b0;
		rec_count_r		<= 	6'b0;
		rectime_r		<= 	28'b0;
		play_count_r	<= 	6'b0;
		playtime_r		<= 	28'b0;
		count_upper_r   <=  28'b0;
	end
	else begin
		sda_data 		<=	io_I2C_SDAT; 
		state_r 		<=  state_w;
		i2c_start_r		<= 	i2c_start_w;
		LCD_mode_r		<= 	LCD_mode_w;
		LCD_wr_enable_r	<=  LCD_wr_enable_w;
		key0_r			<= 	key0_w;
		key1_r			<= 	key1_w;
		key2_r			<= 	key2_w;
		LCD_Wfin_r		<= 	LCD_Wfin_w;
		player_fin_r	<= 	player_fin_w;
		recorder_fin_r	<= 	recorder_fin_w;
		rec_count_r		<= 	rec_count_w;
		rectime_r		<= 	rectime_w;
		play_count_r	<= 	play_count_w;
		playtime_r		<= 	playtime_w;
		count_upper_r   <= count_upper_w;
	end
end

endmodule
