typedef logic [1:0] chess_board [225];
// 找尋己方必須防守的點 和 可以攻擊的點
module Threats(
    input               i_clk,
	input               i_rst_n,
	input               i_start,
	input               i_turn,
    input  chess_board  i_board,
    output   [49:0]     o_posX,
    output   [49:0]     o_posY,
    output   [5:0]      o_size,
    output   [1:0]      o_win,
    output              o_finish
);

parameter S_ATTACK = 1'd0;
parameter S_DEFEND = 1'd1;

parameter b         = 2'd0;
parameter w         = 2'd1;
parameter l         = 2'd2;

parameter logic [1:0] black_con_two_1 [0:5] = '{l, l, l, b, b ,l};
parameter logic [1:0] black_con_two_2 [0:5] = '{l, b, b, l, l ,l};
parameter logic [1:0] black_con_two_3 [0:4] = '{l, l, b, b ,l};
parameter logic [1:0] black_con_two_4 [0:4] = '{l, b, b, l ,l};
parameter logic [1:0] black_blank_one_two_1 [0:5] = '{l, l, b, l ,b, l};
parameter logic [1:0] black_blank_one_two_2 [0:5] = '{l, b, l, b ,l, l};
parameter logic [1:0] black_blank_two_two_1 [0:5] = '{l, b, l, l ,b, l};

parameter logic [1:0] black_blocked_con_three_1 [0:5] = '{l, l, b, b ,b, w};
parameter logic [1:0] black_blocked_con_three_2 [0:5] = '{w, b, b, b ,l, l};
parameter logic [1:0] black_blocked_blank_one_three_1 [0:5] = '{l, b, l, b ,b, w};
parameter logic [1:0] black_blocked_blank_one_three_2 [0:5] = '{w, b, b, l ,b, l};
parameter logic [1:0] black_blocked_blank_two_three_1 [0:5] = '{l, b, b, l ,b, w};
parameter logic [1:0] black_blocked_blank_two_three_2 [0:5] = '{w, b, l, b ,b, l};
parameter logic [1:0] black_blocked_jump_one_three_1 [0:4] = '{b, l, l, b, b};
parameter logic [1:0] black_blocked_jump_one_three_2 [0:4] = '{b, b, l, l, b};
parameter logic [1:0] black_blocked_jump_two_three_1 [0:4] = '{b, l, b, l, b};
parameter logic [1:0] black_blocked_double_three_1 [0:6] = '{w, l, b, b, b, l, w};

parameter logic [1:0] white_con_two_1 [0:5] = '{l, l, l, w, w ,l};
parameter logic [1:0] white_con_two_2 [0:5] = '{l, w, w, l, l ,l};
parameter logic [1:0] white_con_two_3 [0:4] = '{l, l, w, w ,l};
parameter logic [1:0] white_con_two_4 [0:4] = '{l, w, w, l ,l};
parameter logic [1:0] white_blank_one_two_1 [0:5] = '{l, l, w, l ,w, l};
parameter logic [1:0] white_blank_one_two_2 [0:5] = '{l, w, l, w ,l, l};
parameter logic [1:0] white_blank_two_two_1 [0:5] = '{l, w, l, l ,w, l};

parameter logic [1:0] white_blocked_con_three_1 [0:5] = '{l, l, w, w ,w, b};
parameter logic [1:0] white_blocked_con_three_2 [0:5] = '{b, w, w, w ,l, l};
parameter logic [1:0] white_blocked_blank_one_three_1 [0:5] = '{l, w, l, w ,w, b};
parameter logic [1:0] white_blocked_blank_one_three_2 [0:5] = '{b, w, w, l ,w, l};
parameter logic [1:0] white_blocked_blank_two_three_1 [0:5] = '{l, w, w, l ,w, b};
parameter logic [1:0] white_blocked_blank_two_three_2 [0:5] = '{b, w, l, w ,w, l};
parameter logic [1:0] white_blocked_jump_one_three_1 [0:4] = '{w, l, l, w, w};
parameter logic [1:0] white_blocked_jump_one_three_2 [0:4] = '{w, w, l, l, w};
parameter logic [1:0] white_blocked_jump_two_three_1 [0:4] = '{w, l, w, l, w};
parameter logic [1:0] white_blocked_double_three_1 [0:6] = '{b, l, w, w, w, l, b};

