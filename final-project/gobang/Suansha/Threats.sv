typedef logic [1:0] chess_board [224:0];
module Threats(
    input               i_clk,
	input               i_rst_n,
	input               i_start,
	input               i_turn,
    input  chess_board  i_board,
    output   [49:0]     o_posX,
    output   [49:0]     o_posY,
    output   [4:0]      o_size,
    output              o_finish
);

endmodule