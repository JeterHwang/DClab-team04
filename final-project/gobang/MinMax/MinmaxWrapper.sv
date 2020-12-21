module DFS(		// 
	input         i_clk,
	input         i_rst_n,
	input         i_start,
	input  [4:0]  i_depth,
	input  board  i_board,    
    output [4:0]  o_Xpos,     
	output [4:0]  o_Ypos,      
	output 		  o_finish
);

parameter MAXX = {1'b0, {31{1'b1}}};
parameter MINN = {1'b1, {30{1'b0}}, 1'b1};

// wires
board board_w[6];
logic finish_w[6];
logic signed [31:0] point_w[6];
logic start_w[6];
logic [4:0] depth[6];
logic [4:0] Xpos_w[6];
logic [4:0] Ypos_w[6];

assign o_Xpos 	= Xpos_w[0];
assign o_Ypos 	= Ypos_w[0];
assign o_finish = finish_w[0];
assign depth[0] = (i_depth >= 1) ? i_depth - 1 : 5'd0;
assign depth[1] = (i_depth >= 2) ? i_depth - 2 : 5'd0;
assign depth[2] = (i_depth >= 3) ? i_depth - 3 : 5'd0;
assign depth[3] = (i_depth >= 4) ? i_depth - 4 : 5'd0;
assign depth[4] = (i_depth >= 5) ? i_depth - 5 : 5'd0;

genvar i;
generate
	for(i = 0; i < 5; i = i + 1) begin
		if(i == 0) begin
			Kill_node kill(
				.i_clk(i_clk),
				.i_rst_n(i_rst_n),
				.i_depth(depth[i]),
				.i_prev_point(MAXX),
				.i_start(i_start),
				.i_next(finish_w[1]),
				.i_point(point_w[1]),
				.i_board(i_board),
				.o_board(board_w[0]),
				.o_point(point_w[0]),
				.o_finish(finish_w[0]),
				.o_start(start_w[0]),
				.o_Xpos(Xpos_w[0]),
				.o_Ypos(Ypos_w[0])
			);
		end
		else begin
			Kill_node kill(
				.i_clk(i_clk),
				.i_rst_n(i_rst_n),
				.i_depth(depth[i]),
				.i_prev_point(point_w[i-1]),
				.i_start(start_w[i-1]),
				.i_next(finish_w[i+1]),
				.i_point(point_w[i+1]),
				.i_board(board_w[i-1]),
				.o_board(board_w[i]),
				.o_point(point_w[i]),
				.o_finish(finish_w[i]),
				.o_start(start_w[i]),
				.o_Xpos(Xpos_w[i]),
				.o_Ypos(Ypos_w[i])
			);
		end
	end
endgenerate

endmodule