// parameter logic [1:0] black_con_three [0:4] = '{l, l, b, b, l};
// parameter logic [1:0] black_jump_one_three_o [0:5] = '{l, b, l, b, b, l};
// parameter logic [1:0] black_jump_one_three_r [0:5] = '{l, b, b, l, b, l};
// parameter logic [1:0] black_blocked_con_four_o [0:5] = '{l, b, b, b, b, w };
// parameter logic [1:0] black_blocked_con_four_r [0:5] = '{w, b, b, b, b, l };
// parameter logic [1:0] black_blocked_jump_one_four_o [0:4] = '{b, l, b, b, b};
// parameter logic [1:0] black_blocked_jump_one_four_r [0:4] = '{b, b, b, l, b};
// parameter logic [1:0] black_blocked_jump_two_four [0:4] = '{b, b, l, b, b};

// parameter logic [1:0] white_con_three [0:4] = '{l, w, w, w, l};
// parameter logic [1:0] white_jump_one_three_o [0:5] = '{l, w, l, w, w, l};
// parameter logic [1:0] white_jump_one_three_r [0:5] = '{l, w, w, l, w, l};
// parameter logic [1:0] white_blocked_con_four_o [0:5] = '{l, w, w, w, w, b };
// parameter logic [1:0] white_blocked_con_four_r [0:5] = '{b, w, w, w, w, l };
// parameter logic [1:0] white_blocked_jump_one_four_o [0:4] = '{w, l, w, w, w};
// parameter logic [1:0] white_blocked_jump_one_four_r [0:4] = '{w, w, w, l, w};
// parameter logic [1:0] white_blocked_jump_two_four [0:4] = '{w, w, l, w, w};

logic [3:0]  state_r, state_w;
logic [49:0] posx_r, posx_w;
logic [49:0] posy_r, posy_w;
logic [49:0] posx7_r, posx7_w;
logic [49:0] posy7_r, posy7_w;
logic [49:0] posx6_r, posx6_w;
logic [49:0] posy6_r, posy6_w;
logic [49:0] posx5_r, posx5_w;
logic [49:0] posy5_r, posy5_w;
logic [5:0]  size_r, size_w;
logic [1:0]  win_r, win_w;
logic finish_r, finish_w;

assign posx_r = o_posX;
assign posy_r = o_posY;
assign size_r = o_size;
assign win_r = o_win;
assign finish_r = o_finish;

