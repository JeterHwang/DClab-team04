typedef logic [1:0] board [225];
module point_generator(
    input           i_clk,
    input           i_rst_n,
    input           i_start,
    input   board   i_board,
    output  [399:0] o_posX,
    output  [399:0] o_posY,
    output  [6:0]   o_size,
    output          o_finish          // 是否所有空點都被找完
);

endmodule