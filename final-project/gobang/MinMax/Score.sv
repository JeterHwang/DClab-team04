typedef logic [1:0] chess_board [224:0];
module Score (
	input         i_clk,
	input         i_rst_n,
	input         i_start,
	input         board i_board,         // 15*15*2 bit chess board
    input         i_turn,          
	output signed [31:0] o_score,                      // 32 bit score
    output        o_finish
);

parameter S_BLACK 		= 4'd5;
parameter S_WHITE       = 4'd6;
parameter S_EVALUATE    = 4'd7;


parameter FIVE              = 32'd1000000;
parameter FOUR              = 32'd100000;
parameter THREE             = 32'd1000;
parameter TWO               = 32'd100;
parameter ONE               = 32'd10;
parameter BLOCKED_FOUR      = 32'd10000;
parameter BLOCKED_THREE     = 32'd100;
parameter BLOCKED_TWO       = 32'd10;

parameter b         = 2'd0;
parameter w         = 2'd1;
parameter l         = 2'd2;

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
parameter  black_blocked_double_three [0:6] = {w, l, b, b ,b, l, w};
parameter  black_blocked_con_two_o  = {l, l, l, b, b, w };
parameter  black_blocked_con_two_r  = {w, b, b, l, l, l };
parameter  black_blocked_blank_one_two_o = {l, l, b, l, b, w};
parameter  black_blocked_blank_one_two_r = {w, b, l, b, l, l};
parameter  black_blocked_blank_two_two_o = {l, b, l, l, b, w};
parameter  black_blocked_blank_two_two_r = {w, b, l, l, b, l};
parameter  black_blocked_blank_three_two = {b, l, l, l, b};
parameter  black_blocked_one_o = {w, b, l};
parameter  black_blocked_one_r = {l, b, w}
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

parameter logic [6:0] seven [0:1] = '{black_blocked_double_three, white_blocked_double_three};
parameter logic [5:0] six [0:37] = '{black_con_four, black_jump_one_three_o, black_blocked_jump_one_three_r, black_con_two, black_blank_two_two, black_blocked_con_four_o, black_blocked_con_four_r, black_blocked_con_three_o, black_blocked_con_three_r, black_blocked_jump_one_three_o, black_blocked_jump_one_three_r
                                      black_blocked_jump_two_three_o, black_blocked_jump_two_three_r, black_blocked_con_two_o, black_blocked_con_two_r, black_blocked_blank_one_two_o, black_blocked_blank_one_two_r, black_blocked_blank_two_two_o, black_blocked_blank_two_two_r, white_con_four, white_jump_one_three_o, white_jump_one_three_r,
                                      white_con_two, white_blank_two_two, white_blocked_con_four_o, white_blocked_con_four_r, white_blocked_con_three_o, white_blocked_con_three_r, white_blocked_jump_one_three_o, white_blocked_jump_one_three_r, white_blocked_jump_two_three_o, white_blocked_jump_two_three_r, white_blocked_con_two_o, white_blocked_con_two_r, 
                                      white_blocked_blank_one_two_o, white_blocked_blank_one_two_r, white_blocked_blank_two_two_o, white_blocked_blank_two_two_r};
parameter logic [4:0] five [0:19] = '{black_con_five, black_con_three, black_blank_one_two, black_blocked_jump_one_four_o, black_blocked_jump_one_four_r, black_blocked_jump_two_four, black_blocked_blank_one_three_o, black_blocked_blank_one_three_r, black_blocked_blank_two_three, black_blocked_blank_three_two, white_con_five, white_con_three, white_blank_one_two,
                                       white_blocked_jump_one_four_o, white_blocked_jump_one_four_r, white_blocked_jump_two_four, white_blocked_blank_one_three_o, white_blocked_blank_one_three_r, white_blocked_blank_two_three, white_blocked_blank_three_two};
parameter logic [2:0] three [0:5] =  '{black_con_one, black_blocked_one_o, black_blocked_one_r, white_con_one, white_blocked_one_o, white_blocked_one_r};                                               

