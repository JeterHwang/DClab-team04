typedef logic [1:0] chess_board [224:0];
module Minmax (
	input         i_clk,
	input         i_rst_n,
	input         i_start,
	input         chess_board i_board,          // 15*15*2 bit chess boad
    input         i_turn,                       
    output [4:0]  o_horizontal                  //
	output [4:0]  o_vertical,                   // 
);














endmodule
