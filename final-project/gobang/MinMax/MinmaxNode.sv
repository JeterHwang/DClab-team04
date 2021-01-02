module Minmax(		// 
	input         	i_clk,
	input         	i_rst_n,
	input   [4:0]   i_depth,
	input  signed [31:0] i_prev_point,
	// pairing signals
	input         	i_start,
	input 		  	i_next,			// set high to start searching for the next point
	input  signed [31:0] i_point,
	input  board  	i_board,        // 15*15*2 bit chess boad
	output board  	o_board,		// output board to children
	output signed [31:0] o_point,	// output point tp parent
	output 		  	o_finish,		// tell parent that all the points have been searched 
	output 		  	o_start,		// tell children to start searching their points
	output  [3:0]   o_Xpos,
    output  [3:0]   o_Ypos,
	output 			o_kill
);

parameter MAXX = {1'b0, {31{1'b1}}};
parameter MINN = {1'b1, {30{1'b0}}, 1'b1};
parameter MAX_SS_DEPTH = 5'd8;

parameter S_IDLE 	= 3'd0;
parameter S_PG  	= 3'd1;
parameter S_WAIT 	= 3'd2;
parameter S_DFS		= 3'd3;
parameter S_SS		= 3'd4;
parameter S_PEND 	= 3'd5;


// local variables
board board_r, board_w;
logic turn;
logic pruning;
logic [2:0] state_r, state_w;
logic signed [31:0] point_r, point_w;
logic [8:0] pointer_r, pointer_w;
logic [3:0] cand_x_r, cand_x_w;
logic [3:0] cand_y_r, cand_y_w;
logic [3:0] ans_x_r, ans_x_w;
logic [3:0] ans_y_r, ans_y_w;
logic finish_r, finish_w;
logic next_start_r, next_start_w;
logic Iwin, Ilose;

// point generator signals
logic PG_start_r, PG_start_w;
logic PG_finish;
logic [399:0] X_buffer;
logic [399:0] Y_buffer;
logic [8:0] SZ_buffer;

// score signals 
logic SC_start_r, SC_start_w;
logic SC_finish;
logic signed [31:0] SC_score;

// Suansha
logic SS_result;
logic SS_finish;
logic SS_start_r, SS_start_w;
logic [4:0] SS_depth_r, SS_depth_w;
logic [3:0] SS_Xpos;
logic [3:0] SS_Ypos;

assign turn 	= i_depth[0] & 1;
assign o_finish = finish_r;
assign o_point 	= point_r;
assign o_board 	= board_r;
assign o_start 	= next_start_r;
assign o_Xpos 	= (i_depth == 0) ? SS_Xpos : ans_x_r;
assign o_Ypos 	= (i_depth == 0) ? SS_Ypos : ans_y_r;
assign o_kill   = SS_result;

point_generator PG(
    .i_clk(i_clk),
    .i_rst_n(i_rst_n),
    .i_start(PG_start_r),
    .i_board(i_board),
    .o_posX(X_buffer),
    .o_posY(Y_buffer),
    .o_size(SZ_buffer),
    .o_PGfinish(PG_finish)
);
Score score(
	.i_clk(i_clk),
	.i_rst_n(i_rst_n),
	.i_start(SC_start_r),
	.i_board(i_board),
	.i_turn(turn),
	.o_score(SC_score),
	.o_finish(SC_finish)
);
Suansha SS(
	.i_clk(i_clk),
	.i_rst_n(i_rst_n),
	.i_start(SS_start_r),
	.i_depth(SS_depth_r),
	.i_board(i_board),
	.o_sha(SS_result),
	.o_finish(SS_finish),
	.o_Xpos(SS_Xpos),
	.o_Ypos(SS_Ypos)
);
CheckFive checkIwin(
	.i_board(i_board), 
	.i_turn(turn), 
	.o_win(Iwin)
);
CheckFive checkIlose(
	.i_board(i_board), 
	.i_turn(~turn), 
	.o_win(Ilose)
);
task min(
	input signed [31:0] score_A,
	input signed [31:0] score_B,
	input [3:0] cand_x,
	input [3:0] cand_y,
	input [3:0] old_x,
	input [3:0] old_y,
	output [3:0] new_x,
	output [3:0] new_y,
	output signed [31:0] score_min
);
	if(score_A <= score_B) begin
		score_min 	= score_A;
		new_x 		= cand_x;
		new_y 		= cand_y;
	end
	else begin
		score_min = score_B;
		new_x 		= old_x;
		new_y 		= old_y;
	end
endtask

task max(
	input signed [31:0] score_A, // child point
	input signed [31:0] score_B, // old score
	input [3:0] cand_x,
	input [3:0] cand_y,
	input [3:0] old_x,
	input [3:0] old_y,
	output [3:0] new_x,
	output [3:0] new_y,
	output signed [31:0] score_max
);
	if(score_A >= score_B) begin
		score_max = score_A;
		new_x 		= cand_x;
		new_y 		= cand_y;
	end
	else begin
		score_max = score_B;
		new_x 		= old_x;
		new_y 		= old_y;
	end
endtask

task prune(
	input signed [31:0] score_child,
	input signed [31:0] score_parent,
	input MinorMax,
	output valid
);
	if((MinorMax == 0 && score_child >= score_parent) || (MinorMax == 1 && score_child <= score_parent))
		valid = 1'b1;
	else 
		valid = 1'b0;
