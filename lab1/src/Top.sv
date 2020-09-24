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
parameter period_add = 32'd1000000;
parameter tmax = 32'd500000000;

// ===== Output Buffers =====
logic [3:0] o_random_out_r, o_random_out_w;

// ===== Registers & Wires =====
logic state_r, state_w;
logic [31:0] LFSR_r, LFSR_w;
logic [31:0] i_seed_r, i_seed_w;
//Counter 
logic [31:0] count_r, count_w;
logic [31:0] period_r, period_w;       // 等差級數  
logic [31:0] next_time_r, next_time_w; // next count_r stop point 

// ===== Output Assignments =====
assign o_random_out = o_random_out_r;

// ===== Combinational Circuits =====
always_comb begin
	// Default Values
	o_random_out_w = o_random_out_r;
	state_w        = state_r;
	count_w 	   = count_r;
	period_w       = period_r;
	next_time_w    = next_time_r;
	LFSR_w         = LFSR_r;
	i_seed_w       = i_seed_r;
	// FSM
	case(state_r)
	S_IDLE: begin
		if (i_start) begin
			state_w = S_PROC;
			//o_random_out_w = 4'd15;
			count_w 	   = 32'b0;
			period_w       = 32'b1000000;
			LFSR_w         = i_seed_r;
		end
	end
	S_PROC: begin
		state_w = (count_r > tmax) ? S_IDLE : state_w;
		if(count_r >= next_time_r) begin
			o_random_out_w = LFSR_r[3:0];
			next_time_w = next_time_w + period_w;
			period_w = period_w + period_add;
		end

	end
	endcase
end

// ===== Sequential Circuits =====
always_ff @(posedge i_clk or negedge i_rst_n) begin
	// reset
	period_r       <= period_w;
	next_time_r    <= next_time_w;
	if (!i_rst_n) begin
		o_random_out_r <= 4'd0;
		state_r        <= S_IDLE;
		i_seed_r       <= (i_seed_w > 32'hdddddddd) ? (i_seed_w + 32'hab00045) : (32'h1000_0011);		
		//seed 初始值
	end
	else begin
		o_random_out_r <= o_random_out_w;
		state_r        <= state_w;
		LFSR_r 	       <= {LFSR[31:3], ,LFSR[31]^LFSR[30]^LFSR[24]^LFSR[10], LFSR[31]^LFSR[29]^LFSR[23]^LFSR[9], LFSR[27]^LFSR[22]^LFSR[22]^LFSR[4]};
		i_seed_r       <= i_seed_w;
	end
end

always_ff @(posedge i_clk or negedge i_rst_n) begin
	// counter state graph
	if(state_w == S_PROC) begin
		count_r 	  <= count_r + 1'b1;
	end
	else begin
		count_r       <= count_w;
	end
end
endmodule
