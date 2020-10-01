module Top (
	input        i_clk,
	input        i_rst_n,
	input        i_start,
	input        i_memory,
	output [3:0] o_random_out
);

// please check out the working example in lab1 README (or Top_exmaple.sv) first

// ===== States =====
parameter S_IDLE = 1'b0;
parameter S_PROC = 1'b1;

// ===== constants =======
parameter period_add = 32'd1000000;
parameter tmax = 32'd500000000;

// ===== Output Buffers =====
logic [3:0] o_random_out_r, o_random_out_w;

// ===== Registers & Wires =====
logic state_r, state_w;
logic reset_r, reset_w;
logic pause_r, pause_w;
logic [31:0] LFSR_r, LFSR_w;
logic [31:0] i_seed_r, i_seed_w;
// ===== memory unit ======== 
logic is_memory_r, is_memory_w;
logic [31:0] memory_r, memory_w;
logic [31:0] now_r, now_w;
//Counter 
logic [31:0] count_r, count_w;
logic [31:0] period_r, period_w;       // arithmetic sequence  
logic [31:0] next_time_r, next_time_w; // next count_r stop point 

// ===== Output Assignments =====
assign o_random_out = o_random_out_r;

// ===== Combinational Circuits =====
always_comb begin
	// FSM
	case(state_r)
	S_IDLE: begin
		if (i_start) begin
			state_w 		= S_PROC;
			pause_w  		= pause_r;
			now_w			= now_r;
			if(pause_r)begin	//be paused or not matters !!
				count_w			= count_r;
				period_w        = period_r;
				next_time_w     = next_time_r;
				LFSR_w			= LFSR_r;
				i_seed_w       	= i_seed_r;
			end
			else begin
				count_w			= 32'd0;
				period_w        = 32'd1000000;
				next_time_w     = 32'd1000000;
				LFSR_w			= i_seed_r;
				i_seed_w       	= {i_seed_r[28:0], 1'b1, 1'b0, 1'b1};
			end
			reset_w        	= reset_r;
			memory_w        = o_random_out_r;	//record present value to memory
			o_random_out_w  = o_random_out_r;
			is_memory_w     = is_memory_r;
		end
		else begin
			i_seed_w        = i_seed_r;
			state_w        	= state_r;
			count_w        	= count_r;
			period_w       	= period_r;
			next_time_w    	= next_time_r;
			LFSR_w         	= LFSR_r;
			reset_w        	= reset_r;
			memory_w        = memory_r;
			pause_w			= pause_r;
			if(reset_r) begin
				is_memory_w     = is_memory_r;
				o_random_out_w  = o_random_out_r;
				now_w			= now_r;
			end
			else begin
				if(i_memory && !is_memory_r) begin
					is_memory_w    	= (~is_memory_r);
					o_random_out_w  = memory_r;
					now_w			= o_random_out_r;
					//o_random_out_w  = 4'd12;
				end
				else if (i_memory && is_memory_r) begin
					is_memory_w    	= (~is_memory_r);
					o_random_out_w  = now_r;
					now_w			= now_r;
					//o_random_out_w  = 4'd13;
				end
				else begin
					is_memory_w     = is_memory_r;
					o_random_out_w  = o_random_out_r;
					now_w			= now_r;
				end	
			end
		end
	end
	S_PROC: begin
		i_seed_w 	 	= i_seed_r;
		count_w 	 	= count_r + 1'b1;
		LFSR_w 		 	= {LFSR_r[28:0], LFSR_r[31]^LFSR_r[30]^LFSR_r[24]^LFSR_r[10], LFSR_r[31]^LFSR_r[29]^LFSR_r[23]^LFSR_r[9], LFSR_r[27]^LFSR_r[22]^LFSR_r[20]^LFSR_r[4]};
		reset_w         = reset_r;		
		memory_w        = memory_r;
		now_w			= now_r;
		// if paused by Key0 or exceed tmax
		if (i_start) begin
			state_w			= S_IDLE;
			reset_w     	= 1'b0;
			period_w       	= period_r;
			next_time_w    	= next_time_r;
			o_random_out_w 	= o_random_out_r;
			is_memory_w     = 1'b0;
			pause_w 		= 1'b1;
		end
		else if (count_r > tmax) begin
			state_w			= S_IDLE;
			reset_w     	= 1'b0;
			period_w       	= period_r;
			next_time_w    	= next_time_r;
			o_random_out_w 	= o_random_out_r;
			is_memory_w     = 1'b0;
			pause_w 		= 1'b0;
		end
		else begin
			state_w			= state_r;
			reset_w     	= reset_r;
			is_memory_w     = is_memory_r;
			pause_w			= pause_r;
			if(count_r >= next_time_r) begin
				period_w 			= period_r + period_add;  //period double
				next_time_w 		= next_time_r + period_r;		
				o_random_out_w 		= LFSR_r[3:0];		
			end
			else begin
				period_w       	= period_r;
				next_time_w    	= next_time_r;
				o_random_out_w  = o_random_out_r;
			end
		end
	end
	endcase
end

// ===== Sequential Circuits =====
always_ff @(posedge i_clk or negedge i_rst_n) begin
	// reset
	if (!i_rst_n) begin
		o_random_out_r <= 4'd0;
		state_r        <= S_IDLE;
		if (!LFSR_w) begin
			i_seed_r       <= 32'd1001111;  //reset seed value 
		end
		else begin
			i_seed_r       <= {LFSR_w[26:0], 1'b1, 1'b0, 1'b1, 1'b1, 1'b0};
		end
		now_r		   <= now_w;
		period_r       <= period_w;
		next_time_r    <= next_time_w;
		reset_r    	   <= 1'b1;
		pause_r		   <= 1'b0;
		LFSR_r 	       <= LFSR_w;
		count_r        <= count_w;
		memory_r       <= memory_w;
		is_memory_r    <= is_memory_w;
	end
	else begin
		o_random_out_r <= o_random_out_w;
		state_r        <= state_w;		
		i_seed_r       <= i_seed_w;
		now_r		   <= now_w;
		period_r       <= period_w;
		next_time_r    <= next_time_w;
		reset_r        <= reset_w;
		pause_r		   <= pause_w;
		LFSR_r         <= LFSR_w;
		count_r        <= count_w;
		memory_r       <= memory_w;
		is_memory_r    <= is_memory_w;
	end
end
endmodule
