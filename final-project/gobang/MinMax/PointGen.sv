typedef logic [1:0] board [256];
module point_generator(
    input           i_clk,
    input           i_rst_n,
    input           i_start,
    input           i_request,        // MinMax 請求點座標 
    input   board   i_board,
    output  [4:0]   o_horizontal,
    output  [4:0]   o_vertical,
    output  board   o_board,
    output          o_ready,          // 是否已準備好新的點座標
    output          o_finish          // 是否所有空點都被找完
);

endmodule