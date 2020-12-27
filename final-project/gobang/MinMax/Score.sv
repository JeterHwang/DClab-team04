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



parameter FIVE              = 32'd1000000;
parameter FOUR              = 32'd100000;
parameter THREE             = 32'd1000;
parameter TWO               = 32'd100;
parameter ONE               = 32'd10;
parameter BLOCKED_FOUR      = 32'd10000;
parameter BLOCKED_THREE     = 32'd100;
parameter BLOCKED_TWO       = 32'd10;

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
parameter logic [9:0] five [0:19] = '{black_con_five, black_con_three, black_blank_one_two, black_blocked_jump_one_four_o, black_blocked_jump_one_four_r, black_blocked_jump_two_four, black_blocked_blank_one_three_o, black_blocked_blank_one_three_r, black_blocked_blank_two_three, black_blocked_blank_three_two, white_con_five, white_con_three, white_blank_one_two,
                                       white_blocked_jump_one_four_o, white_blocked_jump_one_four_r, white_blocked_jump_two_four, white_blocked_blank_one_three_o, white_blocked_blank_one_three_r, white_blocked_blank_two_three, white_blocked_blank_three_two};
parameter logic [5:0] three [0:5] =  '{black_con_one, black_blocked_one_o, black_blocked_one_r, white_con_one, white_blocked_one_o, white_blocked_one_r};                                               

parameter logic [31:0] seven_weight [0:1] = '{BLOCKED_THREE, BLOCKED_THREE};
parameter logic [31:0] six_weight [0:37] = '{FOUR, THREE, BLOCKED_THREE, TWO, TWO, BLOCKED_FOUR, BLOCKED_FOUR, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_THREE,
                                            BLOCKED_THREE, BLOCKED_THREE, BLOCKED_TWO, BLOCKED_TWO, BLOCKED_TWO, BLOCKED_TWO, BLOCKED_TWO, BLOCKED_TWO, FOUR, THREE, THREE,
                                            TWO, TWO, BLOCKED_FOUR, BLOCKED_FOUR, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_TWO, BLOCKED_TWO,
                                            BLOCKED_TWO, BLOCKED_TWO, BLOCKED_TWO, BLOCKED_TWO};

parameter logic [31:0] five_weight [0:19] = '{FIVE, THREE, TWO, BLOCKED_FOUR, BLOCKED_FOUR, BLOCKED_FOUR, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_TWO, FIVE, THREE, TWO,
                                            BLOCKED_FOUR, BLOCKED_FOUR, BLOCKED_FOUR, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_TWO};
parameter logic [31:0] three_weight [0:5]  = '{ONE, ONE, ONE, ONE, ONE, ONE};


logic signed [31:0] seven_score [0:449];
logic signed [31:0] six_score   [0:8549];
logic signed [31:0] five_score  [0:4499];
logic signed [31:0] three_score [0:1349];





logic [7:0]  state_r, state_w;
logic signed [31:0] white_score_r, white_score_w;
logic signed [31:0] black_score_r, black_score_w;
logic signed [31:0] score_r, score_w;
logic finished_r, finished_w;                      

assign o_finish = finished_r;

task Compare_seven_up;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:449];
    // 268
    for(int i = 0; i <= 8; i++) begin
        for(int j = 0; j < 15; j++) begin
            for(int k=0; k < 1; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[((i+9) * 15 + j) * 1 + k] = 0;
                if({chess_board[j+i*15], chess_board[j+(i+1)*15], chess_board[j+(i+2)*15], chess_board[j+(i+3)*15], chess_board[j+(i+4)*15], chess_board[j+(i+5)*15], chess_board[j+(i+6)*15] } == seven[k+1]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+9) * 15 + j) * 1 + k] = seven_weight[k+1];
                    else
                        score[((i+9) * 15 + j) * 1 + k] = score[((i+9) * 15 + j) * 1 + k - 1] + seven_weight[k+1];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+9) * 15 + j) * 1 + k] = 0;
                    else
                        score[((i+9) * 15 + j) * 1 + k] = score[((i+9) * 15 + j) * 1 + k - 1];
                end
                       
            end     
        end
    end
    for(int i = 0; i <= 8; i++) begin
        for(int j = 0; j < 15; j++) begin
            for(int k=0; k < 1; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[(i * 15 + j) * 1 + k] = 0;
                if({chess_board[j+i*15], chess_board[j+(i+1)*15], chess_board[j+(i+2)*15], chess_board[j+(i+3)*15], chess_board[j+(i+4)*15], chess_board[j+(i+5)*15], chess_board[j+(i+6)*15] } == seven[k]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 15 + j) * 1 + k] = seven_weight[k];
                    else
                        score[(i * 15 + j) * 1 + k] = score[(i * 15 + j) * 1 + k - 1] + seven_weight[k];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 15 + j) * 1 + k] = 0;
                    else
                        score[(i * 15 + j) * 1 + k] = score[(i * 15 + j) * 1 + k - 1];
                end
                       
            end     
        end
    end
