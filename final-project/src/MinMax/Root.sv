typedef logic [1:0] board [256];
module root (		// 
	input         i_clk,
	input         i_rst_n,
	input         i_start,
	input 		  i_next,
	input  board  i_board,          // 15*15*2 bit chess boad
    input         i_turn, 			// 0 -> 我方(max) / 1 -> 敵方(min)
    output [4:0]  o_horizontal,      //           
	output [4:0]  o_vertical,       //
	output board  o_board,
	output 		  o_finish,
    output        o_start
);

parameter S_IDLE = 3'd0;
parameter S_SHA  = 3'd1;
parameter S_RETURN = 3'd2;
parameter S_COUNT = 3'd3;
parameter S_IDLE = 3'd0;

// local variables
logic [2:0] state_r, state_w;
logic signed [31:0] point_r, point_w;

// output answer
logic [4:0] max_x_r, max_x_w;
logic [4:0] max_y_r, max_r_w;

// point generator output
logic       PG_ready_w;
logic [4:0] cand_x_w;
logic [4:0] cand_y_w;

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
	if(!i_rst_n) begin
        state_r     <= S_IDLE;
    end
    else begin
        state_r     <= state_w;
    end
end
endmodule