parameter logic [31:0] seven_weight [0:1] = '{BLOCKED_THREE, BLOCKED_THREE};
parameter logic [31:0] six_weight [0:37] = '{FOUR, THREE, BLOCKED_THREE, TWO, TWO, BLOCKED_FOUR, BLOCKED_FOUR, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_THREE
                                            BLOCKED_THREE, BLOCKED_THREE, BLOCKED_TWO, BLOCKED_TWO, BLOCKED_TWO, BLOCKED_TWO, BLOCKED_TWO, BLOCKED_TWO, FOUR, THREE, THREE,
                                            TWO, TWO, BLOCKED_FOUR, BLOCKED_FOUR, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_TWO, BLOCKED_TWO,
                                            BLOCKED_TWO, BLOCKED_TWO, BLOCKED_TWO, BLOCKED_TWO};

parameter logic [31:0] five_weight [0:19] = '{FIVE, THREE, TWO, BLOCKED_FOUR, BLOCKED_FOUR, BLOCKED_FOUR, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_TWO, FIVE, THREE, TWO,
                                            BLOCKED_FOUR, BLOCKED_FOUR, BLOCKED_FOUR, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_THREE, BLOCKED_TWO};
parameter logic [31:0] three_weight [0:5]  = '{ONE, ONE, ONE, ONE, ONE, ONE};

logic signed [31:0] seven_score [449:0];
logic signed [31:0] six_score   [8549:0];
logic signed [31:0] five_score [4499:0];
logic signed [31:0] three_score [1349:0];


logic [3:0]  state_r, state_w;
logic signed [31:0] white_score_r, white_score_w;
logic signed [31:0] black_score_r, black_score_w;
logic signed [31:0] score_r, score_w;
logic finished_r, finished_w;                      

assign o_finish = finished_r;

task Compare_five_up;
    output signed [31:0] score [8549:0];
    input [1:0] chess_board [0:224];
    
    for(int i = 0; i <= 10; i++) begin
        for(int j = 0; j < 15; j++) begin
            for(int k=0; k < 20; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[(i * 15 + j) * 20 + k] = 0;
                if({chess_board[j+i*15], chess_board[j+(i+1)*15], chess_board[j+(i+2)*15], chess_board[j+(i+3)*15], chess_board[j+(i+4)*15] } === five_score[k]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 15 + j) * 20 + k] = five_weight[k];
                    else
                        score[(i * 15 + j) * 20 + k] = score[(i * 15 + j) * 20 + k - 1] + five_weight[k];
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
endtask
task Compare_five_left;
    output signed [31:0] score [8549:0];
    input [1:0] chess_board [0:224];
    
    for(int i = 0; i < 15; i++) begin
        for(int j = 0; j <= 10; j++) begin
            for(int k=0; k < 20; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[(i * 15 + j) * 20 + k] = 0;
                if({chess_board[i * 15 + j], chess_board[i * 15 + j + 1], chess_board[i * 15 + j + 2], chess_board[i * 15 + j + 3], chess_board[i * 15 + j + 4] } === five_score[k]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 15 + j) * 20 + k] = five_weight[k];
                    else
                        score[(i * 15 + j) * 20 + k] = score[(i * 15 + j) * 20 + k - 1] + five_weight[k];
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
endtask
task Compare_five_upper_left;
    output signed [31:0] score [8549:0];
    input [1:0] chess_board [0:224];
    
    for(int i = 0; i <= 10; i++) begin
        for(int j = 0; j <= 10 ; j++) begin
            for(int k=0; k < 20; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[(i * 15 + j) * 20 + k] = 0;
                if({chess_board[i * 15 + j], chess_board[(i + 1) * 15 + j + 1], chess_board[(i+2)*15 j+2], chess_board[(i + 3) * 15 + j + 3], chess_board[(i + 4) * 15 + j + 4] } === five_score[k]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 15 + j) * 20 + k] = five_weight[k];
                    else
                        score[(i * 15 + j) * 20 + k] = score[(i * 15 + j) * 20 + k - 1] + five_weight[k];
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
endtask
task Compare_five_upper_right;
    output signed [31:0] score [8549:0];
    input [1:0] chess_board [0:224];
    
    for(int i = 4; i <= 14; i++) begin
        for(int j = 0; j <= 10; j++) begin
            for(int k=0; k < 20; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[(i * 15 + j) * 20 + k] = 0;
                if({chess_board[i * 15 + j], chess_board[(i + 1) * 15 + j - 1], chess_board[(i + 2) * 15 + j - 2], chess_board[(i + 3) * 15 + j + 3], chess_board[(i + 4) * 15 + j - 4] } === five_score[k]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 15 + j) * 20 + k] = five_weight[k];
                    else
                        score[(i * 15 + j) * 20 + k] = score[(i * 15 + j) * 20 + k - 1] + five_weight[k];
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
endtask

