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
parameter S_IDLE = 2'd0;
parameter S_PREP = 2'd1;
parameter S_MONT = 2'd2;
parameter S_CALC = 2'd3;

// ======= registers & wires ======
logic state_r, state_w;
logic prep_fin_r, prep_fin_w;
logic mont_fin_r, mont_fin_w;
logic cal_fin_r, cal_fin_w;
logic [8:0] count_r, count_w;
logic [255:0] modulo_r, modulo_w; 
logic [255:0] trans_r, trans_w;
// ====== call submodules ========
Montgomery montgomery_mt(
	.i_clk(i_clk),
	.i_rst(i_rst),
	.i_start(),
	.N(i_n),
	.a(modulo_r),
	.b(trans_r),
);
Montgomery montgomery_tt(
	.i_clk(i_clk),
	.i_rst(i_rst),
	.i_start(),
	.N(i_n),
	.a(modulo_r),
	.b(modulo_r),
);
ModuloProduct moduloproduct(
	.i_clk(i_clk),
	.i_rst(i_rst),
	.i_start(i_start),
	.N(i_n),
	.b(i_y),
	.a(257'd(1<<256)),
	.k(9'd256),
);
// ======= combinational circuit =======
always_comb begin
	case (state_r)
		S_IDLE: begin
			if(i_start) begin
				
			end
			else begin
				
			end
		end
		S_PREP: begin
			
		end
		S_MONT: begin
			
		end
		S_CALC: begin
			
		end
	endcase
end

// ======= sequential circuit =========
always_ff @(posedge i_clk or posedge i_rst) begin
	if(i_rst) begin
		
	end
	else begin
		
	end
end

endmodule





