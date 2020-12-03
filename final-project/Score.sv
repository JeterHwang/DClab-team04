typedef logic [1:0] chess_board [224:0]
module Score (
	input         i_clk,
	input         i_rst_n,
	input         i_start,
	input         chess_board i_board,         i_parent_score// 15*15*2 bit chess boad
    input         i_turn,
    input  [16:0] i_parent_score,                     
	output [16:0] o_score                      // 17 bit score
);













endmodule