task Compare_seven_up;
    output signed [31:0] score [8549:0];
    input [1:0] chess_board [0:224];
    
    for(int i = 0; i <= 10; i++) begin
        for(int j = 0; j < 15; j++) begin
            for(int k=0; k < 20; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[(i * 15 + j) * 20 + k] = 0;
                if({chess_board[j+i*15], chess_board[j+(i+1)*15], chess_board[j+(i+2)*15], chess_board[j+(i+3)*15], chess_board[j+(i+4)*15] } === five_score[k]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 15 + j) * 20 + k] = five_weight[k];
                    else
                        score[(i * 15 + j) * 20 + k] = score[(i * 15 + j) * 20 + k - 1] + five_weight[k];
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
endtask
task Compare_seven_left;
    output signed [31:0] score [8549:0];
    input [1:0] chess_board [0:224];
    
    for(int i = 0; i < 15; i++) begin
        for(int j = 0; j <= 10; j++) begin
            for(int k=0; k < 20; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[(i * 15 + j) * 20 + k] = 0;
                if({chess_board[i * 15 + j], chess_board[i * 15 + j + 1], chess_board[i * 15 + j + 2], chess_board[i * 15 + j + 3], chess_board[i * 15 + j + 4] } === five_score[k]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 15 + j) * 20 + k] = five_weight[k];
                    else
                        score[(i * 15 + j) * 20 + k] = score[(i * 15 + j) * 20 + k - 1] + five_weight[k];
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
endtask
task Compare_seven_upper_left;
    output signed [31:0] score [8549:0];
    input [1:0] chess_board [0:224];
    
    for(int i = 0; i <= 10; i++) begin
        for(int j = 0; j <= 10 ; j++) begin
            for(int k=0; k < 20; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[(i * 15 + j) * 20 + k] = 0;
                if({chess_board[i * 15 + j], chess_board[(i + 1) * 15 + j + 1], chess_board[(i+2)*15 j+2], chess_board[(i + 3) * 15 + j + 3], chess_board[(i + 4) * 15 + j + 4] } === five_score[k]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 15 + j) * 20 + k] = five_weight[k];
                    else
                        score[(i * 15 + j) * 20 + k] = score[(i * 15 + j) * 20 + k - 1] + five_weight[k];
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
endtask
task Compare_seven_upper_right;
    output signed [31:0] score [8549:0];
    input [1:0] chess_board [0:224];
    
    for(int i = 4; i <= 14; i++) begin
        for(int j = 0; j <= 10; j++) begin
            for(int k=0; k < 20; k++) begin
                if(i == 0 && j == 0 && k == 0)
                    score[(i * 15 + j) * 20 + k] = 0;
                if({chess_board[i * 15 + j], chess_board[(i + 1) * 15 + j - 1], chess_board[(i + 2) * 15 + j - 2], chess_board[(i + 3) * 15 + j + 3], chess_board[(i + 4) * 15 + j - 4] } === five_score[k]) begin
                    if(i == 0 && j ==0 && k == 0)
                        score[(i * 15 + j) * 20 + k] = five_weight[k];
                    else
                        score[(i * 15 + j) * 20 + k] = score[(i * 15 + j) * 20 + k - 1] + five_weight[k];
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
endtask
task Count;

    // input [23:0] pattern_store,
    input [224:0] pattern_board;
    input signed [31:0] score;
    begin
    for (int i=0; i<=224; i++) begin
        if (pattern_board[i] == 1) begin
            score += 1;
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
    counter_w                = counter_r;
    finished_w             = finished_r;

    n1_five_w                = n1_five_r;
    n1_four_w                = n1_four_r;
    n1_con_three_w           = n1_con_three_r;
    n1_jump_one_three_w      = n1_jump_one_three_r;
    n1_con_two_w             = n1_con_two_r;
    n1_blank_one_two_w       = n1_blank_one_two_r;
    n1_blank_two_two_w       = n1_blank_two_two_r;
    n1_con_one_w             = n1_con_one_r;

    b1_con_four_w            = b1_con_four_r;
    b1_jump_one_four_w       = b1_jump_one_four_r;
    b1_jump_two_four_w       = b1_jump_two_four_r;
    b1_con_three_w           = b1_con_three_r;      
    b1_jump_one_three_w      = b1_jump_one_three_r; 
    b1_jump_two_three_w      = b1_jump_two_three_r;
    b1_blank_one_three_w     = b1_blank_one_three_r;
    b1_blank_two_three_w     = b1_blank_two_three_r;
    b1_double_three_w        = b1_double_three_r;  
    b1_con_two_w             = b1_con_two_r;          
    b1_blank_one_two_w       = b1_blank_one_two_r; 
    b1_blank_two_two_w       = b1_blank_two_two_r;    
    b1_blank_three_two_w     = b1_blank_three_two_r;
    b1_con_one_w             = b1_con_one_r;

    n2_five_w                = n2_five_r;
    n2_four_w                = n2_four_r;
    n2_con_three_w           = n2_con_three_r;
    n2_jump_one_three_w      = n2_jump_one_three_r;
    n2_con_two_w             = n2_con_two_r;
    n2_blank_one_two_w       = n2_blank_one_two_r;
    n2_blank_two_two_w       = n2_blank_two_two_r;
    n2_con_one_w             = n2_con_one_r;

    b2_con_four_w            = b2_con_four_r;
    b2_jump_one_four_w       = b2_jump_one_four_r;
    b2_jump_two_four_w       = b2_jump_two_four_r;
    b2_con_three_w           = b2_con_three_r;      
    b2_jump_one_three_w      = b2_jump_one_three_r; 
    b2_jump_two_three_w      = b2_jump_two_three_r;
    b2_blank_one_three_w     = b2_blank_one_three_r;
    b2_blank_two_three_w     = b2_blank_two_three_r;
    b2_double_three_w        = b2_double_three_r;  
    b2_con_two_w             = b2_con_two_r;          
    b2_blank_one_two_w       = b2_blank_one_two_r; 
    b2_blank_two_two_w       = b2_blank_two_two_r;    
    b2_blank_three_two_w     = b2_blank_three_two_r;
    b2_con_one_w             = b2_con_one_r;

    
	case (state_r)
        S_BLACK: begin
            if(i_start) begin
            finished_w = 0;

            Compare_five(n1_five_w, black_con_five, i_board, counter_w);
            Compare_six(n1_four_w, black_con_four, i_board, counter_w);
            Compare_six(b1_con_four_w, black_blocked_con_four_o, i_board, counter_w);
            Compare_six(b1_con_four_w, black_blocked_con_four_r, i_board, counter_w);
            Compare_five(b1_jump_one_four_w, black_blocked_jump_one_four_o, i_board, counter_w);
            Compare_five(b1_jump_one_four_w, black_blocked_jump_one_four_r, i_board, counter_w);
            Compare_five(b1_jump_two_four_w, black_blocked_jump_two_four, i_board, counter_w);
            Compare_five(n1_con_three_w, black_con_three, i_board, counter_w);
            Compare_six(n1_jump_one_three_w, black_jump_one_three_o, i_board, counter_w);
            Compare_six(n1_jump_one_three_w, black_jump_one_three_r, i_board, counter_w);
            Compare_six(b1_con_three_w, black_blocked_con_three_o, i_board, counter_w);
            Compare_six(b1_con_three_w, black_blocked_con_three_r, i_board, counter_w);
            Compare_six(b1_jump_one_three_w, black_blocked_jump_one_three_o, i_board, counter_w);
            Compare_six(b1_jump_one_three_w, black_blocked_jump_one_three_r, i_board, counter_w);
            Compare_six(b1_jump_two_three_w, black_blocked_jump_two_three_o, i_board, counter_w);
            Compare_six(b1_jump_two_three_w, black_blocked_jump_two_three_r, i_board, counter_w);
            Compare_five(b1_blank_one_three_w, black_blocked_blank_one_three_o, i_board, counter_w);
            Compare_five(b1_blank_one_three_w, black_blocked_blank_one_three_o, i_board, counter_w);
            Compare_five(b1_blank_two_three_w, black_blocked_blank_two_three, i_board, counter_w);
            Compare_seven(b1_double_three_w, black_blocked_double_three, i_board, counter_w);
            Compare_six(n1_con_two_w, black_con_two, i_board, counter_w);
            Compare_five(n1_blank_one_two_w, black_blank_one_two, i_board, counter_w);
            Compare_six(n1_blank_two_two_w, black_blank_two_two, i_board, counter_w);
            Compare_six(b1_con_two_w, black_blocked_con_two_o, i_board, counter_w);
            Compare_six(b1_con_two_w, black_blocked_con_two_r, i_board, counter_w);
            Compare_six(b1_blank_one_two_w, black_blocked_blank_one_two_o, i_board, counter_w);
            Compare_six(b1_blank_one_two_w, black_blocked_blank_one_two_r, i_board, counter_w);
            Compare_six(b1_blank_two_two_w, black_blocked_blank_two_two_o, i_board, counter_w);
            Compare_six(b1_blank_two_two_w, black_blocked_blank_two_two_r, i_board, counter_w);
            Compare_five(b1_blank_three_two_w, black_blocked_blank_three_two, i_board, counter_w);
            Compare_three(n1_con_one_w, black_con_one, i_board, counter_w);
            Compare_three(b1_con_one_w, black_blocked_one_o, i_board, counter_w);
            Compare_three(b1_con_one_w, black_blocked_one_r, i_board, counter_w);
            state_w = S_WHITE;
            end
        end
        S_WHITE: begin

            Compare_five(n2_five_w, white_con_five, i_board, counter_w);
            Compare_six(n2_four_w, white_con_four, i_board, counter_w);
            Compare_six(b2_con_four_w, white_blocked_con_four_o, i_board, counter_w);
            Compare_six(b2_con_four_w, white_blocked_con_four_r, i_board, counter_w);
            Compare_five(b2_jump_one_four_w, white_blocked_jump_one_four_o, i_board, counter_w);
            Compare_five(b2_jump_one_four_w, white_blocked_jump_one_four_r, i_board, counter_w);
            Compare_five(b2_jump_two_four_w, white_blocked_jump_two_four, i_board, counter_w);
            Compare_five(n2_con_three_w, white_con_three, i_board, counter_w);
            Compare_six(n2_jump_one_three_w, white_jump_one_three_o, i_board, counter_w);
            Compare_six(n2_jump_one_three_w, white_jump_one_three_r, i_board, counter_w);
            Compare_six(b2_con_three_w, white_blocked_con_three_o, i_board, counter_w);
            Compare_six(b2_con_three_w, white_blocked_con_three_r, i_board, counter_w);
            Compare_six(b2_jump_one_three_w, white_blocked_jump_one_three_o, i_board, counter_w);
            Compare_six(b2_jump_one_three_w, white_blocked_jump_one_three_r, i_board, counter_w);
            Compare_six(b2_jump_two_three_w, white_blocked_jump_two_three_o, i_board, counter_w);
            Compare_six(b2_jump_two_three_w, white_blocked_jump_two_three_r, i_board, counter_w);
            Compare_five(b2_blank_one_three_w, white_blocked_blank_one_three_o, i_board, counter_w);
            Compare_five(b2_blank_one_three_w, white_blocked_blank_one_three_o, i_board, counter_w);
            Compare_five(b2_blank_two_three_w, white_blocked_blank_two_three, i_board, counter_w);
            Compare_seven(b2_double_three_w, white_blocked_double_three, i_board, counter_w);
            Compare_six(n2_con_two_w, white_con_two, i_board, counter_w);
            Compare_five(n2_blank_one_two_w, white_blank_one_two, i_board, counter_w);
            Compare_six(n2_blank_two_two_w, white_blank_two_two, i_board, counter_w);
            Compare_six(b2_con_two_w, white_blocked_con_two_o, i_board, counter_w);
            Compare_six(b2_con_two_w, white_blocked_con_two_r, i_board, counter_w);
            Compare_six(b2_blank_one_two_w, white_blocked_blank_one_two_o, i_board, counter_w);
            Compare_six(b2_blank_one_two_w, white_blocked_blank_one_two_r, i_board, counter_w);
            Compare_six(b2_blank_two_two_w, white_blocked_blank_two_two_o, i_board, counter_w);
            Compare_six(b2_blank_two_two_w, white_blocked_blank_two_two_r, i_board, counter_w);
            Compare_five(b2_blank_three_two_w, white_blocked_blank_three_two, i_board, counter_w);
            Compare_three(n2_con_one_w, white_con_one, i_board, counter_w);
            Compare_three(b2_con_one_w, white_blocked_one_o, i_board, counter_w);
            Compare_three(b2_con_one_w, white_blocked_one_r, i_board, counter_w);

        end
        S_EVALUATE: begin
            Count(black_score_w, n1_five_w);
            Count(black_score_w, n1_four_w);
            Count(black_score_w, n1_con_three_w);
            Count(black_score_w, n1_jump_one_three_w);
            Count(black_score_w, n1_con_two_w);
            Count(black_score_w, n1_blank_one_two_w);
            Count(black_score_w, n1_blank_two_two_w);
            Count(black_score_w, n1_con_one_w);

            Count(black_score_w, b1_con_four_w);
            Count(black_score_w, b1_jump_one_four_w);
            Count(black_score_w, b1_jump_two_four_w);
            Count(black_score_w, b1_con_three_w);
            Count(black_score_w, b1_jump_one_three_w);
            Count(black_score_w, b1_jump_two_three_w);
            Count(black_score_w, b1_blank_one_three_w);
            Count(black_score_w, b1_blank_two_three_w);
            Count(black_score_w, b1_double_three_w);
            Count(black_score_w, b1_con_two_w);
            Count(black_score_w, b1_blank_one_two_w);
            Count(black_score_w, b1_blank_two_two_w);
            Count(black_score_w, b1_blank_three_two_w);
            Count(black_score_w, b1_con_one_w);

            Count(white_score_w, n2_five_w);
            Count(white_score_w, n2_four_w);
            Count(white_score_w, n2_con_three_w);
            Count(white_score_w, n2_jump_one_three_w);
            Count(white_score_w, n2_con_two_w);
            Count(white_score_w, n2_blank_one_two_w);
            Count(white_score_w, n2_blank_two_two_w);
            Count(white_score_w, n2_con_one_w);

            Count(white_score_w, b2_con_four_w);
            Count(white_score_w, b2_jump_one_four_w);
            Count(white_score_w, b2_jump_two_four_w);
            Count(white_score_w, b2_con_three_w);
            Count(white_score_w, b2_jump_one_three_w);
            Count(white_score_w, b2_jump_two_three_w);
            Count(white_score_w, b2_blank_one_three_w);
            Count(white_score_w, b2_blank_two_three_w);
            Count(white_score_w, b2_double_three_w);
            Count(white_score_w, b2_con_two_w);
            Count(white_score_w, b2_blank_one_two_w);
            Count(white_score_w, b2_blank_two_two_w);
            Count(white_score_w, b2_blank_three_two_w);
            Count(white_score_w, b2_con_one_w);
            score_w = black_score_w - white_score_w;
            state_w = S_BLACK;
            finished_w  = 1;

        end
    endcase
