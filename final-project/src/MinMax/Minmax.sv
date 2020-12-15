// search depth = 5
// max(root) - min - max - min - max - leaf
typedef logic [1:0] board [256];
module Minmax (		// 
	input         i_clk,
	input         i_rst_n,
	input         i_start,
	input  board  i_board,          // 15*15*2 bit chess boad
    input         i_turn, 			// 0 -> 我方(max) / 1 -> 敵方(min)
	input  [4:0]  i_depth,
    output [4:0]  o_horizontal      //           
	output [4:0]  o_vertical,       //
	output signed [31:0] o_point,
	output 		  o_finish
);

parameter S_IDLE = 3'd0;
parameter S_SHA  = 3'd1;
parameter S_RETURN = 3'd2;
parameter S_COUNT = 3'd3;
parameter S_IDLE = 3'd0;

logic [2:0] state_r, state_w;
logic signed [31:0] point_r, point_w;

logic pending_start_r, pending_start_w;
logic signed [31:0] leaf_score;
logic pending_finish;

Score score(
	.i_clk(i_clk),
	.i_rst_n(i_rst_n),
	.i_start(pending_start_r),
	.i_board(i_board),
	.i_turn(i_turn),
	.o_score(leaf_score),
	.o_finish(pending_finish)
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
		S_SHA: begin
			pending_start_w = 1'b0;
			if(pending_finish) begin
				state_w	= S_RETURN;
				if(o_sha) begin		//如果有殺招分數設到最大
					point_w = leaf_score + 32'd10000000;				
				end
				else begin
					point_w = leaf_score;					
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

