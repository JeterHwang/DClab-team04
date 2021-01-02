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
parameter S_IDLE    = 1'b0;
parameter S_COUNT   = 1'b1;

parameter FIVE              = 32'd1000000;
parameter FOUR              = 32'd100000;
parameter THREE             = 32'd1000;
parameter TWO               = 32'd100;
parameter ONE               = 32'd10;
parameter BLOCKED_FOUR      = 32'd70000;
parameter BLOCKED_THREE     = 32'd100;
parameter BLOCKED_TWO       = 32'd10;

parameter b         = 2'b0;
parameter w         = 2'b1;
parameter l         = 2'b10;
parameter x         = 2'b11;

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

// wires 
logic signed [31:0] seven_score [2];
logic signed [31:0] six_score   [38];
logic signed [31:0] five_score  [20];
logic signed [31:0] three_score [6];

logic signed [31:0] seven_tmp[121]; // 15 * 2 * 4
logic signed [31:0] six_tmp[2281]; // 15 * 38 * 4
logic signed [31:0] five_tmp[1201]; // 15 * 20 * 4
logic signed [31:0] three_tmp[361]; // 15 * 6 * 4

logic state_r, state_w;
logic signed [31:0] white_score_r, white_score_w;
logic signed [31:0] black_score_r, black_score_w;
logic signed [31:0] score_r, score_w;
logic finished_r, finished_w;      
logic [4:0] cnt_r, cnt_w;                

assign o_finish = finished_r;

task Compare_seven;
    input [5:0] index;
    input [4:0] i;
    output signed [31:0] score;
    
    for(int j = 0; j < 15; j++) begin
        // seven up
        if({i_board[(j + 5) + (i + 5) * 25], i_board[(j + 5) + (i + 5 + 1) * 25], i_board[(j + 5) + (i + 5 + 2) * 25], i_board[(j + 5) + (i + 5 + 3) * 25], i_board[(j + 5) + (i + 5 + 4) * 25], i_board[(j + 5) + (i + 5 + 5) * 25], i_board[(j + 5) + (i + 5 + 6) * 25] } == seven[index]) begin
            if(j == 0 && index == 0)
                seven_tmp[(index * 15 + j) * 60 + 0] = seven_weight[index];
            else
                seven_tmp[(index * 15 + j) * 60 + 0] = seven_tmp[((index * 15 + j) * 60) + 0 - 1] + seven_weight[index];    
        end
        else begin
            if(j == 0 && index == 0)
                seven_tmp[(index * 15 + j) * 60 + 0] = 32'd0;
            else
                seven_tmp[(index * 15 + j) * 60 + 0] = seven_tmp[((index * 15 + j) * 60) + 0 - 1];
        end
        // seven left
        if({chess_board[(i + 5) * 25 + (j + 5)], chess_board[(i + 5) * 25 + j + 5 + 1], chess_board[(i + 5) * 25 + j + 5 + 2], chess_board[(i + 5) * 25 + j + 5 + 3], chess_board[(i + 5) * 25 + j + 5 + 4], chess_board[(i + 5) * 25 + j + 5 + 5], chess_board[(i + 5) * 25 + j + 5 + 6] } === seven[index]) begin
            seven_tmp[(index * 15 + j) * 60 + 1] = seven_tmp[((index * 15 + j) * 60) + 1 - 1] + seven_weight[index];               
        end
        else begin
            seven_tmp[(index * 15 + j) * 60 + 1] = seven_tmp[((index * 15 + j) * 60) + 1 - 1];               
        end
        // seven upper left 
        if({chess_board[(i + 5) * 25 + j + 5], chess_board[(i + 5 + 1) * 25 + j + 5 + 1], chess_board[(i + 5 + 2) * 25 + j + 5 + 2], chess_board[(i + 5 + 3) * 25 + j + 5 + 3], chess_board[(i + 5 + 4) * 25 + j + 5 + 4], chess_board[(i + 5 + 5) * 25 + j + 5 + 5], chess_board[(i + 5 + 6) * 25 + j + 5 + 6] } === seven[index]) begin
            seven_tmp[(index * 15 + j) * 60 + 2] = seven_tmp[((index * 15 + j) * 60) + 2 - 1] + seven_weight[index];   
        end
        else begin
            seven_tmp[(index * 15 + j) * 60 + 2] = seven_tmp[((index * 15 + j) * 60) + 2 - 1];   
        end
        // seven upper right
        if({chess_board[(i + 5) * 25 + j + 5 + 6], chess_board[(i + 5 + 1) * 25 + j + 5 + 5], chess_board[(i + 2 + 5) * 25 + j + 5 + 4], chess_board[(i + 5 + 3) * 25 + j + 5 + 3], chess_board[(i + 5 + 4) * 25 + j + 5 + 2], chess_board[(i + 5 + 5) * 25 + j + 5 + 1], chess_board[(i + 5 + 6) * 25 + j + 5]} === seven[index]) begin
            seven_tmp[(index * 15 + j) * 60 + 3] = seven_tmp[((index * 15 + j) * 60) + 3 - 1] + seven_weight[index];
        end
        else begin
            seven_tmp[(index * 15 + j) * 60 + 3] = seven_tmp[((index * 15 + j) * 60) + 3 - 1];
        end       
    end
    score = seven_tmp[(index * 15 + 14) * 60 + 3];
