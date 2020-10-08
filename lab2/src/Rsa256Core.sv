module Rsa256Core (
	input          i_clk,
	input          i_rst,
	input          i_start,
	input  [255:0] i_a, // cipher text y
	input  [255:0] i_d, // private key
	input  [255:0] i_n,
	output [255:0] o_a_pow_d, // plain text x
	output         o_finished
);
// operations for RSA256 decryption
// namely, the Montgomery algorithm

// ======= states ======
parameter S_IDLE 	= 3'd0;
parameter S_PREP 	= 3'd1;
parameter S_PREMONT = 3'd2;
parameter S_MONT 	= 3'd3;
parameter S_CALC 	= 3'd4;

// ======= registers & wires ======
logic [2:0] state_r, state_w;

logic prep_start_r, prep_start_w;
logic prep_reset_r, prep_reset_w;
logic prep_fin_r, prep_fin_w;			// prepare state finish

logic m_reset_r, m_reset_w;
logic mod_start_r, mod_start_w;			// calculate m start
logic update_m_fin_r, update_m_fin_w;	// calculate m finish

logic t_reset_r, t_reset_w;
logic tra_start_r, tra_start_w;			// calculate t start
logic update_t_fin_r, update_t_fin_w;	// calculate t finish

logic cal_fin_r, cal_fin_w;				// calculate state finish

logic [8:0]   count_r, count_w;     		// counter

logic [255:0] text_r, text_w;
logic [255:0] modulo_i_r, modulo_i_w; 		// m
logic [255:0] modulo_o_r, modulo_o_w;

logic [255:0] trans_ini_r, trans_ini_w;		// t
logic [255:0] trans_i_r, trans_i_w;   		
logic [255:0] trans_o_r, trans_o_w;

logic [255:0] output_r, output_w; 		// output

