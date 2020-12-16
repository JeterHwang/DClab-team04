typedef logic [1:0] board [256];
module Minmax (		// 
	input         	i_clk,
	input         	i_rst_n,
	input   [4:0]   i_depth,
	input  signed [31:0] i_prev_point,
	// pairing signals
	input         	i_start,
	input 		  	i_next,			// 繼續找下一個放棋點
	input  signed [31:0] i_point,
	input  board  	i_board,        // 15*15*2 bit chess boad
	output board  	o_board,		// output board 給"下一級"
	output signed [31:0] o_point,	// output point 給"上一級"
	output 		  	o_finish,		// 告訴"上一級"我所有點都做完了
	output 		  	o_start,		// 告訴"下一級"開始動工
	output  [4:0]   o_Xpos,
    output  [4:0]   o_Ypos
);

parameter S_IDLE 	= 2'd0;
parameter S_PG  	= 2'd1;
parameter S_WAIT 	= 2'd2;
parameter S_PEND 	= 2'd3;

// local variables
board board_r, board_w;
logic turn;
logic pruning;
logic 1D_coor_w;
logic [1:0] state_r, state_w;
logic signed [31:0] point_r, point_w;
logic [6:0] pointer_r, pointer_w;
logic [4:0] cand_x_r, cand_x_w;
logic [4:0] cand_y_r, cand_y_w;
logic finish_r, finish_w;
logic next_start_r, next_start_w;

// point generator signals
logic PG_start_r, PG_start_w;
logic PG_finish;
logic [399:0] X_buffer;
logic [399:0] Y_buffer;
logic [6:0] SZ_buffer;

// score signals 
logic SC_start_r, SC_start_w;
logic SC_finish;
logic signed [31:0] SC_score;

assign turn 	= i_depth[0] & 1;
assign o_finish = finish_r;
assign o_point 	= point_r;
assign o_board 	= board_r;
assign o_start 	= next_start_r;
assign o_Xpos 	= cand_x_r;
assign o_Ypos 	= cand_y_r;

point_generator PG(
    .i_clk(i_clk),
    .i_rst_n(i_rst_n),
    .i_start(PG_start),
    .i_board(i_board),
    .o_posX(X_buffer),
    .o_posY(Y_buffer),
    .o_size(SZ_buffer),
    .o_finish(PG_finish)
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

task min(
	input signed [31:0] score_A,
	input signed [31:0] score_B,
	output signed [31:0] score_min
);
	assign score_min = (score_A <= score_B) ? score_A : score_B;
endtask

task max(
	input signed [31:0] score_A,
	input signed [31:0] score_B,
	output signed [31:0] score_max
);
	assign score_max = (score_A >= score_B) ? score_A : score_B;
endtask

task prune(
	input signed [31:0] score_child,
	input signed [31:0] score_parent,
	input MinorMax,
	output valid
);
	assign valid = ((MinorMax == 1'b0 && score_child >= score_parent) || (MinorMax == 1'b1 && score_child <= score_parent)) : 1'b1 : 1'b0;
endtask

always_comb begin
	case(state_r)
		S_IDLE: begin
			finish_w = 1'b0;
			if(i_start) begin
				if(i_depth == 5'd0) begin
					SC_start_w 	= 1'b1;
					state_w 	= S_PEND;
				end
				else begin
					PG_start_w 	= 1'b1;
					state_w 	= S_PG;
				end	
			end
		end
		S_PG: begin
			if(PG_finish) begin
				state_w = S_WAIT;
			end
		end
		S_WAIT: begin
			next_start_w = 1'b0;
			if(i_next) begin
				// update score
				if(turn)
					min(.score_A(point_r), .score_B(i_point), .score_min(point_w));
				else
					max(.score_A(point_r), .score_B(i_point), .score_max(point_w));
				// alpha - beta pruning
				prune(.score_child(i_point), .score_parent(i_prev_point), .MinorMax(turn), .valid(pruning));
				// change state
				if(pointer_r == 7'd0 || pruning) begin
					finish_w 	= 1'b1;
					state_w  	= S_IDLE;
				end
				else begin
					next_start_w 	= 1'b1;
					1D_coor_w 		= 15 * X_buffer[pointer_r : pointer_r - 4] + Y_buffer[pointer_r : pointer_r - 4];
					board_w[1D_coor_w] = turn;
					if(pointer_r > 7'd5)
						pointer_w	= pointer_r - 7'd5;
					else
						pointer_w 	= 7'd0;
				end
			end
			
		end
		S_PEND: begin
			if(SC_finish) begin
				point_w 	= SC_score;
				finish_w 	= 1'b1;
				state_w 	= S_IDLE; 
			end
		end
	endcase
end

always_ff @(posedge i_clk, negedge i_rst_n) begin
	
end
endmodule

