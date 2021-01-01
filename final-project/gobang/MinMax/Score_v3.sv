// typedef logic [1:0] board [225];
module Score (
	input         i_clk,
	input         i_rst_n,
	input         i_start,
	input   board i_board,         // 15*15*2 bit chess board
    input         i_turn,          
	output signed [31:0] o_score,                      // 32 bit score
    output        o_finish
);

parameter S_SEVEN_UP   = 8'd1;
parameter S_SEVEN_LEFT = 8'd2;
parameter S_SEVEN_UL   = 8'd3;
parameter S_SEVEN_UR   = 8'd4;
parameter S_SIX_UP     = 8'd5;
parameter S_SIX_LEFT   = 8'd6;
parameter S_SIX_UL     = 8'd7;
parameter S_SIX_UR     = 8'd8;
parameter S_FIVE_UP    = 8'd9;
parameter S_FIVE_LEFT  = 8'd10;
parameter S_FIVE_UL    = 8'd11;
parameter S_FIVE_UR    = 8'd12;
parameter S_THREE_UP   = 8'd13;
parameter S_THREE_LEFT = 8'd14;
parameter S_THREE_UL   = 8'd15;
parameter S_THREE_UR   = 8'd16;
parameter S_EVALUATE   = 8'd17;
parameter S_SEVEN_UP1   = 8'd18;
parameter S_SEVEN_LEFT1 = 8'd19;
parameter S_SEVEN_UL1   = 8'd20;
parameter S_SEVEN_UR1   = 8'd21;
parameter S_SIX_UP1     = 8'd22;
parameter S_SIX_LEFT1   = 8'd23;
parameter S_SIX_UL1     = 8'd24;
parameter S_SIX_UR1     = 8'd25;
parameter S_FIVE_UP1    = 8'd26;
parameter S_FIVE_LEFT1  = 8'd27;
parameter S_FIVE_UL1    = 8'd28;
parameter S_FIVE_UR1    = 8'd29;
parameter S_THREE_UP1   = 8'd30;
parameter S_THREE_LEFT1 = 8'd31;
parameter S_THREE_UL1   = 8'd32;
parameter S_THREE_UR1   = 8'd33;


parameter FIVE5             = 10'd1000;
parameter FOUR              = 10'd500;
parameter THREE3            = 10'd100;
parameter TWO               = 10'd20;
parameter ONE               = 10'd5;
parameter BLOCKED_FOUR      = 10'd200;
parameter BLOCKED_THREE     = 10'd40;
parameter BLOCKED_TWO       = 10'd5;

parameter b         = 2'b0;
parameter w         = 2'b1;
parameter l         = 2'b10;

parameter  black_con_five = {b, b, b, b, b};
parameter  black_con_four = {l, b, b, b, b, l};
parameter  black_con_three  = {l, b, b, b, l};
parameter  black_jump_one_three_o  = {l, b, l, b, b, l};
parameter  black_jump_one_three_r  = {l, b, b, l, b, l};
parameter  black_con_two  = {l, l, b, b, l, l};
parameter  black_blank_one_two  = {l, b, l, b, l};
parameter  black_blank_two_two  = {l, b, l, l, b, l};
parameter  black_con_one  = {l, b, l};
parameter  black_blocked_con_four_o  = {l, b, b, b, b, w };
parameter  black_blocked_con_four_r  = {w, b, b, b, b, l };
parameter  black_blocked_jump_one_four_o  = {b, l, b, b, b};
parameter  black_blocked_jump_one_four_r  = {b, b, b, l, b};
parameter  black_blocked_jump_two_four  = {b, b, l, b, b};
parameter  black_blocked_con_three_o  = {l, l, b, b, b, w};
parameter  black_blocked_con_three_r  = {w, b, b, b, l, l};
parameter  black_blocked_jump_one_three_o = {l, b, l, b, b, w};
parameter  black_blocked_jump_one_three_r = {w, b, b, l, b, l};
parameter  black_blocked_jump_two_three_o = {l, b, b, l, b, w};
parameter  black_blocked_jump_two_three_r = {w, b, l, b, b, l};
parameter  black_blocked_blank_one_three_o = {b, l, l, b, b};
parameter  black_blocked_blank_one_three_r = {b, b, l, l, b};
parameter  black_blocked_blank_two_three = {b, l, b, l, b};
parameter  black_blocked_double_three = {w, l , b, b, b, l, w};
parameter  black_blocked_con_two_o  = {l, l, l, b, b, w };
parameter  black_blocked_con_two_r  = {w, b, b, l, l, l };
parameter  black_blocked_blank_one_two_o = {l, l, b, l, b, w};
parameter  black_blocked_blank_one_two_r = {w, b, l, b, l, l};
parameter  black_blocked_blank_two_two_o = {l, b, l, l, b, w};
parameter  black_blocked_blank_two_two_r = {w, b, l, l, b, l};
parameter  black_blocked_blank_three_two = {b, l, l, l, b};
parameter  black_blocked_one_o = {w, b, l};
parameter  black_blocked_one_r = {l, b, w};
parameter  white_con_five  = {w, w, w, w, w};
parameter  white_con_four  = {l, w, w, w, w, l};
parameter  white_con_three  = {l, w, w, w, l};
parameter  white_jump_one_three_o  = {l, w, l, w, w, l};
parameter  white_jump_one_three_r  = {l, w, w, l, w, l};
parameter  white_con_two  = {l, l, w, w, l, l};
parameter  white_blank_one_two  = {l, w, l, w, l};
parameter  white_blank_two_two  = {l, w, l, l, w, l};
parameter  white_con_one  = {l, w, l};
parameter  white_blocked_con_four_o  = {l, w, w, w, w, b };
parameter  white_blocked_con_four_r  = {b, w, w, w, w, l };
parameter  white_blocked_jump_one_four_o  = {w, l, w, w, w};
parameter  white_blocked_jump_one_four_r  = {w, w, w, l, w};
parameter  white_blocked_jump_two_four  = {w, w, l, w, w};
parameter  white_blocked_con_three_o  = {l, l, w, w, w, b};
parameter  white_blocked_con_three_r  = {b, w, w, w, l, l};
parameter  white_blocked_jump_one_three_o  = {l, w, l, w, w, b};
parameter  white_blocked_jump_one_three_r  = {b, w, w, l, b, l};
parameter  white_blocked_jump_two_three_o  = {l, w, w, l, w, w};
parameter  white_blocked_jump_two_three_r  = {w, w, l, w, w, l};
parameter  white_blocked_blank_one_three_o  = {w, l, l, w, w};
parameter  white_blocked_blank_one_three_r  = {w, w, l, l, w};
parameter  white_blocked_blank_two_three  = {w, l, w, l, w};
parameter  white_blocked_double_three  = {b, l, w, w ,w, l, b};
parameter  white_blocked_con_two_o  = {l, l, l, w, w, b };
parameter  white_blocked_con_two_r  = {b, w, w, l, l, l };
parameter  white_blocked_blank_one_two_o  = {l, l, w, l, w, b};
parameter  white_blocked_blank_one_two_r  = {b, w, l, w, l, l};
parameter  white_blocked_blank_two_two_o  = {l, w, l, l, w, b};
parameter  white_blocked_blank_two_two_r  = {b, w, l, l, w, l};
parameter  white_blocked_blank_three_two  = {w, l, l, l, w};
parameter  white_blocked_one_o = {b, w, l};
parameter  white_blocked_one_r= {l, w, b};

parameter logic [13:0] seven [0:1] = '{black_blocked_double_three, white_blocked_double_three};
parameter logic [11:0] six [0:37] = '{black_con_four, black_jump_one_three_o, black_blocked_jump_one_three_r, black_con_two, black_blank_two_two, black_blocked_con_four_o, black_blocked_con_four_r, black_blocked_con_three_o, black_blocked_con_three_r, black_blocked_jump_one_three_o, black_blocked_jump_one_three_r,
                                      black_blocked_jump_two_three_o, black_blocked_jump_two_three_r, black_blocked_con_two_o, black_blocked_con_two_r, black_blocked_blank_one_two_o, black_blocked_blank_one_two_r, black_blocked_blank_two_two_o, black_blocked_blank_two_two_r, white_con_four, white_jump_one_three_o, white_jump_one_three_r,
                                      white_con_two, white_blank_two_two, white_blocked_con_four_o, white_blocked_con_four_r, white_blocked_con_three_o, white_blocked_con_three_r, white_blocked_jump_one_three_o, white_blocked_jump_one_three_r, white_blocked_jump_two_three_o, white_blocked_jump_two_three_r, white_blocked_con_two_o, white_blocked_con_two_r, 
                                      white_blocked_blank_one_two_o, white_blocked_blank_one_two_r, white_blocked_blank_two_two_o, white_blocked_blank_two_two_r};
parameter logic [31:0] five [0:19] = '{black_con_five, black_con_three, black_blank_one_two, black_blocked_jump_one_four_o, black_blocked_jump_one_four_r, black_blocked_jump_two_four, black_blocked_blank_one_three_o, black_blocked_blank_one_three_r, black_blocked_blank_two_three, black_blocked_blank_three_two, white_con_five, white_con_three, white_blank_one_two,
                                       white_blocked_jump_one_four_o, white_blocked_jump_one_four_r, white_blocked_jump_two_four, white_blocked_blank_one_three_o, white_blocked_blank_one_three_r, white_blocked_blank_two_three, white_blocked_blank_three_two};
parameter logic [31:0] three [0:5] =  '{black_con_one, black_blocked_one_o, black_blocked_one_r, white_con_one, white_blocked_one_o, white_blocked_one_r};                                               

parameter logic [31:0] seven_weight [0:1] = '{BLOCKED_THREE, BLOCKED_THREE};
parameter logic [31:0] six_weight [0:37] = '{FOUR, THREE3, BLOCKED_THREE, TWO, TWO, BLOCKED_FOUR, BLOCKED_FOUR, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_THREE,
                                            BLOCKED_THREE, BLOCKED_THREE, BLOCKED_TWO, BLOCKED_TWO, BLOCKED_TWO, BLOCKED_TWO, BLOCKED_TWO, BLOCKED_TWO, FOUR, THREE3, THREE3,
                                            TWO, TWO, BLOCKED_FOUR, BLOCKED_FOUR, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_TWO, BLOCKED_TWO,
                                            BLOCKED_TWO, BLOCKED_TWO, BLOCKED_TWO, BLOCKED_TWO};

parameter logic [31:0] five_weight [0:19] = '{FIVE5, THREE3, TWO, BLOCKED_FOUR, BLOCKED_FOUR, BLOCKED_FOUR, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_TWO, FIVE5, THREE3, TWO,
                                            BLOCKED_FOUR, BLOCKED_FOUR, BLOCKED_FOUR, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_TWO};
parameter logic [31:0] three_weight [0:5]  = '{ONE, ONE, ONE, ONE, ONE, ONE};


logic signed [31:0] seven_score [0:269];
logic signed [31:0] six_score   [0:5999];
logic signed [31:0] five_score  [0:3299];
logic signed [31:0] three_score [0:1169];





logic [7:0]  state_r, state_w;
logic signed [31:0] white_score_r, white_score_w;
logic signed [31:0] black_score_r, black_score_w;
logic signed [31:0] score_r, score_w;
logic finished_r, finished_w;                      

assign o_finish = finished_r;
assign o_score     = score_r;