endtask
task Compare_seven_left;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:449];
    for(int i = 0; i < 15; i++) begin
        for(int j = 0; j <= 8; j++) begin
            for(int k=0; k < 1; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[(i * 9 + j) * 1 + k] = 0;
                if({chess_board[i * 15 + j], chess_board[i * 15 + j + 1], chess_board[i * 15 + j + 2], chess_board[i * 15 + j + 3], chess_board[i * 15 + j + 4], chess_board[i * 15 + j + 5], chess_board[i * 15 + j + 6] } === seven[k]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 9 + j) * 1 + k] = seven_weight[k];
                    else
                        score[(i * 9 + j) * 1 + k] = score[(i * 9 + j) * 1 + k - 1] + seven_weight[k];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 9 + j) * 1 + k] = 0;
                    else
                        score[(i * 9 + j) * 1 + k] = score[(i * 9 + j) * 1 + k - 1];
                end
                       
            end     
        end
    end
    for(int i = 0; i < 15; i++) begin
        for(int j = 0; j <= 8; j++) begin
            for(int k=0; k < 1; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[((i+15) * 9 + j) * 1 + k] = 0;
                if({chess_board[i * 15 + j], chess_board[i * 15 + j + 1], chess_board[i * 15 + j + 2], chess_board[i * 15 + j + 3], chess_board[i * 15 + j + 4], chess_board[i * 15 + j + 5], chess_board[i * 15 + j + 6] } === seven[k+1]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+15) * 9 + j) * 1 + k] = seven_weight[k+1];
                    else
                        score[((i+15) * 9 + j) * 1 + k] = score[((i+15) * 9 + j) * 1 + k - 1] + seven_weight[k+1];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+15) * 9 + j) * 1 + k] = 0;
                    else
                        score[((i+15) * 9 + j) * 1 + k] = score[((i+15) * 9 + j) * 1 + k - 1];
                end
                       
            end     
        end
    end
endtask
task Compare_seven_upper_left;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:449];
    
    for(int i = 0; i <= 8; i++) begin
        for(int j = 0; j <= 8 ; j++) begin
            for(int k=0; k < 1; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[(i * 9 + j) * 1 + k] = 0;
                if({chess_board[i * 15 + j], chess_board[(i + 1) * 15 + j + 1], chess_board[(i+2)*15 + j+2], chess_board[(i + 3) * 15 + j + 3], chess_board[(i + 4) * 15 + j + 4], chess_board[(i + 5) * 15 + j + 5], chess_board[(i + 6) * 15 + j + 6] } === seven[k]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 9 + j) * 1 + k] = seven_weight[k];
                    else
                        score[(i * 9 + j) * 1 + k] = score[(i * 9 + j) * 1 + k - 1] + seven_weight[k];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 9 + j) * 1 + k] = 0;
                    else
                        score[(i * 9 + j) * 1 + k] = score[(i * 9 + j) * 1 + k - 1];
                end
                       
            end     
        end
    end
    for(int i = 0; i <= 8; i++) begin
        for(int j = 0; j <= 8 ; j++) begin
            for(int k=0; k < 1; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[((i+9) * 9 + j) * 1 + k] = 0;
                if({chess_board[i * 15 + j], chess_board[(i + 1) * 15 + j + 1], chess_board[(i+2)*15 + j+2], chess_board[(i + 3) * 15 + j + 3], chess_board[(i + 4) * 15 + j + 4], chess_board[(i + 5) * 15 + j + 5], chess_board[(i + 6) * 15 + j + 6] } === seven[k+1]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+9) * 9 + j) * 1 + k] = seven_weight[k+1];
                    else
                        score[(i * 9 + j) * 1 + k] = score[((i+9) * 9 + j) * 1 + k - 1] + seven_weight[k+1];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+9) * 9 + j) * 1 + k] = 0;
                    else
                        score[((i+9) * 9 + j) * 1 + k] = score[((i+9) * 9 + j) * 1 + k - 1];
                end
                       
            end     
        end
    end
