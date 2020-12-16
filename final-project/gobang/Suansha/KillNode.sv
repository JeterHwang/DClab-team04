typedef logic [1:0] chess_board [224:0];
// 我方：找尋所有攻擊點，判斷所有
module Kill_node(
    input               i_clk,
    input               i_rst_n,
    input               i_start,
    input               i_next,
    input  chess_board  i_board,
    input     [4:0]     i_Xpos,
    input     [4:0]     i_Ypos,
    output chess_board  o_board,
    output              o_sha,
    output              o_finish,
    output              o_start         
);

endmodule