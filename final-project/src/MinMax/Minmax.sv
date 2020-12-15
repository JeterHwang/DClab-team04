typedef logic [1:0] board [256];
module Minmax (		// 
	input         i_clk,
	input         i_rst_n,
	input         i_start,
	input 		  i_next,			// 繼續找下一個放棋點
	input  board  i_board,          // 15*15*2 bit chess boad
    input         i_turn, 			// 0 -> 我方(max) / 1 -> 敵方(min)
	output board  o_board,			// output board 給"下一級"
	output signed [31:0] o_point,	// output point 給"上一級"
	output 		  o_finish,			// 告訴"上一級"我所有點都做完了
	output 		  o_start			// 告訴"下一級"開始動工
);

parameter S_IDLE = 3'd0;
parameter S_SHA  = 3'd1;
parameter S_RETURN = 3'd2;
parameter S_COUNT = 3'd3;
parameter S_IDLE = 3'd0;

// local variables
logic [2:0] state_r, state_w;
logic signed [31:0] point_r, point_w;

// point generator output
logic       PG_ready_w;
logic [4:0] cand_x_w;	// not used :(
logic [4:0] cand_y_w;	// not used :(

point_generator PG(
    .i_clk(i_clk),
    .i_rst_n(i_rst_n),
    .i_start(i_start),
    .i_request(i_next),
    .i_board(i_board),
    .o_horizontal(cand_x_w),
    .o_vertical(cand_y_w),
    .o_board(o_board),
    .o_ready(PG_ready_w),
    .o_finish(o_finish)
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

always_comb begin
	case(state_r)
		S_IDLE: begin
			if(i_start) begin
				if(i_depth == 5'd0) begin
					pending_start_w = 1'b1;
					state_w 		= S_SHA;
				end	
			end
		end
		S_COUNT: begin
			if(i_depth & 1)
				max(.score_A(point_r), .score_B(), .score_max(point_w));
			else begin
				min(.score_A(point_r), .score_B(), .score_min(point_w));
			end
		end
		S_RETURN: begin
			
		end
	endcase
end

always_ff @(posedge i_clk, negedge i_rst_n) begin
	
end
endmodule