endtask
task Compare_seven_upper_right;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:449];
    
    for(int i = 0; i <= 8; i++) begin
        for(int j = 0; j <= 8; j++) begin
            for(int k=0; k < 1; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[(i * 9 + j) * 1 + k] = 0;
                if({chess_board[i * 15 + j + 6], chess_board[(i + 1) * 15 + j + 5], chess_board[(i + 2) * 15 + j + 4], chess_board[(i + 3) * 15 + j + 3], chess_board[(i + 4) * 15 + j + 2], chess_board[(i + 5) * 15 + j + 1], chess_board[(i + 6) * 15 + j] } === seven[k]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 9 + j) * 1 + k] = seven_weight[k];
                    else
                        score[(i * 9 + j) * 1 + k] = score[(i * 9 + j) * 1 + k - 1] + seven_weight[k];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 9 + j) * 1 + k] = 0;
                    else
                        score[(i * 9 + j) * 1 + k] = score[(i * 9 + j) * 1 + k - 1];
                end
                       
            end     
        end
    end
    for(int i = 0; i <= 8; i++) begin
        for(int j = 0; j <= 8; j++) begin
            for(int k=0; k < 1; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[((i+9) * 9 + j) * 1 + k] = 0;
                if({chess_board[i * 15 + j + 6], chess_board[(i + 1) * 15 + j + 5], chess_board[(i + 2) * 15 + j + 4], chess_board[(i + 3) * 15 + j + 3], chess_board[(i + 4) * 15 + j + 2], chess_board[(i + 5) * 15 + j + 1], chess_board[(i + 6) * 15 + j] } === seven[k+1]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+9) * 9 + j) * 1 + k] = seven_weight[k+1];
                    else
                        score[((i+9) * 9 + j) * 1 + k] = score[((i+9) * 9 + j) * 1 + k - 1] + seven_weight[k+1];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+9) * 9 + j) * 1 + k] = 0;
                    else
                        score[((i+9) * 9 + j) * 1 + k] = score[((i+9) * 9 + j) * 1 + k - 1];
                end
                       
            end     
        end
    end
endtask

task Compare_six_up;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:8549];
    
    for(int i = 0; i <= 9; i++) begin
        for(int j = 0; j < 15; j++) begin
            for(int k=0; k < 20; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[(i * 15 + j) * 20 + k] = 0;
                if({chess_board[j+i*15], chess_board[j+(i+1)*15], chess_board[j+(i+2)*15], chess_board[j+(i+3)*15], chess_board[j+(i+4)*15], chess_board[j+(i+5)*15]} === six[k]) begin
                    if(i == 0 && j ==0 && k == 0) begin
                        score[(i * 15 + j) * 20 + k] = six_weight[k];
                        score[6000+k] = k;
                    end
                    else begin
                        score[(i * 15 + j) * 20 + k] = score[(i * 15 + j) * 20 + k - 1] + six_weight[k];
                        score[6000+k] = k;
                    end
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 15 + j) * 20 + k] = 0;
                    else
                        score[(i * 15 + j) * 20 + k] = score[(i * 15 + j) * 20 + k - 1];
                end
                       
            end     
        end
    end
    for(int i = 0; i <= 9; i++) begin
        for(int j = 0; j < 15; j++) begin
            for(int k=0; k < 20; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[((i+10) * 15 + j) * 20 + k] = 0;
                if({chess_board[j+i*15], chess_board[j+(i+1)*15], chess_board[j+(i+2)*15], chess_board[j+(i+3)*15], chess_board[j+(i+4)*15], chess_board[j+(i+5)*15]} === six[k+20]) begin
                    if(i == 0 && j ==0 && k == 0) begin
                        score[((i+10) * 15 + j) * 20 + k] = six_weight[k+20];
                        score[6000+k+20] = k;
                    end
                    else begin
                        score[((i+10) * 15 + j) * 20 + k] = score[((i+10) * 15 + j) * 20 + k - 1] + six_weight[k+20];
                        score[6000+k+20] = k;
                    end
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+10) * 15 + j) * 20 + k] = 0;
                    else
                        score[((i+10) * 15 + j) * 20 + k] = score[((i+10) * 15 + j) * 20 + k - 1];
                end
                       
            end     
        end
    end
endtask
task Compare_six_left;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:8549];
    // 5662
    for(int i = 0; i < 15; i++) begin
        for(int j = 0; j < 10; j++) begin
            for(int k=0; k < 20; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[(i * 10 + j) * 20 + k] = 0;
                if({chess_board[i * 15 + j], chess_board[i * 15 + j + 1], chess_board[i * 15 + j + 2], chess_board[i * 15 + j + 3], chess_board[i * 15 + j + 4], chess_board[i * 15 + j + 5] } === six[k]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 10 + j) * 20 + k] = six_weight[k];
                    else
                        score[(i * 10 + j) * 20 + k] = score[(i * 10 + j) * 20 + k - 1] + six_weight[k];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 10 + j) * 20 + k] = 0;
                    else
                        score[(i * 10 + j) * 20 + k] = score[(i * 10 + j) * 20 + k - 1];
                end
                       
            end     
        end
    end
    for(int i = 0; i < 15; i++) begin
        for(int j = 0; j < 10; j++) begin
            for(int k=0; k < 20; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[((i+15) * 10 + j) * 20 + k] = 0;
                if({chess_board[i * 15 + j], chess_board[i * 15 + j + 1], chess_board[i * 15 + j + 2], chess_board[i * 15 + j + 3], chess_board[i * 15 + j + 4], chess_board[i * 15 + j + 5] } === six[k+20]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+15) * 10 + j) * 20 + k] = six_weight[k+20];
                    else
                        score[((i+15) * 10 + j) * 20 + k] = score[((i+15) * 10 + j) * 20 + k - 1] + six_weight[k+20];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+15) * 10 + j) * 20 + k] = 0;
                    else
                        score[((i+15) * 10 + j) * 20 + k] = score[((i+15) * 10 + j) * 20 + k - 1];
                end
                       
            end     
        end
    end