endtask

task Compare_six;
    input [5:0] index;
    input [4:0] i;
    output signed [31:0] score;
    
    for(int j = 0; j < 15; i++) begin
        // six up
        if({chess_board[j+i*15], chess_board[j+(i+1)*15], chess_board[j+(i+2)*15], chess_board[j+(i+3)*15], chess_board[j+(i+4)*15], chess_board[j+(i+5)*15]} === six[0])

        // six left
        if({chess_board[i * 15 + j], chess_board[i * 15 + j + 1], chess_board[i * 15 + j + 2], chess_board[i * 15 + j + 3], chess_board[i * 15 + j + 4], chess_board[i * 15 + j + 5]} === six[0])
        
        // six upper left
        if({chess_board[i * 15 + j], chess_board[(i + 1) * 15 + j + 1], chess_board[(i+2)*15 +  j+2], chess_board[(i + 3) * 15 + j + 3], chess_board[(i + 4) * 15 + j + 4], chess_board[(i + 5) * 15 + j + 5]} === six[0])
            
        // six upper right
        if({chess_board[(i * 15) + j + 5], chess_board[(i + 1) * 15 + j + 4], chess_board[(i + 2) * 15 + j + 3], chess_board[(i + 3) * 15 + j + 2], chess_board[(i + 4) * 15 + j + 1], chess_board[(i + 5) * 15 + j]} === six[0])
        
    end
endtask
task Compare_five_up;
    output signed [31:0] score [15];
    
    for(int i = 0; i < 15; i++) begin
        for(int k = 0; k < 20; k++) begin
            // five up
            if(i + 5 < 15) begin
                if({chess_board[j+i*15], chess_board[j+(i+1)*15], chess_board[j+(i+2)*15], chess_board[j+(i+3)*15], chess_board[j+(i+4)*15] } === five[k])

                
            end
            // five left
            if(j + 5 < 15) begin
                if({chess_board[i * 15 + j], chess_board[i * 15 + j + 1], chess_board[i * 15 + j + 2], chess_board[i * 15 + j + 3], chess_board[i * 15 + j + 4] } === five[k])
            end
            // five upper left
            if(i + 5 < 15 && j + 5 < 15) begin
                if({chess_board[i * 15 + j], chess_board[(i + 1) * 15 + j + 1], chess_board[(i+2)*15 + j+2], chess_board[(i + 3) * 15 + j + 3], chess_board[(i + 4) * 15 + j + 4] } == five[k])
            end
            // five upper right
            if(i + 5 < 15 && j + 5 < 15) begin
                if({chess_board[i * 15 +  j + 4], chess_board[(i + 1) * 15 + j + 3 ], chess_board[(i + 2) * 15 + j + 2], chess_board[(i + 3) * 15 + j + 1], chess_board[(i + 4) * 15 + j] } === five[k])
            end    
        end
    end                       
