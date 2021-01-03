//typedef logic [1:0] chess_board [225];
module Suansha(
    input               i_clk,
	input               i_rst_n,
	input               i_start,
    input     [4:0]     i_depth,
	input     board     i_board,
    output              o_sha,
    output              o_finish,
    output    [3:0]     o_Xpos,
    output    [3:0]     o_Ypos
);

// wires 
board board_w0, board_w1, board_w2, board_w3, board_w4, board_w5, board_w6, board_w7, board_w8;
logic finish_w[11];
logic result_w[11];
logic start_w[11];
logic [3:0] Xpos[11];
logic [3:0] Ypos[11];
logic [4:0] depth[11];

assign o_sha    = result_w[0];
assign o_finish = finish_w[0];
assign depth[0] = (i_depth >= 0) ? i_depth - 5'd0 : 5'd0;
assign depth[1] = (i_depth >= 1) ? i_depth - 5'd1 : 5'd0;
assign depth[2] = (i_depth >= 2) ? i_depth - 5'd2 : 5'd0;
assign depth[3] = (i_depth >= 3) ? i_depth - 5'd3 : 5'd0;
assign depth[4] = (i_depth >= 4) ? i_depth - 5'd4 : 5'd0;
assign depth[5] = (i_depth >= 5) ? i_depth - 5'd5 : 5'd0;
assign depth[6] = (i_depth >= 6) ? i_depth - 5'd6 : 5'd0;
assign depth[7] = (i_depth >= 7) ? i_depth - 5'd7 : 5'd0;
assign depth[8] = (i_depth >= 8) ? i_depth - 5'd8 : 5'd0;
assign o_Xpos = Xpos[0];
assign o_Ypos = Ypos[0];

initial begin
    finish_w[9] = 1'b0;
    result_w[9] = 1'b0;
end

Kill_node node0(
    .i_clk(i_clk),
    .i_rst_n(i_rst_n),
    .i_start(i_start),
    .i_depth(depth[0]),
    .i_next(finish_w[1]),
    .i_sha(result_w[1]),
    .i_board(i_board),
    .o_board(board_w0),
    .o_sha(result_w[0]),
    .o_finish(finish_w[0]),
    .o_start(start_w[0]),
    .o_Xpos(Xpos[0]),
    .o_Ypos(Ypos[0])
);
Kill_node node1(
    .i_clk(i_clk),
    .i_rst_n(i_rst_n),
    .i_start(start_w[0]),
    .i_depth(depth[1]),
    .i_next(finish_w[2]),
    .i_sha(result_w[2]),
    .i_board(board_w0),
    .o_board(board_w1),
    .o_sha(result_w[1]),
    .o_finish(finish_w[1]),
    .o_start(start_w[1]),
    .o_Xpos(Xpos[1]),
    .o_Ypos(Ypos[1])
);
Kill_node node2(
    .i_clk(i_clk),
    .i_rst_n(i_rst_n),
    .i_start(start_w[1]),
    .i_depth(depth[2]),
    .i_next(finish_w[3]),
    .i_sha(result_w[3]),
    .i_board(board_w1),
    .o_board(board_w2),
    .o_sha(result_w[2]),
    .o_finish(finish_w[2]),
    .o_start(start_w[2]),
    .o_Xpos(Xpos[2]),
    .o_Ypos(Ypos[2])
);
Kill_node node3(
    .i_clk(i_clk),
    .i_rst_n(i_rst_n),
    .i_start(start_w[2]),
    .i_depth(depth[3]),
    .i_next(finish_w[4]),
    .i_sha(result_w[4]),
    .i_board(board_w2),
    .o_board(board_w3),
    .o_sha(result_w[3]),
    .o_finish(finish_w[3]),
    .o_start(start_w[3]),
    .o_Xpos(Xpos[3]),
    .o_Ypos(Ypos[3])
);
Kill_node node4(
    .i_clk(i_clk),
    .i_rst_n(i_rst_n),
    .i_start(start_w[3]),
    .i_depth(depth[4]),
    .i_next(finish_w[5]),
    .i_sha(result_w[5]),
    .i_board(board_w3),
    .o_board(board_w4),
    .o_sha(result_w[4]),
    .o_finish(finish_w[4]),
    .o_start(start_w[4]),
    .o_Xpos(Xpos[4]),
    .o_Ypos(Ypos[4])
);
//Kill_node node5(
//    .i_clk(i_clk),
//    .i_rst_n(i_rst_n),
//    .i_start(start_w[4]),
//    .i_depth(depth[5]),
//    .i_next(finish_w[6]),
//    .i_sha(result_w[6]),
//    .i_board(board_w4),
//    .o_board(board_w5),
//    .o_sha(result_w[5]),
//    .o_finish(finish_w[5]),
//    .o_start(start_w[5]),
//    .o_Xpos(Xpos[5]),
//    .o_Ypos(Ypos[5])
//);
//Kill_node node6(
//    .i_clk(i_clk),
//    .i_rst_n(i_rst_n),
//    .i_start(start_w[5]),
//    .i_depth(depth[6]),
//    .i_next(finish_w[7]),
//    .i_sha(result_w[7]),
//    .i_board(board_w5),
//    .o_board(board_w6),
//    .o_sha(result_w[6]),
//    .o_finish(finish_w[6]),
//    .o_start(start_w[6]),
//    .o_Xpos(Xpos[6]),
//    .o_Ypos(Ypos[6])
//);
//Kill_node node7(
//    .i_clk(i_clk),
//    .i_rst_n(i_rst_n),
//    .i_start(start_w[6]),
//    .i_depth(depth[7]),
//    .i_next(finish_w[8]),
//    .i_sha(result_w[8]),
//    .i_board(board_w6),
//    .o_board(board_w7),
//    .o_sha(result_w[7]),
//    .o_finish(finish_w[7]),
//    .o_start(start_w[7]),
//    .o_Xpos(Xpos[7]),
//    .o_Ypos(Ypos[7])
//);
//Kill_node node8(
//    .i_clk(i_clk),
//    .i_rst_n(i_rst_n),
//    .i_start(start_w[7]),
//    .i_depth(depth[8]),
//    .i_next(finish_w[9]),
//    .i_sha(result_w[9]),
//    .i_board(board_w7),
//    .o_board(board_w8),
//    .o_sha(result_w[8]),
//    .o_finish(finish_w[8]),
//    .o_start(start_w[8]),
//    .o_Xpos(Xpos[8]),
//    .o_Ypos(Ypos[8])
//);
endmodule