// ====== output assignment ======
assign o_a_pow_d  	= output_r;
assign o_finished 	= cal_fin_r;
// ====== call submodules ========
Montgomery montgomery_mt(
	.i_clk(i_clk),
	.i_rst(m_reset_r),
	.i_start(mod_start_r),
	.N(i_n),
	.a(modulo_i_r),
	.b(trans_i_r),
	.m(modulo_o_w),
	.calc_rd(update_m_fin_w)
);
Montgomery montgomery_tt(
	.i_clk(i_clk),
	.i_rst(t_reset_r),
	.i_start(tra_start_r),
	.N(i_n),
	.a(trans_i_r),
	.b(trans_i_r),
	.m(trans_o_w),
	.calc_rd(update_t_fin_w)
);
ModuloProduct moduloproduct(
	.i_clk(i_clk),
	.i_rst(prep_reset_r),
	.i_start(prep_start_r),
	.N(i_n),
	.b(text_r),
	.a({1'b1, 256'b0}),
	.k(9'd256),
	.t(trans_ini_w),
	.prep_rd(prep_fin_w)
);
// ======= combinational circuit =======
always_comb begin
	// default value
	state_w 		= state_r;
	t_reset_w		= t_reset_r;
	m_reset_w		= m_reset_r;
	prep_start_w   = prep_start_r;
	prep_reset_w	= prep_reset_r;
	text_w			= text_r;
	mod_start_w		= mod_start_r;
	tra_start_w		= tra_start_r;
	cal_fin_w 		= cal_fin_r;
	count_w 		= count_r;
	modulo_i_w 		= modulo_i_r;
	trans_i_w  		= trans_i_r;
	output_w 		= output_r;
	// state cases
	case (state_r)
		S_IDLE: begin
			if(i_start) begin
				state_w 		= S_PREP;
				cal_fin_w		= 1'd0;
				text_w			= i_a;
				// start prep calculation
				prep_start_w	= 1'b1;
				// end prep reset
				prep_reset_w	= 1'b0;
			end
		end
		S_PREP: begin
			prep_start_w = 1'b0;
			if(prep_fin_r) begin
				state_w 	= S_PREMONT;
				modulo_i_w 	= 256'd1;
				trans_i_w	= trans_ini_r;
				count_w		= 9'd0;
				prep_reset_w= 1'b1;
			end
		end
		S_PREMONT: begin
			state_w			= S_MONT;
			// end m,t reset state
			m_reset_w		= 1'b0;
			t_reset_w		= 1'b0;
			// start m,t caclculation
			tra_start_w		= 1'b1;
			if(i_d[count_r] & 1) begin
				mod_start_w = 1'b1;
			end
			else begin
				mod_start_w = 1'b0;
			end
		end
		S_MONT: begin
			// shut down the start signal 
			if(mod_start_r) begin
				mod_start_w = 1'b0;
			end
			if(tra_start_r) begin
				tra_start_w = 1'b0;
			end 
			// mont finished
			if(update_t_fin_r && (update_t_fin_r || i_d[count_r])) begin
				state_w 	= S_CALC;
			end
		end
		S_CALC: begin
			// reset two Montgomery submodule
			t_reset_w = 1'b1;
			m_reset_w = 1'b1;
			if(count_r == 9'd255) begin // keep iterating
				state_w 	= S_IDLE;
				cal_fin_w 	= 1'b1;
				if(i_d[count_r] & 1) begin
					output_w 	= modulo_o_r;
				end
				else begin
					output_w	= modulo_i_r;
				end
			end
			else begin // output result
				state_w 	= S_PREMONT;
				t_reset_w 	= 1'b1;
				m_reset_w	= 1'b1;
				trans_i_w 	= trans_o_r;
				if(i_d[count_r] & 1) begin
					modulo_i_w = modulo_o_r;
				end
				else begin
					modulo_i_w = modulo_i_r;
				end
				count_w 	= count_r + 9'd1;
			end
		end
	endcase
end

// ======= sequential circuit =========
always_ff @(posedge i_clk or posedge i_rst) begin
	if(i_rst) begin
		// changed
		state_r 		<= S_IDLE;
		prep_start_r 	<= 1'b0;
		mod_start_r 	<= 1'b0;
		tra_start_r 	<= 1'b0;
		// reset three submodules
		m_reset_r		<= 1'b1;
		t_reset_r		<= 1'b1;
		prep_reset_r 	<= 1'b1;
		/////////////////////////
		cal_fin_r		<= 1'b0;
		// unchanged
		text_r			<= text_w;
		prep_fin_r 		<= prep_fin_w;
		update_m_fin_r 	<= update_m_fin_w;
		update_t_fin_r 	<= update_t_fin_w;
		count_r 		<= count_w;
		modulo_i_r 		<= modulo_i_w;
		modulo_o_r 		<= modulo_o_w;
		trans_ini_r 	<= trans_ini_w;
		trans_i_r 		<= trans_i_w;
		trans_o_r 		<= trans_o_w;
		output_r 		<= output_w;
	end
	else begin
		state_r 		<= state_w;
		prep_start_r    <= prep_start_w;
		prep_reset_r    <= prep_reset_w;
		mod_start_r 	<= mod_start_w;
		m_reset_r		<= m_reset_w;
		t_reset_r		<= t_reset_w;
		tra_start_r 	<= tra_start_w;
		text_r			<= text_w;
		prep_fin_r 		<= prep_fin_w;
		update_m_fin_r 	<= update_m_fin_w;
		update_t_fin_r 	<= update_t_fin_w;
		cal_fin_r 		<= cal_fin_w;
		count_r 		<= count_w;
		modulo_i_r 		<= modulo_i_w;
		modulo_o_r 		<= modulo_o_w;
		trans_ini_r 	<= trans_ini_w;
		trans_i_r 		<= trans_i_w;
		trans_o_r 		<= trans_o_w;
		output_r 		<= output_w;
	end
end
endmodule
