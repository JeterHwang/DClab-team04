module Top (
	input        i_clk,
	input        i_rst_n,
	input        i_start,
	output [3:0] o_random_out
);

// please check out the working example in lab1 README (or Top_exmaple.sv) first

// ===== States =====
parameter S_IDLE = 1'b0;
parameter S_PROC = 1'b1;

// ===== constants =======
parameter period_add = 32'd1000;
parameter tmax = 32'd150000;

// ===== Output Buffers =====
logic [3:0] o_random_out_r, o_random_out_w;

// ===== Registers & Wires =====
logic state_r, state_w;
logic pause_r, pause_w;
logic [31:0] LFSR_r, LFSR_w;
logic [31:0] i_seed_r, i_seed_w;
//Counter 
logic [31:0] count_r, count_w;
logic [31:0] period_r, period_w;       // arithmetic sequence  
logic [31:0] next_time_r, next_time_w; // next count_r stop point 

// ===== Output Assignments =====
assign o_random_out = o_random_out_r;

// ===== Combinational Circuits =====
always_comb begin
	// Default Values

	// FSM
	case(state_r)
	S_IDLE: begin
		o_random_out_w = o_random_out_r;
		i_seed_w       = i_seed_r;
		if (i_start) begin
			state_w = S_PROC;
			//o_random_out_w = 4'd15;
			count_w        = 32'd0;
			period_w       = 32'd1000;
			next_time_w    = 32'd1000;
			LFSR_w         = i_seed_r;
			pause_w        = 1'b0;
		end
		else begin
			state_w        = state_r;
			count_w        = count_r;
			period_w       = period_r;
			next_time_w    = next_time_r;
			LFSR_w         = LFSR_r;
			pause_w        = pause_r;
		end
	end
	S_PROC: begin
		//o_random_out_w = 4'd15;
		state_w 	 = (count_r > tmax) ? S_IDLE : state_w;
		count_w 	 = count_r;
		LFSR_w 		 = LFSR_r;
		i_seed_w 	 = i_seed_r;
		
		if(count_r >= next_time_r && !pause_r) begin
			o_random_out_w = LFSR_r[3:0];
			next_time_w = next_time_r + period_r;
			period_w = period_r + period_add;  //period double
		end
		else begin
			o_random_out_w = o_random_out_r;
			period_w       = period_r;
			next_time_w    = next_time_r;
		end

		// if Key_0 is pressed when in PROC state
		if(i_start) begin
			pause_w	 	= (~pause_r);
		end
		else begin
			pause_w 	= pause_r;
		end
	end
	endcase
end

// ===== Sequential Circuits =====
always_ff @(posedge i_clk or negedge i_rst_n) begin
	// reset
	period_r       <= period_w;
	next_time_r    <= next_time_w;
	pause_r        <= pause_w;
	if (!i_rst_n) begin
		o_random_out_r <= 4'd0;
		state_r        <= S_IDLE;
		i_seed_r       <= (32'd10011);		
		//seed 初始值
	end
	else begin
		o_random_out_r <= o_random_out_w;
		state_r        <= state_w;
		LFSR_r 	       <= {LFSR_w[28:0], LFSR_w[31]^LFSR_w[30]^LFSR_w[24]^LFSR_w[10], LFSR_w[31]^LFSR_w[29]^LFSR_w[23]^LFSR_w[9], LFSR_w[27]^LFSR_w[22]^LFSR_w[22]^LFSR_w[4]};
		i_seed_r       <= i_seed_w;
	end
end

always_ff @(posedge i_clk or negedge i_rst_n) begin
	// counter state graph
	if(state_w == S_PROC && !pause_w) begin
		count_r 	  <= count_w + 1'd1;
	end
	else begin
		count_r       <= count_w;
	end
end
endmodule