endtask
task Compare_six_upper_left;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:8549];
    
    for(int i = 0; i <= 9; i++) begin
        for(int j = 0; j <= 9 ; j++) begin
            for(int k=0; k < 20; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[(i * 10 + j) * 20 + k] = 0;
                if({chess_board[i * 15 + j], chess_board[(i + 1) * 15 + j + 1], chess_board[(i+2)*15 +  j+2], chess_board[(i + 3) * 15 + j + 3], chess_board[(i + 4) * 15 + j + 4], chess_board[(i + 5) * 15 + j + 5] } === six[k]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 10 + j) * 20 + k] = six_weight[k];
                    else
                        score[(i * 10 + j) * 20 + k] = score[(i * 10 + j) * 20 + k - 1] + six_weight[k];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 10 + j) * 20 + k] = 0;
                    else
                        score[(i * 10 + j) * 20 + k] = score[(i * 10 + j) * 20 + k - 1];
                end
                       
            end     
        end
    end
    for(int i = 0; i <= 9; i++) begin
        for(int j = 0; j <= 9 ; j++) begin
            for(int k=0; k < 20; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[((i+10) * 10 + j) * 20 + k] = 0;
                if({chess_board[i * 15 + j], chess_board[(i + 1) * 15 + j + 1], chess_board[(i+2)*15 +  j+2], chess_board[(i + 3) * 15 + j + 3], chess_board[(i + 4) * 15 + j + 4], chess_board[(i + 5) * 15 + j + 5] } === six[k+20]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+10) * 10 + j) * 20 + k] = six_weight[k+20];
                    else
                        score[((i+10) * 10 + j) * 20 + k] = score[((i+10) * 10 + j) * 20 + k - 1] + six_weight[k+20];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+10) * 10 + j) * 20 + k] = 0;
                    else
                        score[((i+10) * 10 + j) * 20 + k] = score[((i+10) * 10 + j) * 20 + k - 1];
                end
                       
            end     
        end
    end
endtask
task Compare_six_upper_right;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:8549];
    
    for(int i = 0; i <= 9; i++) begin
        for(int j = 0; j <= 9; j++) begin
            for(int k=0; k < 20; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[(i * 10 + j) * 20 + k] = 0;
                if({chess_board[(i * 15) + j + 5], chess_board[(i + 1) * 15 + j + 4], chess_board[(i + 2) * 15 + j + 3], chess_board[(i + 3) * 15 + j + 2], chess_board[(i + 4) * 15 + j + 1], chess_board[(i + 5) * 15 + j] } === six[k]) begin
                    if(i == 0 && j ==0 && k == 0) begin
                        score[(i * 10 + j) * 20 + k] = six_weight[k];
                        score[4000+k] = k;
                    end
                    else begin
                        score[(i * 10 + j) * 20 + k] = score[(i * 10 + j) * 20 + k - 1] + six_weight[k];
                        score[4000+k] = k;
                    end
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 10 + j) * 20 + k] = 0;
                    else
                        score[(i * 10 + j) * 20 + k] = score[(i * 10 + j) * 20 + k - 1];
                end
                       
            end     
        end
    end
    for(int i = 0; i <= 9; i++) begin
        for(int j = 0; j <= 9; j++) begin
            for(int k=0; k < 20; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[((i+10) * 10 + j) * 20 + k] = 0;
                if({chess_board[(i * 15) + j + 5], chess_board[(i + 1) * 15 + j + 4], chess_board[(i + 2) * 15 + j + 3], chess_board[(i + 3) * 15 + j + 2], chess_board[(i + 4) * 15 + j + 1], chess_board[(i + 5) * 15 + j] } === six[k+20]) begin
                    if(i == 0 && j ==0 && k == 0) begin
                        score[((i+10) * 10 + j) * 20 + k] = six_weight[k+20];
                        score[4000+k+20] = k+20;
                    end
                    else begin
                        score[((i+10) * 10 + j) * 20 + k] = score[((i+10) * 10 + j) * 20 + k - 1] + six_weight[k+20];
                        score[4000+k+20] = k+20;
                    end
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+10) * 10 + j) * 20 + k] = 0;
                    else
                        score[((i+10) * 10 + j) * 20 + k] = score[((i+10) * 10 + j) * 20 + k - 1];
                end
                       
            end     
        end
    end