task Compare_seven_up;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:269];
    // 268

	for(int j = 0; j < 15; j++) begin
		if(j == 0)
			score[(0 * 15 + j) * 1 + 0] = 0;
		if({chess_board[j+0 *15], chess_board[j+(0+1)*15], chess_board[j+(0+2)*15], chess_board[j+(0+3)*15], chess_board[j+(0+4)*15], chess_board[j+(0+5)*15], chess_board[j+(0+6)*15] } == seven[0]) begin
			if(j == 0)
				score[(0 * 15 + j) * 1 + 0] = seven_weight[0];
			else
				score[(0 * 15 + j) * 1 + 0] = score[(0 * 15 + j) * 1 + 0 - 1] + seven_weight[0];
			end
		else begin
			if(j == 0)
				score[(0 * 15 + j) * 1 + 0] = 0;
			else
				score[(0 * 15 + j) * 1 + 0] = score[(0 * 15 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j < 15; j++) begin
		if({chess_board[j+1 *15], chess_board[j+(1+1)*15], chess_board[j+(1+2)*15], chess_board[j+(1+3)*15], chess_board[j+(1+4)*15], chess_board[j+(1+5)*15], chess_board[j+(1+6)*15] } == seven[0]) begin
			score[(1 * 15 + j) * 1 + 0] = score[(1 * 15 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(1 * 15 + j) * 1 + 0] = score[(1 * 15 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j < 15; j++) begin
		if({chess_board[j+2 *15], chess_board[j+(2+1)*15], chess_board[j+(2+2)*15], chess_board[j+(2+3)*15], chess_board[j+(2+4)*15], chess_board[j+(2+5)*15], chess_board[j+(2+6)*15] } == seven[0]) begin
			score[(2 * 15 + j) * 1 + 0] = score[(2 * 15 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(2 * 15 + j) * 1 + 0] = score[(2 * 15 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j < 15; j++) begin
		if({chess_board[j+3 *15], chess_board[j+(3+1)*15], chess_board[j+(3+2)*15], chess_board[j+(3+3)*15], chess_board[j+(3+4)*15], chess_board[j+(3+5)*15], chess_board[j+(3+6)*15] } == seven[0]) begin
			score[(3 * 15 + j) * 1 + 0] = score[(3 * 15 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(3 * 15 + j) * 1 + 0] = score[(3 * 15 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j < 15; j++) begin
		if({chess_board[j+4 *15], chess_board[j+(4+1)*15], chess_board[j+(4+2)*15], chess_board[j+(4+3)*15], chess_board[j+(4+4)*15], chess_board[j+(4+5)*15], chess_board[j+(4+6)*15] } == seven[0]) begin
			score[(4 * 15 + j) * 1 + 0] = score[(4 * 15 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(4 * 15 + j) * 1 + 0] = score[(4 * 15 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j < 15; j++) begin
		if({chess_board[j+5 *15], chess_board[j+(5+1)*15], chess_board[j+(5+2)*15], chess_board[j+(5+3)*15], chess_board[j+(5+4)*15], chess_board[j+(5+5)*15], chess_board[j+(5+6)*15] } == seven[0]) begin
			score[(5 * 15 + j) * 1 + 0] = score[(5 * 15 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(5 * 15 + j) * 1 + 0] = score[(5 * 15 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j < 15; j++) begin
		if({chess_board[j+6 *15], chess_board[j+(6+1)*15], chess_board[j+(6+2)*15], chess_board[j+(6+3)*15], chess_board[j+(6+4)*15], chess_board[j+(6+5)*15], chess_board[j+(6+6)*15] } == seven[0]) begin
			score[(6 * 15 + j) * 1 + 0] = score[(6 * 15 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(6 * 15 + j) * 1 + 0] = score[(6 * 15 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j < 15; j++) begin
		if({chess_board[j+7 *15], chess_board[j+(7+1)*15], chess_board[j+(7+2)*15], chess_board[j+(7+3)*15], chess_board[j+(7+4)*15], chess_board[j+(7+5)*15], chess_board[j+(7+6)*15] } == seven[0]) begin
			score[(7 * 15 + j) * 1 + 0] = score[(7 * 15 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(7 * 15 + j) * 1 + 0] = score[(7 * 15 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j < 15; j++) begin
		if({chess_board[j+8 *15], chess_board[j+(8+1)*15], chess_board[j+(8+2)*15], chess_board[j+(8+3)*15], chess_board[j+(8+4)*15], chess_board[j+(8+5)*15], chess_board[j+(8+6)*15] } == seven[0]) begin
			score[(8 * 15 + j) * 1 + 0] = score[(8 * 15 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(8 * 15 + j) * 1 + 0] = score[(8 * 15 + j) * 1 + 0 - 1];
		end
	end 
endtask

task Compare_seven_up1;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:269];
	for(int j = 0; j < 15; j++) begin
		if(j == 0)
			score[((0+9) * 15 + j) * 1 + 0] = 0;
		if({chess_board[j+0 *15], chess_board[j+(0+1)*15], chess_board[j+(0+2)*15], chess_board[j+(0+3)*15], chess_board[j+(0+4)*15], chess_board[j+(0+5)*15], chess_board[j+(0+6)*15] } == seven[1]) begin
			if(j == 0)
				score[((0+9) * 15 + j) * 1 + 0] = seven_weight[1];
			else
				score[((0+9) * 15 + j) * 1 + 0] = score[((0+9) * 15 + j) * 1 +0 - 1] + seven_weight[1];
			end
		else begin
			if(j == 0)
				score[((0+9) * 15 + j) * 1 + 0] = 0;
			else
				score[((0+9) * 15 + j) * 1 + 0] = score[((0+9) * 15 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j < 15; j++) begin
		if({chess_board[j+1 *15], chess_board[j+(1+1)*15], chess_board[j+(1+2)*15], chess_board[j+(1+3)*15], chess_board[j+(1+4)*15], chess_board[j+(1+5)*15], chess_board[j+(1+6)*15] } == seven[1]) begin
			score[((1+9) * 15 + j) * 1 + 0] = score[((1+9) * 15 + j) * 1 + 0 - 1] + seven_weight[1];
		end
		else begin
			score[((1+9) * 15 + j) * 1 + 0] = score[((1+9) * 15 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j < 15; j++) begin
		if({chess_board[j+2 *15], chess_board[j+(2+1)*15], chess_board[j+(2+2)*15], chess_board[j+(2+3)*15], chess_board[j+(2+4)*15], chess_board[j+(2+5)*15], chess_board[j+(2+6)*15] } == seven[1]) begin
			score[((2+9) * 15 + j) * 1 + 0] = score[((2+9) * 15 + j) * 1 + 0 - 1] + seven_weight[1];
		end
		else begin
			score[((2+9) * 15 + j) * 1 + 0] = score[((2+9) * 15 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j < 15; j++) begin
		if({chess_board[j+3 *15], chess_board[j+(3+1)*15], chess_board[j+(3+2)*15], chess_board[j+(3+3)*15], chess_board[j+(3+4)*15], chess_board[j+(3+5)*15], chess_board[j+(3+6)*15] } == seven[1]) begin
			score[((3+9) * 15 + j) * 1 + 0] = score[((3+9) * 15 + j) * 1 + 0 - 1] + seven_weight[1];
		end
		else begin
			score[((3+9) * 15 + j) * 1 + 0] = score[((3+9) * 15 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j < 15; j++) begin
		if({chess_board[j+4 *15], chess_board[j+(4+1)*15], chess_board[j+(4+2)*15], chess_board[j+(4+3)*15], chess_board[j+(4+4)*15], chess_board[j+(4+5)*15], chess_board[j+(4+6)*15] } == seven[1]) begin
			score[((4+9) * 15 + j) * 1 + 0] = score[((4+9) * 15 + j) * 1 + 0 - 1] + seven_weight[1];
		end
		else begin
			score[((4+9) * 15 + j) * 1 + 0] = score[((4+9) * 15 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j < 15; j++) begin
		if({chess_board[j+5 *15], chess_board[j+(5+1)*15], chess_board[j+(5+2)*15], chess_board[j+(5+3)*15], chess_board[j+(5+4)*15], chess_board[j+(5+5)*15], chess_board[j+(5+6)*15] } == seven[1]) begin
			score[((5+9) * 15 + j) * 1 + 0] = score[((5+9) * 15 + j) * 1 + 0 - 1] + seven_weight[1];
		end
		else begin
			score[((5+9) * 15 + j) * 1 + 0] = score[((5+9) * 15 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j < 15; j++) begin
		if({chess_board[j+6 *15], chess_board[j+(6+1)*15], chess_board[j+(6+2)*15], chess_board[j+(6+3)*15], chess_board[j+(6+4)*15], chess_board[j+(6+5)*15], chess_board[j+(6+6)*15] } == seven[1]) begin
			score[((6+9) * 15 + j) * 1 + 0] = score[((6+9) * 15 + j) * 1 + 0 - 1] + seven_weight[1];
		end
		else begin
			score[((6+9) * 15 + j) * 1 + 0] = score[((6+9) * 15 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j < 15; j++) begin
		if({chess_board[j+7 *15], chess_board[j+(7+1)*15], chess_board[j+(7+2)*15], chess_board[j+(7+3)*15], chess_board[j+(7+4)*15], chess_board[j+(7+5)*15], chess_board[j+(7+6)*15] } == seven[1]) begin
			score[((7+9) * 15 + j) * 1 + 0] = score[((7+9) * 15 + j) * 1 + 0 - 1] + seven_weight[1];
		end
		else begin
			score[((7+9) * 15 + j) * 1 + 0] = score[((7+9) * 15 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j < 15; j++) begin
		if({chess_board[j+8 *15], chess_board[j+(8+1)*15], chess_board[j+(8+2)*15], chess_board[j+(8+3)*15], chess_board[j+(8+4)*15], chess_board[j+(8+5)*15], chess_board[j+(8+6)*15] } == seven[1]) begin
			score[((8+9) * 15 + j) * 1 + 0] = score[((8+9) * 15 + j) * 1 + 0 - 1] + seven_weight[1];
		end
		else begin
			score[((8+9) * 15 + j) * 1 + 0] = score[((8+9) * 15 + j) * 1 + 0 - 1];
		end
	end

endtask
task Compare_seven_left;
	input [1:0] chess_board [225];
	output signed [31:0] score [0:269];
	for(int j = 0; j <= 8; j++) begin
		if(j == 0)
			score[(0 * 9 + j) * 1 + 0] = 0;
		if({chess_board[0 * 15 + j], chess_board[0 * 15 + j + 1], chess_board[0 * 15 + j + 2], chess_board[0 * 15 + j + 3], chess_board[0 * 15 + j + 4], chess_board[0 * 15 + j + 5], chess_board[0 * 15 + j + 6] } == seven[0]) begin
			if(j == 0)
				score[(0 * 9 + j) * 1 + 0] = seven_weight[0];
			else
				score[(0 * 9 + j) * 1 + 0] = score[(0 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
			end
		else begin
			if(j == 0)
				score[(0 * 9 + j) * 1 + 0] = 0;
			else
				score[(0 * 9 + j) * 1 + 0] = score[(0 * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[1 * 15 + j], chess_board[1 * 15 + j + 1], chess_board[1 * 15 + j + 2], chess_board[1 * 15 + j + 3], chess_board[1 * 15 + j + 4], chess_board[1 * 15 + j + 5], chess_board[1 * 15 + j + 6] } == seven[0]) begin
			score[(1 * 9 + j) * 1 + 0] = score[(1 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(1 * 9 + j) * 1 + 0] = score[(1 * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[2 * 15 + j], chess_board[2 * 15 + j + 1], chess_board[2 * 15 + j + 2], chess_board[2 * 15 + j + 3], chess_board[2 * 15 + j + 4], chess_board[2 * 15 + j + 5], chess_board[2 * 15 + j + 6] } == seven[0]) begin
			score[(2 * 9 + j) * 1 + 0] = score[(2 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(2 * 9 + j) * 1 + 0] = score[(2 * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[3 * 15 + j], chess_board[3 * 15 + j + 1], chess_board[3 * 15 + j + 2], chess_board[3 * 15 + j + 3], chess_board[3 * 15 + j + 4], chess_board[3 * 15 + j + 5], chess_board[3 * 15 + j + 6] } == seven[0]) begin
			score[(3 * 9 + j) * 1 + 0] = score[(3 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(3 * 9 + j) * 1 + 0] = score[(3 * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[4 * 15 + j], chess_board[4 * 15 + j + 1], chess_board[4 * 15 + j + 2], chess_board[4 * 15 + j + 3], chess_board[4 * 15 + j + 4], chess_board[4 * 15 + j + 5], chess_board[4 * 15 + j + 6] } == seven[0]) begin
			score[(4 * 9 + j) * 1 + 0] = score[(4 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(4 * 9 + j) * 1 + 0] = score[(4 * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[5 * 15 + j], chess_board[5 * 15 + j + 1], chess_board[5 * 15 + j + 2], chess_board[5 * 15 + j + 3], chess_board[5 * 15 + j + 4], chess_board[5 * 15 + j + 5], chess_board[5 * 15 + j + 6] } == seven[0]) begin
			score[(5 * 9 + j) * 1 + 0] = score[(5 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(5 * 9 + j) * 1 + 0] = score[(5 * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[6 * 15 + j], chess_board[6 * 15 + j + 1], chess_board[6 * 15 + j + 2], chess_board[6 * 15 + j + 3], chess_board[6 * 15 + j + 4], chess_board[6 * 15 + j + 5], chess_board[6 * 15 + j + 6] } == seven[0]) begin
			score[(6 * 9 + j) * 1 + 0] = score[(6 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(6 * 9 + j) * 1 + 0] = score[(6 * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[7 * 15 + j], chess_board[7 * 15 + j + 1], chess_board[7 * 15 + j + 2], chess_board[7 * 15 + j + 3], chess_board[7 * 15 + j + 4], chess_board[7 * 15 + j + 5], chess_board[7 * 15 + j + 6] } == seven[0]) begin
			score[(7 * 9 + j) * 1 + 0] = score[(7 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(7 * 9 + j) * 1 + 0] = score[(7 * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin

		if({chess_board[8 * 15 + j], chess_board[8 * 15 + j + 1], chess_board[8 * 15 + j + 2], chess_board[8 * 15 + j + 3], chess_board[8 * 15 + j + 4], chess_board[8 * 15 + j + 5], chess_board[8 * 15 + j + 6] } == seven[0]) begin
			score[(8 * 9 + j) * 1 + 0] = score[(8 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(8 * 9 + j) * 1 + 0] = score[(8 * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[9 * 15 + j], chess_board[9 * 15 + j + 1], chess_board[9 * 15 + j + 2], chess_board[9 * 15 + j + 3], chess_board[9 * 15 + j + 4], chess_board[9 * 15 + j + 5], chess_board[9 * 15 + j + 6] } == seven[0]) begin
			score[(9 * 9 + j) * 1 + 0] = score[(9 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(9 * 9 + j) * 1 + 0] = score[(9 * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[10 * 15 + j], chess_board[10 * 15 + j + 1], chess_board[10 * 15 + j + 2], chess_board[10 * 15 + j + 3], chess_board[10 * 15 + j + 4], chess_board[10 * 15 + j + 5], chess_board[10 * 15 + j + 6] } == seven[0]) begin
			score[(10 * 9 + j) * 1 + 0] = score[(10 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(10 * 9 + j) * 1 + 0] = score[(10 * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[11 * 15 + j], chess_board[11 * 15 + j + 1], chess_board[11 * 15 + j + 2], chess_board[11 * 15 + j + 3], chess_board[11 * 15 + j + 4], chess_board[11 * 15 + j + 5], chess_board[11 * 15 + j + 6] } == seven[0]) begin
			score[(11 * 9 + j) * 1 + 0] = score[(11 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(11 * 9 + j) * 1 + 0] = score[(11 * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[12 * 15 + j], chess_board[12 * 15 + j + 1], chess_board[12 * 15 + j + 2], chess_board[12 * 15 + j + 3], chess_board[12 * 15 + j + 4], chess_board[12 * 15 + j + 5], chess_board[12 * 15 + j + 6] } == seven[0]) begin
			score[(12 * 9 + j) * 1 + 0] = score[(12 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(12 * 9 + j) * 1 + 0] = score[(12 * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[13 * 15 + j], chess_board[13 * 15 + j + 1], chess_board[13 * 15 + j + 2], chess_board[13 * 15 + j + 3], chess_board[13 * 15 + j + 4], chess_board[13 * 15 + j + 5], chess_board[13 * 15 + j + 6] } == seven[0]) begin
			score[(13 * 9 + j) * 1 + 0] = score[(13 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(13 * 9 + j) * 1 + 0] = score[(13 * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[14 * 15 + j], chess_board[14 * 15 + j + 1], chess_board[14 * 15 + j + 2], chess_board[14 * 15 + j + 3], chess_board[14 * 15 + j + 4], chess_board[14 * 15 + j + 5], chess_board[14 * 15 + j + 6] } == seven[0]) begin
			score[(14 * 9 + j) * 1 + 0] = score[(14 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(14 * 9 + j) * 1 + 0] = score[(14 * 9 + j) * 1 + 0 - 1];
		end
	end
endtask
task Compare_seven_left1;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:269];
	for(int j = 0; j <= 8; j++) begin
		if(j == 0)
			score[((0 + 15) * 9 + j) * 1 + 0] = 0;
		if({chess_board[0 * 15 + j], chess_board[0 * 15 + j + 1], chess_board[0 * 15 + j + 2], chess_board[0 * 15 + j + 3], chess_board[0 * 15 + j + 4], chess_board[0 * 15 + j + 5], chess_board[0 * 15 + j + 6] } == seven[1]) begin
			if(j == 0)
				score[((0 + 15) * 9 + j) * 1 + 0] = seven_weight[1];
			else
				score[((0 + 15) * 9 + j) * 1 + 0] = score[((0 + 15) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
			end
		else begin
			if(j == 0)
				score[((0 + 15) * 9 + j) * 1 + 0] = 0;
			else
				score[((0 + 15) * 9 + j) * 1 + 0] = score[((0 + 15) * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[1 * 15 + j], chess_board[1 * 15 + j + 1], chess_board[1 * 15 + j + 2], chess_board[1 * 15 + j + 3], chess_board[1 * 15 + j + 4], chess_board[1 * 15 + j + 5], chess_board[1 * 15 + j + 6] } == seven[1]) begin
			score[((1 + 15) * 9 + j) * 1 + 0] = score[(144 + j) * 1 + 0 - 1] + seven_weight[1];
		end
		else begin
			score[((1 + 15) * 9 + j) * 1 + 0] = score[((1 + 15) * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[2 * 15 + j], chess_board[2 * 15 + j + 1], chess_board[2 * 15 + j + 2], chess_board[2 * 15 + j + 3], chess_board[2 * 15 + j + 4], chess_board[2 * 15 + j + 5], chess_board[2 * 15 + j + 6] } == seven[1]) begin
			score[((2 + 15) * 9 + j) * 1 + 0] = score[((2 + 15) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
		end
		else begin
			score[((2 + 15) * 9 + j) * 1 + 0] = score[((2 + 15) * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[3 * 15 + j], chess_board[3 * 15 + j + 1], chess_board[3 * 15 + j + 2], chess_board[3 * 15 + j + 3], chess_board[3 * 15 + j + 4], chess_board[3 * 15 + j + 5], chess_board[3 * 15 + j + 6] } == seven[1]) begin
			score[((3 + 15) * 9 + j) * 1 + 0] = score[((3 + 15) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
		end
		else begin
			score[((3 + 15) * 9 + j) * 1 + 0] = score[((3 + 15) * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[4 * 15 + j], chess_board[4 * 15 + j + 1], chess_board[4 * 15 + j + 2], chess_board[4 * 15 + j + 3], chess_board[4 * 15 + j + 4], chess_board[4 * 15 + j + 5], chess_board[4 * 15 + j + 6] } == seven[1]) begin
			score[((4 + 15) * 9 + j) * 1 + 0] = score[((4 + 15) * 1 + j) * 9 + 0 - 1] + seven_weight[1];
		end
		else begin
			score[((4 + 15) * 9 + j) * 1 + 0] = score[((4 + 15) * 1 + j) * 9 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[5 * 15 + j], chess_board[5 * 15 + j + 1], chess_board[5 * 15 + j + 2], chess_board[5 * 15 + j + 3], chess_board[5 * 15 + j + 4], chess_board[5 * 15 + j + 5], chess_board[5 * 15 + j + 6] } == seven[1]) begin
			score[((5 + 15) * 9 + j) * 1 + 0] = score[((5 + 15) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
		end
		else begin
			score[((5 + 15) * 9 + j) * 1 + 0] = score[((5 + 15) * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[6 * 15 + j], chess_board[6 * 15 + j + 1], chess_board[6 * 15 + j + 2], chess_board[6 * 15 + j + 3], chess_board[6 * 15 + j + 4], chess_board[6 * 15 + j + 5], chess_board[6 * 15 + j + 6] } == seven[1]) begin
			score[((6 + 15) * 9 + j) * 1 + 0] = score[((6 + 15) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
		end
		else begin
			score[((6 + 15) * 9 + j) * 1 + 0] = score[((6 + 15) * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[7 * 15 + j], chess_board[7 * 15 + j + 1], chess_board[7 * 15 + j + 2], chess_board[7 * 15 + j + 3], chess_board[7 * 15 + j + 4], chess_board[7 * 15 + j + 5], chess_board[7 * 15 + j + 6] } == seven[1]) begin
			score[((7 + 15) * 9 + j) * 1 + 0] = score[((7 + 15) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
		end
		else begin
			score[((7 + 15) * 9 + j) * 1 + 0] = score[((7 + 15) * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin

		if({chess_board[8 * 15 + j], chess_board[8 * 15 + j + 1], chess_board[8 * 15 + j + 2], chess_board[8 * 15 + j + 3], chess_board[8 * 15 + j + 4], chess_board[8 * 15 + j + 5], chess_board[8 * 15 + j + 6] } == seven[1]) begin
			score[((8 + 15) * 9 + j) * 1 + 0] = score[((8 + 15) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
		end
		else begin
			score[((8 + 15) * 9 + j) * 1 + 0] = score[((8 + 15) * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[9 * 15 + j], chess_board[9 * 15 + j + 1], chess_board[9 * 15 + j + 2], chess_board[9 * 15 + j + 3], chess_board[9 * 15 + j + 4], chess_board[9 * 15 + j + 5], chess_board[9 * 15 + j + 6] } == seven[1]) begin
			score[((9 + 15) * 9 + j) * 1 + 0] = score[((9 + 15) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
		end
		else begin
			score[((9 + 15) * 9 + j) * 1 + 0] = score[((9 + 15) * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[10 * 15 + j], chess_board[10 * 15 + j + 1], chess_board[10 * 15 + j + 2], chess_board[10 * 15 + j + 3], chess_board[10 * 15 + j + 4], chess_board[10 * 15 + j + 5], chess_board[10 * 15 + j + 6] } == seven[1]) begin
			score[((10 + 15) * 9 + j) * 1 + 0] = score[((10 + 15) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
		end
		else begin
			score[((10 + 15) * 9 + j) * 1 + 0] = score[((10 + 15) * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[11 * 15 + j], chess_board[11 * 15 + j + 1], chess_board[11 * 15 + j + 2], chess_board[11 * 15 + j + 3], chess_board[11 * 15 + j + 4], chess_board[11 * 15 + j + 5], chess_board[11 * 15 + j + 6] } == seven[1]) begin
			score[((11 + 15) * 9 + j) * 1 + 0] = score[((11 + 15) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
		end
		else begin
			score[((11 + 15) * 9 + j) * 1 + 0] = score[((11 + 15) * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[12 * 15 + j], chess_board[12 * 15 + j + 1], chess_board[12 * 15 + j + 2], chess_board[12 * 15 + j + 3], chess_board[12 * 15 + j + 4], chess_board[12 * 15 + j + 5], chess_board[12 * 15 + j + 6] } == seven[1]) begin
			score[((12 + 15) * 9 + j) * 1 + 0] = score[((12 + 15) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
		end
		else begin
			score[((12 + 15) * 9 + j) * 1 + 0] = score[((12 + 15) * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[13 * 15 + j], chess_board[13 * 15 + j + 1], chess_board[13 * 15 + j + 2], chess_board[13 * 15 + j + 3], chess_board[13 * 15 + j + 4], chess_board[13 * 15 + j + 5], chess_board[13 * 15 + j + 6] } == seven[1]) begin
			score[((13 + 15) * 9 + j) * 1 + 0] = score[((13 + 15) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
		end
		else begin
			score[((13 + 15) * 9 + j) * 1 + 0] = score[((13 + 15) * 9 + j) * 1 + 0 - 1];
		end
	end
	for(int j = 0; j <= 8; j++) begin
		if({chess_board[14 * 15 + j], chess_board[14 * 15 + j + 1], chess_board[14 * 15 + j + 2], chess_board[14 * 15 + j + 3], chess_board[14 * 15 + j + 4], chess_board[14 * 15 + j + 5], chess_board[14 * 15 + j + 6] } == seven[1]) begin
			score[((14 + 15) * 9 + j) * 1 + 0] = score[((14 + 15) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
		end
		else begin
			score[((14 + 15) * 9 + j) * 1 + 0] = score[((14 + 15) * 9 + j) * 1 + 0 - 1];
		end
	end
endtask
task Compare_seven_upper_left;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:269];
    
	for(int j = 0; j <= 8 ; j++) begin
		if(j == 0)
			score[(0 * 9 + j) * 1 + 0] = 0;
		if({chess_board[0 * 15 + j], chess_board[(0 + 1) * 15 + j + 1], chess_board[(0+2)*15 + j+2], chess_board[(0 + 3) * 15 + j + 3], chess_board[(0 + 4) * 15 + j + 4], chess_board[(0 + 5) * 15 + j + 5], chess_board[(0 + 6) * 15 + j + 6] } == seven[0]) begin
			if(j == 0)
				score[(0 * 9 + j) * 1 + 0] = seven_weight[0];
			else
				score[(0 * 9 + j) * 1 + 0] = score[(0 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			if(j == 0)
				score[(0 * 9 + j) * 1 + 0] = 0;
			else
				score[(0 * 9 + j) * 1 + 0] = score[(0 * 9 + j) * 1 + 0 - 1];			  
		end     
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[1 * 15 + j], chess_board[(1 + 1) * 15 + j + 1], chess_board[(1+2)*15 + j+2], chess_board[(1 + 3) * 15 + j + 3], chess_board[(1 + 4) * 15 + j + 4], chess_board[(1 + 5) * 15 + j + 5], chess_board[(1 + 6) * 15 + j + 6] } == seven[0]) begin
			score[(1 * 9 + j) * 1 + 0] = score[(1 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(1 * 9 + j) * 1 + 0] = score[(1 * 9 + j) * 1 + 0 - 1];
		end			  
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[2 * 15 + j], chess_board[(2 + 1) * 15 + j + 1], chess_board[(2+2)*15 + j+2], chess_board[(2 + 3) * 15 + j + 3], chess_board[(2 + 4) * 15 + j + 4], chess_board[(2 + 5) * 15 + j + 5], chess_board[(2 + 6) * 15 + j + 6] } == seven[0]) begin
			score[(2 * 9 + j) * 1 + 0] = score[(2 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(2 * 9 + j) * 1 + 0] = score[(2 * 9 + j) * 1 + 0 - 1];
		end			  
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[3 * 15 + j], chess_board[(3 + 1) * 15 + j + 1], chess_board[(3+2)*15 + j+2], chess_board[(3 + 3) * 15 + j + 3], chess_board[(3 + 4) * 15 + j + 4], chess_board[(3 + 5) * 15 + j + 5], chess_board[(3 + 6) * 15 + j + 6] } == seven[0]) begin
			score[(3 * 9 + j) * 1 + 0] = score[(3 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(3 * 9 + j) * 1 + 0] = score[(3 * 9 + j) * 1 + 0 - 1];
		end			  
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[4 * 15 + j], chess_board[(4 + 1) * 15 + j + 1], chess_board[(4+2)*15 + j+2], chess_board[(4 + 3) * 15 + j + 3], chess_board[(4 + 4) * 15 + j + 4], chess_board[(4 + 5) * 15 + j + 5], chess_board[(4 + 6) * 15 + j + 6] } == seven[0]) begin
			score[(4 * 9 + j) * 1 + 0] = score[(4 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(4 * 9 + j) * 1 + 0] = score[(4 * 9 + j) * 1 + 0 - 1];
		end			  
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[5 * 15 + j], chess_board[(5 + 1) * 15 + j + 1], chess_board[(5+2)*15 + j+2], chess_board[(5 + 3) * 15 + j + 3], chess_board[(5 + 4) * 15 + j + 4], chess_board[(5 + 5) * 15 + j + 5], chess_board[(5 + 6) * 15 + j + 6] } == seven[0]) begin
			score[(5 * 9 + j) * 1 + 0] = score[(5 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(5 * 9 + j) * 1 + 0] = score[(5 * 9 + j) * 1 + 0 - 1];
		end			  
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[6 * 15 + j], chess_board[(6 + 1) * 15 + j + 1], chess_board[(6+2)*15 + j+2], chess_board[(6 + 3) * 15 + j + 3], chess_board[(6 + 4) * 15 + j + 4], chess_board[(6 + 5) * 15 + j + 5], chess_board[(6 + 6) * 15 + j + 6] } == seven[0]) begin
			score[(6 * 9 + j) * 1 + 0] = score[(6 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(6 * 9 + j) * 1 + 0] = score[(6 * 9 + j) * 1 + 0 - 1];
		end			  
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[7 * 15 + j], chess_board[(7 + 1) * 15 + j + 1], chess_board[(7+2)*15 + j+2], chess_board[(7 + 3) * 15 + j + 3], chess_board[(7 + 4) * 15 + j + 4], chess_board[(7 + 5) * 15 + j + 5], chess_board[(7 + 6) * 15 + j + 6] } == seven[0]) begin
			score[(7 * 9 + j) * 1 + 0] = score[(7 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(7 * 9 + j) * 1 + 0] = score[(7 * 9 + j) * 1 + 0 - 1];
		end			  
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[8 * 15 + j], chess_board[(8 + 1) * 15 + j + 1], chess_board[(8+2)*15 + j+2], chess_board[(8 + 3) * 15 + j + 3], chess_board[(8 + 4) * 15 + j + 4], chess_board[(8 + 5) * 15 + j + 5], chess_board[(8 + 6) * 15 + j + 6] } == seven[0]) begin
			score[(8 * 9 + j) * 1 + 0] = score[(8 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(8 * 9 + j) * 1 + 0] = score[(8 * 9 + j) * 1 + 0 - 1];
		end			  
	end
endtask
task Compare_seven_upper_left1;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:269];
	for(int j = 0; j <= 8 ; j++) begin
		if(j == 0)
			score[((0+9) * 9 + j) * 1 + 0] = 0;
		if({chess_board[0 * 15 + j], chess_board[(0 + 1) * 15 + j + 1], chess_board[(0+2)*15 + j+2], chess_board[(0 + 3) * 15 + j + 3], chess_board[(0 + 4) * 15 + j + 4], chess_board[(0 + 5) * 15 + j + 5], chess_board[(0 + 6) * 15 + j + 6] } == seven[1]) begin
			if(j == 0)
             score[((0+9) * 9 + j) * 1 + 0] = seven_weight[1];
         else
             score[((0+9) * 9 + j) * 1 + 0] = score[((0+9) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
      end
      else begin
          if(j ==0)
              score[((0+9) * 9 + j) * 1 + 0] = 0;
          else
              score[((0+9) * 9 + j) * 1 + 0] = score[((0+9) * 9 + j) * 1 + 0 - 1];
      end
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[1 * 15 + j], chess_board[(1 + 1) * 15 + j + 1], chess_board[(1+2)*15 + j+2], chess_board[(1 + 3) * 15 + j + 3], chess_board[(1 + 4) * 15 + j + 4], chess_board[(1 + 5) * 15 + j + 5], chess_board[(1 + 6) * 15 + j + 6] } == seven[1]) begin
			score[((1+9) * 9 + j) * 1 + 0] = score[((1+9) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
      end
      else begin
			score[((1+9) * 9 + j) * 1 + 0] = score[((1+9) * 9 + j) * 1 + 0 - 1];
      end
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[2 * 15 + j], chess_board[(2 + 1) * 15 + j + 1], chess_board[(2+2)*15 + j+2], chess_board[(2 + 3) * 15 + j + 3], chess_board[(2 + 4) * 15 + j + 4], chess_board[(2 + 5) * 15 + j + 5], chess_board[(2 + 6) * 15 + j + 6] } == seven[1]) begin
			score[((2+9) * 9 + j) * 1 + 0] = score[((2+9) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
      end
      else begin
			score[((2+9) * 9 + j) * 1 + 0] = score[((2+9) * 9 + j) * 1 + 0 - 1];
      end
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[3 * 15 + j], chess_board[(3 + 1) * 15 + j + 1], chess_board[(3+2)*15 + j+2], chess_board[(3 + 3) * 15 + j + 3], chess_board[(3 + 4) * 15 + j + 4], chess_board[(3 + 5) * 15 + j + 5], chess_board[(3 + 6) * 15 + j + 6] } == seven[1]) begin
			score[((3+9) * 9 + j) * 1 + 0] = score[((3+9) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
      end
      else begin
			score[((3+9) * 9 + j) * 1 + 0] = score[((3+9) * 9 + j) * 1 + 0 - 1];
      end
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[4 * 15 + j], chess_board[(4 + 1) * 15 + j + 1], chess_board[(4+2)*15 + j+2], chess_board[(4+ 3) * 15 + j + 3], chess_board[(4 + 4) * 15 + j + 4], chess_board[(4 + 5) * 15 + j + 5], chess_board[(4 + 6) * 15 + j + 6] } == seven[1]) begin
			score[((4+9) * 9 + j) * 1 + 0] = score[((4+9) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
      end
      else begin
			score[((4+9) * 9 + j) * 1 + 0] = score[((4+9) * 9 + j) * 1 + 0 - 1];
      end
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[5 * 15 + j], chess_board[(5 + 1) * 15 + j + 1], chess_board[(5+2)*15 + j+2], chess_board[(5 + 3) * 15 + j + 3], chess_board[(5 + 4) * 15 + j + 4], chess_board[(5 + 5) * 15 + j + 5], chess_board[(5 + 6) * 15 + j + 6] } == seven[1]) begin
			score[((5+9) * 9 + j) * 1 + 0] = score[((5+9) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
      end
      else begin
			score[((5+9) * 9 + j) * 1 + 0] = score[((5+9) * 9 + j) * 1 + 0 - 1];
      end
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[6 * 15 + j], chess_board[(6 + 1) * 15 + j + 1], chess_board[(6+2)*15 + j+2], chess_board[(6 + 3) * 15 + j + 3], chess_board[(6 + 4) * 15 + j + 4], chess_board[(6 + 5) * 15 + j + 5], chess_board[(6 + 6) * 15 + j + 6] } == seven[1]) begin
			score[((6+9) * 9 + j) * 1 + 0] = score[((6+9) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
      end
      else begin
			score[((6+9) * 9 + j) * 1 + 0] = score[((6+9) * 9 + j) * 1 + 0 - 1];
      end
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[7 * 15 + j], chess_board[(7 + 1) * 15 + j + 1], chess_board[(7+2)*15 + j+2], chess_board[(7 + 3) * 15 + j + 3], chess_board[(7 + 4) * 15 + j + 4], chess_board[(7 + 5) * 15 + j + 5], chess_board[(7 + 6) * 15 + j + 6] } == seven[1]) begin
			score[((7+9) * 9 + j) * 1 + 0] = score[((7+9) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
      end
      else begin
			score[((7+9) * 9 + j) * 1 + 0] = score[((7+9) * 9 + j) * 1 + 0 - 1];
      end
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[8 * 15 + j], chess_board[(8 + 1) * 15 + j + 1], chess_board[(8+2)*15 + j+2], chess_board[(8 + 3) * 15 + j + 3], chess_board[(8 + 4) * 15 + j + 4], chess_board[(8 + 5) * 15 + j + 5], chess_board[(8 + 6) * 15 + j + 6] } == seven[1]) begin
			score[((8+9) * 9 + j) * 1 + 0] = score[((8+9) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
      end
      else begin
			score[((8+9) * 9 + j) * 1 + 0] = score[((8+9) * 9 + j) * 1 + 0 - 1];
      end
	end
endtask
task Compare_seven_upper_right;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:269];
 	for(int j = 0; j <= 8 ; j++) begin
		if(j == 0)
			score[(0 * 9 + j) * 1 + 0] = 0;
		if({chess_board[0 * 15 + j + 6], chess_board[(0 + 1) * 15 + j + 5], chess_board[(0 + 2) * 15 + j + 4], chess_board[(0 + 3) * 15 + j + 3], chess_board[(0 + 4) * 15 + j + 2], chess_board[(0 + 5) * 15 + j + 1], chess_board[(0 + 6) * 15 + j] } == seven[0]) begin
			if(j == 0)
				score[(0 * 9 + j) * 1 + 0] = seven_weight[0];
			else
				score[(0 * 9 + j) * 1 + 0] = score[(0 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			if(j == 0)
				score[(0 * 9 + j) * 1 + 0] = 0;
			else
				score[(0 * 9 + j) * 1 + 0] = score[(0 * 9 + j) * 1 + 0 - 1];			  
		end     
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[1 * 15 + j + 6], chess_board[(1 + 1) * 15 + j + 5], chess_board[(1 + 2) * 15 + j + 4], chess_board[(1 + 3) * 15 + j + 3], chess_board[(1 + 4) * 15 + j + 2], chess_board[(1 + 5) * 15 + j + 1], chess_board[(1 + 6) * 15 + j] } == seven[0]) begin
			score[(1 * 9 + j) * 1 + 0] = score[(1 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(1 * 9 + j) * 1 + 0] = score[(1 * 9 + j) * 1 + 0 - 1];
		end			  
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[2 * 15 + j + 6], chess_board[(2 + 1) * 15 + j + 5], chess_board[(2 + 2) * 15 + j + 4], chess_board[(2 + 3) * 15 + j + 3], chess_board[(2 + 4) * 15 + j + 2], chess_board[(2 + 5) * 15 + j + 1], chess_board[(2 + 6) * 15 + j] } == seven[0]) begin
			score[(2 * 9 + j) * 1 + 0] = score[(2 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(2 * 9 + j) * 1 + 0] = score[(2 * 9 + j) * 1 + 0 - 1];
		end			  
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[3 * 15 + j + 6], chess_board[(3 + 1) * 15 + j + 5], chess_board[(3 + 2) * 15 + j + 4], chess_board[(3 + 3) * 15 + j + 3], chess_board[(3 + 4) * 15 + j + 2], chess_board[(3 + 5) * 15 + j + 1], chess_board[(3 + 6) * 15 + j] } == seven[0]) begin
			score[(3 * 9 + j) * 1 + 0] = score[(3 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(3 * 9 + j) * 1 + 0] = score[(3 * 9 + j) * 1 + 0 - 1];
		end			  
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[4 * 15 + j + 6], chess_board[(4 + 1) * 15 + j + 5], chess_board[(4 + 2) * 15 + j + 4], chess_board[(4 + 3) * 15 + j + 3], chess_board[(4 + 4) * 15 + j + 2], chess_board[(4 + 5) * 15 + j + 1], chess_board[(4 + 6) * 15 + j] } == seven[0]) begin
			score[(4 * 9 + j) * 1 + 0] = score[(4 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(4 * 9 + j) * 1 + 0] = score[(4 * 9 + j) * 1 + 0 - 1];
		end			  
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[5 * 15 + j + 6], chess_board[(5 + 1) * 15 + j + 5], chess_board[(5 + 2) * 15 + j + 4], chess_board[(5 + 3) * 15 + j + 3], chess_board[(5 + 4) * 15 + j + 2], chess_board[(5 + 5) * 15 + j + 1], chess_board[(5 + 6) * 15 + j] } == seven[0]) begin
			score[(5 * 9 + j) * 1 + 0] = score[(5 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(5 * 9 + j) * 1 + 0] = score[(5 * 9 + j) * 1 + 0 - 1];
		end			  
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[6 * 15 + j + 6], chess_board[(6 + 1) * 15 + j + 5], chess_board[(6 + 2) * 15 + j + 4], chess_board[(6 + 3) * 15 + j + 3], chess_board[(6 + 4) * 15 + j + 2], chess_board[(6 + 5) * 15 + j + 1], chess_board[(6 + 6) * 15 + j] } == seven[0]) begin
			score[(6 * 9 + j) * 1 + 0] = score[(6 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(6 * 9 + j) * 1 + 0] = score[(6 * 9 + j) * 1 + 0 - 1];
		end			  
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[7 * 15 + j + 6], chess_board[(7 + 1) * 15 + j + 5], chess_board[(7 + 2) * 15 + j + 4], chess_board[(7 + 3) * 15 + j + 3], chess_board[(7 + 4) * 15 + j + 2], chess_board[(7 + 5) * 15 + j + 1], chess_board[(7 + 6) * 15 + j] } == seven[0]) begin
			score[(7 * 9 + j) * 1 + 0] = score[(7 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(7 * 9 + j) * 1 + 0] = score[(7 * 9 + j) * 1 + 0 - 1];
		end			  
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[8 * 15 + j + 6], chess_board[(8 + 1) * 15 + j + 5], chess_board[(8 + 2) * 15 + j + 4], chess_board[(8 + 3) * 15 + j + 3], chess_board[(8 + 4) * 15 + j + 2], chess_board[(8 + 5) * 15 + j + 1], chess_board[(8 + 6) * 15 + j] } == seven[0]) begin
			score[(8 * 9 + j) * 1 + 0] = score[(8 * 9 + j) * 1 + 0 - 1] + seven_weight[0];
		end
		else begin
			score[(8 * 9 + j) * 1 + 0] = score[(8 * 9 + j) * 1 + 0 - 1];
		end			  
	end
endtask
task Compare_seven_upper_right1;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:269];
	for(int j = 0; j <= 8 ; j++) begin
		if(j == 0)
			score[((0+9) * 9 + j) * 1 + 0] = 0;
		if({chess_board[0 * 15 + j + 6], chess_board[(0 + 1) * 15 + j + 5], chess_board[(0 + 2) * 15 + j + 4], chess_board[(0 + 3) * 15 + j + 3], chess_board[(0 + 4) * 15 + j + 2], chess_board[(0 + 5) * 15 + j + 1], chess_board[(0 + 6) * 15 + j] } == seven[1]) begin
			if(j == 0)
             score[((0+9) * 9 + j) * 1 + 0] = seven_weight[1];
         else
             score[((0+9) * 9 + j) * 1 + 0] = score[((0+9) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
      end
      else begin
          if(j ==0)
              score[((0+9) * 9 + j) * 1 + 0] = 0;
          else
              score[((0+9) * 9 + j) * 1 + 0] = score[((0+9) * 9 + j) * 1 + 0 - 1];
      end
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[1 * 15 + j + 6], chess_board[(1 + 1) * 15 + j + 5], chess_board[(1 + 2) * 15 + j + 4], chess_board[(1 + 3) * 15 + j + 3], chess_board[(1 + 4) * 15 + j + 2], chess_board[(1 + 5) * 15 + j + 1], chess_board[(1 + 6) * 15 + j] } == seven[1]) begin
			score[((1+9) * 9 + j) * 1 + 0] = score[((1+9) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
      end
      else begin
			score[((1+9) * 9 + j) * 1 + 0] = score[((1+9) * 9 + j) * 1 + 0 - 1];
      end
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[2 * 15 + j + 6], chess_board[(2 + 1) * 15 + j + 5], chess_board[(2 + 2) * 15 + j + 4], chess_board[(2 + 3) * 15 + j + 3], chess_board[(2 + 4) * 15 + j + 2], chess_board[(2 + 5) * 15 + j + 1], chess_board[(2 + 6) * 15 + j] } == seven[1]) begin
			score[((2+9) * 9 + j) * 1 + 0] = score[((2+9) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
      end
      else begin
			score[((2+9) * 9 + j) * 1 + 0] = score[((2+9) * 9 + j) * 1 + 0 - 1];
      end
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[3 * 15 + j + 6], chess_board[(3 + 1) * 15 + j + 5], chess_board[(3 + 2) * 15 + j + 4], chess_board[(3 + 3) * 15 + j + 3], chess_board[(3 + 4) * 15 + j + 2], chess_board[(3 + 5) * 15 + j + 1], chess_board[(3 + 6) * 15 + j] } == seven[1]) begin
			score[((3+9) * 9 + j) * 1 + 0] = score[((3+9) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
      end
      else begin
			score[((3+9) * 9 + j) * 1 + 0] = score[((3+9) * 9 + j) * 1 + 0 - 1];
      end
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[4 * 15 + j + 6], chess_board[(4 + 1) * 15 + j + 5], chess_board[(4 + 2) * 15 + j + 4], chess_board[(4 + 3) * 15 + j + 3], chess_board[(4 + 4) * 15 + j + 2], chess_board[(4 + 5) * 15 + j + 1], chess_board[(4 + 6) * 15 + j] } == seven[1]) begin
			score[((4+9) * 9 + j) * 1 + 0] = score[((4+9) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
      end
      else begin
			score[((4+9) * 9 + j) * 1 + 0] = score[((4+9) * 9 + j) * 1 + 0 - 1];
      end
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[5 * 15 + j + 6], chess_board[(5 + 1) * 15 + j + 5], chess_board[(5 + 2) * 15 + j + 4], chess_board[(5 + 3) * 15 + j + 3], chess_board[(5 + 4) * 15 + j + 2], chess_board[(5 + 5) * 15 + j + 1], chess_board[(5 + 6) * 15 + j] } == seven[1]) begin
			score[((5+9) * 9 + j) * 1 + 0] = score[((5+9) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
      end
      else begin
			score[((5+9) * 9 + j) * 1 + 0] = score[((5+9) * 9 + j) * 1 + 0 - 1];
      end
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[6 * 15 + j + 6], chess_board[(6 + 1) * 15 + j + 5], chess_board[(6 + 2) * 15 + j + 4], chess_board[(6 + 3) * 15 + j + 3], chess_board[(6 + 4) * 15 + j + 2], chess_board[(6 + 5) * 15 + j + 1], chess_board[(6 + 6) * 15 + j] } == seven[1]) begin
			score[((6+9) * 9 + j) * 1 + 0] = score[((6+9) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
      end
      else begin
			score[((6+9) * 9 + j) * 1 + 0] = score[((6+9) * 9 + j) * 1 + 0 - 1];
      end
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[7 * 15 + j + 6], chess_board[(7 + 1) * 15 + j + 5], chess_board[(7 + 2) * 15 + j + 4], chess_board[(7 + 3) * 15 + j + 3], chess_board[(7 + 4) * 15 + j + 2], chess_board[(7 + 5) * 15 + j + 1], chess_board[(7 + 6) * 15 + j] } == seven[1]) begin
			score[((7+9) * 9 + j) * 1 + 0] = score[((7+9) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
      end
      else begin
			score[((7+9) * 9 + j) * 1 + 0] = score[((7+9) * 9 + j) * 1 + 0 - 1];
      end
	end
	for(int j = 0; j <= 8 ; j++) begin
		if({chess_board[8 * 15 + j + 6], chess_board[(8 + 1) * 15 + j + 5], chess_board[(8 + 2) * 15 + j + 4], chess_board[(8 + 3) * 15 + j + 3], chess_board[(8 + 4) * 15 + j + 2], chess_board[(8 + 5) * 15 + j + 1], chess_board[(8 + 6) * 15 + j] } == seven[1]) begin
			score[((8+9) * 9 + j) * 1 + 0] = score[((8+9) * 9 + j) * 1 + 0 - 1] + seven_weight[1];
      end
      else begin
			score[((8+9) * 9 + j) * 1 + 0] = score[((8+9) * 9 + j) * 1 + 0 - 1];
      end
	end
endtask

task Compare_six_up;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:5999];
    
	 for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 19; k++) begin
			 if(j == 0 && k == 0)
				  score[(0 * 15 + j) * 19 + k] = 0;
			 if({chess_board[j+0*15], chess_board[j+(0+1)*15], chess_board[j+(0+2)*15], chess_board[j+(0+3)*15], chess_board[j+(0+4)*15], chess_board[j+(0+5)*15]} == six[k]) begin
				  if(j ==0 && k == 0) begin
						score[(0 * 15 + j) * 19 + k] = six_weight[k];
				  end
				  else begin
						score[(0 * 15 + j) * 19 + k] = score[(0 * 15 + j) * 19 + k - 1] + six_weight[k];
				  end
			 end
			 else begin
				  if(j ==0 && k == 0)
						score[(0 * 15 + j) * 19 + k] = 0;
				  else
						score[(0 * 15 + j) * 19 + k] = score[(0 * 15 + j) * 19 + k - 1];
			 end
					  
		end     
	 end
	 for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[j+1*15], chess_board[j+(1+1)*15], chess_board[j+(1+2)*15], chess_board[j+(1+3)*15], chess_board[j+(1+4)*15], chess_board[j+(1+5)*15]} == six[k]) begin
					score[(1 * 15 + j) * 19 + k] = score[(1 * 15 + j) * 19 + k - 1] + six_weight[k];
			 end
			 else begin
					score[(1 * 15 + j) * 19 + k] = score[(1 * 15 + j) * 19 + k - 1];
			 end			  
		end     
	 end
	 for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[j+2*15], chess_board[j+(2+1)*15], chess_board[j+(2+2)*15], chess_board[j+(2+3)*15], chess_board[j+(2+4)*15], chess_board[j+(2+5)*15]} == six[k]) begin
					score[(2 * 15 + j) * 19 + k] = score[(2 * 15 + j) * 19 + k - 1] + six_weight[k];
			 end
			 else begin
					score[(2 * 15 + j) * 19 + k] = score[(2 * 15 + j) * 19 + k - 1];
			 end			  
		end     
	 end
	 for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[j+3*15], chess_board[j+(3+1)*15], chess_board[j+(3+2)*15], chess_board[j+(3+3)*15], chess_board[j+(3+4)*15], chess_board[j+(3+5)*15]} == six[k]) begin
					score[(3 * 15 + j) * 19 + k] = score[(3 * 15 + j) * 19 + k - 1] + six_weight[k];
			 end
			 else begin
					score[(3 * 15 + j) * 19 + k] = score[(3 * 15 + j) * 19 + k - 1];
			 end			  
		end     
	 end
	 for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[j+4*15], chess_board[j+(4+1)*15], chess_board[j+(4+2)*15], chess_board[j+(4+3)*15], chess_board[j+(4+4)*15], chess_board[j+(4+5)*15]} == six[k]) begin
					score[(4 * 15 + j) * 19 + k] = score[(4 * 15 + j) * 19 + k - 1] + six_weight[k];
			 end
			 else begin
					score[(4 * 15 + j) * 19 + k] = score[(4 * 15 + j) * 19 + k - 1];
			 end			  
		end     
	 end
	 for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[j+5*15], chess_board[j+(5+1)*15], chess_board[j+(5+2)*15], chess_board[j+(5+3)*15], chess_board[j+(5+4)*15], chess_board[j+(5+5)*15]} == six[k]) begin
					score[(5 * 15 + j) * 19 + k] = score[(5 * 15 + j) * 19 + k - 1] + six_weight[k];
			 end
			 else begin
					score[(5 * 15 + j) * 19 + k] = score[(5 * 15 + j) * 19 + k - 1];
			 end			  
		end     
	 end
	 for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[j+6*15], chess_board[j+(6+1)*15], chess_board[j+(6+2)*15], chess_board[j+(6+3)*15], chess_board[j+(6+4)*15], chess_board[j+(6+5)*15]} == six[k]) begin
					score[(6 * 15 + j) * 19 + k] = score[(6 * 15 + j) * 19 + k - 1] + six_weight[k];
			 end
			 else begin
					score[(6 * 15 + j) * 19 + k] = score[(6 * 15 + j) * 19 + k - 1];
			 end			  
		end     
	 end
	 for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[j+7*15], chess_board[j+(7+1)*15], chess_board[j+(7+2)*15], chess_board[j+(7+3)*15], chess_board[j+(7+4)*15], chess_board[j+(7+5)*15]} == six[k]) begin
					score[(7 * 15 + j) * 19 + k] = score[(7 * 15 + j) * 19 + k - 1] + six_weight[k];
			 end
			 else begin
					score[(7 * 15 + j) * 19 + k] = score[(7 * 15 + j) * 19 + k - 1];
			 end			  
		end     
	 end
	 for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[j+8*15], chess_board[j+(8+1)*15], chess_board[j+(8+2)*15], chess_board[j+(8+3)*15], chess_board[j+(8+4)*15], chess_board[j+(8+5)*15]} == six[k]) begin
					score[(8 * 15 + j) * 19 + k] = score[(8 * 15 + j) * 19 + k - 1] + six_weight[k];
			 end
			 else begin
					score[(8 * 15 + j) * 19 + k] = score[(8 * 15 + j) * 19 + k - 1];
			 end			  
		end     
	 end
	 for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[j+9*15], chess_board[j+(9+1)*15], chess_board[j+(9+2)*15], chess_board[j+(9+3)*15], chess_board[j+(9+4)*15], chess_board[j+(9+5)*15]} == six[k]) begin
					score[(9 * 15 + j) * 19 + k] = score[(9 * 15 + j) * 19 + k - 1] + six_weight[k];
			 end
			 else begin
					score[(9 * 15 + j) * 19 + k] = score[(9 * 15 + j) * 19 + k - 1];
			 end			  
		end     
	 end
endtask
task Compare_six_up1;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:5999];
	 for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 19; k++) begin
			 if(j == 0 && k == 0)
				  score[((0+10) * 15 + j) * 19 + k] = 0;
			 if({chess_board[j+0*15], chess_board[j+(0+1)*15], chess_board[j+(0+2)*15], chess_board[j+(0+3)*15], chess_board[j+(0+4)*15], chess_board[j+(0+5)*15]} == six[k+19]) begin
				  if(j ==0 && k == 0) begin
						score[((0+10) * 15 + j) * 19 + k] = six_weight[k+19];
				  end
				  else begin
						score[((0+10) * 15 + j) * 19 + k] = score[((0+10) * 15 + j) * 19 + k - 1] + six_weight[k+19];
				  end
			 end
			 else begin
				  if(j ==0 && k == 0)
						score[((0+10) * 15 + j) * 19 + k] = 0;
				  else
						score[((0+10) * 15 + j) * 19 + k] = score[((0+10) * 15 + j) * 19 + k - 1];
			 end
					  
		end     
	 end
	 for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[j+1*15], chess_board[j+(1+1)*15], chess_board[j+(1+2)*15], chess_board[j+(1+3)*15], chess_board[j+(1+4)*15], chess_board[j+(1+5)*15]} == six[k+19]) begin
					score[((1+10) * 15 + j) * 19 + k] = score[((1+10) * 15 + j) * 19 + k - 1] + six_weight[k+19];
			end
			 else begin
				score[((1+10) * 15 + j) * 19 + k] = score[((1+10) * 15 + j) * 19 + k - 1];
			 end		  
		end     
	 end
	 for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[j+2*15], chess_board[j+(2+1)*15], chess_board[j+(2+2)*15], chess_board[j+(2+3)*15], chess_board[j+(2+4)*15], chess_board[j+(2+5)*15]} == six[k+19]) begin
					score[((2+10) * 15 + j) * 19 + k] = score[((2+10) * 15 + j) * 19 + k - 1] + six_weight[k+19];
			end
			 else begin
				score[((2+10) * 15 + j) * 19 + k] = score[((2+10) * 15 + j) * 19 + k - 1];
			 end		  
		end     
	 end
	 for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[j+3*15], chess_board[j+(3+1)*15], chess_board[j+(3+2)*15], chess_board[j+(3+3)*15], chess_board[j+(3+4)*15], chess_board[j+(3+5)*15]} == six[k+19]) begin
					score[((3+10) * 15 + j) * 19 + k] = score[((3+10) * 15 + j) * 19 + k - 1] + six_weight[k+19];
			end
			 else begin
				score[((3+10) * 15 + j) * 19 + k] = score[((3+10) * 15 + j) * 19 + k - 1];
			 end		  
		end     
	 end
	 for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[4+1*15], chess_board[j+(4+1)*15], chess_board[j+(4+2)*15], chess_board[j+(4+3)*15], chess_board[j+(4+4)*15], chess_board[j+(4+5)*15]} == six[k+19]) begin
					score[((4+10) * 15 + j) * 19 + k] = score[((4+10) * 15 + j) * 19 + k - 1] + six_weight[k+19];
			end
			 else begin
				score[((4+10) * 15 + j) * 19 + k] = score[((4+10) * 15 + j) * 19 + k - 1];
			 end		  
		end     
	 end
	 for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[j+5*15], chess_board[j+(5+1)*15], chess_board[j+(5+2)*15], chess_board[j+(5+3)*15], chess_board[j+(5+4)*15], chess_board[j+(5+5)*15]} == six[k+19]) begin
					score[((5+10) * 15 + j) * 19 + k] = score[((5+10) * 15 + j) * 19 + k - 1] + six_weight[k+19];
			end
			 else begin
				score[((5+10) * 15 + j) * 19 + k] = score[((5+10) * 15 + j) * 19 + k - 1];
			 end		  
		end     
	 end
	 for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[j+6*15], chess_board[j+(6+1)*15], chess_board[j+(6+2)*15], chess_board[j+(6+3)*15], chess_board[j+(6+4)*15], chess_board[j+(6+5)*15]} == six[k+19]) begin
					score[((6+10) * 15 + j) * 19 + k] = score[((6+10) * 15 + j) * 19 + k - 1] + six_weight[k+19];
			end
			 else begin
				score[((6+10) * 15 + j) * 19 + k] = score[((6+10) * 15 + j) * 19 + k - 1];
			 end		  
		end     
	 end
	 for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[j+7*15], chess_board[j+(7+1)*15], chess_board[j+(7+2)*15], chess_board[j+(7+3)*15], chess_board[j+(7+4)*15], chess_board[j+(7+5)*15]} == six[k+19]) begin
					score[((7+10) * 15 + j) * 19 + k] = score[((7+10) * 15 + j) * 19 + k - 1] + six_weight[k+19];
			end
			 else begin
				score[((7+10) * 15 + j) * 19 + k] = score[((7+10) * 15 + j) * 19 + k - 1];
			 end		  
		end     
	 end
	 for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[j+8*15], chess_board[j+(8+1)*15], chess_board[j+(8+2)*15], chess_board[j+(8+3)*15], chess_board[j+(8+4)*15], chess_board[j+(8+5)*15]} == six[k+19]) begin
					score[((8+10) * 15 + j) * 19 + k] = score[((8+10) * 15 + j) * 19 + k - 1] + six_weight[k+19];
			end
			 else begin
				score[((8+10) * 15 + j) * 19 + k] = score[((8+10) * 15 + j) * 19 + k - 1];
			 end		  
		end     
	 end
	 for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[j+9*15], chess_board[j+(9+1)*15], chess_board[j+(9+2)*15], chess_board[j+(9+3)*15], chess_board[j+(9+4)*15], chess_board[j+(9+5)*15]} == six[k+19]) begin
					score[((9+10) * 15 + j) * 19 + k] = score[((9+10) * 15 + j) * 19 + k - 1] + six_weight[k+19];
			end
			 else begin
				score[((9+10) * 15 + j) * 19 + k] = score[((9+10) * 15 + j) * 19 + k - 1];
			 end		  
		end     
	 end
endtask
task Compare_six_left;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:5999];
    // 5662
    for(int j = 0; j < 10; j++) begin
        for(int k=0; k < 19; k++) begin
            if(j == 0 && k == 0)
                score[(0 * 10 + j) * 19 + k] = 0;
            if({chess_board[0 * 15 + j], chess_board[0 * 15 + j + 1], chess_board[0 * 15 + j + 2], chess_board[0 * 15 + j + 3], chess_board[0 * 15 + j + 4], chess_board[0 * 15 + j + 5] } == six[k]) begin
                if(j ==0 && k == 0)
                    score[(0 * 10 + j) * 19 + k] = six_weight[k];
                else
                    score[(0 * 10 + j) * 19 + k] = score[(0 * 10 + j) * 19 + k - 1] + six_weight[k];
            end
            else begin
                if(j ==0 && k == 0)
                    score[(0 * 10 + j) * 19 + k] = 0;
                else
                    score[(0 * 10 + j) * 19 + k] = score[(0 * 10 + j) * 19 + k - 1];
            end
                   
        end     
    end
	 for(int j = 0; j < 10; j++) begin
        for(int k=0; k < 19; k++) begin
            if({chess_board[1 * 15 + j], chess_board[1 * 15 + j + 1], chess_board[1 * 15 + j + 2], chess_board[1 * 15 + j + 3], chess_board[1 * 15 + j + 4], chess_board[1 * 15 + j + 5] } == six[k]) begin
                 score[(1 * 10 + j) * 19 + k] = score[(1 * 10 + j) * 19 + k - 1] + six_weight[k];
            end
            else begin
                score[(1 * 10 + j) * 19 + k] = score[(1 * 10 + j) * 19 + k - 1];
            end       
        end     
    end
	 for(int j = 0; j < 10; j++) begin
        for(int k=0; k < 19; k++) begin
            if({chess_board[2 * 15 + j], chess_board[2 * 15 + j + 1], chess_board[2 * 15 + j + 2], chess_board[2 * 15 + j + 3], chess_board[2 * 15 + j + 4], chess_board[2 * 15 + j + 5] } == six[k]) begin
                 score[(2 * 10 + j) * 19 + k] = score[(2 * 10 + j) * 19 + k - 1] + six_weight[k];
            end
            else begin
                score[(2 * 10 + j) * 19 + k] = score[(2 * 10 + j) * 19 + k - 1];
            end       
        end     
    end
	 for(int j = 0; j < 10; j++) begin
        for(int k=0; k < 19; k++) begin
            if({chess_board[3 * 15 + j], chess_board[3 * 15 + j + 1], chess_board[3 * 15 + j + 2], chess_board[3 * 15 + j + 3], chess_board[3 * 15 + j + 4], chess_board[3 * 15 + j + 5] } == six[k]) begin
                 score[(3 * 10 + j) * 19 + k] = score[(3 * 10 + j) * 19 + k - 1] + six_weight[k];
            end
            else begin
                score[(3 * 10 + j) * 19 + k] = score[(3 * 10 + j) * 19 + k - 1];
            end       
        end     
    end
	 for(int j = 0; j < 10; j++) begin
        for(int k=0; k < 19; k++) begin
            if({chess_board[4 * 15 + j], chess_board[4 * 15 + j + 1], chess_board[4 * 15 + j + 2], chess_board[4 * 15 + j + 3], chess_board[4 * 15 + j + 4], chess_board[4 * 15 + j + 5] } == six[k]) begin
                 score[(4 * 10 + j) * 19 + k] = score[(4 * 10 + j) * 19 + k - 1] + six_weight[k];
            end
            else begin
                score[(4 * 10 + j) * 19 + k] = score[(4 * 10 + j) * 19 + k - 1];
				end
        end     
    end
	 for(int j = 0; j < 10; j++) begin
        for(int k=0; k < 19; k++) begin
            if({chess_board[5 * 15 + j], chess_board[5 * 15 + j + 1], chess_board[5 * 15 + j + 2], chess_board[5 * 15 + j + 3], chess_board[5 * 15 + j + 4], chess_board[5 * 15 + j + 5] } == six[k]) begin
                 score[(5 * 10 + j) * 19 + k] = score[(5 * 10 + j) * 19 + k - 1] + six_weight[k];
            end
            else begin
                score[(5 * 10 + j) * 19 + k] = score[(5 * 10 + j) * 19 + k - 1];
            end       
        end     
    end
	 for(int j = 0; j < 10; j++) begin
        for(int k=0; k < 19; k++) begin
            if({chess_board[6 * 15 + j], chess_board[6 * 15 + j + 1], chess_board[6 * 15 + j + 2], chess_board[6 * 15 + j + 3], chess_board[6 * 15 + j + 4], chess_board[6 * 15 + j + 5] } == six[k]) begin
                 score[(6 * 10 + j) * 19 + k] = score[(6 * 10 + j) * 19 + k - 1] + six_weight[k];
            end
            else begin
                score[(6 * 10 + j) * 19 + k] = score[(6 * 10 + j) * 19 + k - 1];
            end       
        end     
    end
	 for(int j = 0; j < 10; j++) begin
        for(int k=0; k < 19; k++) begin
            if({chess_board[7 * 15 + j], chess_board[7 * 15 + j + 1], chess_board[7 * 15 + j + 2], chess_board[7 * 15 + j + 3], chess_board[7 * 15 + j + 4], chess_board[7 * 15 + j + 5] } == six[k]) begin
                 score[(7 * 10 + j) * 19 + k] = score[(7 * 10 + j) * 19 + k - 1] + six_weight[k];
            end
            else begin
                score[(7 * 10 + j) * 19 + k] = score[(7 * 10 + j) * 19 + k - 1];
            end       
        end     
    end
	 for(int j = 0; j < 10; j++) begin
        for(int k=0; k < 19; k++) begin
            if({chess_board[8 * 15 + j], chess_board[8 * 15 + j + 1], chess_board[8 * 15 + j + 2], chess_board[8 * 15 + j + 3], chess_board[8 * 15 + j + 4], chess_board[8 * 15 + j + 5] } == six[k]) begin
                 score[(8* 10 + j) * 19 + k] = score[(8 * 10 + j) * 19 + k - 1] + six_weight[k];
            end
            else begin
                score[(8 * 10 + j) * 19 + k] = score[(8 * 10 + j) * 19 + k - 1];
            end       
        end     
    end
	 for(int j = 0; j < 10; j++) begin
        for(int k=0; k < 19; k++) begin
            if({chess_board[9 * 15 + j], chess_board[9 * 15 + j + 1], chess_board[9 * 15 + j + 2], chess_board[9 * 15 + j + 3], chess_board[9 * 15 + j + 4], chess_board[9 * 15 + j + 5] } == six[k]) begin
                 score[(9 * 10 + j) * 19 + k] = score[(9 * 10 + j) * 19 + k - 1] + six_weight[k];
            end
            else begin
                score[(9 * 10 + j) * 19 + k] = score[(9 * 10 + j) * 19 + k - 1];
            end       
        end     
    end
	 for(int j = 0; j < 10; j++) begin
        for(int k=0; k < 19; k++) begin
            if({chess_board[10 * 15 + j], chess_board[10 * 15 + j + 1], chess_board[10 * 15 + j + 2], chess_board[10 * 15 + j + 3], chess_board[10 * 15 + j + 4], chess_board[10 * 15 + j + 5] } == six[k]) begin
                 score[(10 * 10 + j) * 19 + k] = score[(10 * 10 + j) * 19 + k - 1] + six_weight[k];
            end
            else begin
                score[(10 * 10 + j) * 19 + k] = score[(10 * 10 + j) * 19 + k - 1];
            end       
        end     
    end
	 for(int j = 0; j < 10; j++) begin
        for(int k=0; k < 19; k++) begin
            if({chess_board[11 * 15 + j], chess_board[11 * 15 + j + 1], chess_board[11 * 15 + j + 2], chess_board[11 * 15 + j + 3], chess_board[11 * 15 + j + 4], chess_board[11 * 15 + j + 5] } == six[k]) begin
                 score[(11 * 10 + j) * 19 + k] = score[(11 * 10 + j) * 19 + k - 1] + six_weight[k];
            end
            else begin
                score[(11 * 10 + j) * 19 + k] = score[(11 * 10 + j) * 19 + k - 1];
            end       
        end     
    end
	 for(int j = 0; j < 10; j++) begin
        for(int k=0; k < 19; k++) begin
            if({chess_board[12 * 15 + j], chess_board[12 * 15 + j + 1], chess_board[12 * 15 + j + 2], chess_board[12 * 15 + j + 3], chess_board[12 * 15 + j + 4], chess_board[12 * 15 + j + 5] } == six[k]) begin
                 score[(12 * 10 + j) * 19 + k] = score[(12 * 10 + j) * 19 + k - 1] + six_weight[k];
            end
            else begin
                score[(12 * 10 + j) * 19 + k] = score[(12 * 10 + j) * 19 + k - 1];
            end       
        end     
    end
	 for(int j = 0; j < 10; j++) begin
        for(int k=0; k < 19; k++) begin
            if({chess_board[13 * 15 + j], chess_board[13 * 15 + j + 1], chess_board[13 * 15 + j + 2], chess_board[13 * 15 + j + 3], chess_board[13 * 15 + j + 4], chess_board[13 * 15 + j + 5] } == six[k]) begin
                 score[(13 * 10 + j) * 19 + k] = score[(13 * 10 + j) * 19 + k - 1] + six_weight[k];
            end
            else begin
                score[(13 * 10 + j) * 19 + k] = score[(13 * 10 + j) * 19 + k - 1];
            end       
        end     
    end
	 for(int j = 0; j < 10; j++) begin
        for(int k=0; k < 19; k++) begin
            if({chess_board[14 * 15 + j], chess_board[14 * 15 + j + 1], chess_board[14 * 15 + j + 2], chess_board[14 * 15 + j + 3], chess_board[14 * 15 + j + 4], chess_board[14 * 15 + j + 5] } == six[k]) begin
                 score[(14 * 10 + j) * 19 + k] = score[(14 * 10 + j) * 19 + k - 1] + six_weight[k];
            end
            else begin
                score[(14 * 10 + j) * 19 + k] = score[(14 * 10 + j) * 19 + k - 1];
            end       
        end     
    end
endtask
task Compare_six_left1;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:5999];
	 for(int j = 0; j < 10; j++) begin
		for(int k=0; k < 19; k++) begin
			 if(j == 0 && k == 0)
				  score[((0+15) * 10 + j) * 19 + k] = 0;
			 if({chess_board[0 * 15 + j], chess_board[0 * 15 + j + 1], chess_board[0 * 15 + j + 2], chess_board[0 * 15 + j + 3], chess_board[0 * 15 + j + 4], chess_board[0 * 15 + j + 5] } == six[k+19]) begin
				  if(j ==0 && k == 0)
						score[((0+15) * 10 + j) * 19 + k] = six_weight[k+19];
				  else
						score[((0+15) * 10 + j) * 19 + k] = score[((0+15) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			 end
			 else begin
				  if(j ==0 && k == 0)
						score[((0+15) * 10 + j) * 19 + k] = 0;
				  else
						score[((0+15) * 10 + j) * 19 + k] = score[((0+15) * 10 + j) * 19 + k - 1];
			 end
					  
		end     
	 end
	 for(int j = 0; j < 10; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[1 * 15 + j], chess_board[1 * 15 + j + 1], chess_board[1 * 15 + j + 2], chess_board[1 * 15 + j + 3], chess_board[1 * 15 + j + 4], chess_board[1 * 15 + j + 5] } == six[k+19]) begin
				score[((1+15) * 10 + j) * 19 + k] = score[((1+15) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			 end
			 else begin
				score[((1+15) * 10 + j) * 19 + k] = score[((1+15) * 10 + j) * 19 + k - 1];
			 end
					  
		end     
	 end
	 for(int j = 0; j < 10; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[2 * 15 + j], chess_board[2 * 15 + j + 1], chess_board[2 * 15 + j + 2], chess_board[2 * 15 + j + 3], chess_board[2 * 15 + j + 4], chess_board[2 * 15 + j + 5] } == six[k+19]) begin
				score[((2+15) * 10 + j) * 19 + k] = score[((2+15) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			 end
			 else begin
				score[((2+15) * 10 + j) * 19 + k] = score[((2+15) * 10 + j) * 19 + k - 1];
			 end
					  
		end     
	 end
	 for(int j = 0; j < 10; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[3 * 15 + j], chess_board[3 * 15 + j + 1], chess_board[3 * 15 + j + 2], chess_board[3 * 15 + j + 3], chess_board[3 * 15 + j + 4], chess_board[3 * 15 + j + 5] } == six[k+19]) begin
				score[((3+15) * 10 + j) * 19 + k] = score[((3+15) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			 end
			 else begin
				score[((3+15) * 10 + j) * 19 + k] = score[((3+15) * 10 + j) * 19 + k - 1];
			 end
					  
		end     
	 end
	 for(int j = 0; j < 10; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[4 * 15 + j], chess_board[4 * 15 + j + 1], chess_board[4 * 15 + j + 2], chess_board[4 * 15 + j + 3], chess_board[4 * 15 + j + 4], chess_board[4 * 15 + j + 5] } == six[k+19]) begin
				score[((4+15) * 10 + j) * 19 + k] = score[((4+15) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			 end
			 else begin
				score[((4+15) * 10 + j) * 19 + k] = score[((4+15) * 10 + j) * 19 + k - 1];
			 end
					  
		end     
	 end
	 for(int j = 0; j < 10; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[5 * 15 + j], chess_board[5 * 15 + j + 1], chess_board[5 * 15 + j + 2], chess_board[5 * 15 + j + 3], chess_board[5 * 15 + j + 4], chess_board[5 * 15 + j + 5] } == six[k+19]) begin
				score[((5+15) * 10 + j) * 19 + k] = score[((5+15) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			 end
			 else begin
				score[((5+15) * 10 + j) * 19 + k] = score[((5+15) * 10 + j) * 19 + k - 1];
			 end
					  
		end     
	 end
	 for(int j = 0; j < 10; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[6 * 15 + j], chess_board[6 * 15 + j + 1], chess_board[6 * 15 + j + 2], chess_board[6 * 15 + j + 3], chess_board[6 * 15 + j + 4], chess_board[6 * 15 + j + 5] } == six[k+19]) begin
				score[((6+15) * 10 + j) * 19 + k] = score[((6+15) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			 end
			 else begin
				score[((6+15) * 10 + j) * 19 + k] = score[((6+15) * 10 + j) * 19 + k - 1];
			 end
					  
		end     
	 end
	 for(int j = 0; j < 10; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[7 * 15 + j], chess_board[7 * 15 + j + 1], chess_board[7 * 15 + j + 2], chess_board[7 * 15 + j + 3], chess_board[7 * 15 + j + 4], chess_board[7 * 15 + j + 5] } == six[k+19]) begin
				score[((7+15) * 10 + j) * 19 + k] = score[((7+15) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			 end
			 else begin
				score[((7+15) * 10 + j) * 19 + k] = score[((7+15) * 10 + j) * 19 + k - 1];
			 end
					  
		end     
	 end
	for(int j = 0; j < 10; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[8 * 15 + j], chess_board[8 * 15 + j + 1], chess_board[8 * 15 + j + 2], chess_board[8 * 15 + j + 3], chess_board[8 * 15 + j + 4], chess_board[8 * 15 + j + 5] } == six[k+19]) begin
				score[((8+15) * 10 + j) * 19 + k] = score[((8+15) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			 end
			 else begin
				score[((8+15) * 10 + j) * 19 + k] = score[((8+15) * 10 + j) * 19 + k - 1];
			 end			  
		end     
	end
	for(int j = 0; j < 10; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[9 * 15 + j], chess_board[9 * 15 + j + 1], chess_board[9 * 15 + j + 2], chess_board[9 * 15 + j + 3], chess_board[9 * 15 + j + 4], chess_board[9 * 15 + j + 5] } == six[k+19]) begin
				score[((9+15) * 10 + j) * 19 + k] = score[((9+15) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			 end
			 else begin
				score[((9+15) * 10 + j) * 19 + k] = score[((9+15) * 10 + j) * 19 + k - 1];
			 end			  
		end     
	end
	for(int j = 0; j < 10; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[10 * 15 + j], chess_board[10 * 15 + j + 1], chess_board[10 * 15 + j + 2], chess_board[10 * 15 + j + 3], chess_board[10 * 15 + j + 4], chess_board[10 * 15 + j + 5] } == six[k+19]) begin
				score[((10+15) * 10 + j) * 19 + k] = score[((10+15) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			 end
			 else begin
				score[((10+15) * 10 + j) * 19 + k] = score[((10+15) * 10 + j) * 19 + k - 1];
			 end			  
		end     
	end
	for(int j = 0; j < 10; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[11 * 15 + j], chess_board[11 * 15 + j + 1], chess_board[11 * 15 + j + 2], chess_board[11 * 15 + j + 3], chess_board[11 * 15 + j + 4], chess_board[11 * 15 + j + 5] } == six[k+19]) begin
				score[((11+15) * 10 + j) * 19 + k] = score[((11+15) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			 end
			 else begin
				score[((11+15) * 10 + j) * 19 + k] = score[((11+15) * 10 + j) * 19 + k - 1];
			 end			  
		end     
	end
	for(int j = 0; j < 10; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[12 * 15 + j], chess_board[12 * 15 + j + 1], chess_board[12 * 15 + j + 2], chess_board[12 * 15 + j + 3], chess_board[12 * 15 + j + 4], chess_board[12 * 15 + j + 5] } == six[k+19]) begin
				score[((12+15) * 10 + j) * 19 + k] = score[((12+15) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			 end
			 else begin
				score[((12+15) * 10 + j) * 19 + k] = score[((12+15) * 10 + j) * 19 + k - 1];
			 end			  
		end     
	end
	for(int j = 0; j < 10; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[13 * 15 + j], chess_board[13 * 15 + j + 1], chess_board[13 * 15 + j + 2], chess_board[13 * 15 + j + 3], chess_board[13 * 15 + j + 4], chess_board[13 * 15 + j + 5] } == six[k+19]) begin
				score[((13+15) * 10 + j) * 19 + k] = score[((13+15) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			 end
			 else begin
				score[((13+15) * 10 + j) * 19 + k] = score[((13+15) * 10 + j) * 19 + k - 1];
			 end			  
		end     
	end
	for(int j = 0; j < 10; j++) begin
		for(int k=0; k < 19; k++) begin
			 if({chess_board[14 * 15 + j], chess_board[14 * 15 + j + 1], chess_board[14 * 15 + j + 2], chess_board[12 * 15 + j + 3], chess_board[14 * 15 + j + 4], chess_board[14 * 15 + j + 5] } == six[k+19]) begin
				score[((14+15) * 10 + j) * 19 + k] = score[((14+15) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			 end
			 else begin
				score[((14+15) * 10 + j) * 19 + k] = score[((14+15) * 10 + j) * 19 + k - 1];
			 end			  
		end     
	end
endtask
task Compare_six_upper_left;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:5999];
    

	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if(j == 0 && k == 0)
				score[(0 * 10 + j) * 19 + k] = 0;
			if({chess_board[0 * 15 + j], chess_board[(0 + 1) * 15 + j + 1], chess_board[(0+2)*15 +  j+2], chess_board[(0 + 3) * 15 + j + 3], chess_board[(0 + 4) * 15 + j + 4], chess_board[(0 + 5) * 15 + j + 5] } == six[k]) begin
				if(j ==0 && k == 0)
					score[(0 * 10 + j) * 19 + k] = six_weight[k];
				else
					score[(0 * 10 + j) * 19 + k] = score[(0 * 10 + j) * 19 + k - 1] + six_weight[k];
         end
         else begin
            if(j ==0 && k == 0)
               score[(0 * 10 + j) * 19 + k] = 0;
            else
               score[(0 * 10 + j) * 19 + k] = score[(0 * 10 + j) * 19 + k - 1];          
			end     
		end
	end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[1 * 15 + j], chess_board[(1 + 1) * 15 + j + 1], chess_board[(1+2)*15 +  j+2], chess_board[(1 + 3) * 15 + j + 3], chess_board[(1 + 4) * 15 + j + 4], chess_board[(1 + 5) * 15 + j + 5] } == six[k]) begin
				score[(1 * 10 + j) * 19 + k] = score[(1 * 10 + j) * 19 + k - 1] + six_weight[k];
         end
         else begin
             score[(1 * 10 + j) * 19 + k] = score[(1 * 10 + j) * 19 + k - 1];
         end              
		end
	end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[2 * 15 + j], chess_board[(2 + 1) * 15 + j + 1], chess_board[(2+2)*15 +  j+2], chess_board[(2 + 3) * 15 + j + 3], chess_board[(2 + 4) * 15 + j + 4], chess_board[(2 + 5) * 15 + j + 5] } == six[k]) begin
				score[(2 * 10 + j) * 19 + k] = score[(2 * 10 + j) * 19 + k - 1] + six_weight[k];
         end
         else begin
             score[(2 * 10 + j) * 19 + k] = score[(2 * 10 + j) * 19 + k - 1];
         end              
		end
	end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[3 * 15 + j], chess_board[(3 + 1) * 15 + j + 1], chess_board[(3+2)*15 +  j+2], chess_board[(3 + 3) * 15 + j + 3], chess_board[(3 + 4) * 15 + j + 4], chess_board[(3 + 5) * 15 + j + 5] } == six[k]) begin
				score[(3 * 10 + j) * 19 + k] = score[(3 * 10 + j) * 19 + k - 1] + six_weight[k];
         end
         else begin
             score[(3 * 10 + j) * 19 + k] = score[(3 * 10 + j) * 19 + k - 1];
         end              
		end
	end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[4 * 15 + j], chess_board[(4 + 1) * 15 + j + 1], chess_board[(4+2)*15 +  j+2], chess_board[(4 + 3) * 15 + j + 3], chess_board[(4 + 4) * 15 + j + 4], chess_board[(4 + 5) * 15 + j + 5] } == six[k]) begin
				score[(4 * 10 + j) * 19 + k] = score[(4 * 10 + j) * 19 + k - 1] + six_weight[k];
         end
         else begin
             score[(4 * 10 + j) * 19 + k] = score[(4 * 10 + j) * 19 + k - 1];
         end              
		end
	end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[5 * 15 + j], chess_board[(5 + 1) * 15 + j + 1], chess_board[(5+2)*15 +  j+2], chess_board[(5 + 3) * 15 + j + 3], chess_board[(5 + 4) * 15 + j + 4], chess_board[(5 + 5) * 15 + j + 5] } == six[k]) begin
				score[(5 * 10 + j) * 19 + k] = score[(5 * 10 + j) * 19 + k - 1] + six_weight[k];
         end
         else begin
             score[(5 * 10 + j) * 19 + k] = score[(5 * 10 + j) * 19 + k - 1];
         end              
		end
	end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[6 * 15 + j], chess_board[(6 + 1) * 15 + j + 1], chess_board[(6+2)*15 +  j+2], chess_board[(6 + 3) * 15 + j + 3], chess_board[(6 + 4) * 15 + j + 4], chess_board[(6 + 5) * 15 + j + 5] } == six[k]) begin
				score[(6 * 10 + j) * 19 + k] = score[(6 * 10 + j) * 19 + k - 1] + six_weight[k];
         end
         else begin
             score[(6 * 10 + j) * 19 + k] = score[(6 * 10 + j) * 19 + k - 1];
         end              
		end
	end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[1 * 15 + j], chess_board[(1 + 1) * 15 + j + 1], chess_board[(1+2)*15 +  j+2], chess_board[(1 + 3) * 15 + j + 3], chess_board[(1 + 4) * 15 + j + 4], chess_board[(1 + 5) * 15 + j + 5] } == six[k]) begin
				score[(7 * 10 + j) * 19 + k] = score[(1 * 10 + j) * 19 + k - 1] + six_weight[k];
         end
         else begin
             score[(7 * 10 + j) * 19 + k] = score[(1 * 10 + j) * 19 + k - 1];
         end              
		end
	end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[1 * 15 + j], chess_board[(7 + 1) * 15 + j + 1], chess_board[(7+2)*15 +  j+2], chess_board[(7 + 3) * 15 + j + 3], chess_board[(7 + 4) * 15 + j + 4], chess_board[(7 + 5) * 15 + j + 5] } == six[k]) begin
				score[(7 * 10 + j) * 19 + k] = score[(7 * 10 + j) * 19 + k - 1] + six_weight[k];
         end
         else begin
             score[(7 * 10 + j) * 19 + k] = score[(7 * 10 + j) * 19 + k - 1];
         end              
		end
	end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[8 * 15 + j], chess_board[(8 + 1) * 15 + j + 1], chess_board[(8+2)*15 +  j+2], chess_board[(8 + 3) * 15 + j + 3], chess_board[(8 + 4) * 15 + j + 4], chess_board[(8 + 5) * 15 + j + 5] } == six[k]) begin
				score[(8 * 10 + j) * 19 + k] = score[(8 * 10 + j) * 19 + k - 1] + six_weight[k];
         end
         else begin
             score[(8 * 10 + j) * 19 + k] = score[(8 * 10 + j) * 19 + k - 1];
         end              
		end
	end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[9 * 15 + j], chess_board[(9 + 1) * 15 + j + 1], chess_board[(9+2)*15 +  j+2], chess_board[(9 + 3) * 15 + j + 3], chess_board[(9 + 4) * 15 + j + 4], chess_board[(9 + 5) * 15 + j + 5] } == six[k]) begin
				score[(9 * 10 + j) * 19 + k] = score[(9 * 10 + j) * 19 + k - 1] + six_weight[k];
         end
         else begin
             score[(9 * 10 + j) * 19 + k] = score[(9 * 10 + j) * 19 + k - 1];
         end              
		end
	end
endtask
task Compare_six_upper_left1;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:5999];
 
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if(j == 0 && k == 0)
				score[((0+10) * 10 + j) * 19 + k] = 0;
			if({chess_board[0 * 15 + j], chess_board[(0 + 1) * 15 + j + 1], chess_board[(0+2)*15 +  j+2], chess_board[(0 + 3) * 15 + j + 3], chess_board[(0 + 4) * 15 + j + 4], chess_board[(0 + 5) * 15 + j + 5] } == six[k+19]) begin
				if(j ==0 && k == 0)
					score[((0+10) * 10 + j) * 19 + k] = six_weight[k+19];
				else
					score[((0+10) * 10 + j) * 19 + k] = score[((0+10) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			end
			else begin
				if(j ==0 && k == 0)
					score[((0+10) * 10 + j) * 19 + k] = 0;
				else
					score[((0+10) * 10 + j) * 19 + k] = score[((0+10) * 10 + j) * 19 + k - 1];
			end		  
		end     
  end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[1 * 15 + j], chess_board[(1 + 1) * 15 + j + 1], chess_board[(1+2)*15 +  j+2], chess_board[(1 + 3) * 15 + j + 3], chess_board[(1 + 4) * 15 + j + 4], chess_board[(1 + 5) * 15 + j + 5] } == six[k+19]) begin
				score[((1+10) * 10 + j) * 19 + k] = score[((1+10) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			end
			else begin
				score[((1+10) * 10 + j) * 19 + k] = score[((1+10) * 10 + j) * 19 + k - 1];
			end		  
		end     
  end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[2 * 15 + j], chess_board[(2 + 1) * 15 + j + 1], chess_board[(2+2)*15 +  j+2], chess_board[(2 + 3) * 15 + j + 3], chess_board[(2 + 4) * 15 + j + 4], chess_board[(2 + 5) * 15 + j + 5] } == six[k+19]) begin
				score[((2+10) * 10 + j) * 19 + k] = score[((2+10) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			end
			else begin
				score[((2+10) * 10 + j) * 19 + k] = score[((2+10) * 10 + j) * 19 + k - 1];
			end		  
		end     
  end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[3 * 15 + j], chess_board[(3 + 1) * 15 + j + 1], chess_board[(3+2)*15 +  j+2], chess_board[(3 + 3) * 15 + j + 3], chess_board[(3 + 4) * 15 + j + 4], chess_board[(3 + 5) * 15 + j + 5] } == six[k+19]) begin
				score[((3+10) * 10 + j) * 19 + k] = score[((3+10) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			end
			else begin
				score[((3+10) * 10 + j) * 19 + k] = score[((3+10) * 10 + j) * 19 + k - 1];
			end		  
		end     
  end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[4 * 15 + j], chess_board[(4 + 1) * 15 + j + 1], chess_board[(4+2)*15 +  j+2], chess_board[(4 + 3) * 15 + j + 3], chess_board[(4 + 4) * 15 + j + 4], chess_board[(4 + 5) * 15 + j + 5] } == six[k+19]) begin
				score[((4+10) * 10 + j) * 19 + k] = score[((4+10) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			end
			else begin
				score[((4+10) * 10 + j) * 19 + k] = score[((4+10) * 10 + j) * 19 + k - 1];
			end		  
		end     
  end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[5 * 15 + j], chess_board[(5 + 1) * 15 + j + 1], chess_board[(5+2)*15 +  j+2], chess_board[(5 + 3) * 15 + j + 3], chess_board[(5 + 4) * 15 + j + 4], chess_board[(5 + 5) * 15 + j + 5] } == six[k+19]) begin
				score[((5+10) * 10 + j) * 19 + k] = score[((5+10) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			end
			else begin
				score[((5+10) * 10 + j) * 19 + k] = score[((5+10) * 10 + j) * 19 + k - 1];
			end		  
		end     
  end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[6 * 15 + j], chess_board[(6 + 1) * 15 + j + 1], chess_board[(6+2)*15 +  j+2], chess_board[(6 + 3) * 15 + j + 3], chess_board[(6 + 4) * 15 + j + 4], chess_board[(6 + 5) * 15 + j + 5] } == six[k+19]) begin
				score[((6+10) * 10 + j) * 19 + k] = score[((6+10) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			end
			else begin
				score[((6+10) * 10 + j) * 19 + k] = score[((6+10) * 10 + j) * 19 + k - 1];
			end		  
		end     
  end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[7 * 15 + j], chess_board[(7 + 1) * 15 + j + 1], chess_board[(7+2)*15 +  j+2], chess_board[(7 + 3) * 15 + j + 3], chess_board[(7 + 4) * 15 + j + 4], chess_board[(7+ 5) * 15 + j + 5] } == six[k+19]) begin
				score[((7+10) * 10 + j) * 19 + k] = score[((7+10) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			end
			else begin
				score[((7+10) * 10 + j) * 19 + k] = score[((7+10) * 10 + j) * 19 + k - 1];
			end		  
		end     
  end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[8 * 15 + j], chess_board[(8 + 1) * 15 + j + 1], chess_board[(8+2)*15 +  j+2], chess_board[(8 + 3) * 15 + j + 3], chess_board[(8 + 4) * 15 + j + 4], chess_board[(8 + 5) * 15 + j + 5] } == six[k+19]) begin
				score[((8+10) * 10 + j) * 19 + k] = score[((8+10) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			end
			else begin
				score[((8+10) * 10 + j) * 19 + k] = score[((8+10) * 10 + j) * 19 + k - 1];
			end		  
		end     
  end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[9 * 15 + j], chess_board[(9+ 1) * 15 + j + 1], chess_board[(9+2)*15 +  j+2], chess_board[(9 + 3) * 15 + j + 3], chess_board[(9 + 4) * 15 + j + 4], chess_board[(9 + 5) * 15 + j + 5] } == six[k+19]) begin
				score[((9+10) * 10 + j) * 19 + k] = score[((9+10) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			end
			else begin
				score[((9+10) * 10 + j) * 19 + k] = score[((9+10) * 10 + j) * 19 + k - 1];
			end		  
		end     
  end

endtask


task Compare_six_upper_right;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:5999];
    
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if(j == 0 && k == 0)
				score[(0 * 10 + j) * 19 + k] = 0;
			if({chess_board[(0 * 15) + j + 5], chess_board[(0 + 1) * 15 + j + 4], chess_board[(0 + 2) * 15 + j + 3], chess_board[(0 + 3) * 15 + j + 2], chess_board[(0 + 4) * 15 + j + 1], chess_board[(0 + 5) * 15 + j] } == six[k]) begin
				if(j ==0 && k == 0)
					score[(0 * 10 + j) * 19 + k] = six_weight[k];
				else
					score[(0 * 10 + j) * 19 + k] = score[(0 * 10 + j) * 19 + k - 1] + six_weight[k];
         end
         else begin
            if(j ==0 && k == 0)
               score[(0 * 10 + j) * 19 + k] = 0;
            else
               score[(0 * 10 + j) * 19 + k] = score[(0 * 10 + j) * 19 + k - 1];          
			end     
		end
	end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[(1 * 15) + j + 5], chess_board[(1 + 1) * 15 + j + 4], chess_board[(1 + 2) * 15 + j + 3], chess_board[(1 + 3) * 15 + j + 2], chess_board[(1 + 4) * 15 + j + 1], chess_board[(1 + 5) * 15 + j] } == six[k]) begin
				score[(1 * 10 + j) * 19 + k] = score[(1 * 10 + j) * 19 + k - 1] + six_weight[k];
         end
         else begin
             score[(1 * 10 + j) * 19 + k] = score[(1 * 10 + j) * 19 + k - 1];
         end              
		end
	end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[(2 * 15) + j + 5], chess_board[(2 + 1) * 15 + j + 4], chess_board[(2 + 2) * 15 + j + 3], chess_board[(2 + 3) * 15 + j + 2], chess_board[(2 + 4) * 15 + j + 1], chess_board[(2 + 5) * 15 + j] } == six[k]) begin
				score[(2 * 10 + j) * 19 + k] = score[(2 * 10 + j) * 19 + k - 1] + six_weight[k];
         end
         else begin
             score[(2 * 10 + j) * 19 + k] = score[(2 * 10 + j) * 19 + k - 1];
         end              
		end
	end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[(3 * 15) + j + 5], chess_board[(3 + 1) * 15 + j + 4], chess_board[(3 + 2) * 15 + j + 3], chess_board[(3 + 3) * 15 + j + 2], chess_board[(3 + 4) * 15 + j + 1], chess_board[(3 + 5) * 15 + j] } == six[k]) begin
				score[(3 * 10 + j) * 19 + k] = score[(3 * 10 + j) * 19 + k - 1] + six_weight[k];
         end
         else begin
             score[(3 * 10 + j) * 19 + k] = score[(3 * 10 + j) * 19 + k - 1];
         end              
		end
	end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[(4 * 15) + j + 5], chess_board[(4 + 1) * 15 + j + 4], chess_board[(4 + 2) * 15 + j + 3], chess_board[(4+ 3) * 15 + j + 2], chess_board[(4 + 4) * 15 + j + 1], chess_board[(4 + 5) * 15 + j] } == six[k]) begin
				score[(4 * 10 + j) * 19 + k] = score[(4 * 10 + j) * 19 + k - 1] + six_weight[k];
         end
         else begin
             score[(4 * 10 + j) * 19 + k] = score[(4 * 10 + j) * 19 + k - 1];
         end              
		end
	end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[(5 * 15) + j + 5], chess_board[(5 + 1) * 15 + j + 4], chess_board[(5 + 2) * 15 + j + 3], chess_board[(5 + 3) * 15 + j + 2], chess_board[(5 + 4) * 15 + j + 1], chess_board[(5 + 5) * 15 + j] } == six[k]) begin
				score[(5 * 10 + j) * 19 + k] = score[(5 * 10 + j) * 19 + k - 1] + six_weight[k];
         end
         else begin
             score[(5 * 10 + j) * 19 + k] = score[(5 * 10 + j) * 19 + k - 1];
         end              
		end
	end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[(6 * 15) + j + 5], chess_board[(6 + 1) * 15 + j + 4], chess_board[(6 + 2) * 15 + j + 3], chess_board[(6 + 3) * 15 + j + 2], chess_board[(6 + 4) * 15 + j + 1], chess_board[(6 + 5) * 15 + j] } == six[k]) begin
				score[(6 * 10 + j) * 19 + k] = score[(6 * 10 + j) * 19 + k - 1] + six_weight[k];
         end
         else begin
             score[(6 * 10 + j) * 19 + k] = score[(6 * 10 + j) * 19 + k - 1];
         end              
		end
	end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[(7 * 15) + j + 5], chess_board[(7 + 1) * 15 + j + 4], chess_board[(7 + 2) * 15 + j + 3], chess_board[(7 + 3) * 15 + j + 2], chess_board[(7 + 4) * 15 + j + 1], chess_board[(7 + 5) * 15 + j] } == six[k]) begin
				score[(7 * 10 + j) * 19 + k] = score[(1 * 10 + j) * 19 + k - 1] + six_weight[k];
         end
         else begin
             score[(7 * 10 + j) * 19 + k] = score[(1 * 10 + j) * 19 + k - 1];
         end              
		end
	end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[(8 * 15) + j + 5], chess_board[(8 + 1) * 15 + j + 4], chess_board[(8 + 2) * 15 + j + 3], chess_board[(8 + 3) * 15 + j + 2], chess_board[(8 + 4) * 15 + j + 1], chess_board[(8 + 5) * 15 + j] } == six[k]) begin
				score[(8 * 10 + j) * 19 + k] = score[(8 * 10 + j) * 19 + k - 1] + six_weight[k];
         end
         else begin
             score[(8 * 10 + j) * 19 + k] = score[(8 * 10 + j) * 19 + k - 1];
         end              
		end
	end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if({chess_board[(9 * 15) + j + 5], chess_board[(9 + 1) * 15 + j + 4], chess_board[(9 + 2) * 15 + j + 3], chess_board[(9 + 3) * 15 + j + 2], chess_board[(9 + 4) * 15 + j + 1], chess_board[(9 + 5) * 15 + j] } == six[k]) begin
				score[(9 * 10 + j) * 19 + k] = score[(9 * 10 + j) * 19 + k - 1] + six_weight[k];
         end
         else begin
             score[(9 * 10 + j) * 19 + k] = score[(9 * 10 + j) * 19 + k - 1];
         end              
		end
	end
