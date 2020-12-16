typedef logic [1:0] board [256];
module leaf_node (
    input           i_clk,
    input           i_rst_n,
    input           i_start,
    input           i_turn,
    input  board    i_board,
    output signed [31:0] o_point,
    output          o_finish
);

logic pending_finish_w;

Score score(  // 我方分數 - 敵方分數
    .i_clk(i_clk),
    .i_rst_n(i_rst_n),
    .i_start(i_start),
    .i_board(i_board),
    .i_turn(i_turn),
    .o_score(o_point),
    .o_finish(pending_finish_w),
);

endmodule