task VCX_seven;
    input [49:0] posx, posy;
    input [1:0] pattern_cmp [0:6];
    input [1:0] chess_board [225];
    
    begin
        logic [7:0] counter_1;
        logic [7:0] counter_2;
        assign counter_1 = 0;
        assign counter_2 = 1;
        for (int i=0; i<=14; i++) begin
            for (int j=0; j<=8; j++) begin
                if( '{chess_board[i + j*15],  chess_board[i + (j+1)*15], chess_board[i + (j+2)*15], chess_board[i + (j+3)*15],
                chess_board[i + (j+4)*15], chess_board[i + (j+5)*15], chess_board[i + (j+6)*15]} == pattern_cmp) begin
                    posx[(49-(counter_1 << 3 + counter_1 << 1)) -: 5] = j+1;
                    posy[(49-(counter_1 << 3 + counter_1 << 1)) -: 5] = i;
                    posx[(49-(counter_2 << 3 + counter_2 << 1)) -: 5] = j+5;
                    posy[(49-(counter_2 << 3 + counter_2 << 1)) -: 5] = i;
                    counter_1 ++;
                    counter_2 ++;
                end
                
            end
        end
        for (int i=0; i<=14; i++) begin
            for (int j=0; j<=8; j++) begin
                if( '{chess_board[i*15 + j],  chess_board[i*15 + (j+1)], chess_board[i*15 + (j+2)], chess_board[i*15 + (j+3)],
                chess_board[i*15 + (j+4)], chess_board[i*15 + (j+5)], chess_board[i*15 + (j+6)]} == pattern_cmp) begin
                    posx[(49-(counter_1 << 3 + counter_1 << 1)) -: 5] = i;
                    posy[(49-(counter_1 << 3 + counter_1 << 1)) -: 5] = j+1;
                    posx[(49-(counter_2 << 3 + counter_2 << 1)) -: 5] = i;
                    posy[(49-(counter_2 << 3 + counter_2 << 1)) -: 5] = j+5;
                    counter_1 ++;
                    counter_2 ++;
                end
                
            end
        end
        for (int i=0; i<=8; i++) begin
            for (int j=0; j<=8; j++) begin
                if( '{chess_board[i + j*15],  chess_board[i + (j+1)*15+1], chess_board[i + (j+2)*15+2], chess_board[i + (j+3)*15+3],
                chess_board[i + (j+4)*15+4], chess_board[i + (j+5)*15+5], chess_board[i + (j+6)*15+6]} == pattern_cmp) begin
                    posx[(49-(counter_1 << 3 + counter_1 << 1)) -: 5] = j+1;
                    posy[(49-(counter_1 << 3 + counter_1 << 1)) -: 5] = i+1;
                    posx[(49-(counter_2 << 3 + counter_2 << 1)) -: 5] = j+5;
                    posy[(49-(counter_2 << 3 + counter_2 << 1)) -: 5] = i+5;
                    counter_1 ++;
                    counter_2 ++;
                end
                
            end
        end
        for (int i=7; i<=14; i++) begin
            for (int j=0; j<=8; j++) begin
                if( '{chess_board[i + j*15],  chess_board[i + (j+1)*15-1], chess_board[i + (j+2)*15-2], chess_board[i + (j+3)*15-3],
                chess_board[i + (j+4)*15-4], chess_board[i + (j+5)*15-5], chess_board[i + (j+6)*15-6] } == pattern_cmp) begin
                    posx[(49-(counter_1 << 3 + counter_1 << 1)) -: 5] = j-1;
                    posy[(49-(counter_1 << 3 + counter_1 << 1)) -: 5] = i+1;
                    posx[(49-(counter_2 << 3 + counter_2 << 1)) -: 5] = j-5;
                    posy[(49-(counter_2 << 3 + counter_2 << 1)) -: 5] = i+5;
                    counter_1 ++;
                    counter_2 ++;
                end
                
            end
        end


    end
