typedef logic [1:0] chess_board [224:0];
module Kill_node(
    input               i_clk,
    input               i_rst_n,
    input               i_start,
    input  chess_board  i_board,
    input     [4:0]     i_Xpos,
    input     [4:0]     i_Ypos,
    output              o_sha,
    output              o_finish           
);