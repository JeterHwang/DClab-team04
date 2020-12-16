typedef logic [1:0] chess_board [224:0];
module Win(
    input               i_clk,
    input               i_rst_n,
    input               i_start,
    input               i_turn,
    input     [4:0]     i_Xpos,
    input     [4:0]     i_Ypos,
    input  chess_board  i_board,
    output              o_win,
    output              o_finish
);
    
endmodule