endtask
task VCX_six;
    input [49:0] posx1, posy1;
    input [49:0] posx2, posy2;
    input [1:0] pattern_cmp1 [0:6];
    input [1:0] pattern_cmp2 [0:6];
    input [1:0] pattern_cmp3 [0:6];
    input [1:0] pattern_cmp4 [0:6];
    input [1:0] pattern_cmp5 [0:6];
    input [1:0] pattern_cmp6 [0:6];
    input [1:0] pattern_cmp7 [0:6];
    input [1:0] pattern_cmp8 [0:6];
    input [1:0] pattern_cmp9 [0:6];
    input [1:0] pattern_cmp10 [0:6];
    input [1:0] pattern_cmp11 [0:6];

    input [1:0] chess_board [225];
    
    begin
        logic [1:0] pattern [0:5];
        logic [7:0] counter_1;
        logic [7:0] counter_2;
        assign counter_1 = 0;
        assign counter_2 = 0;
        for (int i=0; i<=14; i++) begin
            for (int j=0; j<=8; j++) begin
                pattern = '{chess_board[i + j*15],  chess_board[i + (j+1)*15], chess_board[i + (j+2)*15], chess_board[i + (j+3)*15],
                chess_board[i + (j+4)*15], chess_board[i + (j+5)*15]};
                case (pattern)
                    pattern_cmp1: begin
                        posx1[(49-(counter_1 << 2 + counter_1)) -: 5] = j+1;
                        posy1[(49-(counter_1 << 2 + counter_1)) -: 5] = i;
                        counter_1 ++;
                    end
                    pattern_cmp2: begin
                        posx[(49-(counter_1 << 2 + counter_1)) -: 5] = j+4;
                        posy[(49-(counter_1 << 2 + counter_1)) -: 5] = i;
                        counter_1 ++;
                    end
                    pattern_cmp3: begin
                        posx[(49-(counter_1 << 2 + counter_1)) -: 5] = j+1;
                        posy[(49-(counter_1 << 2 + counter_1)) -: 5] = i;
                        posx[(49-(counter_2 << 2 + counter_2)) -: 5] = j+3;
                        posy[(49-(counter_2 << 2 + counter_2)) -: 5] = i;
                        counter_1 ++;
                        counter_2 ++;
                    end
                    pattern_cmp4: begin
                        posx[(49-(counter_1 << 2 + counter_1)) -: 5] = j+2;
                        posy[(49-(counter_1 << 2 + counter_1)) -: 5] = i;
                        posx[(49-(counter_2 << 2 + counter_2)) -: 5] = j+4;
                        posy[(49-(counter_2 << 2 + counter_2)) -: 5] = i;
                        counter_1 ++;
                        counter_2 ++;
                    end
                    pattern_cmp5: begin
                        posx[(49-(counter_1 << 2 + counter_1)) -: 5] = j+2;
                        posy[(49-(counter_1 << 2 + counter_1)) -: 5] = i;
                        posx[(49-(counter_2 << 2 + counter_2)) -: 5] = j+3;
                        posy[(49-(counter_2 << 2 + counter_2)) -: 5] = i;
                        counter_1 ++;
                        counter_2 ++;
                    end
                    pattern_cmp6: begin
                        posx[(49-(counter_1 << 2 + counter_1)) -: 5] = j;
                        posy[(49-(counter_1 << 2 + counter_1)) -: 5] = i;
                        posx[(49-(counter_2 << 2 + counter_2)) -: 5] = j+1;
                        posy[(49-(counter_2 << 2 + counter_2)) -: 5] = i;
                        counter_1 ++;
                        counter_2 ++;
                    end
                    pattern_cmp7: begin
                        posx[(49-(counter_1 << 2 + counter_1)) -: 5] = j+4;
                        posy[(49-(counter_1 << 2 + counter_1)) -: 5] = i;
                        posx[(49-(counter_2 << 2 + counter_2)) -: 5] = j+5;
                        posy[(49-(counter_2 << 2 + counter_2)) -: 5] = i;
                        counter_1 ++;
                        counter_2 ++;
                    end
                    pattern_cmp8: begin
                        posx[(49-(counter_1 << 2 + counter_1)) -: 5] = j;
                        posy[(49-(counter_1 << 2 + counter_1)) -: 5] = i;
                        posx[(49-(counter_2 << 2 + counter_2)) -: 5] = j+2;
                        posy[(49-(counter_2 << 2 + counter_2)) -: 5] = i;
                        counter_1 ++;
                        counter_2 ++;
                    end
                    pattern_cmp9: begin
                        posx[(49-(counter_1 << 2 + counter_1)) -: 5] = j+3;
                        posy[(49-(counter_1 << 2 + counter_1)) -: 5] = i;
                        posx[(49-(counter_2 << 2 + counter_2)) -: 5] = j+5;
                        posy[(49-(counter_2 << 2 + counter_2)) -: 5] = i;
                        counter_1 ++;
                        counter_2 ++;
                    end
                    pattern_cmp10: begin
                        posx[(49-(counter_1 << 2 + counter_1)) -: 5] = j;
                        posy[(49-(counter_1 << 2 + counter_1)) -: 5] = i;
                        posx[(49-(counter_2 << 2 + counter_2)) -: 5] = j+3;
                        posy[(49-(counter_2 << 2 + counter_2)) -: 5] = i;
                        counter_1 ++;
                        counter_2 ++;
                    end
                    pattern_cmp11: begin
                        posx[(49-(counter_1 << 2 + counter_1)) -: 5] = j+2;
                        posy[(49-(counter_1 << 2 + counter_1)) -: 5] = i;
                        posx[(49-(counter_2 << 2 + counter_2)) -: 5] = j+5;
                        posy[(49-(counter_2 << 2 + counter_2)) -: 5] = i;
                        counter_1 ++;
                        counter_2 ++;
                    end
                endcase
            end
        end
        for (int i=0; i<=14; i++) begin
            for (int j=0; j<=8; j++) begin
                if( '{chess_board[i*15 + j],  chess_board[i*15 + (j+1)], chess_board[i*15 + (j+2)], chess_board[i*15 + (j+3)],
                chess_board[i*15 + (j+4)], chess_board[i*15 + (j+5)], chess_board[i*15 + (j+6)]} == pattern_cmp) begin
                    posx[(49-(counter_1 << 3 + counter_1 << 1)) -: 5] = i;
                    posy[(49-(counter_1 << 3 + counter_1 << 1)) -: 5] = j+1;
                    posx[(49-(counter_2 << 2 + counter_2)) -: 5] = i;
                    posy[(49-(counter_2 << 2 + counter_2)) -: 5] = j+5;
                end

            end
        end
        for (int i=0; i<=8; i++) begin
            for (int j=0; j<=8; j++) begin
                if( '{chess_board[i + j*15],  chess_board[i + (j+1)*15+1], chess_board[i + (j+2)*15+2], chess_board[i + (j+3)*15+3],
                chess_board[i + (j+4)*15+4], chess_board[i + (j+5)*15+5], chess_board[i + (j+6)*15+6]} == pattern_cmp) begin
                    posx[(49-(counter_1 << 3 + counter_1 << 1)) -: 5] = j+1;
                    posy[(49-(counter_1 << 3 + counter_1 << 1)) -: 5] = i+1;
                    posx[(49-(counter_2 << 2 + counter_2)) -: 5] = j+5;
                    posy[(49-(counter_2 << 3 + counter_2 << 1)) -: 5] = i+5;
                end

            end
        end
        for (int i=7; i<=14; i++) begin
            for (int j=0; j<=8; j++) begin
                if( '{chess_board[i + j*15],  chess_board[i + (j+1)*15-1], chess_board[i + (j+2)*15-2], chess_board[i + (j+3)*15-3],
                chess_board[i + (j+4)*15-4], chess_board[i + (j+5)*15-5], chess_board[i + (j+6)*15-6] } == pattern_cmp) begin
                    posx[(49-(counter_1 << 3 + counter_1 << 1)) -: 5] = j-1;
                    posy[(49-(counter_1 << 3 + counter_1 << 1)) -: 5] = i+1;
                    posx[(49-(counter_2 << 3 + counter_2 << 1)) -: 5] = j-5;
                    posy[(49-(counter_2 << 3 + counter_2 << 1)) -: 5] = i+5;
                end

            end
        end


    end