endtask
task Compare_five_up;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:4499];
    // 3280
    for(int i = 0; i <= 10; i++) begin
        for(int j = 0; j <= 14; j++) begin
            for(int k=0; k <= 9; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[(i * 15 + j) * 10 + k] = 0;
                if({chess_board[j+i*15], chess_board[j+(i+1)*15], chess_board[j+(i+2)*15], chess_board[j+(i+3)*15], chess_board[j+(i+4)*15] } === five[k]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 15 + j) * 10 + k] = five_weight[k];
                    else
                        score[(i * 15 + j) * 10 + k] = score[(i * 15 + j) * 10 + k - 1] + five_weight[k];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 15 + j) * 10 + k] = 0;
                    else
                        score[(i * 15 + j) * 10 + k] = score[(i * 15 + j) * 10 + k - 1];
                end
                       
            end     
        end
    end
    for(int i = 0; i <= 10; i++) begin
        for(int j = 0; j <= 14; j++) begin
            for(int k=0; k <= 9; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[((i+11) * 15 + j) * 10 + k] = 0;
                if({chess_board[j+i*15], chess_board[j+(i+1)*15], chess_board[j+(i+2)*15], chess_board[j+(i+3)*15], chess_board[j+(i+4)*15] } === five[k+10]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+11) * 15 + j) * 10 + k] = five_weight[k+10];
                    else
                        score[((i+11) * 15 + j) * 10 + k] = score[((i+11) * 15 + j) * 10 + k - 1] + five_weight[k+10];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+11) * 15 + j) * 10 + k] = 0;
                    else
                        score[((i+11) * 15 + j) * 10 + k] = score[((i+11) * 15 + j) * 10 + k - 1];
                end
                       
            end     
        end
    end
                           
endtask
task Compare_five_left;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:4499];
    
    for(int i = 0; i < 15; i++) begin
        for(int j = 0; j <= 10; j++) begin
            for(int k=0; k < 10; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[(i * 11 + j) * 10 + k] = 0;
                if({chess_board[i * 15 + j], chess_board[i * 15 + j + 1], chess_board[i * 15 + j + 2], chess_board[i * 15 + j + 3], chess_board[i * 15 + j + 4] } === five[k]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 11 + j) * 10 + k] = five_weight[k];
                    else
                        score[(i * 11 + j) * 10 + k] = score[(i * 11 + j) * 10 + k - 1] + five_weight[k];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 11 + j) * 10 + k] = 0;
                    else
                        score[(i * 11 + j) * 10 + k] = score[(i * 11 + j) * 10 + k - 1];
                end
                       
            end     
        end
    end
    for(int i = 0; i < 15; i++) begin
        for(int j = 0; j <= 10; j++) begin
            for(int k=0; k < 10; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[((i+15) * 11 + j) * 10 + k] = 0;
                if({chess_board[i * 15 + j], chess_board[i * 15 + j + 1], chess_board[i * 15 + j + 2], chess_board[i * 15 + j + 3], chess_board[i * 15 + j + 4] } === five[k+10]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+15) * 11 + j) * 10 + k] = five_weight[k+10];
                    else
                        score[((i+15) * 11 + j) * 10 + k] = score[((i+15) * 11 + j) * 10 + k - 1] + five_weight[k+10];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+15) * 11 + j) * 10 + k] = 0;
                    else
                        score[((i+15) * 11 + j) * 10 + k] = score[((i+15) * 11 + j) * 10 + k - 1];
                end
                       
            end     
        end
    end
    
endtask
task Compare_five_upper_left(
    input [1:0] chess_board [225],
    output signed [31:0] score [0:4499]
);
    for(int i = 0; i <= 10; i++) begin
        for(int j = 0; j <= 10 ; j++) begin
            for(int k=0; k < 10; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[(i * 11 + j) * 10 + k] = 0;
                if( { chess_board[i * 15 + j], chess_board[(i + 1) * 15 + j + 1], chess_board[(i+2)*15 + j+2], chess_board[(i + 3) * 15 + j + 3], chess_board[(i + 4) * 15 + j + 4] } == five[k]) begin
                    if(i == 0 && j == 0 && k == 0)
                        score[(i * 11 + j) * 10 + k] = five_weight[k];
                    else
                        score[(i * 11 + j) * 10 + k] = score[(i * 11 + j) * 10 + k - 1] + five_weight[k];
                end
                else begin
                    if(i == 0 && j == 0 && k == 0)
                        score[(i * 11 + j) * 10 + k] = 0;
                    else
                        score[(i * 11 + j) * 10 + k] = score[(i * 11 + j) * 10 + k - 1];
                end
                       
            end     
        end
    end
    for(int i = 0; i <= 10; i++) begin
        for(int j = 0; j <= 10 ; j++) begin
            for(int k=0; k < 10; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[((i+11) * 11 + j) * 10 + k] = 0;
                if( { chess_board[i * 15 + j], chess_board[(i + 1) * 15 + j + 1], chess_board[(i+2)*15 + j+2], chess_board[(i + 3) * 15 + j + 3], chess_board[(i + 4) * 15 + j + 4] } == five[k+10]) begin
                    if(i == 0 && j == 0 && k == 0)
                        score[((i+11) * 11 + j) * 10 + k] = five_weight[k+10];
                    else
                        score[((i+11) * 11 + j) * 10 + k] = score[((i+11) * 11 + j) * 10 + k - 1] + five_weight[k+10];
                end
                else begin
                    if(i == 0 && j == 0 && k == 0)
                        score[((i+11) * 11 + j) * 10 + k] = 0;
                    else
                        score[((i+11) * 11 + j) * 10 + k] = score[((i+11) * 11 + j) * 10 + k - 1];
                end
                       
            end     
        end
    end

endtask
task Compare_five_upper_right;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:4499];
    
    for(int i = 0; i <= 10; i++) begin
        for(int j = 0; j <= 10; j++) begin
            for(int k=0; k < 10; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[(i * 11 + j) * 10 + k] = 0;
                if({chess_board[i * 15 +  j + 4], chess_board[(i + 1) * 15 + j + 3 ], chess_board[(i + 2) * 15 + j + 2], chess_board[(i + 3) * 15 + j + 1], chess_board[(i + 4) * 15 + j] } === five[k]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 11 + j) * 10 + k] = five_weight[k];
                    else
                        score[(i * 11 + j) * 10 + k] = score[(i * 11 + j) * 10 + k - 1] + five_weight[k];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 11 + j) * 10 + k] = 0;
                    else
                        score[(i * 11 + j) * 10 + k] = score[(i * 11 + j) * 10 + k - 1];
                end
                       
            end     
        end
    end
    for(int i = 0; i <= 10; i++) begin
        for(int j = 0; j <= 10; j++) begin
            for(int k=0; k < 10; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[((i+11) * 11 + j) * 10 + k] = 0;
                if({chess_board[i * 15 +  j + 4], chess_board[(i + 1) * 15 + j + 3 ], chess_board[(i + 2) * 15 + j + 2], chess_board[(i + 3) * 15 + j + 1], chess_board[(i + 4) * 15 + j] } === five[k+10]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+11) * 11 + j) * 10 + k] = five_weight[k+10];
                    else
                        score[((i+11) * 11 + j) * 10 + k] = score[((i+11) * 11 + j) * 10 + k - 1] + five_weight[k+10];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+11) * 11 + j) * 10 + k] = 0;
                    else
                        score[((i+11) * 11 + j) * 10 + k] = score[((i+11) * 11 + j) * 10 + k - 1];
                end
                       
            end     
        end
    end

