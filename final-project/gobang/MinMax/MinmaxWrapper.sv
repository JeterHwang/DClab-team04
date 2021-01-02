module DFS(		// 
	input         i_clk,
	input         i_rst_n,
	input         i_start,
	input  [4:0]  i_depth,
	input  board  i_board,    
    output [3:0]  o_Xpos,     
	output [3:0]  o_Ypos,      
	output 		  o_finish,
	output		  o_kill
);

parameter MAXX = {1'b0, {31{1'b1}}};
parameter MINN = {1'b1, {30{1'b0}}, 1'b1};

logic output_kill_r;

// wires
board board_w0, board_w1, board_w2, board_w3, board_w4;
logic finish_w[6];
logic signed [31:0] point_w[6];
logic start_w[6];
logic [4:0] depth[6];
logic [3:0] Xpos_w[6];
logic [3:0] Ypos_w[6];
logic kill[6];

assign o_Xpos 	= Xpos_w[0];
assign o_Ypos 	= Ypos_w[0];
assign o_finish = finish_w[0];
assign depth[0] = (i_depth >= 0) ? i_depth - 5'd0 : 5'd0;
assign depth[1] = (i_depth >= 1) ? i_depth - 5'd1 : 5'd0;
assign depth[2] = (i_depth >= 2) ? i_depth - 5'd2 : 5'd0;
assign depth[3] = (i_depth >= 3) ? i_depth - 5'd3 : 5'd0;
assign depth[4] = (i_depth >= 4) ? i_depth - 5'd4 : 5'd0;
assign o_kill = output_kill_r;

Base minmax0(
	.i_clk(i_clk),
	.i_rst_n(i_rst_n),
	.i_depth(depth[0]),
	.i_prev_point(MAXX),
	.i_start(i_start),
	.i_next(finish_w[1]),
	.i_point(point_w[1]),
	.i_board(i_board),
	.o_board(board_w0),
	.o_point(point_w[0]),
	.o_finish(finish_w[0]),
	.o_start(start_w[0]),
	.o_Xpos(Xpos_w[0]),
	.o_Ypos(Ypos_w[0]),
	.o_kill(kill[0])
);
Min minmax1(
	.i_clk(i_clk),
	.i_rst_n(i_rst_n),
	.i_depth(depth[1]),
	.i_prev_point(point_w[0]),
	.i_start(start_w[0]),
	.i_next(finish_w[2]),
	.i_point(point_w[2]),
	.i_board(board_w0),
	.o_board(board_w1),
	.o_point(point_w[1]),
	.o_finish(finish_w[1]),
	.o_start(start_w[1]),
	.o_Xpos(Xpos_w[1]),
	.o_Ypos(Ypos_w[1]),
	.o_kill(kill[1])
);
Max minmax2(
	.i_clk(i_clk),
	.i_rst_n(i_rst_n),
	.i_depth(depth[2]),
	.i_prev_point(point_w[1]),
	.i_start(start_w[1]),
	.i_next(finish_w[3]),
	.i_point(point_w[3]),
	.i_board(board_w1),
	.o_board(board_w2),
	.o_point(point_w[2]),
	.o_finish(finish_w[2]),
	.o_start(start_w[2]),
	.o_Xpos(Xpos_w[2]),
	.o_Ypos(Ypos_w[2]),
	.o_kill(kill[2])
);
Min minmax3(
	.i_clk(i_clk),
	.i_rst_n(i_rst_n),
	.i_depth(depth[3]),
	.i_prev_point(point_w[2]),
	.i_start(start_w[2]),
	.i_next(finish_w[4]),
	.i_point(point_w[4]),
	.i_board(board_w2),
	.o_board(board_w3),
	.o_point(point_w[3]),
	.o_finish(finish_w[3]),
	.o_start(start_w[3]),
	.o_Xpos(Xpos_w[3]),
	.o_Ypos(Ypos_w[3]),
	.o_kill(kill[3])
);
Max minmax4(
	.i_clk(i_clk),
	.i_rst_n(i_rst_n),
	.i_depth(depth[4]),
	.i_prev_point(point_w[3]),
	.i_start(start_w[3]),
	.i_next(finish_w[5]),
	.i_point(point_w[5]),
	.i_board(board_w3),
	.o_board(board_w4),
	.o_point(point_w[4]),
	.o_finish(finish_w[4]),
	.o_start(start_w[4]),
	.o_Xpos(Xpos_w[4]),
	.o_Ypos(Ypos_w[4]),
	.o_kill(kill[4])
);

always_ff @(posedge i_clk or negedge i_rst_n) begin
	if(!i_rst_n) begin
		output_kill_r <= 1'b0;
	end
	else begin
		if(i_start)
			output_kill_r <= 1'b0;
		else if(kill[i_depth])
			output_kill_r <= 1'b1;
		else
			output_kill_r <= output_kill_r;
	end
end
endmodule

