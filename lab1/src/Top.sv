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

// ===== Output Buffers =====
logic [3:0] o_random_out_r, o_random_out_w;

// ===== Registers & Wires =====
logic state_r, state_w;
logic [32:0] LFSR;
// ===== Output Assignments =====
assign o_random_out = o_random_out_r;

// ===== Combinational Circuits =====
always_comb begin
	// Default Values
	o_random_out_w = o_random_out_r;
	state_w        = state_r;

	// FSM
	case(state_r)
	S_IDLE: begin
		if (i_start) begin
			state_w = S_PROC;
			o_random_out_w = 4'd15;
		end
	end

	S_PROC: begin
		if (i_start) begin
			state_w = (o_random_out_r == 4'd10) ? S_IDLE : state_w;
			o_random_out_w = (o_random_out_r == 4'd10) ? 4'd1 : (o_random_out_r - 4'd1);
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
	end
	else begin
		o_random_out_r <= o_random_out_w;
		state_r        <= state_w;
	end

	// state graph
	if(state_r == S_PROC) begin
			
	end
	else begin
		
	end
end


// // Galois LFSR
// always_ff @(posedge i_clk or negedge i_rst_n) begin
// 	if (!i_rst_n) begin
// 		lfsr_r[3:0] <= 4'b1001;
// 	end
// 	else begin
// 		if (i_start) begin
// 			lfsr_r <= seed_r[5:2];
// 		end
// 		else begin
// 			lfsr_r[3] <= lfsr_r[2];
// 			lfsr_r[2] <= lfsr_r[1];
// 			lfsr_r[1] <= lfsr_r[0] ^ lfsr_r[3];
// 			lfsr_r[0] <= lfsr_r[3];
// 		end
// 	end
// end

endmodule