endtask


task Compare_three_up;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:1349];
    // 1164
    for(int i = 0; i <= 12; i++) begin
        for(int j = 0; j < 15; j++) begin
            for(int k=0; k < 3; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[(i * 15 + j) * 3 + k] = 0;
                if({chess_board[j+i*15], chess_board[j+(i+1)*15], chess_board[j+(i+2)*15] } === three[k]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 15 + j) * 3 + k] = three_weight[k];
                    else
                        score[(i * 15 + j) * 3 + k] = score[(i * 15 + j) * 3 + k - 1] + three_weight[k];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 15 + j) * 3 + k] = 0;
                    else
                        score[(i * 15 + j) * 3 + k] = score[(i * 15 + j) * 3 + k - 1];
                end
                       
            end     
        end
    end
    for(int i = 0; i <= 12; i++) begin
        for(int j = 0; j < 15; j++) begin
            for(int k=0; k < 3; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[((i+13) * 15 + j) * 3 + k] = 0;
                if({chess_board[j+i*15], chess_board[j+(i+1)*15], chess_board[j+(i+2)*15] } === three[k+3]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+13) * 15 + j) * 3 + k] = three_weight[k+3];
                    else
                        score[((i+13) * 15 + j) * 3 + k] = score[((i+13) * 15 + j) * 3 + k - 1] + three_weight[k+3];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+13) * 15 + j) * 3 + k] = 0;
                    else
                        score[((i+13) * 15 + j) * 3 + k] = score[((i+13) * 15 + j) * 3 + k - 1];
                end
                       
            end     
        end
    end
endtask
task Compare_three_left;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:1349];
    
    for(int i = 0; i < 15; i++) begin
        for(int j = 0; j <= 12; j++) begin
            for(int k=0; k < 3; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[(i * 13 + j) * 3 + k] = 0;
                if({chess_board[i * 12 + j], chess_board[i * 15 + j + 1], chess_board[i * 15 + j + 2] } === three[k]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 13 + j) * 3 + k] = three_weight[k];
                    else
                        score[(i * 13 + j) * 3 + k] = score[(i * 13 + j) * 3 + k - 1] + three_weight[k];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 13 + j) * 3 + k] = 0;
                    else
                        score[(i * 13 + j) * 3 + k] = score[(i * 13 + j) * 3 + k - 1];
                end
                       
            end     
        end
    end
    for(int i = 0; i < 15; i++) begin
        for(int j = 0; j <= 12; j++) begin
            for(int k=0; k < 3; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[((i+15) * 13 + j) * 3 + k] = 0;
                if({chess_board[i * 12 + j], chess_board[i * 15 + j + 1], chess_board[i * 15 + j + 2] } === three[k+3]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+15) * 13 + j) * 3 + k] = three_weight[k+3];
                    else
                        score[((i+15) * 13 + j) * 3 + k] = score[((i+15) * 13 + j) * 3 + k - 1] + three_weight[k+3];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+15) * 13 + j) * 3 + k] = 0;
                    else
                        score[((i+15) * 13 + j) * 3 + k] = score[((i+15) * 13 + j) * 3 + k - 1];
                end
                       
            end     
        end
    end