endtask
task VCX_two;
    begin



    end
endtask
always_comb begin
    state_w         = state_r;
    posx_w          = posx_r;
    posy_w          = posy_r;
    posx7_w         = posx7_r;
    posy7_w         = posy7_r;
    posx6_w         = posx6_r;
    posy6_w         = posy6_r;
    posx5_w         = posx5_r;
    posy5_w         = posy5_r;
    size_w          = size_r;
    win_w           = win_r;
    finish_w        = finish_r;
    case (state_r)
        S_ATTACK: begin
            if (i_turn == 0) begin
                


            end

        end
        S_DEFEND: begin


        end
    endcase


end

always_ff @(negedge i_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        state_r         <= S_ATTACK;
        posx_r          <= 0; 
        posy_r          <= 0;
        posx7_r         <= 0; 
        posy7_r         <= 0;
        posx6_r         <= 0; 
        posy6_r         <= 0;
        posx5_r         <= 0; 
        posy5_r         <= 0;
        size_r          <= 0;
        win_r           <= 0;       
        finish_r        <= 0;
    end
    else begin
        state_r         <= state_w;
        posx_r          <= posx_w;
        posy_r          <= posy_w;
        posx7_r         <= posx7_w;
        posy7_r         <= posy7_w;
        posx6_r         <= posx6_w;
        posy6_r         <= posy6_w;
        posx5_r         <= posx5_w;
        posy5_r         <= posy5_w;
        size_r          <= size_w;
        win_r           <= win_w;
        finish_r        <= finish_w;
    end
end






endmodule