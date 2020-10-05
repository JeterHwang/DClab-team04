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


// ======= functions ======
function logic [255:0] ModuloProduct(
	input logic [255:0] N,b,
	input logic [256:0] a,
	input logic [9:0]   k
);
	pass
endfunction

function logic [255:0] MontgomeryAlgorithm(
	input logic [255:0] N,a,b
);
	pass
endfunction

function logic [255:0] RSA256Mont(
	input [255:0] N,y,d
);
	pass
endfunction

// ======= combinational circuit =======
always_comb begin
	
end

// ======= sequential circuit =========
always_ff @(posedge i_clk or posedge i_rst) begin
	
end

endmodule