endtask
task Compare_three_upper_left;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:1349];
    
    for(int i = 0; i <= 12; i++) begin
        for(int j = 0; j <= 12 ; j++) begin
            for(int k=0; k < 3; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[(i * 13 + j) * 3 + k] = 0;
                if({chess_board[i * 15 + j], chess_board[(i + 1) * 15 + j + 1], chess_board[(i+2)*15 + j+2] } === three[k]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 13 + j) * 3 + k] = three_weight[k];
                    else
                        score[(i * 13 + j) * 3 + k] = score[(i * 13 + j) * 3 + k - 1] + three_weight[k];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 13 + j) * 3 + k] = 0;
                    else
                        score[(i * 13 + j) * 3 + k] = score[(i * 13 + j) * 3 + k - 1];
                end
                       
            end     
        end
    end
    for(int i = 0; i <= 12; i++) begin
        for(int j = 0; j <= 12 ; j++) begin
            for(int k=0; k < 3; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[((i+13) * 13 + j) * 3 + k] = 0;
                if({chess_board[i * 15 + j], chess_board[(i + 1) * 15 + j + 1], chess_board[(i+2)*15 + j+2] } === three[k+3]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+13) * 13 + j) * 3 + k] = three_weight[k+3];
                    else
                        score[((i+13) * 13 + j) * 3 + k] = score[((i+13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+13) * 13 + j) * 3 + k] = 0;
                    else
                        score[((i+13) * 13 + j) * 3 + k] = score[((i+13) * 13 + j) * 3 + k - 1];
                end
                       
            end     
        end
    end
endtask
task Compare_three_upper_right;
    input [1:0] chess_board [225];
    output signed [31:0] score [0:1349];
    
    for(int i = 0; i <= 12; i++) begin
        for(int j = 0; j <= 12; j++) begin
            for(int k=0; k < 3; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[(i * 13 + j) * 3 + k] = 0;
                if({chess_board[i * 15 + j + 2], chess_board[(i + 1) * 15 + j + 1], chess_board[(i + 2) * 15 + j] } === three[k]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 13 + j) * 3 + k] = three_weight[k];
                    else
                        score[(i * 13 + j) * 3 + k] = score[(i * 13 + j) * 3 + k - 1] + three_weight[k];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 13 + j) * 3 + k] = 0;
                    else
                        score[(i * 13 + j) * 3 + k] = score[(i * 13 + j) * 3 + k - 1];
                end
                       
            end     
        end
    end
    for(int i = 0; i <= 12; i++) begin
        for(int j = 0; j <= 12; j++) begin
            for(int k=0; k < 3; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[((i+13) * 13 + j) * 3 + k] = 0;
                if({chess_board[i * 15 + j + 2], chess_board[(i + 1) * 15 + j + 1], chess_board[(i + 2) * 15 + j] } === three[k+3]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+13) * 13 + j) * 3 + k] = three_weight[k+3];
                    else
                        score[((i+13) * 13 + j) * 3 + k] = score[((i+13) * 13 + j) * 3 + k - 1] + three_weight[k+3];
                end
                else begin
                    if(i == 0 && j ==0 && k == 0)
                        score[((i+13) * 13 + j) * 3 + k] = 0;
                    else
                        score[((i+13) * 13 + j) * 3 + k] = score[((i+13) * 13 + j) * 3 + k - 1];
                end
                       
            end     
        end
    end
endtask



assign o_score     = score_r;