end

always_ff @(negedge i_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        state_r                 <= S_BLACK;
        black_score_r           <= 0;
        white_score_r           <= 0;
		score_r				    <= 0;
        counter_r               <= 0;
        finished_r              <= 0;

        n1_five_r               <= 0;
        n1_four_r               <= 0;
        n1_con_three_r          <= 0;
        n1_jump_one_three_r     <= 0;
        n1_con_two_r            <= 0;
        n1_blank_one_two_r      <= 0;
        n1_blank_two_two_r      <= 0;
        n1_con_one_r            <= 0;

        b1_con_four_r           <= 0;
        b1_jump_one_four_r      <= 0;
        b1_jump_two_four_r      <= 0;
        b1_con_three_r          <= 0;      
        b1_jump_one_three_r     <= 0; 
        b1_jump_two_three_r     <= 0;
        b1_blank_one_three_r    <= 0;
        b1_blank_two_three_r    <= 0;
        b1_double_three_r       <= 0;  
        b1_con_two_r            <= 0;          
        b1_blank_one_two_r      <= 0;
        b1_blank_two_two_r      <= 0;    
        b1_blank_three_two_r    <= 0;
        b1_con_one_r            <= 0;

        n2_five_r               <= 0;
        n2_four_r               <= 0;
        n2_con_three_r          <= 0;
        n2_jump_one_three_r     <= 0;
        n2_con_two_r            <= 0;
        n2_blank_one_two_r      <= 0;
        n2_blank_two_two_r      <= 0;
        n2_con_one_r            <= 0;

        b2_con_four_r           <= 0;
        b2_jump_one_four_r      <= 0;
        b2_jump_two_four_r      <= 0;
        b2_con_three_r          <= 0;      
        b2_jump_one_three_r     <= 0; 
        b2_jump_two_three_r     <= 0;
        b2_blank_one_three_r    <= 0;
        b2_blank_two_three_r    <= 0;
        b2_double_three_r       <= 0;  
        b2_con_two_r            <= 0;          
        b2_blank_one_two_r      <= 0; 
        b2_blank_two_two_r      <= 0;    
        b2_blank_three_two_r    <= 0;
        b2_con_one_r            <= 0;
    end
    else begin
        state_r                 <= state_w;
		score_r				    <= score_w;
        counter_r               <= counter_w;
        black_score_r           <= black_score_w;
        white_score_r           <= white_score_w;
        finished_r              <= finished_w;

        n1_five_r               <= n1_five_w;
        n1_four_r               <= n1_four_w;
        n1_con_three_r          <= n1_con_three_w;
        n1_jump_one_three_r     <= n1_jump_one_three_w;
        n1_con_two_r            <= n1_con_two_w;
        n1_blank_one_two_r      <= n1_blank_one_two_w;
        n1_blank_two_two_r      <= n1_blank_two_two_w;
        n1_con_one_r            <= n1_con_one_w;

        b1_con_four_r           <= b1_con_four_w;
        b1_jump_one_four_r      <= b1_jump_one_four_w;
        b1_jump_two_four_r      <= b1_jump_two_four_w;
        b1_con_three_r          <= b1_con_three_w;      
        b1_jump_one_three_r     <= b1_jump_one_three_w; 
        b1_jump_two_three_r     <= b1_jump_two_three_w;
        b1_blank_one_three_r    <= b1_blank_one_three_w;
        b1_blank_two_three_r    <= b1_blank_two_three_w;
        b1_double_three_r       <= b1_double_three_w;  
        b1_con_two_r            <= b1_con_two_w;          
        b1_blank_one_two_r      <= b1_blank_one_two_w; 
        b1_blank_two_two_r      <= b1_blank_two_two_w;    
        b1_blank_three_two_r    <= b1_blank_three_two_w;
        b1_con_one_r            <= b1_con_one_w;

        n2_five_r               <= n2_five_w;
        n2_four_r               <= n2_four_w;
        n2_con_three_r          <= n2_con_three_w;
        n2_jump_one_three_r     <= n2_jump_one_three_w;
        n2_con_two_r            <= n2_con_two_w;
        n2_blank_one_two_r      <= n2_blank_one_two_w;
        n2_blank_two_two_r      <= n2_blank_two_two_w;
        n2_con_one_r            <= n2_con_one_w;

        b2_con_four_r           <= b2_con_four_w;
        b2_jump_one_four_r      <= b2_jump_one_four_w;
        b2_jump_two_four_r      <= b2_jump_two_four_w;
        b2_con_three_r          <= b2_con_three_w;      
        b2_jump_one_three_r     <= b2_jump_one_three_w; 
        b2_jump_two_three_r     <= b2_jump_two_three_w;
        b2_blank_one_three_r    <= b2_blank_one_three_w;
        b2_blank_two_three_r    <= b2_blank_two_three_w;
        b2_double_three_r       <= b2_double_three_w;  
        b2_con_two_r            <= b2_con_two_w;          
        b2_blank_one_two_r      <= b2_blank_one_two_w; 
        b2_blank_two_two_r      <= b2_blank_two_two_w;    
        b2_blank_three_two_r    <= b2_blank_three_two_w;
        b2_con_one_r            <= b2_con_one_w;

    end

end

endmodule