endtask

always_comb begin
	board_w			= board_r;
	state_w			= state_r;
	point_w			= point_r;
	pointer_w		= pointer_r;
	cand_x_w		= cand_x_r;
	cand_y_w		= cand_y_r;
	ans_x_w			= ans_x_r;
	ans_y_w 		= ans_y_r;
	finish_w		= finish_r;
	next_start_w	= next_start_r;
	PG_start_w		= PG_start_r;
	SC_start_w		= SC_start_r;
	SS_start_w		= SS_start_r;
	SS_depth_w      = SS_depth_r;
	case(state_r)
		S_IDLE: begin
			finish_w = 1'b0;
			if(i_start) begin
				if(Iwin) begin
					finish_w = 1'b1;
					if(turn)
						point_w = {12'b111111111111, 20'b00001011110111000000};
					else
						point_w = 32'd1000000;
				end
				else if(Ilose) begin
					finish_w = 1'b1;
					if(turn)
						point_w = 32'd1000000;
					else
						point_w = {12'b111111111111, 20'b00001011110111000000};
				end
				else if(i_depth == 0) begin
					SS_start_w = 1'b1;
					SS_depth_w = 5'd2;
					state_w = S_SS;
				end
				else begin
					PG_start_w 	= 1'b1;
					state_w 	= S_PG;
				end	
			end
		end
		S_PG: begin
			PG_start_w = 1'b0;
			if(PG_finish) begin
				state_w = S_WAIT;
				pointer_w = 9'd399;
				if(turn == 0)  			// initialize
					point_w = MINN;
				else
					point_w = MAXX;
			end
		end
		S_WAIT: begin
			// alpha - beta pruning
			prune(.score_child(point_r), .score_parent(i_prev_point), .MinorMax(turn), .valid(pruning));
			if(pointer_r == SZ_buffer || pruning) begin
				finish_w 	= 1'b1;
				state_w  	= S_IDLE;
			end
			else begin
				for(int i = 0; i < 25; i++) begin 
					for(int j = 0; j < 25; j++) begin
						board_w[i * 25 + j] = i_board[i * 25 + j];
					end
				end
				next_start_w 		= 1'b1;
				cand_x_w			= X_buffer[pointer_r -: 4];
				cand_y_w			= Y_buffer[pointer_r -: 4];
				board_w[25 * (cand_x_w + 5) + (cand_y_w + 5)] 	= turn;
				pointer_w			= pointer_r - 4;
				state_w				= S_DFS;
			end
		end
		S_DFS: begin
			next_start_w = 1'b0;
			if(i_next) begin
				state_w 	= S_WAIT;
				// update score
				if(turn)
					min(.score_A(i_point), .score_B(point_r), .score_min(point_w), .cand_x(cand_x_r), .cand_y(cand_y_r), .old_x(ans_x_r), .old_y(ans_y_r), .new_x(ans_x_w), .new_y(ans_y_w));
				else
					max(.score_A(i_point), .score_B(point_r), .score_max(point_w), .cand_x(cand_x_r), .cand_y(cand_y_r), .old_x(ans_x_r), .old_y(ans_y_r), .new_x(ans_x_w), .new_y(ans_y_w));		
			end
		end
		S_SS: begin
			SS_start_w = 1'b0;
			if(SS_finish) begin
				if(SS_result) begin
					point_w 	= 32'd1000000;
					finish_w 	= 1'b1;
					state_w 	= S_IDLE;
				end
				else if(SS_depth_r < 8) begin
					SS_depth_w = SS_depth_r + 5'd2;
					SS_start_w = 1'b1;
				end
				else begin
					SC_start_w 	= 1'b1; 
					state_w 	= S_PEND;
				end
			end
		end
		S_PEND: begin
			SC_start_w = 1'b0;
			if(SC_finish) begin
				point_w 	= SC_score;
				finish_w 	= 1'b1;
				state_w 	= S_IDLE; 
			end
		end
	endcase
end

always_ff @(posedge i_clk, negedge i_rst_n) begin
	if(!i_rst_n) begin
		board_r			<= board_w;
		state_r			<= S_IDLE;
		point_r			<= 32'd0;
		pointer_r		<= 9'd0;
		cand_x_r		<= 4'd0;
		cand_y_r		<= 4'd0;
		ans_x_r			<= 4'd0;
		ans_y_r 		<= 4'd0;
		finish_r		<= 1'b0;
		next_start_r	<= 1'b0;
		PG_start_r		<= 1'b0;
		SC_start_r		<= 1'b0;
		SS_start_r		<= 1'b0;
		SS_depth_r		<= 5'd0;
	end
	else begin
		board_r			<= board_w;
		state_r			<= state_w;
		point_r			<= point_w;
		pointer_r		<= pointer_w;
		cand_x_r		<= cand_x_w;
		cand_y_r		<= cand_y_w;
		ans_x_r			<= ans_x_w;
		ans_y_r 		<= ans_y_w;
		finish_r		<= finish_w;
		next_start_r	<= next_start_w;
		PG_start_r		<= PG_start_w;
		SC_start_r		<= SC_start_w;
		SS_start_r		<= SS_start_w;
		SS_depth_r		<= SS_depth_w;
	end
end
endmodule