always_comb begin
    state_w                 = state_r;
    black_score_w           = black_score_r;
    white_score_w           = white_score_r;
	score_w				    = score_r;
    finished_w             = finished_r;

    
	case (state_r)
        S_SEVEN_UP: begin
            if(i_start) begin
                finished_w = 0;
                Compare_seven_up(.chess_board(i_board), .score(seven_score));
                black_score_w = black_score_r + seven_score[134];
                white_score_w = white_score_r + seven_score[269];
                $display("up_black: ", black_score_w);
                $display("up_white: ", white_score_w);
                state_w = S_SEVEN_LEFT;
            end 
        end 
        S_SEVEN_LEFT:  begin 
            Compare_seven_left(.chess_board(i_board), .score(seven_score));
            black_score_w = black_score_r + seven_score[134];
            white_score_w = white_score_r + seven_score[269];
            $display("left_black: ", black_score_w);
            $display("left_white: ", white_score_w);
            state_w = S_SEVEN_UL;  
        end
        S_SEVEN_UL:    begin  
            Compare_seven_upper_left(.chess_board(i_board), .score(seven_score));
            black_score_w = black_score_r + seven_score[80];
            white_score_w = white_score_r + seven_score[161];
            $display("upperleft_black: ", black_score_w);
            $display("upperleft_white: ", white_score_w);
            state_w = S_SEVEN_UR;
        end
        S_SEVEN_UR:    begin  
            Compare_seven_upper_right(.chess_board(i_board), .score(seven_score));
            black_score_w = black_score_r + seven_score[80];
            white_score_w = white_score_r + seven_score[161];
            $display("upperright_black: ", black_score_w);
            $display("upperright_white: ", white_score_w);
            state_w = S_SIX_UP;   
        end
        S_SIX_UP:      begin  
            Compare_six_up(.chess_board(i_board), .score(six_score));
            black_score_w = black_score_r + six_score[2999];
            white_score_w = white_score_r + six_score[5999];
            $display("up_black: ", black_score_w);
            $display("up_white: ", white_score_w);
            // for(int i=6000; i<6040; i++) begin
            //     $write(six_score[i], " ");
            // end
            state_w = S_SIX_LEFT; 
        end
        S_SIX_LEFT:    begin  
            Compare_six_left(.chess_board(i_board), .score(six_score));
            black_score_w = black_score_r + six_score[2999];
            white_score_w = white_score_r + six_score[5999];
            $display("left_black: ", black_score_w);
            $display("left_white: ", white_score_w);
            state_w = S_SIX_UL; 

        end
        S_SIX_UL:      begin  
            Compare_six_upper_left(.chess_board(i_board), .score(six_score));
            black_score_w = black_score_r + six_score[1999];
            white_score_w = white_score_r + six_score[3999];
            $display("upperleft_black: ", black_score_w);
            $display("upperleft_white: ", white_score_w);
            state_w = S_SIX_UR;    
        end
        S_SIX_UR:      begin 
            Compare_six_upper_right(.chess_board(i_board), .score(six_score));
            black_score_w = black_score_r + six_score[1999];
            white_score_w = white_score_r + six_score[3999];
            $display("upperright_black: ", black_score_w);
            $display("upperright_white: ", white_score_w);
            state_w = S_FIVE_UP;   
        end
        S_FIVE_UP:     begin 
            Compare_five_up(.chess_board(i_board), .score(five_score));
            black_score_w = black_score_r + five_score[1649];
            white_score_w = white_score_r + five_score[3299];
            $display("up_black: ", black_score_w);
            $display("up_white: ", white_score_w);
            state_w = S_FIVE_LEFT; 
        end
        S_FIVE_LEFT:   begin 
            Compare_five_left(.chess_board(i_board), .score(five_score));
            black_score_w = black_score_r + five_score[1649];
            white_score_w = white_score_r + five_score[3299];
            $display("left_black: ", black_score_w);
            $display("left_white: ", white_score_w);
            state_w = S_FIVE_UL; 
        end
        S_FIVE_UL:     begin 
            Compare_five_upper_left(.chess_board(i_board), .score(five_score)); 
            black_score_w = black_score_r + five_score[1209];
            white_score_w = white_score_r + five_score[2419];
            $display("upperleft_black: ", black_score_w);
            $display("upperleft_white: ", white_score_w);
            state_w = S_FIVE_UR;   
        end
        S_FIVE_UR:     begin  
            Compare_five_upper_right(.chess_board(i_board), .score(five_score));
            black_score_w = black_score_r + five_score[1209];
            white_score_w = white_score_r + five_score[2419];
            $display("upperright_black: ", black_score_w);
            $display("upperright_white: ", white_score_w);
            state_w = S_THREE_UP;  
        end
        S_THREE_UP:    begin 
            Compare_three_up(.chess_board(i_board), .score(three_score));
            black_score_w = black_score_r + three_score[584];
            white_score_w = white_score_r + three_score[1169];
            $display("up_black: ", black_score_w);
            $display("up_white: ", white_score_w);
            state_w = S_THREE_LEFT;
        end
        S_THREE_LEFT:  begin 
            Compare_three_left(.chess_board(i_board), .score(three_score));
            black_score_w = black_score_r + three_score[584];
            white_score_w = white_score_r + three_score[1169];
            $display("left_black: ", black_score_w);
            $display("left_white: ", white_score_w);
            state_w = S_THREE_UL;  
        end
        S_THREE_UL:    begin  
            Compare_three_upper_left(.chess_board(i_board), .score(three_score));
            black_score_w = black_score_r + three_score[506];
            white_score_w = white_score_r + three_score[1013];
            $display("upperleft_black: ", black_score_w);
            $display("upperleft_white: ", white_score_w);
            state_w = S_THREE_UR;  
        end
        S_THREE_UR:    begin  
            Compare_three_upper_right(.chess_board(i_board), .score(three_score));
            black_score_w = black_score_r + three_score[506];
            white_score_w = white_score_r + three_score[1013];
            $display("upperright_black: ", black_score_w);
            $display("upperright_white: ", white_score_w);
            state_w = S_EVALUATE;   
        end
        S_EVALUATE: begin
            if(i_turn == 0) begin
                state_w = S_SEVEN_UP;
                finished_w  = 1;
                score_w = black_score_r - white_score_r;
                $display("total: ",score_w);
            end
            else begin
                state_w = S_SEVEN_UP;
                finished_w  = 1;
                score_w = white_score_r - black_score_r;
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