endtask
task Compare_three;
    output signed [31:0] score [15];
    
    for(int i = 0; i < 15; i++) begin
        for(int k = 0; k < 6; k++) begin
            // five up
            if(i + 5 < 15) begin
                if({chess_board[j+i*15], chess_board[j+(i+1)*15], chess_board[j+(i+2)*15] } === three[k])

                
            end
            // five left
            if(j + 5 < 15) begin
                if({chess_board[i * 12 + j], chess_board[i * 15 + j + 1], chess_board[i * 15 + j + 2] } === three[k])
            end
            // five upper left
            if(i + 5 < 15 && j + 5 < 15) begin
                if({chess_board[i * 15 + j], chess_board[(i + 1) * 15 + j + 1], chess_board[(i+2)*15 + j+2] } === three[k])
            end
            // five upper right
            if(i + 5 < 15 && j + 5 < 15) begin
                if({chess_board[i * 15 + j + 2], chess_board[(i + 1) * 15 + j + 1], chess_board[(i + 2) * 15 + j] } === three[k])
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
        S_IDLE: begin
            finished_w = 0;
            if(i_start) begin
                cnt_w = 5'd0;
                black_score_w = 0;
                white_score_w = 0;    
                state_w = S_COUNT;
            end 
        end 
        S_COUNT: begin
            cnt_w = cnt_r + 5'd1;
            if(cnt_r == 15) begin
                state_w = S_IDLE;
                finished_w = 1'b1;
                if(i_turn)
                    score_w = white_score_r - black_score_r;
                else
                    score_w = black_score_r - white_score_r;
            end
            else begin
                for(int k = 0; k < 2; k++) begin
                    Compare_seven(.index(k[5:0]), .i(cnt_r), .score(seven_score[k]));    
                end
                for(int k = 0; k < 38; k++) begin
                    Compare_six(.index(k[5:0]), .i(cnt_r), .score(six_score[k]));    
                end
                for(int k = 0; k < 20; k++) begin
                    Compare_five(.index(k[5:0]), .i(cnt_r), .score(five_score[k]));    
                end
                for(int k = 0; k < 6; k++) begin
                    Compare_three(.index(k[5:0]), .i(cnt_r), .score(three_score[k]));    
                end
                               
                black_score_w = black_score_r 
                + seven_score[0] 
                + six_score[0] + six_score[1] + six_score[2] + six_score[3] + six_score[4] + six_score[5]
                 + six_score[6] + six_score[7] + six_score[8] + six_score[9] + six_score[10] + six_score[11]
                  + six_score[12] + six_score[13] + six_score[14] + six_score[15] + six_score[16] + six_score[17] + six_score[18] 
                + five_score[0]+ five_score[1]+ five_score[2]+ five_score[3]+ five_score[4]
                + five_score[5]+ five_score[6]+ five_score[7]+ five_score[8]+ five_score[9] 
                + three_score[0]+ three_score[1]+ three_score[2];
                
                white_score_w = white_score_r
                + seven_score[1] 
                + six_score[19] + six_score[20] + six_score[21] + six_score[22] + six_score[23] + six_score[24]
                 + six_score[25] + six_score[26] + six_score[27] + six_score[28] + six_score[29] + six_score[30]
                  + six_score[31] + six_score[32] + six_score[33] + six_score[34] + six_score[35] + six_score[36] + six_score[37] 
                + five_score[10]+ five_score[11]+ five_score[12]+ five_score[13]+ five_score[14]
                + five_score[15]+ five_score[16]+ five_score[17]+ five_score[18]+ five_score[19] 
                + three_score[3]+ three_score[4]+ three_score[5];
            end
        end
    endcase
end

always_ff @(posedge i_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        state_r                 <= S_IDLE;
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