endtask

task Compare_six_upper_right1;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:5999];
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
			if(j == 0 && k == 0)
				score[((0+10) * 10 + j) * 19 + k] = 0;
          if({chess_board[(0 * 15) + j + 5], chess_board[(0 + 1) * 15 + j + 4], chess_board[(0 + 2) * 15 + j + 3], chess_board[(0 + 3) * 15 + j + 2], chess_board[(0 + 4) * 15 + j + 1], chess_board[(0 + 5) * 15 + j + 0] } == six[k+19]) begin
				if(j ==0 && k == 0)
					score[((0+10) * 10 + j) * 19 + k] = six_weight[k+19];
				else
					score[((0+10) * 10 + j) * 19 + k] = score[((0+10) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			end
			else begin
				if(j ==0 && k == 0)
					score[((0+10) * 10 + j) * 19 + k] = 0;
				else
					score[((0+10) * 10 + j) * 19 + k] = score[((0+10) * 10 + j) * 19 + k - 1];
			end		  
		end     
  end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
          if({chess_board[(1 * 15) + j + 5], chess_board[(1 + 1) * 15 + j + 4], chess_board[(1 + 2) * 15 + j + 3], chess_board[(1 + 3) * 15 + j + 2], chess_board[(1 + 4) * 15 + j + 1], chess_board[(1 + 5) * 15 + j + 0] } == six[k+19]) begin
				score[((1+10) * 10 + j) * 19 + k] = score[((1+10) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			end
			else begin
				score[((1+10) * 10 + j) * 19 + k] = score[((1+10) * 10 + j) * 19 + k - 1];
			end		  
		end     
  end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
          if({chess_board[(2 * 15) + j + 5], chess_board[(2 + 1) * 15 + j + 4], chess_board[(2 + 2) * 15 + j + 3], chess_board[(2 + 3) * 15 + j + 2], chess_board[(2 + 4) * 15 + j + 1], chess_board[(2 + 5) * 15 + j + 0] } == six[k+19]) begin
				score[((2+10) * 10 + j) * 19 + k] = score[((2+10) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			end
			else begin
				score[((2+10) * 10 + j) * 19 + k] = score[((2+10) * 10 + j) * 19 + k - 1];
			end		  
		end     
  end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
          if({chess_board[(3 * 15) + j + 5], chess_board[(3 + 1) * 15 + j + 4], chess_board[(3 + 2) * 15 + j + 3], chess_board[(3 + 3) * 15 + j + 2], chess_board[(3 + 4) * 15 + j + 1], chess_board[(3 + 5) * 15 + j + 0] } == six[k+19]) begin
				score[((3+10) * 10 + j) * 19 + k] = score[((3+10) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			end
			else begin
				score[((3+10) * 10 + j) * 19 + k] = score[((3+10) * 10 + j) * 19 + k - 1];
			end		  
		end     
  end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
          if({chess_board[(4 * 15) + j + 5], chess_board[(4 + 1) * 15 + j + 4], chess_board[(4 + 2) * 15 + j + 3], chess_board[(4 + 3) * 15 + j + 2], chess_board[(4 + 4) * 15 + j + 1], chess_board[(4 + 5) * 15 + j + 0] } == six[k+19]) begin
				score[((4+10) * 10 + j) * 19 + k] = score[((4+10) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			end
			else begin
				score[((4+10) * 10 + j) * 19 + k] = score[((4+10) * 10 + j) * 19 + k - 1];
			end		  
		end     
  end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
          if({chess_board[(5 * 15) + j + 5], chess_board[(5 + 1) * 15 + j + 4], chess_board[(5 + 2) * 15 + j + 3], chess_board[(5 + 3) * 15 + j + 2], chess_board[(5 + 4) * 15 + j + 1], chess_board[(5 + 5) * 15 + j + 0] } == six[k+19]) begin
				score[((5+10) * 10 + j) * 19 + k] = score[((5+10) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			end
			else begin
				score[((5+10) * 10 + j) * 19 + k] = score[((5+10) * 10 + j) * 19 + k - 1];
			end		  
		end     
  end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
          if({chess_board[(6 * 15) + j + 5], chess_board[(6 + 1) * 15 + j + 4], chess_board[(6 + 2) * 15 + j + 3], chess_board[(6 + 3) * 15 + j + 2], chess_board[(6 + 4) * 15 + j + 1], chess_board[(6 + 5) * 15 + j + 0] } == six[k+19]) begin
				score[((6+10) * 10 + j) * 19 + k] = score[((6+10) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			end
			else begin
				score[((6+10) * 10 + j) * 19 + k] = score[((6+10) * 10 + j) * 19 + k - 1];
			end		  
		end     
  end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
          if({chess_board[(7 * 15) + j + 5], chess_board[(7 + 1) * 15 + j + 4], chess_board[(7 + 2) * 15 + j + 3], chess_board[(7 + 3) * 15 + j + 2], chess_board[(7 + 4) * 15 + j + 1], chess_board[(7 + 5) * 15 + j + 0] } == six[k+19]) begin
				score[((7+10) * 10 + j) * 19 + k] = score[((7+10) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			end
			else begin
				score[((7+10) * 10 + j) * 19 + k] = score[((7+10) * 10 + j) * 19 + k - 1];
			end		  
		end     
  end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
          if({chess_board[(8 * 15) + j + 5], chess_board[(8 + 1) * 15 + j + 4], chess_board[(8 + 2) * 15 + j + 3], chess_board[(8 + 3) * 15 + j + 2], chess_board[(8 + 4) * 15 + j + 1], chess_board[(8 + 5) * 15 + j + 0] } == six[k+19]) begin
				score[((8+10) * 10 + j) * 19 + k] = score[((8+10) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			end
			else begin
				score[((8+10) * 10 + j) * 19 + k] = score[((8+10) * 10 + j) * 19 + k - 1];
			end		  
		end     
  end
	for(int j = 0; j <= 9 ; j++) begin
		for(int k=0; k < 19; k++) begin
          if({chess_board[(9 * 15) + j + 5], chess_board[(9 + 1) * 15 + j + 4], chess_board[(9 + 2) * 15 + j + 3], chess_board[(9 + 3) * 15 + j + 2], chess_board[(9 + 4) * 15 + j + 1], chess_board[(9 + 5) * 15 + j + 0] } == six[k+19]) begin
				score[((9+10) * 10 + j) * 19 + k] = score[((9+10) * 10 + j) * 19 + k - 1] + six_weight[k+19];
			end
			else begin
				score[((9+10) * 10 + j) * 19 + k] = score[((9+10) * 10 + j) * 19 + k - 1];
			end		  
		end     
  end
endtask
task Compare_five_up;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:3299];
    // 3280
	 for(int j = 0; j <= 14; j++) begin
		for(int k=0; k <= 9; k++) begin
			 if(j == 0 && k == 0)
				  score[(0 * 15 + j) * 10 + k] = 0;
			 if({chess_board[j+0*15], chess_board[j+(0+1)*15], chess_board[j+(0+2)*15], chess_board[j+(0+3)*15], chess_board[j+(0+4)*15] } == five[k]) begin
				  if(j ==0 && k == 0)
						score[(0 * 15 + j) * 10 + k] = five_weight[k];
				  else
						score[(0 * 15 + j) * 10 + k] = score[(0 * 15 + j) * 10 + k - 1] + five_weight[k];
			 end
			 else begin
				  if(j ==0 && k == 0)
						score[(0 * 15 + j) * 10 + k] = 0;
				  else
						score[(0 * 15 + j) * 10 + k] = score[(0 * 15 + j) * 10 + k - 1];
			 end
					  
		end     
	  end
	for(int j = 0; j <= 14; j++) begin
		for(int k=0; k <= 9; k++) begin
			if({chess_board[j+1*15], chess_board[j+(1+1)*15], chess_board[j+(1+2)*15], chess_board[j+(1+3)*15], chess_board[j+(1+4)*15] } == five[k]) begin
				score[(1 * 15 + j) * 10 + k] = score[(1 * 15 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(1 * 15 + j) * 10 + k] = score[(1 * 15 + j) * 10 + k - 1];
			end
						  
		end     
	end
	for(int j = 0; j <= 14; j++) begin
		for(int k=0; k <= 9; k++) begin
			if({chess_board[j+2*15], chess_board[j+(2+1)*15], chess_board[j+(2+2)*15], chess_board[j+(2+3)*15], chess_board[j+(2+4)*15] } == five[k]) begin
				score[(2 * 15 + j) * 10 + k] = score[(2 * 15 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(2 * 15 + j) * 10 + k] = score[(2 * 15 + j) * 10 + k - 1];
			end
						  
		end     
	end
	for(int j = 0; j <= 14; j++) begin
		for(int k=0; k <= 9; k++) begin
			if({chess_board[j+3*15], chess_board[j+(3+1)*15], chess_board[j+(3+2)*15], chess_board[j+(3+3)*15], chess_board[j+(3+4)*15] } == five[k]) begin
				score[(3 * 15 + j) * 10 + k] = score[(3 * 15 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(3 * 15 + j) * 10 + k] = score[(3 * 15 + j) * 10 + k - 1];
			end
						  
		end     
	end
	for(int j = 0; j <= 14; j++) begin
		for(int k=0; k <= 9; k++) begin
			if({chess_board[j+4*15], chess_board[j+(4+1)*15], chess_board[j+(4+2)*15], chess_board[j+(4+3)*15], chess_board[j+(4+4)*15] } == five[k]) begin
				score[(4 * 15 + j) * 10 + k] = score[(4 * 15 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(4 * 15 + j) * 10 + k] = score[(4 * 15 + j) * 10 + k - 1];
			end
						  
		end     
	end
	for(int j = 0; j <= 14; j++) begin
		for(int k=0; k <= 9; k++) begin
			if({chess_board[j+5*15], chess_board[j+(5+1)*15], chess_board[j+(5+2)*15], chess_board[j+(5+3)*15], chess_board[j+(5+4)*15] } == five[k]) begin
				score[(5 * 15 + j) * 10 + k] = score[(5 * 15 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(5 * 15 + j) * 10 + k] = score[(5 * 15 + j) * 10 + k - 1];
			end
						  
		end     
	end
	for(int j = 0; j <= 14; j++) begin
		for(int k=0; k <= 9; k++) begin
			if({chess_board[j+6*15], chess_board[j+(6+1)*15], chess_board[j+(6+2)*15], chess_board[j+(6+3)*15], chess_board[j+(6+4)*15] } == five[k]) begin
				score[(6 * 15 + j) * 10 + k] = score[(6 * 15 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(6 * 15 + j) * 10 + k] = score[(6 * 15 + j) * 10 + k - 1];
			end
						  
		end     
	end
	for(int j = 0; j <= 14; j++) begin
		for(int k=0; k <= 9; k++) begin
			if({chess_board[j+7*15], chess_board[j+(7+1)*15], chess_board[j+(7+2)*15], chess_board[j+(7+3)*15], chess_board[j+(7+4)*15] } == five[k]) begin
				score[(7 * 15 + j) * 10 + k] = score[(7 * 15 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(7 * 15 + j) * 10 + k] = score[(7 * 15 + j) * 10 + k - 1];
			end
						  
		end     
	end
	for(int j = 0; j <= 14; j++) begin
		for(int k=0; k <= 9; k++) begin
			if({chess_board[j+8*15], chess_board[j+(8+1)*15], chess_board[j+(8+2)*15], chess_board[j+(8+3)*15], chess_board[j+(8+4)*15] } == five[k]) begin
				score[(8 * 15 + j) * 10 + k] = score[(8 * 15 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(8 * 15 + j) * 10 + k] = score[(8 * 15 + j) * 10 + k - 1];
			end
						  
		end     
	end
	for(int j = 0; j <= 14; j++) begin
		for(int k=0; k <= 9; k++) begin
			if({chess_board[j+9*15], chess_board[j+(9+1)*15], chess_board[j+(9+2)*15], chess_board[j+(9+3)*15], chess_board[j+(9+4)*15] } == five[k]) begin
				score[(9 * 15 + j) * 10 + k] = score[(9 * 15 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(9 * 15 + j) * 10 + k] = score[(9 * 15 + j) * 10 + k - 1];
			end
						  
		end     
	end
	for(int j = 0; j <= 14; j++) begin
		for(int k=0; k <= 9; k++) begin
			if({chess_board[j+10*15], chess_board[j+(10+1)*15], chess_board[j+(10+2)*15], chess_board[j+(10+3)*15], chess_board[j+(10+4)*15] } == five[k]) begin
				score[(10 * 15 + j) * 10 + k] = score[(10 * 15 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(10 * 15 + j) * 10 + k] = score[(10 * 15 + j) * 10 + k - 1];
			end
						  
		end     
	end
endtask
task Compare_five_up1;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:3299];
    for(int j = 0; j <= 14; j++) begin
        for(int k=0; k <= 9; k++) begin
            if(j == 0 && k == 0)
                score[((0+11) * 15 + j) * 10 + k] = 0;
            if({chess_board[j+0*15], chess_board[j+(0+1)*15], chess_board[j+(0+2)*15], chess_board[j+(0+3)*15], chess_board[j+(0+4)*15] } == five[k+10]) begin
                if(j ==0 && k == 0)
                    score[((0+11) * 15 + j) * 10 + k] = five_weight[k+10];
                else
                    score[((0+11) * 15 + j) * 10 + k] = score[((0+11) * 15 + j) * 10 + k - 1] + five_weight[k+10];
            end
            else begin
                if(j ==0 && k == 0)
                    score[((0+11) * 15 + j) * 10 + k] = 0;
                else
                    score[((0+11) * 15 + j) * 10 + k] = score[((0+11) * 15 + j) * 10 + k - 1];
            end
                   
        end     
    end
    for(int j = 0; j <= 14; j++) begin
        for(int k=0; k <= 9; k++) begin
            if({chess_board[j+1*15], chess_board[j+(1+1)*15], chess_board[j+(1+2)*15], chess_board[j+(1+3)*15], chess_board[j+(1+4)*15] } == five[k+10]) begin
                score[((1+11) * 15 + j) * 10 + k] = score[((1+11) * 15 + j) * 10 + k - 1] + five_weight[k+10];
            end
            else begin
                 score[((1+11) * 15 + j) * 10 + k] = score[((1+11) * 15 + j) * 10 + k - 1];
            end                 
        end     
    end 	 
    for(int j = 0; j <= 14; j++) begin
        for(int k=0; k <= 9; k++) begin
            if({chess_board[j+2*15], chess_board[j+(2+1)*15], chess_board[j+(2+2)*15], chess_board[j+(2+3)*15], chess_board[j+(2+4)*15] } == five[k+10]) begin
                score[((2+11) * 15 + j) * 10 + k] = score[((2+11) * 15 + j) * 10 + k - 1] + five_weight[k+10];
            end
            else begin
                 score[((2+11) * 15 + j) * 10 + k] = score[((2+11) * 15 + j) * 10 + k - 1];
            end                 
        end     
    end 
    for(int j = 0; j <= 14; j++) begin
        for(int k=0; k <= 9; k++) begin
            if({chess_board[j+3*15], chess_board[j+(3+1)*15], chess_board[j+(3+2)*15], chess_board[j+(3+3)*15], chess_board[j+(3+4)*15] } == five[k+10]) begin
                score[((3+11) * 15 + j) * 10 + k] = score[((3+11) * 15 + j) * 10 + k - 1] + five_weight[k+10];
            end
            else begin
                 score[((3+11) * 15 + j) * 10 + k] = score[((3+11) * 15 + j) * 10 + k - 1];
            end                 
        end     
    end 
    for(int j = 0; j <= 14; j++) begin
        for(int k=0; k <= 9; k++) begin
            if({chess_board[j+4*15], chess_board[j+(4+1)*15], chess_board[j+(4+2)*15], chess_board[j+(4+3)*15], chess_board[j+(4+4)*15] } == five[k+10]) begin
                score[((4+11) * 15 + j) * 10 + k] = score[((4+11) * 15 + j) * 10 + k - 1] + five_weight[k+10];
            end
            else begin
                 score[((4+11) * 15 + j) * 10 + k] = score[((4+11) * 15 + j) * 10 + k - 1];
            end                 
        end     
    end 
    for(int j = 0; j <= 14; j++) begin
        for(int k=0; k <= 9; k++) begin
            if({chess_board[j+5*15], chess_board[j+(5+1)*15], chess_board[j+(5+2)*15], chess_board[j+(5+3)*15], chess_board[j+(5+4)*15] } == five[k+10]) begin
                score[((5+11) * 15 + j) * 10 + k] = score[((5+11) * 15 + j) * 10 + k - 1] + five_weight[k+10];
            end
            else begin
                 score[((5+11) * 15 + j) * 10 + k] = score[((5+11) * 15 + j) * 10 + k - 1];
            end                 
        end     
    end 
    for(int j = 0; j <= 14; j++) begin
        for(int k=0; k <= 9; k++) begin
            if({chess_board[j+6*15], chess_board[j+(6+1)*15], chess_board[j+(6+2)*15], chess_board[j+(6+3)*15], chess_board[j+(6+4)*15] } == five[k+10]) begin
                score[((6+11) * 15 + j) * 10 + k] = score[((6+11) * 15 + j) * 10 + k - 1] + five_weight[k+10];
            end
            else begin
                 score[((6+11) * 15 + j) * 10 + k] = score[((6+11) * 15 + j) * 10 + k - 1];
            end                 
        end     
    end 
    for(int j = 0; j <= 14; j++) begin
        for(int k=0; k <= 9; k++) begin
            if({chess_board[j+7*15], chess_board[j+(7+1)*15], chess_board[j+(7+2)*15], chess_board[j+(7+3)*15], chess_board[j+(7+4)*15] } == five[k+10]) begin
                score[((7+11) * 15 + j) * 10 + k] = score[((7+11) * 15 + j) * 10 + k - 1] + five_weight[k+10];
            end
            else begin
                 score[((7+11) * 15 + j) * 10 + k] = score[((7+11) * 15 + j) * 10 + k - 1];
            end                 
        end     
    end 
    for(int j = 0; j <= 14; j++) begin
        for(int k=0; k <= 9; k++) begin
            if({chess_board[j+8*15], chess_board[j+(8+1)*15], chess_board[j+(8+2)*15], chess_board[j+(8+3)*15], chess_board[j+(8+4)*15] } == five[k+10]) begin
                score[((8+11) * 15 + j) * 10 + k] = score[((8+11) * 15 + j) * 10 + k - 1] + five_weight[k+10];
            end
            else begin
                 score[((8+11) * 15 + j) * 10 + k] = score[((8+11) * 15 + j) * 10 + k - 1];
            end                 
        end     
    end 
    for(int j = 0; j <= 14; j++) begin
        for(int k=0; k <= 9; k++) begin
            if({chess_board[j+9*15], chess_board[j+(9+1)*15], chess_board[j+(9+2)*15], chess_board[j+(9+3)*15], chess_board[j+(9+4)*15] } == five[k+10]) begin
                score[((9+11) * 15 + j) * 10 + k] = score[((9+11) * 15 + j) * 10 + k - 1] + five_weight[k+10];
            end
            else begin
                 score[((9+11) * 15 + j) * 10 + k] = score[((9+11) * 15 + j) * 10 + k - 1];
            end                 
        end     
    end 
    for(int j = 0; j <= 14; j++) begin
        for(int k=0; k <= 9; k++) begin
            if({chess_board[j+10*15], chess_board[j+(10+1)*15], chess_board[j+(10+2)*15], chess_board[j+(10+3)*15], chess_board[j+(10+4)*15] } == five[k+10]) begin
                score[((10+11) * 15 + j) * 10 + k] = score[((10+11) * 15 + j) * 10 + k - 1] + five_weight[k+10];
            end
            else begin
                 score[((10+11) * 15 + j) * 10 + k] = score[((10+11) * 15 + j) * 10 + k - 1];
            end                 
        end     
    end 
endtask
task Compare_five_left;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:3299];
    
	 for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			 if(j == 0 && k == 0)
				  score[(0 * 11 + j) * 10 + k] = 0;
			 if({chess_board[0 * 15 + j], chess_board[0 * 15 + j + 1], chess_board[0 * 15 + j + 2], chess_board[0 * 15 + j + 3], chess_board[0 * 15 + j + 4] } == five[k]) begin
				  if(j ==0 && k == 0)
						score[(0 * 11 + j) * 10 + k] = five_weight[k];
				  else
						score[(0 * 11 + j) * 10 + k] = score[(0 * 11 + j) * 10 + k - 1] + five_weight[k];
			 end
			 else begin
				  if(j ==0 && k == 0)
						score[(0 * 11 + j) * 10 + k] = 0;
				  else
						score[(0 * 11 + j) * 10 + k] = score[(0 * 11 + j) * 10 + k - 1];
			 end
					  
		end     
	  end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[1 * 15 + j], chess_board[1 * 15 + j + 1], chess_board[1 * 15 + j + 2], chess_board[1 * 15 + j + 3], chess_board[1 * 15 + j + 4] } == five[k]) begin
				score[(1 * 11 + j) * 10 + k] = score[(1 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(1 * 11 + j) * 10 + k] = score[(1 * 11 + j) * 10 + k - 1];
			end
						  
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[2 * 15 + j], chess_board[2 * 15 + j + 1], chess_board[2 * 15 + j + 2], chess_board[2 * 15 + j + 3], chess_board[2 * 15 + j + 4] } == five[k]) begin
				score[(2 * 11 + j) * 10 + k] = score[(2 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(2 * 11 + j) * 10 + k] = score[(2 * 11 + j) * 10 + k - 1];
			end
						  
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[3 * 15 + j], chess_board[3 * 15 + j + 1], chess_board[3 * 15 + j + 2], chess_board[3 * 15 + j + 3], chess_board[3 * 15 + j + 4] } == five[k]) begin
				score[(3 * 11 + j) * 10 + k] = score[(3 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(3 * 11 + j) * 10 + k] = score[(3 * 11 + j) * 10 + k - 1];
			end
						  
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[4 * 15 + j], chess_board[4 * 15 + j + 1], chess_board[4 * 15 + j + 2], chess_board[4 * 15 + j + 3], chess_board[4 * 15 + j + 4] } == five[k]) begin
				score[(4 * 11 + j) * 10 + k] = score[(4 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(4 * 11 + j) * 10 + k] = score[(4 * 11 + j) * 10 + k - 1];
			end
						  
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[5 * 15 + j], chess_board[5 * 15 + j + 1], chess_board[5 * 15 + j + 2], chess_board[5 * 15 + j + 3], chess_board[5 * 15 + j + 4] } == five[k]) begin
				score[(5 * 11 + j) * 10 + k] = score[(5 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(5 * 11 + j) * 10 + k] = score[(5 * 11 + j) * 10 + k - 1];
			end
						  
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[6 * 15 + j], chess_board[6 * 15 + j + 1], chess_board[6 * 15 + j + 2], chess_board[6 * 15 + j + 3], chess_board[6 * 15 + j + 4] } == five[k]) begin
				score[(6 * 11 + j) * 10 + k] = score[(6 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(6 * 11 + j) * 10 + k] = score[(6 * 11 + j) * 10 + k - 1];
			end
						  
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[7 * 15 + j], chess_board[7 * 15 + j + 1], chess_board[7 * 15 + j + 2], chess_board[7 * 15 + j + 3], chess_board[7 * 15 + j + 4] } == five[k]) begin
				score[(7 * 11 + j) * 10 + k] = score[(7 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(7 * 11 + j) * 10 + k] = score[(7 * 11 + j) * 10 + k - 1];
			end
						  
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[8 * 15 + j], chess_board[8 * 15 + j + 1], chess_board[8 * 15 + j + 2], chess_board[8 * 15 + j + 3], chess_board[8 * 15 + j + 4] } == five[k]) begin
				score[(8 * 11 + j) * 10 + k] = score[(8 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(8 * 11 + j) * 10 + k] = score[(8 * 11 + j) * 10 + k - 1];
			end
						  
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[9 * 15 + j], chess_board[9 * 15 + j + 1], chess_board[9 * 15 + j + 2], chess_board[9 * 15 + j + 3], chess_board[9 * 15 + j + 4] } == five[k]) begin
				score[(9 * 11 + j) * 10 + k] = score[(9 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(9 * 11 + j) * 10 + k] = score[(9 * 11 + j) * 10 + k - 1];
			end
						  
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[10 * 15 + j], chess_board[10 * 15 + j + 1], chess_board[10 * 15 + j + 2], chess_board[10 * 15 + j + 3], chess_board[10 * 15 + j + 4] } == five[k]) begin
				score[(10 * 11 + j) * 10 + k] = score[(10 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(10 * 11 + j) * 10 + k] = score[(10 * 11 + j) * 10 + k - 1];
			end
						  
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[11 * 15 + j], chess_board[11 * 15 + j + 1], chess_board[11 * 15 + j + 2], chess_board[11 * 15 + j + 3], chess_board[11 * 15 + j + 4] } == five[k]) begin
				score[(11 * 11 + j) * 10 + k] = score[(11 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(11 * 11 + j) * 10 + k] = score[(11 * 11 + j) * 10 + k - 1];
			end
						  
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[12 * 15 + j], chess_board[12 * 15 + j + 1], chess_board[12 * 15 + j + 2], chess_board[12 * 15 + j + 3], chess_board[12 * 15 + j + 4] } == five[k]) begin
				score[(12 * 11 + j) * 10 + k] = score[(12 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(12 * 11 + j) * 10 + k] = score[(12 * 11 + j) * 10 + k - 1];
			end
						  
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[13 * 15 + j], chess_board[13 * 15 + j + 1], chess_board[13 * 15 + j + 2], chess_board[13 * 15 + j + 3], chess_board[13 * 15 + j + 4] } == five[k]) begin
				score[(13 * 11 + j) * 10 + k] = score[(13 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(13 * 11 + j) * 10 + k] = score[(13 * 11 + j) * 10 + k - 1];
			end
						  
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[14 * 15 + j], chess_board[14 * 15 + j + 1], chess_board[14 * 15 + j + 2], chess_board[14 * 15 + j + 3], chess_board[14 * 15 + j + 4] } == five[k]) begin
				score[(14 * 11 + j) * 10 + k] = score[(14 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(14 * 11 + j) * 10 + k] = score[(14 * 11 + j) * 10 + k - 1];
			end
						  
		end     
	end
endtask
task Compare_five_left1;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:3299];
        for(int j = 0; j <= 10; j++) begin
            for(int k=0; k < 10; k++) begin
                if(j == 0 && k == 0)
                    score[((0 + 15) * 11 + j) * 10 + k] = 0;
                if({chess_board[0 * 15 + j], chess_board[0 * 15 + j + 1], chess_board[0 * 15 + j + 2], chess_board[0 * 15 + j + 3], chess_board[0 * 15 + j + 4] } == five[k+10]) begin
                    if(j ==0 && k == 0)
                        score[((0 + 15) * 11 + j) * 10 + k] = five_weight[k+10];
                    else
                        score[((0 + 15) * 11 + j) * 10 + k] = score[((0 + 15) * 11 + j) * 10 + k - 1] + five_weight[k+10];
                end
                else begin
                    if(j ==0 && k == 0)
                        score[((0 + 15) * 11 + j) * 10 + k] = 0;
                    else
                        score[((0 + 15) * 11 + j) * 10 + k] = score[((0 + 15) * 11 + j) * 10 + k - 1];
                end
                       
            end     
        end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[1 * 15 + j], chess_board[1 * 15 + j + 1], chess_board[1 * 15 + j + 2], chess_board[1 * 15 + j + 3], chess_board[1 * 15 + j + 4] } == five[k+10]) begin
				score[((1 + 15) * 11 + j) * 10 + k] = score[((1 + 15) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			end
			else begin
				score[((1 + 15) * 11 + j) * 10 + k] = score[((1 + 15) * 11 + j) * 10 + k - 1];
			end
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[2 * 15 + j], chess_board[2 * 15 + j + 1], chess_board[2 * 15 + j + 2], chess_board[2 * 15 + j + 3], chess_board[2 * 15 + j + 4] } == five[k+10]) begin
				score[((2 + 15) * 11 + j) * 10 + k] = score[((2 + 15) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			end
			else begin
				score[((2 + 15) * 11 + j) * 10 + k] = score[((2 + 15) * 11 + j) * 10 + k - 1];
			end
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[3 * 15 + j], chess_board[3 * 15 + j + 1], chess_board[3 * 15 + j + 2], chess_board[3 * 15 + j + 3], chess_board[3 * 15 + j + 4] } == five[k+10]) begin
				score[((3 + 15) * 11 + j) * 10 + k] = score[((3 + 15) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			end
			else begin
				score[((3 + 15) * 11 + j) * 10 + k] = score[((3 + 15) * 11 + j) * 10 + k - 1];
			end
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[4 * 15 + j], chess_board[4 * 15 + j + 1], chess_board[4 * 15 + j + 2], chess_board[4 * 15 + j + 3], chess_board[4 * 15 + j + 4] } == five[k+10]) begin
				score[((4 + 15) * 11 + j) * 10 + k] = score[((4 + 15) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			end
			else begin
				score[((4 + 15) * 11 + j) * 10 + k] = score[((4 + 15) * 11 + j) * 10 + k - 1];
			end
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[5 * 15 + j], chess_board[5 * 15 + j + 1], chess_board[5 * 15 + j + 2], chess_board[5 * 15 + j + 3], chess_board[5 * 15 + j + 4] } == five[k+10]) begin
				score[((5 + 15) * 11 + j) * 10 + k] = score[((5 + 15) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			end
			else begin
				score[((5 + 15) * 11 + j) * 10 + k] = score[((5 + 15) * 11 + j) * 10 + k - 1];
			end
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[6 * 15 + j], chess_board[6 * 15 + j + 1], chess_board[6 * 15 + j + 2], chess_board[6 * 15 + j + 3], chess_board[6 * 15 + j + 4] } == five[k+10]) begin
				score[((6 + 15) * 11 + j) * 10 + k] = score[((6 + 15) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			end
			else begin
				score[((6 + 15) * 11 + j) * 10 + k] = score[((6 + 15) * 11 + j) * 10 + k - 1];
			end
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[7 * 15 + j], chess_board[7 * 15 + j + 1], chess_board[7 * 15 + j + 2], chess_board[7 * 15 + j + 3], chess_board[7 * 15 + j + 4] } == five[k+10]) begin
				score[((7 + 15) * 11 + j) * 10 + k] = score[((7 + 15) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			end
			else begin
				score[((7 + 15) * 11 + j) * 10 + k] = score[((7 + 15) * 11 + j) * 10 + k - 1];
			end
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[8 * 15 + j], chess_board[8 * 15 + j + 1], chess_board[8 * 15 + j + 2], chess_board[8 * 15 + j + 3], chess_board[8 * 15 + j + 4] } == five[k+10]) begin
				score[((8 + 15) * 11 + j) * 10 + k] = score[((8 + 15) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			end
			else begin
				score[((8 + 15) * 11 + j) * 10 + k] = score[((8 + 15) * 11 + j) * 10 + k - 1];
			end
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[9 * 15 + j], chess_board[9 * 15 + j + 1], chess_board[9 * 15 + j + 2], chess_board[9 * 15 + j + 3], chess_board[9 * 15 + j + 4] } == five[k+10]) begin
				score[((9 + 15) * 11 + j) * 10 + k] = score[((9 + 15) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			end
			else begin
				score[((9 + 15) * 11 + j) * 10 + k] = score[((9 + 15) * 11 + j) * 10 + k - 1];
			end
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[10  * 15 + j], chess_board[10  * 15 + j + 1], chess_board[10  * 15 + j + 2], chess_board[10  * 15 + j + 3], chess_board[10  * 15 + j + 4] } == five[k+10]) begin
				score[((10  + 15) * 11 + j) * 10 + k] = score[((10  + 15) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			end
			else begin
				score[((10  + 15) * 11 + j) * 10 + k] = score[((10  + 15) * 11 + j) * 10 + k - 1];
			end
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[11 * 15 + j], chess_board[11 * 15 + j + 1], chess_board[11 * 15 + j + 2], chess_board[11 * 15 + j + 3], chess_board[11 * 15 + j + 4] } == five[k+10]) begin
				score[((11 + 15) * 11 + j) * 10 + k] = score[((11 + 15) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			end
			else begin
				score[((11 + 15) * 11 + j) * 10 + k] = score[((11 + 15) * 11 + j) * 10 + k - 1];
			end
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[12 * 15 + j], chess_board[12 * 15 + j + 1], chess_board[12 * 15 + j + 2], chess_board[12 * 15 + j + 3], chess_board[12 * 15 + j + 4] } == five[k+10]) begin
				score[((12 + 15) * 11 + j) * 10 + k] = score[((12 + 15) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			end
			else begin
				score[((12 + 15) * 11 + j) * 10 + k] = score[((12 + 15) * 11 + j) * 10 + k - 1];
			end
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[13 * 15 + j], chess_board[13 * 15 + j + 1], chess_board[13 * 15 + j + 2], chess_board[13 * 15 + j + 3], chess_board[13 * 15 + j + 4] } == five[k+10]) begin
				score[((13 + 15) * 11 + j) * 10 + k] = score[((13 + 15) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			end
			else begin
				score[((13 + 15) * 11 + j) * 10 + k] = score[((13 + 15) * 11 + j) * 10 + k - 1];
			end
		end     
	end
	for(int j = 0; j <= 10; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[14 * 15 + j], chess_board[14 * 15 + j + 1], chess_board[14 * 15 + j + 2], chess_board[14 * 15 + j + 3], chess_board[14 * 15 + j + 4] } == five[k+10]) begin
				score[((14 + 15) * 11 + j) * 10 + k] = score[((14 + 15) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			end
			else begin
				score[((14 + 15) * 11 + j) * 10 + k] = score[((14 + 15) * 11 + j) * 10 + k - 1];
			end
		end     
	end

 
endtask
task Compare_five_upper_left(
    input [1:0] chess_board [225],
    output signed [31:0] score [0:3299]
);
        for(int j = 0; j <= 10 ; j++) begin
            for(int k=0; k < 10; k++) begin
                if(j == 0 && k == 0)
                    score[(0 * 11 + j) * 10 + k] = 0;
                if( { chess_board[0 * 15 + j], chess_board[(0 + 1) * 15 + j + 1], chess_board[(0 + 2)*15 + j+2], chess_board[(0 + 3) * 15 + j + 3], chess_board[(0 + 4) * 15 + j + 4] } == five[k]) begin
                    if(j == 0 && k == 0)
                        score[(0 * 11 + j) * 10 + k] = five_weight[k];
                    else
                        score[(0 * 11 + j) * 10 + k] = score[(0 * 11 + j) * 10 + k - 1] + five_weight[k];
                end
                else begin
                    if(j == 0 && k == 0)
                        score[(0 * 11 + j) * 10 + k] = 0;
                    else
                        score[(0 * 11 + j) * 10 + k] = score[(0 * 11 + j) * 10 + k - 1];
                end
                       
            end     
        end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			if( { chess_board[1 * 15 + j], chess_board[(1 + 1) * 15 + j + 1], chess_board[(1 + 2)*15 + j+2], chess_board[(1 + 3) * 15 + j + 3], chess_board[(1 + 4) * 15 + j + 4] } == five[k]) begin
				score[(1 * 11 + j) * 10 + k] = score[(1 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(1 * 11 + j) * 10 + k] = score[(1 * 11 + j) * 10 + k - 1];
			end                    
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			if( { chess_board[2 * 15 + j], chess_board[(2 + 1) * 15 + j + 1], chess_board[(2 + 2)*15 + j+2], chess_board[(2 + 3) * 15 + j + 3], chess_board[(2 + 4) * 15 + j + 4] } == five[k]) begin
				score[(2 * 11 + j) * 10 + k] = score[(2 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(2 * 11 + j) * 10 + k] = score[(2 * 11 + j) * 10 + k - 1];
			end                    
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			if( { chess_board[3 * 15 + j], chess_board[(3 + 1) * 15 + j + 1], chess_board[(3 + 2)*15 + j+2], chess_board[(3 + 3) * 15 + j + 3], chess_board[(3 + 4) * 15 + j + 4] } == five[k]) begin
				score[(3 * 11 + j) * 10 + k] = score[(3 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(3 * 11 + j) * 10 + k] = score[(3 * 11 + j) * 10 + k - 1];
			end                    
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			if( { chess_board[4 * 15 + j], chess_board[(4 + 1) * 15 + j + 1], chess_board[(4 + 2)*15 + j+2], chess_board[(4 + 3) * 15 + j + 3], chess_board[(4 + 4) * 15 + j + 4] } == five[k]) begin
				score[(4 * 11 + j) * 10 + k] = score[(4 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(4 * 11 + j) * 10 + k] = score[(4 * 11 + j) * 10 + k - 1];
			end                    
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			if( { chess_board[5 * 15 + j], chess_board[(5 + 1) * 15 + j + 1], chess_board[(5 + 2)*15 + j+2], chess_board[(5 + 3) * 15 + j + 3], chess_board[(5 + 4) * 15 + j + 4] } == five[k]) begin
				score[(5 * 11 + j) * 10 + k] = score[(5 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(5 * 11 + j) * 10 + k] = score[(5 * 11 + j) * 10 + k - 1];
			end                    
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			if( { chess_board[6 * 15 + j], chess_board[(6 + 1) * 15 + j + 1], chess_board[(6 + 2)*15 + j+2], chess_board[(6 + 3) * 15 + j + 3], chess_board[(6 + 4) * 15 + j + 4] } == five[k]) begin
				score[(6 * 11 + j) * 10 + k] = score[(6 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(6 * 11 + j) * 10 + k] = score[(6 * 11 + j) * 10 + k - 1];
			end                    
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			if( { chess_board[7 * 15 + j], chess_board[(7 + 1) * 15 + j + 1], chess_board[(7 + 2)*15 + j+2], chess_board[(7 + 3) * 15 + j + 3], chess_board[(7 + 4) * 15 + j + 4] } == five[k]) begin
				score[(7 * 11 + j) * 10 + k] = score[(7 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(7 * 11 + j) * 10 + k] = score[(7 * 11 + j) * 10 + k - 1];
			end                    
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			if( { chess_board[8 * 15 + j], chess_board[(8 + 1) * 15 + j + 1], chess_board[(8 + 2)*15 + j+2], chess_board[(8 + 3) * 15 + j + 3], chess_board[(8 + 4) * 15 + j + 4] } == five[k]) begin
				score[(8 * 11 + j) * 10 + k] = score[(8 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(8 * 11 + j) * 10 + k] = score[(8 * 11 + j) * 10 + k - 1];
			end                    
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			if( { chess_board[9 * 15 + j], chess_board[(9 + 1) * 15 + j + 1], chess_board[(9 + 2)*15 + j+2], chess_board[(9 + 3) * 15 + j + 3], chess_board[(9 + 4) * 15 + j + 4] } == five[k]) begin
				score[(9 * 11 + j) * 10 + k] = score[(9 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(9 * 11 + j) * 10 + k] = score[(9 * 11 + j) * 10 + k - 1];
			end                    
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			if( { chess_board[10 * 15 + j], chess_board[(10 + 1) * 15 + j + 1], chess_board[(10 + 2)*15 + j+2], chess_board[(10 + 3) * 15 + j + 3], chess_board[(10 + 4) * 15 + j + 4] } == five[k]) begin
				score[(10 * 11 + j) * 10 + k] = score[(10 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(10 * 11 + j) * 10 + k] = score[(10 * 11 + j) * 10 + k - 1];
			end                    
		end     
	end
endtask
task Compare_five_upper_left1(
    input [1:0] chess_board [225],
    output signed [31:0] score [0:3299]
);
	  for(int j = 0; j <= 10 ; j++) begin
			for(int k=0; k < 10; k++) begin
				 if(k == 0)
					  score[((0 + 11) * 11 + j) * 10 + k] = 0;
				 if( { chess_board[0 * 15 + j], chess_board[(0 + 1) * 15 + j + 1], chess_board[(0 + 2)*15 + j+2], chess_board[(0 + 3) * 15 + j + 3], chess_board[(0 + 4) * 15 + j + 4] } == five[k+10]) begin
					  if(j == 0 && k == 0)
							score[((0 + 11) * 11 + j) * 10 + k] = five_weight[k+10];
					  else
							score[((0 + 11) * 11 + j) * 10 + k] = score[((0 + 11) * 11 + j) * 10 + k - 1] + five_weight[k+10];
				 end
				 else begin
					  if(j == 0 && k == 0)
							score[((0 + 11) * 11 + j) * 10 + k] = 0;
					  else
							score[((0 + 11) * 11 + j) * 10 + k] = score[((0 + 11) * 11 + j) * 10 + k - 1];
				 end
						  
			end     
	  end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			 if( { chess_board[1 * 15 + j], chess_board[(1 + 1) * 15 + j + 1], chess_board[(1 + 2)*15 + j+2], chess_board[(1 + 3) * 15 + j + 3], chess_board[(1 + 4) * 15 + j + 4] } == five[k+10]) begin
				score[((1 + 11) * 11 + j) * 10 + k] = score[((1 + 11) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			 end
			 else begin
				score[((1 + 11) * 11 + j) * 10 + k] = score[((1 + 11) * 11 + j) * 10 + k - 1];
			 end				  
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			 if( { chess_board[2 * 15 + j], chess_board[(2 + 1) * 15 + j + 1], chess_board[(2 + 2)*15 + j+2], chess_board[(2 + 3) * 15 + j + 3], chess_board[(2 + 4) * 15 + j + 4] } == five[k+10]) begin
				score[((2 + 11) * 11 + j) * 10 + k] = score[((2 + 11) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			 end
			 else begin
				score[((2 + 11) * 11 + j) * 10 + k] = score[((2 + 11) * 11 + j) * 10 + k - 1];
			 end				  
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			 if( { chess_board[3 * 15 + j], chess_board[(3 + 1) * 15 + j + 1], chess_board[(3 + 2)*15 + j+2], chess_board[(3 + 3) * 15 + j + 3], chess_board[(3 + 4) * 15 + j + 4] } == five[k+10]) begin
				score[((3 + 11) * 11 + j) * 10 + k] = score[((3 + 11) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			 end
			 else begin
				score[((3 + 11) * 11 + j) * 10 + k] = score[((3 + 11) * 11 + j) * 10 + k - 1];
			 end				  
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			 if( { chess_board[4 * 15 + j], chess_board[(4 + 1) * 15 + j + 1], chess_board[(4 + 2)*15 + j+2], chess_board[(4 + 3) * 15 + j + 3], chess_board[(4 + 4) * 15 + j + 4] } == five[k+10]) begin
				score[((4 + 11) * 11 + j) * 10 + k] = score[((4 + 11) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			 end
			 else begin
				score[((4 + 11) * 11 + j) * 10 + k] = score[((4 + 11) * 11 + j) * 10 + k - 1];
			 end				  
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			 if( { chess_board[5 * 15 + j], chess_board[(5 + 1) * 15 + j + 1], chess_board[(5 + 2)*15 + j+2], chess_board[(5 + 3) * 15 + j + 3], chess_board[(5 + 4) * 15 + j + 4] } == five[k+10]) begin
				score[((5 + 11) * 11 + j) * 10 + k] = score[((5 + 11) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			 end
			 else begin
				score[((5 + 11) * 11 + j) * 10 + k] = score[((5 + 11) * 11 + j) * 10 + k - 1];
			 end				  
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			 if( { chess_board[6 * 15 + j], chess_board[(6 + 1) * 15 + j + 1], chess_board[(6 + 2)*15 + j+2], chess_board[(6 + 3) * 15 + j + 3], chess_board[(6 + 4) * 15 + j + 4] } == five[k+10]) begin
				score[((6 + 11) * 11 + j) * 10 + k] = score[((6 + 11) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			 end
			 else begin
				score[((6 + 11) * 11 + j) * 10 + k] = score[((6 + 11) * 11 + j) * 10 + k - 1];
			 end				  
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			 if( { chess_board[7 * 15 + j], chess_board[(7 + 1) * 15 + j + 1], chess_board[(7 + 2)*15 + j+2], chess_board[(7 + 3) * 15 + j + 3], chess_board[(7 + 4) * 15 + j + 4] } == five[k+10]) begin
				score[((7 + 11) * 11 + j) * 10 + k] = score[((7 + 11) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			 end
			 else begin
				score[((7 + 11) * 11 + j) * 10 + k] = score[((7 + 11) * 11 + j) * 10 + k - 1];
			 end				  
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			 if( { chess_board[8 * 15 + j], chess_board[(8 + 1) * 15 + j + 1], chess_board[(8 + 2)*15 + j+2], chess_board[(8 + 3) * 15 + j + 3], chess_board[(8 + 4) * 15 + j + 4] } == five[k+10]) begin
				score[((8 + 11) * 11 + j) * 10 + k] = score[((8 + 11) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			 end
			 else begin
				score[((8 + 11) * 11 + j) * 10 + k] = score[((8 + 11) * 11 + j) * 10 + k - 1];
			 end				  
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			 if( { chess_board[9 * 15 + j], chess_board[(9 + 1) * 15 + j + 1], chess_board[(9 + 2)*15 + j+2], chess_board[(9 + 3) * 15 + j + 3], chess_board[(9 + 4) * 15 + j + 4] } == five[k+10]) begin
				score[((9 + 11) * 11 + j) * 10 + k] = score[((9 + 11) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			 end
			 else begin
				score[((9 + 11) * 11 + j) * 10 + k] = score[((9 + 11) * 11 + j) * 10 + k - 1];
			 end				  
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			 if( { chess_board[10 * 15 + j], chess_board[(10 + 1) * 15 + j + 1], chess_board[(10 + 2)*15 + j+2], chess_board[(10 + 3) * 15 + j + 3], chess_board[(10 + 4) * 15 + j + 4] } == five[k+10]) begin
				score[((10 + 11) * 11 + j) * 10 + k] = score[((10 + 11) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			 end
			 else begin
				score[((10 + 11) * 11 + j) * 10 + k] = score[((10 + 11) * 11 + j) * 10 + k - 1];
			 end				  
		end     
	end
endtask
task Compare_five_upper_right(
    input [1:0] chess_board [225],
    output signed [31:0] score [0:3299]
    );
        for(int j = 0; j <= 10 ; j++) begin
            for(int k=0; k < 10; k++) begin
                if(j == 0 && k == 0)
                    score[(0 * 11 + j) * 10 + k] = 0;
                if({chess_board[0 * 15 +  j + 4], chess_board[(0 + 1) * 15 + j + 3 ], chess_board[(0 + 2) * 15 + j + 2], chess_board[(0 + 3) * 15 + j + 1], chess_board[(0 + 4) * 15 + j] } == five[k+10]) begin
                    if(j == 0 && k == 0)
                        score[(0 * 11 + j) * 10 + k] = five_weight[k];
                    else
                        score[(0 * 11 + j) * 10 + k] = score[(0 * 11 + j) * 10 + k - 1] + five_weight[k];
                end
                else begin
                    if(j == 0 && k == 0)
                        score[(0 * 11 + j) * 10 + k] = 0;
                    else
                        score[(0 * 11 + j) * 10 + k] = score[(0 * 11 + j) * 10 + k - 1];
                end
                       
            end     
        end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
                if({chess_board[1 * 15 +  j + 4], chess_board[(1 + 1) * 15 + j + 3 ], chess_board[(1 + 2) * 15 + j + 2], chess_board[(1 + 3) * 15 + j + 1], chess_board[(1 + 4) * 15 + j] } == five[k+10]) begin
				score[(1 * 11 + j) * 10 + k] = score[(1 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(1 * 11 + j) * 10 + k] = score[(1 * 11 + j) * 10 + k - 1];
			end                    
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[2 * 15 +  j + 4], chess_board[(2 + 1) * 15 + j + 3 ], chess_board[(2 + 2) * 15 + j + 2], chess_board[(2 + 3) * 15 + j + 1], chess_board[(2 + 4) * 15 + j] } == five[k+10]) begin
				score[(2 * 11 + j) * 10 + k] = score[(2 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(2 * 11 + j) * 10 + k] = score[(2 * 11 + j) * 10 + k - 1];
			end                    
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[3 * 15 +  j + 4], chess_board[(3 + 1) * 15 + j + 3 ], chess_board[(3 + 2) * 15 + j + 2], chess_board[(3 + 3) * 15 + j + 1], chess_board[(3 + 4) * 15 + j] } == five[k+10]) begin
				score[(3 * 11 + j) * 10 + k] = score[(3 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(3 * 11 + j) * 10 + k] = score[(3 * 11 + j) * 10 + k - 1];
			end                    
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[4 * 15 +  j + 4], chess_board[(4 + 1) * 15 + j + 3 ], chess_board[(4 + 2) * 15 + j + 2], chess_board[(4 + 3) * 15 + j + 1], chess_board[(4 + 4) * 15 + j] } == five[k+10]) begin
				score[(4 * 11 + j) * 10 + k] = score[(4 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(4 * 11 + j) * 10 + k] = score[(4 * 11 + j) * 10 + k - 1];
			end                    
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[5 * 15 +  j + 4], chess_board[(5 + 1) * 15 + j + 3 ], chess_board[(5 + 2) * 15 + j + 2], chess_board[(5 + 3) * 15 + j + 1], chess_board[(5 + 4) * 15 + j] } == five[k+10]) begin
				score[(5 * 11 + j) * 10 + k] = score[(5 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(5 * 11 + j) * 10 + k] = score[(5 * 11 + j) * 10 + k - 1];
			end                    
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[6 * 15 +  j + 4], chess_board[(6 + 1) * 15 + j + 3 ], chess_board[(6 + 2) * 15 + j + 2], chess_board[(6 + 3) * 15 + j + 1], chess_board[(6 + 4) * 15 + j] } == five[k+10]) begin
				score[(6 * 11 + j) * 10 + k] = score[(6 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(6 * 11 + j) * 10 + k] = score[(6 * 11 + j) * 10 + k - 1];
			end                    
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[7 * 15 +  j + 4], chess_board[(7 + 1) * 15 + j + 3 ], chess_board[(7 + 2) * 15 + j + 2], chess_board[(7 + 3) * 15 + j + 1], chess_board[(7 + 4) * 15 + j] } == five[k+10]) begin
				score[(7 * 11 + j) * 10 + k] = score[(7 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(7 * 11 + j) * 10 + k] = score[(7 * 11 + j) * 10 + k - 1];
			end                    
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[8 * 15 +  j + 4], chess_board[(8 + 1) * 15 + j + 3 ], chess_board[(8 + 2) * 15 + j + 2], chess_board[(8 + 3) * 15 + j + 1], chess_board[(8 + 4) * 15 + j] } == five[k+10]) begin
				score[(8 * 11 + j) * 10 + k] = score[(8 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(8 * 11 + j) * 10 + k] = score[(8 * 11 + j) * 10 + k - 1];
			end                    
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[9 * 15 +  j + 4], chess_board[(9 + 1) * 15 + j + 3 ], chess_board[(9 + 2) * 15 + j + 2], chess_board[(9 + 3) * 15 + j + 1], chess_board[(9 + 4) * 15 + j] } == five[k+10]) begin
				score[(9 * 11 + j) * 10 + k] = score[(9 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(9 * 11 + j) * 10 + k] = score[(9 * 11 + j) * 10 + k - 1];
			end                    
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
			if({chess_board[10 * 15 +  j + 4], chess_board[(10 + 1) * 15 + j + 3 ], chess_board[(10 + 2) * 15 + j + 2], chess_board[(10 + 3) * 15 + j + 1], chess_board[(10 + 4) * 15 + j] } == five[k+10]) begin
				score[(10 * 11 + j) * 10 + k] = score[(10 * 11 + j) * 10 + k - 1] + five_weight[k];
			end
			else begin
				score[(10 * 11 + j) * 10 + k] = score[(10 * 11 + j) * 10 + k - 1];
			end                    
		end     
	end
endtask
		  

task Compare_five_upper_right1;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:3299];
	  for(int j = 0; j <= 10 ; j++) begin
			for(int k=0; k < 10; k++) begin
				 if(k == 0)
					  score[((0 + 11) * 11 + j) * 10 + k] = 0;
		    if({chess_board[0 * 15 +  j + 4], chess_board[(0 + 1) * 15 + j + 3 ], chess_board[(0 + 2) * 15 + j + 2], chess_board[(0 + 3) * 15 + j + 1], chess_board[(0 + 4) * 15 + j] } == five[k+10]) begin
					  if(j == 0 && k == 0)
							score[((0 + 11) * 11 + j) * 10 + k] = five_weight[k+10];
					  else
							score[((0 + 11) * 11 + j) * 10 + k] = score[((0 + 11) * 11 + j) * 10 + k - 1] + five_weight[k+10];
				 end
				 else begin
					  if(j == 0 && k == 0)
							score[((0 + 11) * 11 + j) * 10 + k] = 0;
					  else
							score[((0 + 11) * 11 + j) * 10 + k] = score[((0 + 11) * 11 + j) * 10 + k - 1];
				 end
						  
			end     
	  end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
		    if({chess_board[1 * 15 +  j + 4], chess_board[(1 + 1) * 15 + j + 3 ], chess_board[(1 + 2) * 15 + j + 2], chess_board[(1 + 3) * 15 + j + 1], chess_board[(1 + 4) * 15 + j] } == five[k+10]) begin
				score[((1 + 11) * 11 + j) * 10 + k] = score[((1 + 11) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			 end
			 else begin
				score[((1 + 11) * 11 + j) * 10 + k] = score[((1 + 11) * 11 + j) * 10 + k - 1];
			 end				  
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
		    if({chess_board[2 * 15 +  j + 4], chess_board[(2 + 1) * 15 + j + 3 ], chess_board[(2 + 2) * 15 + j + 2], chess_board[(2 + 3) * 15 + j + 1], chess_board[(2 + 4) * 15 + j] } == five[k+10]) begin
				score[((2 + 11) * 11 + j) * 10 + k] = score[((2 + 11) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			 end
			 else begin
				score[((2 + 11) * 11 + j) * 10 + k] = score[((2 + 11) * 11 + j) * 10 + k - 1];
			 end				  
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
		    if({chess_board[3 * 15 +  j + 4], chess_board[(3 + 1) * 15 + j + 3 ], chess_board[(3 + 2) * 15 + j + 2], chess_board[(3 + 3) * 15 + j + 1], chess_board[(3 + 4) * 15 + j] } == five[k+10]) begin
				score[((3 + 11) * 11 + j) * 10 + k] = score[((3 + 11) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			 end
			 else begin
				score[((3 + 11) * 11 + j) * 10 + k] = score[((3 + 11) * 11 + j) * 10 + k - 1];
			 end				  
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
		    if({chess_board[4 * 15 +  j + 4], chess_board[(4 + 1) * 15 + j + 3 ], chess_board[(4 + 2) * 15 + j + 2], chess_board[(4 + 3) * 15 + j + 1], chess_board[(4 + 4) * 15 + j] } == five[k+10]) begin
				score[((4 + 11) * 11 + j) * 10 + k] = score[((4 + 11) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			 end
			 else begin
				score[((4 + 11) * 11 + j) * 10 + k] = score[((4 + 11) * 11 + j) * 10 + k - 1];
			 end				  
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
		    if({chess_board[5 * 15 +  j + 4], chess_board[(5 + 1) * 15 + j + 3 ], chess_board[(5 + 2) * 15 + j + 2], chess_board[(5 + 3) * 15 + j + 1], chess_board[(5 + 4) * 15 + j] } == five[k+10]) begin
				score[((5 + 11) * 11 + j) * 10 + k] = score[((5 + 11) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			 end
			 else begin
				score[((5 + 11) * 11 + j) * 10 + k] = score[((5 + 11) * 11 + j) * 10 + k - 1];
			 end				  
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
		    if({chess_board[6 * 15 +  j + 4], chess_board[(6 + 1) * 15 + j + 3 ], chess_board[(6 + 2) * 15 + j + 2], chess_board[(6 + 3) * 15 + j + 1], chess_board[(6 + 4) * 15 + j] } == five[k+10]) begin
				score[((6 + 11) * 11 + j) * 10 + k] = score[((6 + 11) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			 end
			 else begin
				score[((6 + 11) * 11 + j) * 10 + k] = score[((6 + 11) * 11 + j) * 10 + k - 1];
			 end				  
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
		    if({chess_board[7 * 15 +  j + 4], chess_board[(7 + 1) * 15 + j + 3 ], chess_board[(7 + 2) * 15 + j + 2], chess_board[(7 + 3) * 15 + j + 1], chess_board[(7 + 4) * 15 + j] } == five[k+10]) begin
				score[((7 + 11) * 11 + j) * 10 + k] = score[((7 + 11) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			 end
			 else begin
				score[((7 + 11) * 11 + j) * 10 + k] = score[((7 + 11) * 11 + j) * 10 + k - 1];
			 end				  
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
		    if({chess_board[8 * 15 +  j + 4], chess_board[(8 + 1) * 15 + j + 3 ], chess_board[(8 + 2) * 15 + j + 2], chess_board[(8 + 3) * 15 + j + 1], chess_board[(8 + 4) * 15 + j] } == five[k+10]) begin
				score[((8 + 11) * 11 + j) * 10 + k] = score[((8 + 11) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			 end
			 else begin
				score[((8 + 11) * 11 + j) * 10 + k] = score[((8 + 11) * 11 + j) * 10 + k - 1];
			 end				  
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
		    if({chess_board[9 * 15 +  j + 4], chess_board[(9 + 1) * 15 + j + 3 ], chess_board[(9 + 2) * 15 + j + 2], chess_board[(9 + 3) * 15 + j + 1], chess_board[(9 + 4) * 15 + j] } == five[k+10]) begin
				score[((9 + 11) * 11 + j) * 10 + k] = score[((9 + 11) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			 end
			 else begin
				score[((9 + 11) * 11 + j) * 10 + k] = score[((9 + 11) * 11 + j) * 10 + k - 1];
			 end				  
		end     
	end
	for(int j = 0; j <= 10 ; j++) begin
		for(int k=0; k < 10; k++) begin
		    if({chess_board[10 * 15 +  j + 4], chess_board[(10 + 1) * 15 + j + 3 ], chess_board[(10 + 2) * 15 + j + 2], chess_board[(10 + 3) * 15 + j + 1], chess_board[(6 + 4) * 15 + j] } == five[k+10]) begin
				score[((10 + 11) * 11 + j) * 10 + k] = score[((10 + 11) * 11 + j) * 10 + k - 1] + five_weight[k+10];
			 end
			 else begin
				score[((10 + 11) * 11 + j) * 10 + k] = score[((10 + 11) * 11 + j) * 10 + k - 1];
			 end				  
		end     
	end
endtask


task Compare_three_up;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:1169];
    // 1164
        for(int j = 0; j < 15; j++) begin
            for(int k=0; k < 3; k++) begin
                if(j == 0 && k == 0)
                    score[(0 * 15 + j) * 3 + k] = 0;
                if({chess_board[j+ 0 *15], chess_board[j+(0 + 1)*15], chess_board[j+(0 + 2)*15] } == three[k]) begin
                    if(j ==0 && k == 0)
                        score[(0 * 15 + j) * 3 + k] = three_weight[k];
                    else
                        score[(0 * 15 + j) * 3 + k] = score[(0 * 15 + j) * 3 + k - 1] + three_weight[k];
                end
                else begin
                    if(j ==0 && k == 0)
                        score[(0 * 15 + j) * 3 + k] = 0;
                    else
                        score[(0 * 15 + j) * 3 + k] = score[(0 * 15 + j) * 3 + k - 1];
                end
                       
            end     
        end
	for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[j+ 1 *15], chess_board[j+(1 + 1)*15], chess_board[j+(1 + 2)*15] } == three[k]) begin
				score[(1 * 15 + j) * 3 + k] = score[(1 * 15 + j) * 3 + k - 1] + three_weight[k];
         end
         else begin
				score[(1 * 15 + j) * 3 + k] = score[(1 * 15 + j) * 3 + k - 1];
         end         
      end     
   end
	for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[j+ 2 *15], chess_board[j+(2 + 1)*15], chess_board[j+(2 + 2)*15] } == three[k]) begin
				score[(2 * 15 + j) * 3 + k] = score[(2 * 15 + j) * 3 + k - 1] + three_weight[k];
         end
         else begin
				score[(2 * 15 + j) * 3 + k] = score[(2 * 15 + j) * 3 + k - 1];
         end         
      end     
   end
	for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[j+ 3 *15], chess_board[j+(3 + 1)*15], chess_board[j+(3 + 2)*15] } == three[k]) begin
				score[(3 * 15 + j) * 3 + k] = score[(3 * 15 + j) * 3 + k - 1] + three_weight[k];
         end
         else begin
				score[(3 * 15 + j) * 3 + k] = score[(3 * 15 + j) * 3 + k - 1];
         end         
      end     
   end
	for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[j+ 4 *15], chess_board[j+(4 + 1)*15], chess_board[j+(4 + 2)*15] } == three[k]) begin
				score[(4 * 15 + j) * 3 + k] = score[(4 * 15 + j) * 3 + k - 1] + three_weight[k];
         end
         else begin
				score[(4 * 15 + j) * 3 + k] = score[(4 * 15 + j) * 3 + k - 1];
         end         
      end     
   end
	for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[j+ 5 *15], chess_board[j+(5 + 1)*15], chess_board[j+(5 + 2)*15] } == three[k]) begin
				score[(5 * 15 + j) * 3 + k] = score[(5 * 15 + j) * 3 + k - 1] + three_weight[k];
         end
         else begin
				score[(5 * 15 + j) * 3 + k] = score[(5 * 15 + j) * 3 + k - 1];
         end         
      end     
   end
	for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[j+ 6 *15], chess_board[j+(6 + 1)*15], chess_board[j+(6 + 2)*15] } == three[k]) begin
				score[(6 * 15 + j) * 3 + k] = score[(6 * 15 + j) * 3 + k - 1] + three_weight[k];
         end
         else begin
				score[(6 * 15 + j) * 3 + k] = score[(6 * 15 + j) * 3 + k - 1];
         end         
      end     
   end
	for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[j+ 7 *15], chess_board[j+(7 + 1)*15], chess_board[j+(7 + 2)*15] } == three[k]) begin
				score[(7 * 15 + j) * 3 + k] = score[(7 * 15 + j) * 3 + k - 1] + three_weight[k];
         end
         else begin
				score[(7 * 15 + j) * 3 + k] = score[(7 * 15 + j) * 3 + k - 1];
         end         
      end     
   end
	for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[j+ 8 *15], chess_board[j+(8 + 1)*15], chess_board[j+(8 + 2)*15] } == three[k]) begin
				score[(8 * 15 + j) * 3 + k] = score[(8 * 15 + j) * 3 + k - 1] + three_weight[k];
         end
         else begin
				score[(8 * 15 + j) * 3 + k] = score[(8 * 15 + j) * 3 + k - 1];
         end         
      end     
   end
	for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[j+ 9 *15], chess_board[j+(9 + 1)*15], chess_board[j+(9 + 2)*15] } == three[k]) begin
				score[(9 * 15 + j) * 3 + k] = score[(9 * 15 + j) * 3 + k - 1] + three_weight[k];
         end
         else begin
				score[(9 * 15 + j) * 3 + k] = score[(9 * 15 + j) * 3 + k - 1];
         end         
      end     
   end
	for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[j+ 10 *15], chess_board[j+(10 + 1)*15], chess_board[j+(10 + 2)*15] } == three[k]) begin
				score[(10 * 15 + j) * 3 + k] = score[(10 * 15 + j) * 3 + k - 1] + three_weight[k];
         end
         else begin
				score[(10 * 15 + j) * 3 + k] = score[(10 * 15 + j) * 3 + k - 1];
         end         
      end     
   end
endtask
task Compare_three_up1;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:1169];
        for(int j = 0; j < 15; j++) begin
            for(int k=0; k < 3; k++) begin
                if(j == 0 && k == 0)
                    score[((0+13) * 15 + j) * 3 + k] = 0;
                if({chess_board[j+0*15], chess_board[j+(0+1)*15], chess_board[j+(0+2)*15] } == three[k+3]) begin
                    if(j ==0 && k == 0)
                        score[((0+13) * 15 + j) * 3 + k] = three_weight[k+3];
                    else
                        score[((0+13) * 15 + j) * 3 + k] = score[((0+13) * 15 + j) * 3 + k - 1] + three_weight[k+3];
                end
                else begin
                    if(j ==0 && k == 0)
                        score[((0+13) * 15 + j) * 3 + k] = 0;
                    else
                        score[((0+13) * 15 + j) * 3 + k] = score[((0+13) * 15 + j) * 3 + k - 1];
                end      
            end     
        end
	for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[j+1*15], chess_board[j+(1+1)*15], chess_board[j+(1+2)*15] } == three[k+3]) begin
				score[((1+13) * 15 + j) * 3 + k] = score[((1+13) * 15 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((1+13) * 15 + j) * 3 + k] = score[((1+13) * 15 + j) * 3 + k - 1];
			end      
		end     
	end
	for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[j+2*15], chess_board[j+(2+1)*15], chess_board[j+(2+2)*15] } == three[k+3]) begin
				score[((2+13) * 15 + j) * 3 + k] = score[((2+13) * 15 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((2+13) * 15 + j) * 3 + k] = score[((2+13) * 15 + j) * 3 + k - 1];
			end      
		end     
	end
	for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[j+3*15], chess_board[j+(3+1)*15], chess_board[j+(3+2)*15] } == three[k+3]) begin
				score[((3+13) * 15 + j) * 3 + k] = score[((3+13) * 15 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((3+13) * 15 + j) * 3 + k] = score[((3+13) * 15 + j) * 3 + k - 1];
			end      
		end     
	end
	for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[j+4*15], chess_board[j+(4+1)*15], chess_board[j+(4+2)*15] } == three[k+3]) begin
				score[((4+13) * 15 + j) * 3 + k] = score[((4+13) * 15 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((4+13) * 15 + j) * 3 + k] = score[((4+13) * 15 + j) * 3 + k - 1];
			end      
		end     
	end
	for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[j+5*15], chess_board[j+(5+1)*15], chess_board[j+(5+2)*15] } == three[k+3]) begin
				score[((5+13) * 15 + j) * 3 + k] = score[((5+13) * 15 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((5+13) * 15 + j) * 3 + k] = score[((5+13) * 15 + j) * 3 + k - 1];
			end      
		end     
	end
	for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[j+6*15], chess_board[j+(6+1)*15], chess_board[j+(6+2)*15] } == three[k+3]) begin
				score[((6+13) * 15 + j) * 3 + k] = score[((6+13) * 15 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((6+13) * 15 + j) * 3 + k] = score[((6+13) * 15 + j) * 3 + k - 1];
			end      
		end     
	end
	for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[j+7*15], chess_board[j+(7+1)*15], chess_board[j+(7+2)*15] } == three[k+3]) begin
				score[((7+13) * 15 + j) * 3 + k] = score[((7+13) * 15 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((7+13) * 15 + j) * 3 + k] = score[((7+13) * 15 + j) * 3 + k - 1];
			end      
		end     
	end
	for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[j+8*15], chess_board[j+(8+1)*15], chess_board[j+(8+2)*15] } == three[k+3]) begin
				score[((8+13) * 15 + j) * 3 + k] = score[((8+13) * 15 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((8+13) * 15 + j) * 3 + k] = score[((8+13) * 15 + j) * 3 + k - 1];
			end      
		end     
	end
	for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[j+9*15], chess_board[j+(9+1)*15], chess_board[j+(9+2)*15] } == three[k+3]) begin
				score[((9+13) * 15 + j) * 3 + k] = score[((9+13) * 15 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((9+13) * 15 + j) * 3 + k] = score[((9+13) * 15 + j) * 3 + k - 1];
			end      
		end     
	end
	for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[j+19*15], chess_board[j+(10+1)*15], chess_board[j+(10+2)*15] } == three[k+3]) begin
				score[((10+13) * 15 + j) * 3 + k] = score[((10+13) * 15 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((10+13) * 15 + j) * 3 + k] = score[((10+13) * 15 + j) * 3 + k - 1];
			end      
		end     
	end
	for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[j+11*15], chess_board[j+(11+1)*15], chess_board[j+(11+2)*15] } == three[k+3]) begin
				score[((11+13) * 15 + j) * 3 + k] = score[((11+13) * 15 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((11+13) * 15 + j) * 3 + k] = score[((11+13) * 15 + j) * 3 + k - 1];
			end      
		end     
	end
	for(int j = 0; j < 15; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[j+12*15], chess_board[j+(12+1)*15], chess_board[j+(12+2)*15] } == three[k+3]) begin
				score[((12+13) * 15 + j) * 3 + k] = score[((12+13) * 15 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((12+13) * 15 + j) * 3 + k] = score[((12+13) * 15 + j) * 3 + k - 1];
			end      
		end     
	end
endtask
task Compare_three_left;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:1169];
    
    for(int i = 0; i < 15; i++) begin
        for(int j = 0; j <= 12; j++) begin
            for(int k=0; k < 3; k++) begin
                if(j == 0 && k == 0)
                    score[(0 * 13 + j) * 3 + k] = 0;
                if({chess_board[0 * 12 + j], chess_board[0 * 15 + j + 1], chess_board[0 * 15 + j + 2] } == three[k]) begin
                    if(j ==0 && k == 0)
                        score[(0 * 13 + j) * 3 + k] = three_weight[k];
                    else
                        score[(0 * 13 + j) * 3 + k] = score[(0 * 13 + j) * 3 + k - 1] + three_weight[k];
                end
                else begin
                    if(j ==0 && k == 0)
                        score[(0 * 13 + j) * 3 + k] = 0;
                    else
                        score[(0 * 13 + j) * 3 + k] = score[(0 * 13 + j) * 3 + k - 1];
                end
                       
            end     
        end
    end
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[1 * 12 + j], chess_board[1 * 15 + j + 1], chess_board[1 * 15 + j + 2] } == three[k]) begin
				score[(1 * 13 + j) * 3 + k] = score[(1 * 13 + j) * 3 + k - 1] + three_weight[k];
			end
			else begin
				score[(1 * 13 + j) * 3 + k] = score[(1 * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[2 * 12 + j], chess_board[2 * 15 + j + 1], chess_board[2 * 15 + j + 2] } == three[k]) begin
				score[(2 * 13 + j) * 3 + k] = score[(2 * 13 + j) * 3 + k - 1] + three_weight[k];
			end
			else begin
				score[(2 * 13 + j) * 3 + k] = score[(2 * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[3 * 12 + j], chess_board[3 * 15 + j + 1], chess_board[3 * 15 + j + 2] } == three[k]) begin
				score[(3 * 13 + j) * 3 + k] = score[(3 * 13 + j) * 3 + k - 1] + three_weight[k];
			end
			else begin
				score[(3 * 13 + j) * 3 + k] = score[(3 * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[4 * 12 + j], chess_board[4 * 15 + j + 1], chess_board[4 * 15 + j + 2] } == three[k]) begin
				score[(4 * 13 + j) * 3 + k] = score[(4 * 13 + j) * 3 + k - 1] + three_weight[k];
			end
			else begin
				score[(4 * 13 + j) * 3 + k] = score[(4 * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[5 * 12 + j], chess_board[5 * 15 + j + 1], chess_board[5 * 15 + j + 2] } == three[k]) begin
				score[(5 * 13 + j) * 3 + k] = score[(5 * 13 + j) * 3 + k - 1] + three_weight[k];
			end
			else begin
				score[(5 * 13 + j) * 3 + k] = score[(5 * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[6 * 12 + j], chess_board[6 * 15 + j + 1], chess_board[6 * 15 + j + 2] } == three[k]) begin
				score[(6 * 13 + j) * 3 + k] = score[(6 * 13 + j) * 3 + k - 1] + three_weight[k];
			end
			else begin
				score[(6 * 13 + j) * 3 + k] = score[(6 * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[7 * 12 + j], chess_board[7 * 15 + j + 1], chess_board[7 * 15 + j + 2] } == three[k]) begin
				score[(7 * 13 + j) * 3 + k] = score[(7 * 13 + j) * 3 + k - 1] + three_weight[k];
			end
			else begin
				score[(7 * 13 + j) * 3 + k] = score[(7 * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[8 * 12 + j], chess_board[8 * 15 + j + 1], chess_board[8 * 15 + j + 2] } == three[k]) begin
				score[(8 * 13 + j) * 3 + k] = score[(8 * 13 + j) * 3 + k - 1] + three_weight[k];
			end
			else begin
				score[(8 * 13 + j) * 3 + k] = score[(8 * 13 + j) * 3 + k - 1];
			end
						
		end     
	end	
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[9 * 12 + j], chess_board[9 * 15 + j + 1], chess_board[9 * 15 + j + 2] } == three[k]) begin
				score[(9 * 13 + j) * 3 + k] = score[(9 * 13 + j) * 3 + k - 1] + three_weight[k];
			end
			else begin
				score[(9 * 13 + j) * 3 + k] = score[(9 * 13 + j) * 3 + k - 1];
			end
						
		end     
	end	
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[10 * 12 + j], chess_board[10 * 15 + j + 1], chess_board[10 * 15 + j + 2] } == three[k]) begin
				score[(10 * 13 + j) * 3 + k] = score[(10 * 13 + j) * 3 + k - 1] + three_weight[k];
			end
			else begin
				score[(10 * 13 + j) * 3 + k] = score[(10 * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[11 * 12 + j], chess_board[11 * 15 + j + 1], chess_board[11 * 15 + j + 2] } == three[k]) begin
				score[(11 * 13 + j) * 3 + k] = score[(11 * 13 + j) * 3 + k - 1] + three_weight[k];
			end
			else begin
				score[(11 * 13 + j) * 3 + k] = score[(11 * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[12 * 12 + j], chess_board[12 * 15 + j + 1], chess_board[12 * 15 + j + 2] } == three[k]) begin
				score[(12 * 13 + j) * 3 + k] = score[(12 * 13 + j) * 3 + k - 1] + three_weight[k];
			end
			else begin
				score[(12 * 13 + j) * 3 + k] = score[(12 * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[13 * 13 + j], chess_board[13 * 15 + j + 1], chess_board[13 * 15 + j + 2] } == three[k]) begin
				score[(13 * 13 + j) * 3 + k] = score[(13 * 13 + j) * 3 + k - 1] + three_weight[k];
			end
			else begin
				score[(13 * 13 + j) * 3 + k] = score[(13 * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[14 * 14 + j], chess_board[14 * 15 + j + 1], chess_board[14 * 15 + j + 2] } == three[k]) begin
				score[(14 * 13 + j) * 3 + k] = score[(14 * 13 + j) * 3 + k - 1] + three_weight[k];
			end
			else begin
				score[(14 * 13 + j) * 3 + k] = score[(14 * 13 + j) * 3 + k - 1];
			end
						
		end     
	end

	 
endtask
task Compare_three_left1;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:1169];
        for(int j = 0; j <= 12; j++) begin
            for(int k=0; k < 3; k++) begin
                if(j == 0 && k == 0)
                    score[((0 + 15) * 13 + j) * 3 + k] = 0;
                if({chess_board[0 * 12 + j], chess_board[0 * 15 + j + 1], chess_board[0 * 15 + j + 2] } == three[k+3]) begin
                    if(j ==0 && k == 0)
                        score[((0 + 15) * 13 + j) * 3 + k] = three_weight[k+3];
                    else
                        score[((0 + 15) * 13 + j) * 3 + k] = score[((0 + 15) * 13 + j) * 3 + k - 1] + three_weight[k+3];
                end
                else begin
                    if(j ==0 && k == 0)
                        score[((0 + 15) * 13 + j) * 3 + k] = 0;
                    else
                        score[((0 + 15) * 13 + j) * 3 + k] = score[((0 + 15) * 13 + j) * 3 + k - 1];
                end
                       
            end     
        end

	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[1 * 12 + j], chess_board[1 * 15 + j + 1], chess_board[1 * 15 + j + 2] } == three[k+3]) begin
				score[((1 + 15) * 13 + j) * 3 + k] = score[((1 + 15) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((1 + 15) * 13 + j) * 3 + k] = score[((1 + 15) * 13 + j) * 3 + k - 1];
			end			
		end     
	end
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[2 * 12 + j], chess_board[2 * 15 + j + 1], chess_board[2 * 15 + j + 2] } == three[k+3]) begin
				score[((2 + 15) * 13 + j) * 3 + k] = score[((2 + 15) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((2 + 15) * 13 + j) * 3 + k] = score[((2 + 15) * 13 + j) * 3 + k - 1];
			end			
		end     
	end
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[3 * 12 + j], chess_board[3 * 15 + j + 1], chess_board[3 * 15 + j + 2] } == three[k+3]) begin
				score[((3 + 15) * 13 + j) * 3 + k] = score[((3 + 15) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((3 + 15) * 13 + j) * 3 + k] = score[((3 + 15) * 13 + j) * 3 + k - 1];
			end			
		end     
	end
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[4 * 12 + j], chess_board[4 * 15 + j + 1], chess_board[4 * 15 + j + 2] } == three[k+3]) begin
				score[((4 + 15) * 13 + j) * 3 + k] = score[((4 + 15) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((4 + 15) * 13 + j) * 3 + k] = score[((4 + 15) * 13 + j) * 3 + k - 1];
			end			
		end     
	end
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[5 * 12 + j], chess_board[5 * 15 + j + 1], chess_board[5 * 15 + j + 2] } == three[k+3]) begin
				score[((5 + 15) * 13 + j) * 3 + k] = score[((5 + 15) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((5 + 15) * 13 + j) * 3 + k] = score[((5 + 15) * 13 + j) * 3 + k - 1];
			end			
		end     
	end
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[6 * 12 + j], chess_board[6 * 15 + j + 1], chess_board[6 * 15 + j + 2] } == three[k+3]) begin
				score[((6 + 15) * 13 + j) * 3 + k] = score[((6 + 15) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((6 + 15) * 13 + j) * 3 + k] = score[((6 + 15) * 13 + j) * 3 + k - 1];
			end			
		end     
	end
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[7 * 12 + j], chess_board[7 * 15 + j + 1], chess_board[7 * 15 + j + 2] } == three[k+3]) begin
				score[((7 + 15) * 13 + j) * 3 + k] = score[((7 + 15) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((7 + 15) * 13 + j) * 3 + k] = score[((7 + 15) * 13 + j) * 3 + k - 1];
			end			
		end     
	end
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[8 * 12 + j], chess_board[8 * 15 + j + 1], chess_board[8 * 15 + j + 2] } == three[k+3]) begin
				score[((8 + 15) * 13 + j) * 3 + k] = score[((8 + 15) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((8 + 15) * 13 + j) * 3 + k] = score[((8 + 15) * 13 + j) * 3 + k - 1];
			end			
		end     
	end
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[9 * 12 + j], chess_board[9 * 15 + j + 1], chess_board[9 * 15 + j + 2] } == three[k+3]) begin
				score[((9 + 15) * 13 + j) * 3 + k] = score[((9 + 15) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((9 + 15) * 13 + j) * 3 + k] = score[((9 + 15) * 13 + j) * 3 + k - 1];
			end			
		end     
	end
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[10 * 12 + j], chess_board[10 * 15 + j + 1], chess_board[10 * 15 + j + 2] } == three[k+3]) begin
				score[((10 + 15) * 13 + j) * 3 + k] = score[((10 + 15) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((10 + 15) * 13 + j) * 3 + k] = score[((10 + 15) * 13 + j) * 3 + k - 1];
			end			
		end     
	end
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[11 * 12 + j], chess_board[11 * 15 + j + 1], chess_board[11 * 15 + j + 2] } == three[k+3]) begin
				score[((11 + 15) * 13 + j) * 3 + k] = score[((11 + 15) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((11 + 15) * 13 + j) * 3 + k] = score[((11 + 15) * 13 + j) * 3 + k - 1];
			end			
		end     
	end
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[12 * 12 + j], chess_board[12 * 15 + j + 1], chess_board[12 * 15 + j + 2] } == three[k+3]) begin
				score[((12 + 15) * 13 + j) * 3 + k] = score[((12 + 15) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((12 + 15) * 13 + j) * 3 + k] = score[((12 + 15) * 13 + j) * 3 + k - 1];
			end			
		end     
	end
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[13 * 12 + j], chess_board[13 * 15 + j + 1], chess_board[13 * 15 + j + 2] } == three[k+3]) begin
				score[((13 + 15) * 13 + j) * 3 + k] = score[((13 + 15) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((13 + 15) * 13 + j) * 3 + k] = score[((13 + 15) * 13 + j) * 3 + k - 1];
			end			
		end     
	end
	for(int j = 0; j <= 12; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[14 * 12 + j], chess_board[14 * 15 + j + 1], chess_board[14 * 15 + j + 2] } == three[k+3]) begin
				score[((14 + 15) * 13 + j) * 3 + k] = score[((14 + 15) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((14 + 15) * 13 + j) * 3 + k] = score[((14 + 15) * 13 + j) * 3 + k - 1];
			end			
		end     
	end

endtask
task Compare_three_upper_left;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:1169];
	  for(int j = 0; j <= 12 ; j++) begin
			for(int k=0; k < 3; k++) begin
				 if(j == 0 && k == 0)
					  score[(0 * 13 + j) * 3 + k] = 0;
				 if({chess_board[0 * 15 + j], chess_board[(0 + 1) * 15 + j + 1], chess_board[(0 + 2)*15 + j+2] } == three[k]) begin
					  if(j ==0 && k == 0)
							score[(0 * 13 + j) * 3 + k] = three_weight[k];
					  else
							score[(0 * 13 + j) * 3 + k] = score[(0 * 13 + j) * 3 + k - 1] + three_weight[k];
				 end
				 else begin
					  if(j ==0 && k == 0)
							score[(0 * 13 + j) * 3 + k] = 0;
					  else
							score[(0 * 13 + j) * 3 + k] = score[(0 * 13 + j) * 3 + k - 1];
				 end
						  
			end     
	  end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			 if({chess_board[1 * 15 + j], chess_board[(1 + 1) * 15 + j + 1], chess_board[(1 + 2)*15 + j+2] } == three[k]) begin
				score[(1 * 13 + j) * 3 + k] = score[(1 * 13 + j) * 3 + k - 1] + three_weight[k];
			 end
			 else begin
				score[(1 * 13 + j) * 3 + k] = score[(1 * 13 + j) * 3 + k - 1];
			 end					  
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			 if({chess_board[2 * 15 + j], chess_board[(2 + 1) * 15 + j + 1], chess_board[(2 + 2)*15 + j+2] } == three[k]) begin
				score[(2 * 13 + j) * 3 + k] = score[(2 * 13 + j) * 3 + k - 1] + three_weight[k];
			 end
			 else begin
				score[(2 * 13 + j) * 3 + k] = score[(2 * 13 + j) * 3 + k - 1];
			 end					  
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			 if({chess_board[3 * 15 + j], chess_board[(3 + 1) * 15 + j + 1], chess_board[(3 + 2)*15 + j+2] } == three[k]) begin
				score[(3 * 13 + j) * 3 + k] = score[(3 * 13 + j) * 3 + k - 1] + three_weight[k];
			 end
			 else begin
				score[(3 * 13 + j) * 3 + k] = score[(3 * 13 + j) * 3 + k - 1];
			 end					  
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			 if({chess_board[4 * 15 + j], chess_board[(4 + 1) * 15 + j + 1], chess_board[(4 + 2)*15 + j+2] } == three[k]) begin
				score[(4 * 13 + j) * 3 + k] = score[(4 * 13 + j) * 3 + k - 1] + three_weight[k];
			 end
			 else begin
				score[(4 * 13 + j) * 3 + k] = score[(4 * 13 + j) * 3 + k - 1];
			 end					  
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			 if({chess_board[5 * 15 + j], chess_board[(5 + 1) * 15 + j + 1], chess_board[(5 + 2)*15 + j+2] } == three[k]) begin
				score[(5 * 13 + j) * 3 + k] = score[(5 * 13 + j) * 3 + k - 1] + three_weight[k];
			 end
			 else begin
				score[(5 * 13 + j) * 3 + k] = score[(5 * 13 + j) * 3 + k - 1];
			 end					  
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			 if({chess_board[6 * 15 + j], chess_board[(6 + 1) * 15 + j + 1], chess_board[(6 + 2)*15 + j+2] } == three[k]) begin
				score[(6 * 13 + j) * 3 + k] = score[(6 * 13 + j) * 3 + k - 1] + three_weight[k];
			 end
			 else begin
				score[(6 * 13 + j) * 3 + k] = score[(6 * 13 + j) * 3 + k - 1];
			 end					  
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			 if({chess_board[7 * 15 + j], chess_board[(7 + 1) * 15 + j + 1], chess_board[(7 + 2)*15 + j+2] } == three[k]) begin
				score[(7 * 13 + j) * 3 + k] = score[(7 * 13 + j) * 3 + k - 1] + three_weight[k];
			 end
			 else begin
				score[(7 * 13 + j) * 3 + k] = score[(7 * 13 + j) * 3 + k - 1];
			 end					  
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			 if({chess_board[8 * 15 + j], chess_board[(8 + 1) * 15 + j + 1], chess_board[(8 + 2)*15 + j+2] } == three[k]) begin
				score[(8 * 13 + j) * 3 + k] = score[(8 * 13 + j) * 3 + k - 1] + three_weight[k];
			 end
			 else begin
				score[(8 * 13 + j) * 3 + k] = score[(8 * 13 + j) * 3 + k - 1];
			 end					  
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			 if({chess_board[9 * 15 + j], chess_board[(9 + 1) * 15 + j + 1], chess_board[(9 + 2)*15 + j+2] } == three[k]) begin
				score[(9 * 13 + j) * 3 + k] = score[(9 * 13 + j) * 3 + k - 1] + three_weight[k];
			 end
			 else begin
				score[(9 * 13 + j) * 3 + k] = score[(9 * 13 + j) * 3 + k - 1];
			 end					  
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			 if({chess_board[10 * 15 + j], chess_board[(10 + 1) * 15 + j + 1], chess_board[(10 + 2)*15 + j+2] } == three[k]) begin
				score[(10 * 13 + j) * 3 + k] = score[(10 * 13 + j) * 3 + k - 1] + three_weight[k];
			 end
			 else begin
				score[(10 * 13 + j) * 3 + k] = score[(10 * 13 + j) * 3 + k - 1];
			 end					  
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			 if({chess_board[11 * 15 + j], chess_board[(11 + 1) * 15 + j + 1], chess_board[(11 + 2)*15 + j+2] } == three[k]) begin
				score[(11 * 13 + j) * 3 + k] = score[(11 * 13 + j) * 3 + k - 1] + three_weight[k];
			 end
			 else begin
				score[(11 * 13 + j) * 3 + k] = score[(11 * 13 + j) * 3 + k - 1];
			 end					  
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			 if({chess_board[12 * 15 + j], chess_board[(12 + 1) * 15 + j + 1], chess_board[(12 + 2)*15 + j+2] } == three[k]) begin
				score[(12 * 13 + j) * 3 + k] = score[(12 * 13 + j) * 3 + k - 1] + three_weight[k];
			 end
			 else begin
				score[(12 * 13 + j) * 3 + k] = score[(12 * 13 + j) * 3 + k - 1];
			 end					  
		end     
	end	
endtask
task Compare_three_upper_left1;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:1169];
        for(int j = 0; j <= 12 ; j++) begin
            for(int k=0; k < 3; k++) begin
                if(j == 0 && k == 0)
                    score[((0 + 13) * 13 + j) * 3 + k] = 0;
                if({chess_board[0 * 15 + j], chess_board[(0 + 1) * 15 + j + 1], chess_board[(0 + 2)*15 + j+2] } == three[k+3]) begin
                    if(j ==0 && k == 0)
                        score[((0 + 13) * 13 + j) * 3 + k] = three_weight[k+3];
                    else
                        score[((0 + 13) * 13 + j) * 3 + k] = score[((0 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
                end
                else begin
                    if(j ==0 && k == 0)
                        score[((0 + 13) * 13 + j) * 3 + k] = 0;
                    else
                        score[((0 + 13) * 13 + j) * 3 + k] = score[((0 + 13) * 13 + j) * 3 + k - 1];
                end
                       
            end     
        end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[1 * 15 + j], chess_board[(1 + 1) * 15 + j + 1], chess_board[(1 + 2)*15 + j+2] } == three[k+3]) begin
				score[((1 + 13) * 13 + j) * 3 + k] = score[((1 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((1 + 13) * 13 + j) * 3 + k] = score[((1 + 13) * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[2 * 15 + j], chess_board[(2 + 1) * 15 + j + 1], chess_board[(2 + 2)*15 + j+2] } == three[k+3]) begin
				score[((2 + 13) * 13 + j) * 3 + k] = score[((2 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((2 + 13) * 13 + j) * 3 + k] = score[((2 + 13) * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[3 * 15 + j], chess_board[(3 + 1) * 15 + j + 1], chess_board[(3 + 2)*15 + j+2] } == three[k+3]) begin
				score[((3 + 13) * 13 + j) * 3 + k] = score[((3 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((3 + 13) * 13 + j) * 3 + k] = score[((3 + 13) * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[4 * 15 + j], chess_board[(4 + 1) * 15 + j + 1], chess_board[(4 + 2)*15 + j+2] } == three[k+3]) begin
				score[((4 + 13) * 13 + j) * 3 + k] = score[((4 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((4 + 13) * 13 + j) * 3 + k] = score[((4 + 13) * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[5 * 15 + j], chess_board[(5 + 1) * 15 + j + 1], chess_board[(5 + 2)*15 + j+2] } == three[k+3]) begin
				score[((5 + 13) * 13 + j) * 3 + k] = score[((5 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((5 + 13) * 13 + j) * 3 + k] = score[((5 + 13) * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[6 * 15 + j], chess_board[(6 + 1) * 15 + j + 1], chess_board[(6 + 2)*15 + j+2] } == three[k+3]) begin
				score[((6 + 13) * 13 + j) * 3 + k] = score[((6 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((6 + 13) * 13 + j) * 3 + k] = score[((6 + 13) * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[7 * 15 + j], chess_board[(7 + 1) * 15 + j + 1], chess_board[(7 + 2)*15 + j+2] } == three[k+3]) begin
				score[((7 + 13) * 13 + j) * 3 + k] = score[((7 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((7 + 13) * 13 + j) * 3 + k] = score[((7 + 13) * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[8 * 15 + j], chess_board[(8 + 1) * 15 + j + 1], chess_board[(8 + 2)*15 + j+2] } == three[k+3]) begin
				score[((8 + 13) * 13 + j) * 3 + k] = score[((8 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((8 + 13) * 13 + j) * 3 + k] = score[((8 + 13) * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[9 * 15 + j], chess_board[(9 + 1) * 15 + j + 1], chess_board[(9 + 2)*15 + j+2] } == three[k+3]) begin
				score[((9 + 13) * 13 + j) * 3 + k] = score[((9 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((9 + 13) * 13 + j) * 3 + k] = score[((9 + 13) * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[10 * 15 + j], chess_board[(10 + 1) * 15 + j + 1], chess_board[(10 + 2)*15 + j+2] } == three[k+3]) begin
				score[((10 + 13) * 13 + j) * 3 + k] = score[((10 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((10 + 13) * 13 + j) * 3 + k] = score[((10 + 13) * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[11 * 15 + j], chess_board[(11 + 1) * 15 + j + 1], chess_board[(11 + 2)*15 + j+2] } == three[k+3]) begin
				score[((11 + 13) * 13 + j) * 3 + k] = score[((11 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((11 + 13) * 13 + j) * 3 + k] = score[((11 + 13) * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[12 * 15 + j], chess_board[(12 + 1) * 15 + j + 1], chess_board[(12 + 2)*15 + j+2] } == three[k+3]) begin
				score[((12 + 13) * 13 + j) * 3 + k] = score[((12 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((12 + 13) * 13 + j) * 3 + k] = score[((12 + 13) * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	
endtask
task Compare_three_upper_right;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:1169];
	  for(int j = 0; j <= 12 ; j++) begin
			for(int k=0; k < 3; k++) begin
				 if(j == 0 && k == 0)
					  score[(0 * 13 + j) * 3 + k] = 0;
			if({chess_board[0 * 15 + j + 2], chess_board[(0 + 1) * 15 + j + 1], chess_board[(0 + 2) * 15 + j] } == three[k+3]) begin
					  if(j ==0 && k == 0)
							score[(0 * 13 + j) * 3 + k] = three_weight[k];
					  else
							score[(0 * 13 + j) * 3 + k] = score[(0 * 13 + j) * 3 + k - 1] + three_weight[k];
				 end
				 else begin
					  if(j ==0 && k == 0)
							score[(0 * 13 + j) * 3 + k] = 0;
					  else
							score[(0 * 13 + j) * 3 + k] = score[(0 * 13 + j) * 3 + k - 1];
				 end
						  
			end     
	  end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[1 * 15 + j + 2], chess_board[(1 + 1) * 15 + j + 1], chess_board[(1 + 2) * 15 + j] } == three[k+3]) begin
				score[(1 * 13 + j) * 3 + k] = score[(1 * 13 + j) * 3 + k - 1] + three_weight[k];
			 end
			 else begin
				score[(1 * 13 + j) * 3 + k] = score[(1 * 13 + j) * 3 + k - 1];
			 end					  
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[2 * 15 + j + 2], chess_board[(2 + 1) * 15 + j + 1], chess_board[(2 + 2) * 15 + j] } == three[k+3]) begin
				score[(2 * 13 + j) * 3 + k] = score[(2 * 13 + j) * 3 + k - 1] + three_weight[k];
			 end
			 else begin
				score[(2 * 13 + j) * 3 + k] = score[(2 * 13 + j) * 3 + k - 1];
			 end					  
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[3 * 15 + j + 2], chess_board[(3 + 1) * 15 + j + 1], chess_board[(3 + 2) * 15 + j] } == three[k+3]) begin
				score[(3 * 13 + j) * 3 + k] = score[(3 * 13 + j) * 3 + k - 1] + three_weight[k];
			 end
			 else begin
				score[(3 * 13 + j) * 3 + k] = score[(3 * 13 + j) * 3 + k - 1];
			 end					  
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[4 * 15 + j + 2], chess_board[(4 + 1) * 15 + j + 1], chess_board[(4 + 2) * 15 + j] } == three[k+3]) begin
				score[(4 * 13 + j) * 3 + k] = score[(4 * 13 + j) * 3 + k - 1] + three_weight[k];
			 end
			 else begin
				score[(4 * 13 + j) * 3 + k] = score[(4 * 13 + j) * 3 + k - 1];
			 end					  
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[5 * 15 + j + 2], chess_board[(5 + 1) * 15 + j + 1], chess_board[(5 + 2) * 15 + j] } == three[k+3]) begin
				score[(5 * 13 + j) * 3 + k] = score[(5 * 13 + j) * 3 + k - 1] + three_weight[k];
			 end
			 else begin
				score[(5 * 13 + j) * 3 + k] = score[(5 * 13 + j) * 3 + k - 1];
			 end					  
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[6 * 15 + j + 2], chess_board[(6 + 1) * 15 + j + 1], chess_board[(6 + 2) * 15 + j] } == three[k+3]) begin
				score[(6 * 13 + j) * 3 + k] = score[(6 * 13 + j) * 3 + k - 1] + three_weight[k];
			 end
			 else begin
				score[(6 * 13 + j) * 3 + k] = score[(6 * 13 + j) * 3 + k - 1];
			 end					  
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[7 * 15 + j + 2], chess_board[(7 + 1) * 15 + j + 1], chess_board[(7 + 2) * 15 + j] } == three[k+3]) begin
				score[(7 * 13 + j) * 3 + k] = score[(7 * 13 + j) * 3 + k - 1] + three_weight[k];
			 end
			 else begin
				score[(7 * 13 + j) * 3 + k] = score[(7 * 13 + j) * 3 + k - 1];
			 end					  
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[8 * 15 + j + 2], chess_board[(8 + 1) * 15 + j + 1], chess_board[(8 + 2) * 15 + j] } == three[k+3]) begin
				score[(8 * 13 + j) * 3 + k] = score[(8 * 13 + j) * 3 + k - 1] + three_weight[k];
			 end
			 else begin
				score[(8 * 13 + j) * 3 + k] = score[(8 * 13 + j) * 3 + k - 1];
			 end					  
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[9 * 15 + j + 2], chess_board[(9 + 1) * 15 + j + 1], chess_board[(9 + 2) * 15 + j] } == three[k+3]) begin
				score[(9 * 13 + j) * 3 + k] = score[(9 * 13 + j) * 3 + k - 1] + three_weight[k];
			 end
			 else begin
				score[(9 * 13 + j) * 3 + k] = score[(9 * 13 + j) * 3 + k - 1];
			 end					  
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[10 * 15 + j + 2], chess_board[(10 + 1) * 15 + j + 1], chess_board[(10 + 2) * 15 + j] } == three[k+3]) begin
				score[(10 * 13 + j) * 3 + k] = score[(10 * 13 + j) * 3 + k - 1] + three_weight[k];
			 end
			 else begin
				score[(10 * 13 + j) * 3 + k] = score[(10 * 13 + j) * 3 + k - 1];
			 end					  
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[11 * 15 + j + 2], chess_board[(11 + 1) * 15 + j + 1], chess_board[(11 + 2) * 15 + j] } == three[k+3]) begin
				score[(11 * 13 + j) * 3 + k] = score[(11 * 13 + j) * 3 + k - 1] + three_weight[k];
			 end
			 else begin
				score[(11 * 13 + j) * 3 + k] = score[(11 * 13 + j) * 3 + k - 1];
			 end					  
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[12 * 15 + j + 2], chess_board[(12 + 1) * 15 + j + 1], chess_board[(12 + 2) * 15 + j] } == three[k+3]) begin
				score[(12 * 13 + j) * 3 + k] = score[(12 * 13 + j) * 3 + k - 1] + three_weight[k];
			 end
			 else begin
				score[(12 * 13 + j) * 3 + k] = score[(12 * 13 + j) * 3 + k - 1];
			 end					  
		end     
	end
endtask
task Compare_three_upper_right1;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:1169];
        for(int j = 0; j <= 12 ; j++) begin
            for(int k=0; k < 3; k++) begin
                if(j == 0 && k == 0)
                    score[((0 + 13) * 13 + j) * 3 + k] = 0;
			if({chess_board[0 * 15 + j + 2], chess_board[(0 + 1) * 15 + j + 1], chess_board[(0 + 2) * 15 + j] } == three[k+3]) begin
                    if(j ==0 && k == 0)
                        score[((0 + 13) * 13 + j) * 3 + k] = three_weight[k+3];
                    else
                        score[((0 + 13) * 13 + j) * 3 + k] = score[((0 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
                end
                else begin
                    if(j ==0 && k == 0)
                        score[((0 + 13) * 13 + j) * 3 + k] = 0;
                    else
                        score[((0 + 13) * 13 + j) * 3 + k] = score[((0 + 13) * 13 + j) * 3 + k - 1];
                end
                       
            end     
        end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[1 * 15 + j + 2], chess_board[(1 + 1) * 15 + j + 1], chess_board[(1 + 2) * 15 + j] } == three[k+3]) begin
				score[((1 + 13) * 13 + j) * 3 + k] = score[((1 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((1 + 13) * 13 + j) * 3 + k] = score[((1 + 13) * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[2 * 15 + j + 2], chess_board[(2 + 1) * 15 + j + 1], chess_board[(2 + 2) * 15 + j] } == three[k+3]) begin
				score[((2 + 13) * 13 + j) * 3 + k] = score[((2 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((2 + 13) * 13 + j) * 3 + k] = score[((2 + 13) * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[3 * 15 + j + 2], chess_board[(3 + 1) * 15 + j + 1], chess_board[(3 + 2) * 15 + j] } == three[k+3]) begin
				score[((3 + 13) * 13 + j) * 3 + k] = score[((3 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((3 + 13) * 13 + j) * 3 + k] = score[((3 + 13) * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[4 * 15 + j + 2], chess_board[(4 + 1) * 15 + j + 1], chess_board[(4 + 2) * 15 + j] } == three[k+3]) begin
				score[((4 + 13) * 13 + j) * 3 + k] = score[((4 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((4 + 13) * 13 + j) * 3 + k] = score[((4 + 13) * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[5 * 15 + j + 2], chess_board[(5 + 1) * 15 + j + 1], chess_board[(5 + 2) * 15 + j] } == three[k+3]) begin
				score[((5 + 13) * 13 + j) * 3 + k] = score[((5 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((5 + 13) * 13 + j) * 3 + k] = score[((5 + 13) * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[6 * 15 + j + 2], chess_board[(6 + 1) * 15 + j + 1], chess_board[(6 + 2) * 15 + j] } == three[k+3]) begin
				score[((6 + 13) * 13 + j) * 3 + k] = score[((6 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((6 + 13) * 13 + j) * 3 + k] = score[((6 + 13) * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[7 * 15 + j + 2], chess_board[(7 + 1) * 15 + j + 1], chess_board[(7 + 2) * 15 + j] } == three[k+3]) begin
				score[((7 + 13) * 13 + j) * 3 + k] = score[((7 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((7 + 13) * 13 + j) * 3 + k] = score[((7 + 13) * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[8 * 15 + j + 2], chess_board[(8 + 1) * 15 + j + 1], chess_board[(8 + 2) * 15 + j] } == three[k+3]) begin
				score[((8 + 13) * 13 + j) * 3 + k] = score[((8 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((8 + 13) * 13 + j) * 3 + k] = score[((8 + 13) * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[9 * 15 + j + 2], chess_board[(9 + 1) * 15 + j + 1], chess_board[(9 + 2) * 15 + j] } == three[k+3]) begin
				score[((9 + 13) * 13 + j) * 3 + k] = score[((9 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((9 + 13) * 13 + j) * 3 + k] = score[((9 + 13) * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[10 * 15 + j + 2], chess_board[(10 + 1) * 15 + j + 1], chess_board[(10 + 2) * 15 + j] } == three[k+3]) begin
				score[((10 + 13) * 13 + j) * 3 + k] = score[((10 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((10 + 13) * 13 + j) * 3 + k] = score[((10 + 13) * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[11 * 15 + j + 2], chess_board[(11 + 1) * 15 + j + 1], chess_board[(11 + 2) * 15 + j] } == three[k+3]) begin
				score[((11 + 13) * 13 + j) * 3 + k] = score[((11 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((11 + 13) * 13 + j) * 3 + k] = score[((11 + 13) * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
	for(int j = 0; j <= 12 ; j++) begin
		for(int k=0; k < 3; k++) begin
			if({chess_board[12 * 15 + j + 2], chess_board[(12 + 1) * 15 + j + 1], chess_board[(12 + 2) * 15 + j] } == three[k+3]) begin
				score[((12 + 13) * 13 + j) * 3 + k] = score[((12 + 13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
			end
			else begin
				score[((12 + 13) * 13 + j) * 3 + k] = score[((12 + 13) * 13 + j) * 3 + k - 1];
			end
						
		end     
	end
endtask

always_comb begin
    state_w                 = state_r;
    black_score_w           = black_score_r;
    white_score_w           = white_score_r;
	score_w				    	= score_r;
    finished_w             = finished_r;

    
	case (state_r)
        S_SEVEN_UP: begin
           finished_w = 0;
           black_score_w = 0;
           white_score_w = 0;    
           if(i_start) begin
               Compare_seven_up(.chess_board(i_board), .score(seven_score));
               //Compare_six_up(.chess_board(i_board), .score(six_score));
               //Compare_five_up(.chess_board(i_board), .score(five_score));
               //Compare_three_up(.chess_board(i_board), .score(three_score));
               black_score_w = black_score_r + seven_score[134];
				//	+ six_score[2999] + five_score[1649] + three_score[584];
              // white_score_w = white_score_r + seven_score[269];
				//	+ six_score[5999] + five_score[3299]+ three_score[1169] ;
               // $display("up_black: ", black_score_w);
               // $display("up_white: ", white_score_w);
               state_w = S_EVALUATE;
           end 
        end 
	//	  S_SEVEN_UP1: begin
//
   //            Compare_seven_up1(.chess_board(i_board), .score(seven_score));
   //            //Compare_six_up(.chess_board(i_board), .score(six_score));
   //            //Compare_five_up(.chess_board(i_board), .score(five_score));
   //            //Compare_three_up(.chess_board(i_board), .score(three_score));
   //          //  black_score_w = black_score_r + seven_score[134];
	//			//	+ six_score[2999] + five_score[1649] + three_score[584];
   //            white_score_w = white_score_r + seven_score[269];
	//			//	+ six_score[5999] + five_score[3299]+ three_score[1169] ;
   //            // $display("up_black: ", black_score_w);
   //            // $display("up_white: ", white_score_w);
   //            state_w = S_SEVEN_LEFT;
   //
   //     end 
   //     S_SEVEN_LEFT:  begin 
   //        Compare_seven_left(.chess_board(i_board), .score(seven_score));
   //        //Compare_six_left(.chess_board(i_board), .score(six_score));
   //        //Compare_five_left(.chess_board(i_board), .score(five_score));
   //        //Compare_three_left(.chess_board(i_board), .score(three_score));
   //        black_score_w = black_score_r + seven_score[134];
	//			//] + six_score[2999] + five_score[1649] + three_score[584];
   //        //white_score_w = white_score_r + seven_score[269];
	//		 // + six_score[5999] + five_score[3299]+ three_score[1169];           
   //        // $display("left_black: ", black_score_w);
   //        // $display("left_white: ", white_score_w);
   //        state_w = S_SEVEN_LEFT1;  
   //     end
	//	  S_SEVEN_LEFT1:  begin 
   //        Compare_seven_left1(.chess_board(i_board), .score(seven_score));
   //        //Compare_six_left(.chess_board(i_board), .score(six_score));
   //        //Compare_five_left(.chess_board(i_board), .score(five_score));
   //        //Compare_three_left(.chess_board(i_board), .score(three_score));
   //        //black_score_w = black_score_r + seven_score[134];
	//			//] + six_score[2999] + five_score[1649] + three_score[584];
   //        white_score_w = white_score_r + seven_score[269];
	//		 // + six_score[5999] + five_score[3299]+ three_score[1169];           
   //        // $display("left_black: ", black_score_w);
   //        // $display("left_white: ", white_score_w);
   //        state_w = S_SEVEN_UL;  
   //     end
   //     S_SEVEN_UL:    begin  
   //        Compare_seven_upper_left(.chess_board(i_board), .score(seven_score));
   //        //Compare_six_upper_left(.chess_board(i_board), .score(six_score));
   //        //Compare_five_upper_left(.chess_board(i_board), .score(five_score)); 
   //        //Compare_three_upper_left(.chess_board(i_board), .score(three_score));
   //        black_score_w = black_score_r + seven_score[80];
	//			// + six_score[1999] + five_score[1209] + three_score[506];
   //        //white_score_w = white_score_r + seven_score[161];
	//			// + six_score[3999] + five_score[2419] + three_score[1013];
   //        // $display("upperleft_black: ", black_score_w);
   //        // $display("upperleft_white: ", white_score_w);
   //        state_w = S_SEVEN_UL1;
   //     end
	//	  S_SEVEN_UL1:    begin  
   //        Compare_seven_upper_left1(.chess_board(i_board), .score(seven_score));
   //        //Compare_six_upper_left(.chess_board(i_board), .score(six_score));
   //        //Compare_five_upper_left(.chess_board(i_board), .score(five_score)); 
   //        //Compare_three_upper_left(.chess_board(i_board), .score(three_score));
   //        //black_score_w = black_score_r + seven_score[80];
	//			// + six_score[1999] + five_score[1209] + three_score[506];
   //        white_score_w = white_score_r + seven_score[161];
	//			// + six_score[3999] + five_score[2419] + three_score[1013];
   //        // $display("upperleft_black: ", black_score_w);
   //        // $display("upperleft_white: ", white_score_w);
   //        state_w = S_SEVEN_UR;
   //     end
   //     S_SEVEN_UR:    begin  
   //        Compare_seven_upper_right(.chess_board(i_board), .score(seven_score));
   //        //Compare_six_upper_right(.chess_board(i_board), .score(six_score));
   //        //Compare_five_upper_right(.chess_board(i_board), .score(five_score));
   //        //Compare_three_upper_right(.chess_board(i_board), .score(three_score));
   //        black_score_w = black_score_r + seven_score[80];
	//			// + six_score[1999] + five_score[1209] + three_score[506];
   //        //white_score_w = white_score_r + seven_score[161];
	//			//] + six_score[3999] + five_score[2419] + three_score[1013];
   //        // $display("upperright_black: ", black_score_w);
   //        // $display("upperright_white: ", white_score_w);
   //        state_w = S_SEVEN_UR1;   
   //     end
	//	  S_SEVEN_UR1:    begin  
   //        Compare_seven_upper_right1(.chess_board(i_board), .score(seven_score));
   //        //Compare_six_upper_right(.chess_board(i_board), .score(six_score));
   //        //Compare_five_upper_right(.chess_board(i_board), .score(five_score));
   //        //Compare_three_upper_right(.chess_board(i_board), .score(three_score));
   //        //black_score_w = black_score_r + seven_score[80];
	//			// + six_score[1999] + five_score[1209] + three_score[506];
   //        white_score_w = white_score_r + seven_score[161];
	//			//] + six_score[3999] + five_score[2419] + three_score[1013];
   //        // $display("upperright_black: ", black_score_w);
   //        // $display("upperright_white: ", white_score_w);
   //        state_w = S_SIX_UP;   
   //     end
   //      S_SIX_UP:      begin  
   //          Compare_six_up(.chess_board(i_board), .score(six_score));
   //          black_score_w = black_score_r + six_score[2999];
   //          state_w = S_SIX_UP1; 
   //      end
	//		S_SIX_UP1:      begin  
   //          Compare_six_up1(.chess_board(i_board), .score(six_score));
   //          white_score_w = white_score_r + six_score[5999];
   //          state_w = S_SIX_LEFT; 
   //      end
   //      S_SIX_LEFT:    begin  
   //          Compare_six_left(.chess_board(i_board), .score(six_score));
   //          black_score_w = black_score_r + six_score[2999];
   //          //white_score_w = white_score_r + six_score[5999];
   //          state_w = S_SIX_LEFT1; 
//
   //      end
	//		S_SIX_LEFT1:    begin  
   //          Compare_six_left(.chess_board(i_board), .score(six_score));
   //          //black_score_w = black_score_r + six_score[2999];
   //          white_score_w = white_score_r + six_score[5999];
   //          state_w = S_SIX_UL; 
//
   //      end
   //      S_SIX_UL:      begin  
   //          Compare_six_upper_left(.chess_board(i_board), .score(six_score));
   //          black_score_w = black_score_r + six_score[1999];
   //          //white_score_w = white_score_r + six_score[3999];);
   //          state_w = S_SIX_UL1;    
   //      end
	//		S_SIX_UL1:      begin  
   //          Compare_six_upper_left(.chess_board(i_board), .score(six_score));
   //          //black_score_w = black_score_r + six_score[1999];
   //          white_score_w = white_score_r + six_score[3999];
   //          state_w = S_SIX_UR;    
   //      end
   //      S_SIX_UR:      begin 
   //          Compare_six_upper_right(.chess_board(i_board), .score(six_score));
   //          black_score_w = black_score_r + six_score[1999];
   //          ///white_score_w = white_score_r + six_score[3999];
   //          state_w = S_SIX_UR1;   
   //      end
	//		S_SIX_UR1:      begin 
   //          Compare_six_upper_right(.chess_board(i_board), .score(six_score));
   //          //black_score_w = black_score_r + six_score[1999];
   //          white_score_w = white_score_r + six_score[3999];
   //          state_w = S_FIVE_UP;   
   //      end
   //      S_FIVE_UP:     begin 
   //          Compare_five_up(.chess_board(i_board), .score(five_score));
   //          black_score_w = black_score_r + five_score[1649];
   //          //white_score_w = white_score_r + five_score[3299];
   //          state_w = S_FIVE_UP1; 
   //      end
	//	   S_FIVE_UP1:     begin 
   //         Compare_five_up(.chess_board(i_board), .score(five_score));
   //         //black_score_w = black_score_r + five_score[1649];
   //         white_score_w = white_score_r + five_score[3299];
   //         state_w = S_FIVE_LEFT; 
   //     end
   //     S_FIVE_LEFT:   begin 
   //         Compare_five_left(.chess_board(i_board), .score(five_score));
   //         black_score_w = black_score_r + five_score[1649];
   //         //white_score_w = white_score_r + five_score[3299];
   //         state_w = S_FIVE_LEFT1; 
   //     end
	//	 S_FIVE_LEFT1:   begin 
   //         Compare_five_left(.chess_board(i_board), .score(five_score));
   //         //black_score_w = black_score_r + five_score[1649];
   //         white_score_w = white_score_r + five_score[3299];
   //         state_w = S_FIVE_UL; 
   //     end
   //     S_FIVE_UL:     begin 
   //         Compare_five_upper_left(.chess_board(i_board), .score(five_score)); 
   //         black_score_w = black_score_r + five_score[1209];
   //         //white_score_w = white_score_r + five_score[2419];
   //         state_w = S_FIVE_UL1;   
   //     end
	//	S_FIVE_UL1:     begin 
   //         Compare_five_upper_left(.chess_board(i_board), .score(five_score)); 
   //         //black_score_w = black_score_r + five_score[1209];
   //         white_score_w = white_score_r + five_score[2419];
   //         state_w = S_FIVE_UR;   
   //     end
   //     S_FIVE_UR:     begin  
   //         Compare_five_upper_right(.chess_board(i_board), .score(five_score));
   //         black_score_w = black_score_r + five_score[1209];
   //         //white_score_w = white_score_r + five_score[2419];
   //         state_w = S_FIVE_UR1;  
   //     end
	//	 S_FIVE_UR1:     begin  
   //         Compare_five_upper_right(.chess_board(i_board), .score(five_score));
   //         //black_score_w = black_score_r + five_score[1209];
   //         white_score_w = white_score_r + five_score[2419];
   //         state_w = S_THREE_UP;  
   //     end
   //     S_THREE_UP:    begin 
   //         Compare_three_up(.chess_board(i_board), .score(three_score));
   //         black_score_w = black_score_r + three_score[584];
   //         //white_score_w = white_score_r + three_score[1169];
   //         state_w = S_THREE_UP1;
   //     end
	//	 S_THREE_UP1:    begin 
   //         Compare_three_up(.chess_board(i_board), .score(three_score));
   //         //black_score_w = black_score_r + three_score[584];
   //         white_score_w = white_score_r + three_score[1169];
   //         state_w = S_THREE_LEFT;
   //     end
   //     S_THREE_LEFT:  begin 
   //         Compare_three_left(.chess_board(i_board), .score(three_score));
   //         black_score_w = black_score_r + three_score[584];
   //         //white_score_w = white_score_r + three_score[1169];
   //         state_w = S_THREE_LEFT1;  
   //     end
	//	 S_THREE_LEFT1:  begin 
   //         Compare_three_left(.chess_board(i_board), .score(three_score));
   //         ///black_score_w = black_score_r + three_score[584];
   //         white_score_w = white_score_r + three_score[1169];
   //         state_w = S_THREE_UL;  
   //     end
   //     S_THREE_UL:    begin  
   //         Compare_three_upper_left(.chess_board(i_board), .score(three_score));
   //         black_score_w = black_score_r + three_score[506];
   //         //white_score_w = white_score_r + three_score[1013];
   //         state_w = S_THREE_UL1;  
   //     end
	//	 S_THREE_UL1:    begin  
   //         Compare_three_upper_left(.chess_board(i_board), .score(three_score));
   //         //black_score_w = black_score_r + three_score[506];
   //         white_score_w = white_score_r + three_score[1013];
   //         state_w = S_THREE_UR;  
   //     end
   //     S_THREE_UR:    begin  
   //         Compare_three_upper_right(.chess_board(i_board), .score(three_score));
   //         black_score_w = black_score_r + three_score[506];
   //         //white_score_w = white_score_r + three_score[1013];
   //         state_w = S_THREE_UR1;   
   //     end
	//	 S_THREE_UR1:    begin  
   //         Compare_three_upper_right(.chess_board(i_board), .score(three_score));
   //         //black_score_w = black_score_r + three_score[506];
   //         white_score_w = white_score_r + three_score[1013];
   //         state_w = S_EVALUATE;   
   //     end
       S_EVALUATE: begin
           if(i_turn == 0) begin
               state_w = S_SEVEN_UP;
               finished_w  = 1;
               //score_w = black_score_r - white_score_r;
               //$display("total: ",score_w);
					score_w = 32'd100;
           end
           else begin
               state_w = S_SEVEN_UP;
               finished_w  = 1;
               //score_w = white_score_r - black_score_r;
					score_w = 32'd100;
           end
       end
   endcase
end

always_ff @(posedge i_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        state_r                 <= S_SEVEN_UP;
        black_score_r           <= 0;
        white_score_r           <= 0;
		score_r				    <= 0;
        finished_r              <= 0;
    end
    else begin
        state_r                 <= state_w;
		score_r				    <= score_w;
        black_score_r           <= black_score_w;
        white_score_r           <= white_score_w;
        finished_r              <= finished_w;
    end
end

endmodule
