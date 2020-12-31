module Threats(
    input               i_clk,
	input               i_rst_n,
	input               i_start,
	input               i_turn,
    input     board     i_board,
    output   [499:0]    o_posX,
    output   [499:0]    o_posY,
    output   [8:0]      o_size,
    output              o_win,
    output              o_finish
);

parameter b         = 2'd0;
parameter w         = 2'd1;
parameter l         = 2'd2;

parameter S_IDLE    = 1'b0;
parameter S_COUNT   = 1'b1;

logic state_r, state_w;
logic finish_r, finish_w;
logic final_win_r, final_win_w;
logic [499:0] final_X_r, final_X_w;
logic [499:0] final_Y_r, final_Y_w;
logic [8:0] final_pointer_r, final_pointer_w;
logic [3:0] cnt_r, cnt_w;

logic [8:0] pointer_three_r, pointer_three_w[16];
logic [8:0] pointer_four_r, pointer_four_w[16];
logic [8:0] pointer_normal_r, pointer_normal_w[16];
logic [499:0] defense_four_X_r, defense_four_X_w, defense_four_Y_r, defense_four_Y_w;
logic [499:0] defense_three_X_r, defense_three_X_w, defense_three_Y_r, defense_three_Y_w;
logic [499:0] normal_X_r, normal_X_w, normal_Y_r, normal_Y_w;


// wires
logic [224:0] valid[15];

logic [14:0] offense_livethree_w;
logic [14:0] offense_livefour_w;
logic [14:0] offense_blockedfour_w;
logic [14:0] defense_blockedfour_w;
logic [14:0] defense_livethree_w;
logic [14:0] win_w;

assign o_posX   = final_X_r;
assign o_posY   = final_Y_r;
assign o_size   = final_pointer_r;
assign o_finish = finish_r;
assign o_win    = final_win_r;

task Offense_live_three(
    input   [3:0] X,
    input   [3:0] Y,
    input   [1:0] turn,
    input   [3:0] pointer,
    input   [7:0] offset,
    output  check 
);
    
// live threes
    // middle blank
    if(X < 13 && X >= 2 && Y < 13 && Y >= 2 && i_board[(X + 2) * 15 + (Y + 2)] == l && i_board[(X + 1) * 15 + (Y + 1)] == turn && i_board[(X - 1) * 15 + (Y - 1)] == turn && i_board[(X - 2) * 15 + (Y - 2)] == l)
        valid[pointer][offset + 0] = 1;
    else 
        valid[pointer][offset + 0] = 0;
    if(X < 13 && X >= 2 && i_board[(X + 2) * 15 + Y] == l && i_board[(X + 1) * 15 + Y] == turn && i_board[(X - 1) * 15 + Y] == turn && i_board[(X - 2) * 15 + Y] == l)
        valid[pointer][offset + 1] = 1;
    else
        valid[pointer][offset + 1] = 0;
    if(Y < 13 && Y >= 2 && i_board[X * 15 + (Y + 2)] == l && i_board[X * 15 + (Y + 1)] == turn && i_board[X * 15 + (Y - 1)] == turn && i_board[X * 15 + (Y - 2)] == l)
        valid[pointer][offset + 2] = 1;
    else
        valid[pointer][offset + 2] = 0;
    if(X < 13 && Y < 13 && X >= 2 && Y >= 2 && i_board[(X - 2) * 15 + (Y + 2)] == l && i_board[(X - 1) * 15 + (Y + 1)] == turn && i_board[(X + 1) * 15 + (Y - 1)] == turn && i_board[(X + 2) * 15 + (Y - 2)] == l)
        valid[pointer][offset + 3] = 1;
    else
        valid[pointer][offset + 3] = 0;
    
    // * x . . * 45  
    if(X < 12 && Y < 12 && X >= 1 && Y >= 1 && i_board[(X + 3) * 15 + (Y + 3)] == l && i_board[(X + 1) * 15 + (Y + 1)] == turn && i_board[(X + 2) * 15 + (Y + 2)] == turn && i_board[(X - 1) * 15 + (Y - 1)] == l)
        valid[pointer][offset + 4] = 1;
    else
        valid[pointer][offset + 4] = 0;
    // * x . . * 135  
    if(X < 14 && X >= 3 && i_board[(X - 3) * 15 + (Y - 3)] == l && i_board[(X - 2) * 15 + (Y - 2)] == turn && i_board[(X - 1) * 15 + (Y - 1)] == turn && i_board[(X + 1) * 15 + (Y + 1)] == l)
        valid[pointer][offset + 5] = 1;
    else
        valid[pointer][offset + 5] = 0;
    // * x . . * 315  
    if(X < 12 && X >= 1 && Y < 14 && Y >= 3 && i_board[(X + 1) * 15 + (Y - 1)] == turn && i_board[(X + 2) * 15 + (Y - 2)] == turn && i_board[(X + 3) * 15 + (Y - 3)] == l && i_board[(X - 1) * 15 + (Y + 1)] == l)
        valid[pointer][offset + 6] = 1;
    else
        valid[pointer][offset + 6] = 0;
    // * x . . * 225  
    if(X >= 3 && X < 14 && Y < 12 && Y >= 1 && i_board[(X - 3) * 15 + (Y + 3)] == l && i_board[(X - 1) * 15 + (Y + 1)] == turn && i_board[(X - 2) * 15 + (Y + 2)] == turn && i_board[(X + 1) * 15 + (Y - 1)] == l)
        valid[pointer][offset + 7] = 1;
    else
        valid[pointer][offset + 7] = 0;
    // * x . . * 0  
    if(X < 12 && X >= 1 && i_board[(X - 1) * 15 + Y] == l && i_board[(X + 1) * 15 + Y] == turn && i_board[(X + 2) * 15 + Y] == turn && i_board[(X + 3) * 15 + Y] == l)
        valid[pointer][offset + 8] = 1;
    else
        valid[pointer][offset + 8] = 0;
    // * x . . * 180  
    if(X >= 3 && X < 14 && i_board[(X + 1) * 15 + Y] == l && i_board[(X - 1) * 15 + Y] == turn && i_board[(X - 2) * 15 + Y] == turn && i_board[(X - 3) * 15 + Y] == l)
        valid[pointer][offset + 9] = 1;
    else
        valid[pointer][offset + 9] = 0;
    // * x . . * 90 
    if(Y < 12 && Y >= 1 && i_board[X * 15 + (Y - 1)] == l && i_board[X * 15 + (Y + 1)] == turn && i_board[X * 15 + (Y + 2)] == turn && i_board[X * 15 + (Y + 3)] == l)
        valid[pointer][offset + 10] = 1;
    else
        valid[pointer][offset + 10] = 0;
    // * x . . * 270  
    if(Y >= 3 && Y < 14 && i_board[X * 15 + (Y + 1)] == l && i_board[X * 15 + (Y - 1)] == turn && i_board[X * 15 + (Y - 2)] == turn && i_board[X * 15 + (Y - 3)] == l)
        valid[pointer][offset + 11] = 1;
    else
        valid[pointer][offset + 11] = 0;
    
    
    // * A . X . * 45
    if(X >= 1 && X < 11 && Y >= 1 && Y < 11 && i_board[(X - 1) * 15 + (Y - 1)] == l && i_board[(X + 1) * 15 + (Y + 1)] == turn && i_board[(X + 2) * 15 + (Y + 2)] == l && i_board[(X + 3) * 15 + (Y + 3)] == turn && i_board[(X + 4) * 15 + (Y + 4)])
        valid[pointer][offset + 12] = 1;
    else
        valid[pointer][offset + 12] = 0;
    // * A X . . * 45
    if(X >= 1 && X < 11 && Y >= 1 && Y < 11 && i_board[(X - 1) * 15 + (Y - 1)] == l && i_board[(X + 1) * 15 + (Y + 1)] == l && i_board[(X + 2) * 15 + (Y + 2)] == turn && i_board[(X + 3) * 15 + (Y + 3)] == turn && i_board[(X + 4) * 15 + (Y + 4)])
        valid[pointer][offset + 13] = 1;
    else
        valid[pointer][offset + 13] = 0;
    // * A . X . * 90
    if(Y >= 1 && Y < 11 && i_board[X * 15 + (Y - 1)] == l && i_board[X * 15 + (Y + 1)] == turn && i_board[X * 15 + (Y + 2)] == l && i_board[X * 15 + (Y + 3)] == turn && i_board[X * 15 + (Y + 4)] == l)
        valid[pointer][offset + 14] = 1;
    else
        valid[pointer][offset + 14] = 0;
    // * A X . . * 90
    if(Y >= 1 && Y < 11 && i_board[X * 15 + (Y - 1)] == l && i_board[X * 15 + (Y + 1)] == l && i_board[X * 15 + (Y + 2)] == turn && i_board[X * 15 + (Y + 3)] == turn && i_board[X * 15 + (Y + 4)] == l)
        valid[pointer][offset + 15] = 1;
    else
        valid[pointer][offset + 15] = 0;
    // * A . X . * 135
    if(X >= 4 && X < 14 && Y >= 1 && Y < 11 && i_board[(X + 1) * 15 + (Y - 1)] == l && i_board[(X - 1) * 15 + (Y + 1)] == turn && i_board[(X - 2) * 15 + (Y + 2)] == l && i_board[(X - 3) * 15 + (Y + 3)] == turn && i_board[(X - 4) * 15 + (Y + 4)] == l)
        valid[pointer][offset + 16] = 1;
    else
        valid[pointer][offset + 16] = 0;
    // * A X . . * 135
    if(X >= 4 && X < 14 && Y >= 1 && Y < 11 && i_board[(X + 1) * 15 + (Y - 1)] == l && i_board[(X - 1) * 15 + (Y + 1)] == l && i_board[(X - 2) * 15 + (Y + 2)] == turn && i_board[(X - 3) * 15 + (Y + 3)] == turn && i_board[(X - 4) * 15 + (Y + 4)] == l)
        valid[pointer][offset + 17] = 1;
    else
        valid[pointer][offset + 17] = 0;
    // * A . X . * 180
    if(X >= 4 && X < 14 && i_board[(X + 1) * 15 + Y] && i_board[(X - 1) * 15 + Y] == turn && i_board[(X - 2) * 15 + Y] == l && i_board[(X - 3) * 15 + Y] == turn && i_board[(X - 4) * 15 + Y] == l)
        valid[pointer][offset + 18] = 1;
    else
        valid[pointer][offset + 18] = 0;
    // * A X . . * 180
    if(X >= 4 && X < 14 && i_board[(X + 1) * 15 + Y] && i_board[(X - 1) * 15 + Y] == l && i_board[(X - 2) * 15 + Y] == turn && i_board[(X - 3) * 15 + Y] == turn && i_board[(X - 4) * 15 + Y] == l)
        valid[pointer][offset + 19] = 1;
    else
        valid[pointer][offset + 19] = 0;
    // * A . X . * 225
    if(X >= 4 && X < 14 && Y >= 4 && Y < 14 && i_board[(X + 1) * 15 + (Y + 1)] == l && i_board[(X - 1) * 15 + (Y - 1)] == turn && i_board[(X - 2) * 15 + (Y - 2)] == l && i_board[(X - 3) * 15 + (Y - 3)] == turn && i_board[(X - 4) * 15 + (Y - 4)] == l)
        valid[pointer][offset + 20] = 1;
    else
        valid[pointer][offset + 20] = 0;
    // * A X . . * 225
    if(X >= 4 && X < 14 && Y >= 4 && Y < 14 && i_board[(X + 1) * 15 + (Y + 1)] == l && i_board[(X - 1) * 15 + (Y - 1)] == l && i_board[(X - 2) * 15 + (Y - 2)] == turn && i_board[(X - 3) * 15 + (Y - 3)] == turn && i_board[(X - 4) * 15 + (Y - 4)] == l)
        valid[pointer][offset + 21] = 1;
    else
        valid[pointer][offset + 21] = 0;
    // * A . X . * 270
    if(Y >= 4 && Y < 14 && i_board[X * 15 + (Y + 1)] == l && i_board[X * 15 + (Y - 1)] == turn && i_board[X * 15 + (Y - 2)] == l && i_board[X * 15 + (Y - 3)] == turn && i_board[X * 15 + (Y -4)] == l)
        valid[pointer][offset + 22] = 1;
    else
        valid[pointer][offset + 22] = 0;
    // * A X . . * 270
    if(Y >= 4 && Y < 14 && i_board[X * 15 + (Y + 1)] == l && i_board[X * 15 + (Y - 1)] == l && i_board[X * 15 + (Y - 2)] == turn && i_board[X * 15 + (Y - 3)] == turn && i_board[X * 15 + (Y -4)] == l)
        valid[pointer][offset + 23] = 1;
    else
        valid[pointer][offset + 23] = 0;
    // * A . X . * 315
    if(Y >= 4 && Y < 14 && X < 11 && X >= 1 && i_board[(X - 1) * 15 + (Y + 1)] == l && i_board[(X + 1) * 15 + (Y - 1)] == turn && i_board[(X + 2) * 15 + (Y - 2)] == l && i_board[(X + 3) * 15 + (Y - 3)] == turn && i_board[(X + 4) * 15 + (Y - 4)] == l)
        valid[pointer][offset + 24] = 1;
    else
        valid[pointer][offset + 24] = 0;
    // * A X . . * 315
    if(Y >= 4 && Y < 14 && X < 11 && X >= 1 && i_board[(X - 1) * 15 + (Y + 1)] == l && i_board[(X + 1) * 15 + (Y - 1)] == l && i_board[(X + 2) * 15 + (Y - 2)] == turn && i_board[(X + 3) * 15 + (Y - 3)] == turn && i_board[(X + 4) * 15 + (Y - 4)] == l)    
        valid[pointer][offset + 25] = 1;
    else
        valid[pointer][offset + 25] = 0;
    // * A . X . * 0
    if(X >= 1 && X < 11 && i_board[(X - 1) * 15 + Y] == l && i_board[(X + 1) * 15 + Y] == turn && i_board[(X + 2) * 15 + Y] == l && i_board[(X + 3) * 15 + Y] == turn && i_board[(X + 4) * 15 + Y] == l)
        valid[pointer][offset + 26] = 1;
    else
        valid[pointer][offset + 26] = 0;
    // * A X . . * 0
    if(X >= 1 && X < 11 && i_board[(X - 1) * 15 + Y] == l && i_board[(X + 1) * 15 + Y] == l && i_board[(X + 2) * 15 + Y] == turn && i_board[(X + 3) * 15 + Y] == turn && i_board[(X + 4) * 15 + Y] == l)
        valid[pointer][offset + 27] = 1;
    else
        valid[pointer][offset + 27] = 0;

    // * . A X . * 45
    if(X >= 2 && X < 12 && Y >= 2 && Y < 12 && i_board[(X - 2) * 15 + (Y - 2)] == l && i_board[(X - 1) * 15 + (Y - 1)] == turn && i_board[(X + 1) * 15 + (Y + 1)] == l && i_board[(X + 2) * 15 + (Y + 2)] == turn && i_board[(X + 3) * 15 + (Y + 3)] == l)
        valid[pointer][offset + 28] = 1;
    else
        valid[pointer][offset + 28] = 0;
    // * . A X . * 90
    if(Y >= 2 && Y < 12 && i_board[X * 15 + (Y - 2)] == l && i_board[X * 15 + (Y - 1)] == turn && i_board[X * 15 + (Y + 1)] == l && i_board[X * 15 + (Y + 2)] == turn && i_board[X * 15 + (Y + 3)] == l)
        valid[pointer][offset + 29] = 1;
    else
        valid[pointer][offset + 29] = 0;
    // * . A X . * 135
    if(X < 13 && X >= 3 && Y >= 2 && X < 12 && i_board[(X + 2) * 15 + (Y - 2)] == l && i_board[(X + 1) * 15 + (Y - 1)] == turn && i_board[(X - 1) * 15 + (Y + 1)] == l && i_board[(X - 2) * 15 + (Y + 2)] == turn && i_board[(X - 3) * 15 + (Y + 3)] == l)
        valid[pointer][offset + 30] = 1;
    else
        valid[pointer][offset + 30] = 0;
    // * . A X . * 180
    if(X < 13 && X >= 3 && i_board[(X + 2) * 15 + Y] == l && i_board[(X + 1) * 15 + Y] == turn && i_board[(X - 1) * 15 + Y] == l && i_board[(X - 2) * 15 + Y] == turn && i_board[(X - 3) * 15 + Y] == l)
        valid[pointer][offset + 31] = 1;
    else
        valid[pointer][offset + 31] = 0;
    // * . A X . * 225
    if(X < 13 && X >= 3 && Y < 13 && Y >= 3 && i_board[(X + 2) * 15 + (Y + 2)] == l && i_board[(X + 1) * 15 + (Y + 1)] == turn && i_board[(X - 1) * 15 + (Y - 1)] == l && i_board[(X - 2) * 15 + (Y - 2)] == turn && i_board[(X - 3) * 15 + (Y - 3)] == l)
        valid[pointer][offset + 32] = 1;
    else
        valid[pointer][offset + 32] = 0;
    // * . A X . * 270
    if(Y < 13 && Y >= 3 && i_board[X * 15 + (Y + 2)] == l && i_board[X * 15 + (Y + 1)] == turn && i_board[X * 15 + (Y - 1)] == l && i_board[X * 15 + (Y - 2)] == turn && i_board[X * 15 + (Y - 3)] == l)
        valid[pointer][offset + 33] = 1;
    else
        valid[pointer][offset + 33] = 0;
    // * . A X . * 315
    if(X >= 2 && X < 12 && Y >= 3 && Y  < 13 && i_board[(X - 2) * 15 + (Y + 2)] == l && i_board[(X - 1) * 15 + (Y + 1)] == turn && i_board[(X + 1) * 15 + (Y - 1)] == l && i_board[(X + 2) * 15 + (Y - 2)] == turn && i_board[(X + 3) * 15 + (Y - 3)] == l)
        valid[pointer][offset + 34] = 1;
    else
        valid[pointer][offset + 34] = 0;
    // * . A X . * 0
    if(X < 13 && X >= 3 && i_board[(X - 2) * 15 + Y] == l && i_board[(X - 1) * 15 + Y] == turn && i_board[(X + 1) * 15 + Y] == l && i_board[(X + 2) * 15 + Y] == turn && i_board[(X + 3) * 15 + Y] == l)
        valid[pointer][offset + 35] = 1;
    else
        valid[pointer][offset + 35] = 0;

    assign check = i_board[X * 15 + Y][1] & (valid[pointer][offset] | valid[pointer][offset + 1] | valid[pointer][offset + 2] | valid[pointer][offset + 3]
     | valid[pointer][offset + 4] | valid[pointer][offset + 5] | valid[pointer][offset + 6] | valid[pointer][offset + 7]
      | valid[pointer][offset + 8] | valid[pointer][offset + 9] | valid[pointer][offset + 10] | valid[pointer][offset + 11]
       | valid[pointer][offset + 12] | valid[pointer][offset + 13] | valid[pointer][offset + 14] | valid[pointer][offset + 15]
        | valid[pointer][offset + 16] | valid[pointer][offset + 17] | valid[pointer][offset + 18] | valid[pointer][offset + 19]
         | valid[pointer][offset + 20] | valid[pointer][offset + 21] | valid[pointer][offset + 22] | valid[pointer][offset + 23]
          | valid[pointer][offset + 24] | valid[pointer][offset + 25] | valid[pointer][offset + 26] | valid[pointer][offset + 27]
           | valid[pointer][offset + 28] | valid[pointer][offset + 29] | valid[pointer][offset + 30] | valid[pointer][offset + 31]
            | valid[pointer][offset + 32] | valid[pointer][offset + 33] | valid[pointer][offset + 34] | valid[pointer][offset + 35]);


endtask


task Offense_blocked_four(
    input   [3:0] X,
    input   [3:0] Y,
    input   [1:0] turn,
    input   [7:0] offset,
    output  check 
);
// blocked fours
    // lA...x ,0
    if((X < 11 &&  X > 0) && 
        (i_board[(X+1)*15 + Y] == turn &&  i_board[(X+2)*15 + Y] == turn  && i_board[(X+3)*15 + Y] == turn)  &&
        (i_board[(X+4)*15 + Y] == {turn[1],~turn[0]}) &&
        (i_board[(X-1)*15 + Y] == l))
        valid[pointer][offset + 0] = 1;
    else    
        valid[pointer][offset + 0] = 0;
    // l.A..x ,0
    if((X < 12 && X > 1) && 
        (i_board[(X+1)*15+Y] == turn &&  i_board[(X+2)*15+Y] == turn  && i_board[(X-1)*15+Y] == turn)  &&
        (i_board[(X+3)*15+Y] == {turn[1],~turn[0]}) &&
        (i_board[(X-2)*15+Y] == l))
        valid[pointer][offset + 1] = 1;
    else
        valid[pointer][offset + 1] = 0;
    // l..A.x ,0
    if((X < 13 && X > 2) && 
        (i_board[(X+1)*15+Y] == turn &&  i_board[(X-1)*15+Y] == turn  && i_board[(X-2)*15+Y] == turn)  &&
        (i_board[(X+2)*15+Y] == {turn[1],~turn[0]}) &&
        (i_board[(X-3)*15+Y] == l))
        valid[pointer][offset + 2] = 1;
    else
        valid[pointer][offset + 2] = 0;
    // l...Ax ,0
    if( (X < 14 && X > 3) && 
        (i_board[(X-1)*15+Y] == turn &&  i_board[(X-2)*15+Y] == turn  && i_board[(X-3)*15+Y] == turn)  &&
        (i_board[(X+1)*15+Y] == {turn[1],~turn[0]}) &&
        (i_board[(X-4)*15+Y] == l))
        valid[pointer][offset + 3] = 1;
    else
        valid[pointer][offset + 3] = 0;
    // lA ...x ,45
    if((X < 11 && Y < 11 && X > 0 && Y > 0) && 
        (i_board[(X+1)*15+(Y+1)] == turn &&  i_board[(X+2)*15+(Y+2)] == turn  && i_board[(X+3)*15+(Y+3)] == turn)  &&
        (i_board[(X+4)*15+(Y+4)] == {turn[1],~turn[0]}) &&
        (i_board[(X-1)*15+(Y-1)] == l))
        valid[pointer][offset + 4] = 1;
    else
        valid[pointer][offset + 4] = 0;
    // l.A..x ,45
    if((X < 12 && Y < 12 && X > 1 && Y > 1) && 
        (i_board[(X+1)*15+(Y+1)] == turn &&  i_board[(X+2)*15+(Y+2)] == turn  && i_board[(X-1)*15+(Y-1)] == turn)  &&
        (i_board[(X+3)*15+(Y+3)] == {turn[1],~turn[0]}) &&
        (i_board[(X-2)*15+(Y-2)] == l))
        valid[pointer][offset + 5] = 1;
    else
        valid[pointer][offset + 5] = 0;
    // l..A.x ,45
    if((X < 13 && Y < 13 && X > 2 && Y > 2) && 
        (i_board[(X+1)*15+(Y+1)] == turn &&  i_board[(X-2)*15+(Y-2)] == turn  && i_board[(X-1)*15+(Y-1)] == turn)  &&
        (i_board[(X+2)*15+(Y+2)] == {turn[1],~turn[0]}) &&
        (i_board[(X-3)*15+(Y-3)] == l))
        valid[pointer][offset + 6] = 1;
    else
        valid[pointer][offset + 6] = 0;
    // l...Ax ,45
    if( (X < 14 && Y < 14 && X > 3 && Y > 3) && 
        (i_board[(X-3)*15+(Y-3)] == turn &&  i_board[(X-2)*15+(Y-2)] == turn  && i_board[(X-1)*15+(Y-1)] == turn)  &&
        (i_board[(X+1)*15+(Y+1)] == {turn[1],~turn[0]}) &&
        (i_board[(X-4)*15+(Y-4)] == l))
        valid[pointer][offset + 7] = 1;
    else
        valid[pointer][offset + 7] = 0;
    // lA...x ,90
    if( (Y < 11 && Y > 0) && 
        (i_board[X*15+Y+1] == turn &&  i_board[X*15+Y+2] == turn  && i_board[X*15+Y+3] == turn)  &&
        (i_board[X*15+Y+4] == {turn[1],~turn[0]}) &&
        (i_board[X*15+Y-1] == l))
        valid[pointer][offset + 8] = 1;
    else
        valid[pointer][offset + 8] = 0;
    // l.A..x ,90
    if( (Y < 12 && Y > 1) && 
        (i_board[X*15+Y+1] == turn &&  i_board[X*15+Y+2] == turn  && i_board[X*15+Y-1] == turn)  &&
        (i_board[X*15+Y+3] == {turn[1],~turn[0]}) &&
        (i_board[X*15+Y-2] == l))
        valid[pointer][offset + 9] = 1;
    else
        valid[pointer][offset + 9] = 0;
    // l..A.x ,90
    if( (Y < 13 && Y > 2) && 
        (i_board[X*15+Y+1] == turn &&  i_board[X*15+Y-2] == turn  && i_board[X*15+Y-1] == turn)  &&
        (i_board[X*15+Y+2] == {turn[1],~turn[0]}) &&
        (i_board[X*15+Y-3] == l))
        valid[pointer][offset + 10] = 1;
    else
        valid[pointer][offset + 10] = 0;
    // l...Ax ,90
    if( (Y < 14 && Y > 3) && 
        (i_board[X*15+Y-3] == turn &&  i_board[X*15+Y-2] == turn  && i_board[X*15+Y-1] == turn)  &&
        (i_board[X*15+Y+1] == {turn[1],~turn[0]}) &&
        (i_board[X*15+(Y-4)] == l))
        valid[pointer][offset + 11] = 1;
    else
        valid[pointer][offset + 11] = 0;
    // x...Al ,135
    if((X < 14 && Y < 11 && X > 3 && Y > 0) && 
        (i_board[(X-1)*15+(Y+1)] == turn &&  i_board[(X-2)*15+(Y+2)] == turn  && i_board[(X-3)*15+(Y+3)] == turn)  &&
        (i_board[(X-4)*15+(Y+4)] == {turn[1],~turn[0]}) &&
        (i_board[(X+1)*15+(Y-1)] == l))
        valid[pointer][offset + 12] = 1;
    else
        valid[pointer][offset + 12] = 0;
    // x..A.l ,135
    if((X < 13 && Y < 12 && X > 2 && Y > 1) && 
        (i_board[(X-1)*15+(Y+1)] == turn &&  i_board[(X-2)*15+(Y+2)] == turn  && i_board[(X+1)*15+(Y-1)] == turn)  &&
        (i_board[(X-3)*15+(Y+3)] == {turn[1],~turn[0]}) &&
        (i_board[(X+2)*15+(Y-2)] == l))
        valid[pointer][offset + 13] = 1;
    else
        valid[pointer][offset + 13] = 0;
    // x.A..l ,135
    if((X < 12 && Y < 13 && X > 1 && Y > 2) && 
        (i_board[(X-1)*15+(Y+1)] == turn &&  i_board[(X+1)*15+(Y-1)] == turn  && i_board[(X+2)*15+(Y-2)] == turn)  &&
        (i_board[(X-2)*15+(Y+2)] == {turn[1],~turn[0]}) &&
        (i_board[(X+3)*15+(Y-3)] == l))
        valid[pointer][offset + 14] = 1;
    else
        valid[pointer][offset + 14] = 0;
    // xA...l ,135
    if( (X < 11 && Y < 14 && X > 0 && Y > 3) && 
        (i_board[(X+1)*15+(Y-1)] == turn &&  i_board[(X+2)*15+(Y-2)] == turn  && i_board[(X+3)*15+(Y-3)] == turn)  &&
        (i_board[(X-1)*15+(Y+1)] == {turn[1],~turn[0]}) &&
        (i_board[(X+4)*15+(Y-4)] == l))
        valid[pointer][offset + 15] = 1;
    else
        valid[pointer][offset + 15] = 0;
    // x...Al ,180
    if((X < 14 &&  X > 3) && 
        (i_board[(X-1)*15+Y] == turn &&  i_board[(X-2)*15+Y] == turn  && i_board[(X-3)*15+Y] == turn)  &&
        (i_board[(X-4)*15+Y] == {turn[1],~turn[0]}) &&
        (i_board[(X+1)*15+Y] == l))
        valid[pointer][offset + 16] = 1;
    else
        valid[pointer][offset + 16] = 0;
    // x..A.l ,180
    if((X < 13 && X > 2) && 
        (i_board[(X-1)*15+Y] == turn &&  i_board[(X-2)*15+Y] == turn  && i_board[(X+1)*15+Y] == turn)  &&
        (i_board[(X-3)*15+Y] == {turn[1],~turn[0]}) &&
        (i_board[(X+2)*15+Y] == l))
        valid[pointer][offset + 17] = 1;
    else
        valid[pointer][offset + 17] = 0;
    // x.A..l ,180
    if((X < 12 && X > 1) && 
        (i_board[(X-1)*15+Y] == turn &&  i_board[(X+1)*15+Y] == turn  && i_board[(X+2)*15+Y] == turn)  &&
        (i_board[(X-2)*15+Y] == {turn[1],~turn[0]}) &&
        (i_board[(X+3)*15+Y] == l))
        valid[pointer][offset + 18] = 1;
    else
        valid[pointer][offset + 18] = 0;
    // xA...l ,180
    if( (X < 11 && X > 0) && 
        (i_board[(X+1)*15+Y] == turn &&  i_board[(X+2)*15+Y] == turn  && i_board[(X+3)*15+Y] == turn)  &&
        (i_board[(X-1)*15+Y] == {turn[1],~turn[0]}) &&
        (i_board[(X+4)*15+Y] == l))
        valid[pointer][offset + 19] = 1;
    else
        valid[pointer][offset + 19] = 0;
    // x...Al ,225
    if((X < 14 && Y < 14 && X > 3 && Y > 3) && 
        (i_board[(X-1)*15+(Y-1)] == turn &&  i_board[(X-2)*15+(Y-2)] == turn  && i_board[(X-3)*15+(Y-3)] == turn)  &&
        (i_board[(X-4)*15+(Y-4)] == {turn[1],~turn[0]}) &&
        (i_board[(X+1)*15+(Y+1)] == l))
        valid[pointer][offset + 20] = 1;
    else
        valid[pointer][offset + 20] = 0;
    // x..A.l ,225
    if((X < 13 && Y < 13 && X > 2 && Y > 2) && 
        (i_board[(X-1)*15+(Y-1)] == turn &&  i_board[(X-2)*15+(Y-2)] == turn  && i_board[(X+1)*15+(Y+1)] == turn)  &&
        (i_board[(X-3)*15+(Y-3)] == {turn[1],~turn[0]}) &&
        (i_board[(X+2)*15+(Y+2)] == l))
        valid[pointer][offset + 21] = 1;
    else
        valid[pointer][offset + 21] = 0;
    // x.A..l ,225
    if((X < 12 && Y < 12 && X > 1 && Y > 1) && 
        (i_board[(X-1)*15+(Y-1)] == turn &&  i_board[(X+1)*15+(Y+1)] == turn  && i_board[(X+2)*15+(Y+2)] == turn)  &&
        (i_board[(X-2)*15+(Y-2)] == {turn[1],~turn[0]}) &&
        (i_board[(X+3)*15+(Y+3)] == l))
        valid[pointer][offset + 22] = 1;
    else
        valid[pointer][offset + 22] = 0;
    // xA...l ,225
    if( (X < 11 && Y < 11 && X > 0 && Y > 0) && 
       (i_board[(X+1)*15+(Y+1)] == turn &&  i_board[(X+2)*15+(Y+2)] == turn  && i_board[(X+3)*15+(Y+3)] == turn)  &&
        (i_board[(X-1)*15+(Y-1)] == {turn[1],~turn[0]}) &&
        (i_board[(X+4)*15+(Y+4)] == l))
        valid[pointer][offset + 23] = 1;
    else
        valid[pointer][offset + 23] = 0;
    // lA...x ,270
    if( (Y < 14 && Y > 3) && 
        (i_board[X*15+Y-1] == turn &&  i_board[X*15+Y-2] == turn  && i_board[X*15+Y-3] == turn)  &&
        (i_board[X*15+Y-4] == {turn[1],~turn[0]}) &&
        (i_board[X*15+Y+1] == l))
        valid[pointer][offset + 24] = 1;
    else
        valid[pointer][offset + 24] = 0;
    // l.A..x ,270
    if( (Y < 13 && Y > 2) && 
        (i_board[X*15+Y-1] == turn &&  i_board[X*15+Y-2] == turn  && i_board[X*15+Y+1] == turn)  &&
        (i_board[X*15+Y-3] == {turn[1],~turn[0]}) &&
        (i_board[X*15+Y+2] == l))
        valid[pointer][offset + 25] = 1;
    else
        valid[pointer][offset + 25] = 0;
    // l..A.x ,270
    if( (Y < 12 && Y > 1) && 
        (i_board[X*15+Y-1] == turn &&  i_board[X*15+Y+1] == turn  && i_board[X*15+Y+2] == turn)  &&
        (i_board[X*15+Y-2] == {turn[1],~turn[0]}) &&
        (i_board[X*15+Y+3] == l))
        valid[pointer][offset + 26] = 1;
    else
        valid[pointer][offset + 26] = 0;
    // l...Ax ,270
    if( (Y < 11 && Y > 0) && 
        (i_board[X*15+Y+3] == turn &&  i_board[X*15+Y+2] == turn  && i_board[X*15+Y+1] == turn)  &&
        (i_board[X*15+Y-1] == {turn[1],~turn[0]}) &&
        (i_board[X*15+(Y+4)] == l))
        valid[pointer][offset + 27] = 1;
    else
        valid[pointer][offset + 27] = 0;
    // lA ...x ,315
    if((X < 11 && Y < 14 && X > 0 && Y > 3) && 
        (i_board[(X+1)*15+(Y-1)] == turn &&  i_board[(X+2)*15+(Y+2)] == turn  && i_board[(X+3)*15+(Y-3)] == turn)  &&
        (i_board[(X+4)*15+(Y-4)] == {turn[1],~turn[0]}) &&
        (i_board[(X-1)*15+(Y+1)] == l))
        valid[pointer][offset + 28] = 1;
    else
        valid[pointer][offset + 28] = 0;
    // l.A..x ,315
    if((X < 12 && Y < 13 && X > 1 && Y > 2) && 
        (i_board[(X+1)*15+(Y-1)] == turn &&  i_board[(X+2)*15+(Y-2)] == turn  && i_board[(X-1)*15+(Y+1)] == turn)  &&
        (i_board[(X+3)*15+(Y-3)] == {turn[1],~turn[0]}) &&
        (i_board[(X-2)*15+(Y+2)] == l))
        valid[pointer][offset + 29] = 1;
    else
        valid[pointer][offset + 29] = 0;
    // l..A.x ,315
    if((X < 13 && Y < 12 && X > 2 && Y > 1) && 
        (i_board[(X+1)*15+(Y-1)] == turn &&  i_board[(X-1)*15+(Y+1)] == turn  && i_board[(X-2)*15+(Y-2)] == turn)  &&
        (i_board[(X+2)*15+(Y-2)] == {turn[1],~turn[0]}) &&
        (i_board[(X-3)*15+(Y+3)] == l))
        valid[pointer][offset + 30] = 1;
    else
        valid[pointer][offset + 30] = 0;
    // l...Ax ,315
    if( (X < 14 && Y < 11 && X > 3 && Y > 0) && 
        (i_board[(X-3)*15+(Y+3)] == turn &&  i_board[(X-2)*15+(Y+2)] == turn  && i_board[(X-1)*15+(Y+1)] == turn)  &&
        (i_board[(X+1)*15+(Y-1)] == {turn[1],~turn[0]}) &&
        (i_board[(X-4)*15+(Y+4)] == l))
        valid[pointer][offset + 31] = 1;
    else
        valid[pointer][offset + 31] = 0;


//Second condition
    // Al... ,0
        if( (X < 11) &&
            (i_board[(X+2)*15+Y] == turn && i_board[(X+3)*15+Y] == turn && i_board[(X+4)*15+Y] == turn) &&
            (i_board[(X+1)*15+Y] == l))
            valid[pointer][offset +32] = 1;
        else 
            valid[pointer][offset +32] = 0;
    // .lA.. ,0
        if( (X < 13 && X > 1) &&
            (i_board[(X-2)*15+Y] == turn && i_board[(X+1)*15+Y] == turn && i_board[(X+2)*15+Y] == turn) &&
            (i_board[(X-1)*15+Y] == l))
            valid[pointer][offset +33] = 1;
        else
            valid[pointer][offset +33] = 0;
    // .l.A. ,0
        if( (X < 14 && X > 2) &&
            (i_board[(X-3)*15+Y] == turn && i_board[(X-1)*15+Y] == turn && i_board[(X+1)*15+Y] == turn) &&
            (i_board[(X-2)*15+Y] == l))
            valid[pointer][offset +34] = 1;
        else 
            valid[pointer][offset +34] = 0;
    // .l..A ,0
        if( ( X > 3) &&
            (i_board[(X-4)*15+Y] == turn && i_board[(X-2)*15+Y] == turn && i_board[(X-1)*15+Y] == turn) &&
            (i_board[(X-3)*15+Y] == l))
            valid[pointer][offset +35] = 1;
        else
            valid[pointer][offset +35] = 0;

    // Al... ,45
       if( (X < 11 && Y < 11) &&
           (i_board[(X+2)*15+(Y+2)] == turn && i_board[(X+3)*15+(Y+3)] == turn && i_board[(X+4)*15+(Y+4)] == turn) &&
           (i_board[(X+1)*15+(Y+1)] == l)) 
           valid[pointer][offset +36] = 1;
       else
           valid[pointer][offset +36] = 0;
    // .lA.. ,45
        if( (X < 13 && X > 1 && Y < 13 && Y > 1) &&
            (i_board[(X-2)*15+(Y-2)] == turn && i_board[(X+1)*15+(Y+1)] == turn && i_board[(X+2)*15+(Y+2)] == turn) &&
            (i_board[(X-1)*15+(Y-1)] == l))
            valid[pointer][offset +37] = 1;
        else
            valid[pointer][offset +37] = 0;
    // .l.A. ,45
        if( (X < 14 && X > 2 && Y < 14 && Y > 2) &&
            (i_board[(X-3)*15+(Y-3)] == turn && i_board[(X-1)*15+(Y-1)] == turn && i_board[(X+1)*15+(Y+1)] == turn) &&
            (i_board[(X-2)*15+(Y-2)] == l))
            valid[pointer][offset +38] = 1;
        else
            valid[pointer][offset +38] = 0;
    // .l..A ,45
        if( (X > 3 &&  Y > 3) &&
            (i_board[(X-4)*15+(Y-4)] == turn && i_board[(X-2)*15+(Y-2)] == turn && i_board[(X-1)*15+(Y-1)] == turn) &&
            (i_board[(X-3)*15+(Y-3)] == l))
            valid[pointer][offset +39] = 1;
        else
            valid[pointer][offset +39] = 0;

    // Al... ,90
        if( (Y < 11) &&
            (i_board[X*15+Y+2] == turn && i_board[X*15+Y+3] == turn && i_board[X*15+Y+4] == turn) &&
            (i_board[X*15+Y+1] == l))
            valid[pointer][offset +40] = 1;
        else
            valid[pointer][offset +40] = 0;
    // .lA.. ,90
        if( (Y < 13 && Y > 1) &&
            (i_board[X*15+Y-2] == turn && i_board[X*15+Y+1] == turn && i_board[X*15+Y+2] == turn) &&
            (i_board[X*15+Y-1] == l))
            valid[pointer][offset +41] = 1;
        else
            valid[pointer][offset +41] = 0;
    // .l.A. ,90
        if( (Y < 14 && Y > 2) &&
            (i_board[X*15+Y-3] == turn && i_board[X*15+Y-1] == turn && i_board[X*15+Y+1] == turn) &&
            (i_board[X*15+Y-2] == l))
            valid[pointer][offset +42] = 1;
        else
            valid[pointer][offset +42] = 0;
    // .l..A ,90
        if( (Y > 3) &&
            (i_board[X*15+Y-4] == turn && i_board[X*15+Y-2] == turn && i_board[X*15+Y-1] == turn) &&
            (i_board[X*15+Y-3] == l))
            valid[pointer][offset +43] = 1;
        else
            valid[pointer][offset +43] = 0;

    // ...lA ,135
        if( (X > 3 && Y < 11) &&
            (i_board[(X-2)*15+(Y+2)] == turn && i_board[(X-3)*15+(Y+3)] == turn && i_board[(X-4)*15+(Y+4)] == turn) &&
            (i_board[(X-1)*15+(Y+1)] == l))
            valid[pointer][offset +44] = 1;
        else
            valid[pointer][offset +44] = 0;
    // ..Al. ,135
        if( (X < 13 && X > 1 && Y < 13 && Y > 1) &&
            (i_board[(X-2)*15+(Y+2)] == turn && i_board[(X-1)*15+(Y+1)] == turn && i_board[(X+2)*15+(Y-2)] == turn) &&
            (i_board[(X+1)*15+(Y-1)] == l))
            valid[pointer][offset +45] = 1;
        else
            valid[pointer][offset +45] = 0;
    // .A.l. ,135
        if( (X < 12 && X > 0 && Y < 14 && Y > 2) &&
            (i_board[(X-1)*15+(Y+1)] == turn && i_board[(X+1)*15+(Y-1)] == turn && i_board[(X+3)*15+(Y-3)] == turn) &&
            (i_board[(X-2)*15+(Y-2)] == l))
            valid[pointer][offset +46] = 1;
        else
            valid[pointer][offset +46] = 0;
    // A..l. ,135
        if( (X < 11 && Y > 3) &&
            (i_board[(X+1)*15+(Y-1)] == turn && i_board[(X+2)*15+(Y-2)] == turn && i_board[(X+4)*15+(Y-4)] == turn) &&
            (i_board[(X+3)*15+(Y-3)] == l))
            valid[pointer][offset +47] = 1;
        else
            valid[pointer][offset +47] = 0;

    // ...lA ,180
        if( (X > 3) &&
            (i_board[(X-2)*15+Y] == turn && i_board[(X-3)*15+Y] == turn && i_board[(X-4)*15+Y] == turn) &&
            (i_board[(X-1)*15+Y] == l))
            valid[pointer][offset +48] = 1;
        else
            valid[pointer][offset +48] = 0;
    // ..Al. ,180
        if( (X < 13 && X > 1) &&
            (i_board[(X-2)*15+Y] == turn && i_board[(X-1)*15+Y] == turn && i_board[(X+2)*15+Y] == turn) &&
            (i_board[(X-1)*15+Y] == l))
            valid[pointer][offset +49] = 1;
        else
            valid[pointer][offset +49] = 0;
    // .A.l. ,180
        if( (X < 12 && X > 0) &&
            (i_board[(X+3)*15+Y] == turn && i_board[(X-1)*15+Y] == turn && i_board[(X+1)*15+Y] == turn) &&
            (i_board[(X+2)*15+Y] == l))
            valid[pointer][offset +50] = 1;
        else
            valid[pointer][offset +50] = 0;
    // A..l. ,180
        if( (X < 11 ) &&
            (i_board[(X+4)*15+Y] == turn && i_board[(X+2)*15+Y] == turn && i_board[(X+1)*15+Y] == turn) &&
            (i_board[(X+3)*15+Y] == l))
            valid[pointer][offset +51] = 1;
        else
            valid[pointer][offset +51] = 0;

    // ...lA ,225
        if( (X > 3 && Y > 3) &&
            (i_board[(X-2)*15+(Y-2)] == turn && i_board[(X-3)*15+(Y-3)] == turn && i_board[(X-4)*15+(Y-4)] == turn) &&
            (i_board[(X-1)*15+(Y-1)] == l))
            valid[pointer][offset +52] = 1;
        else
            valid[pointer][offset +52] = 0;
    // ..Al. ,225
        if( (X < 13 && X > 1 && Y < 13 && Y > 1) &&
            (i_board[(X-2)*15+(Y-2)] == turn && i_board[(X-1)*15+(Y-1)] == turn && i_board[(X+2)*15+(Y+2)] == turn) &&
            (i_board[(X+1)*15+(Y+1)] == l))
            valid[pointer][offset +53] = 1;
        else
            valid[pointer][offset +53] = 0;
    // .A.l. ,225
        if( (X < 12 && X > 0 && Y < 12 && Y > 0) &&
            (i_board[(X+3)*15+(Y+3)] == turn && i_board[(X+1)*15+(Y+1)] == turn && i_board[(X-1)*15+(Y-1)] == turn) &&
            (i_board[(X+2)*15+(Y+2)] == l))
            valid[pointer][offset +54] = 1;
        else
            valid[pointer][offset +54] = 0;
    // A..l. ,225
        if( (X < 11 &&  Y < 11) &&
            (i_board[(X+4)*15+(Y+4)] == turn && i_board[(X+2)*15+(Y+2)] == turn && i_board[(X+1)*15+(Y+1)] == turn) &&
            (i_board[(X+3)*15+(Y+3)] == l))
            valid[pointer][offset +55] = 1;
        else
            valid[pointer][offset +55] = 0;

    // Al... ,270
        if( (Y > 3) &&
            (i_board[X*15+Y-2] == turn && i_board[X*15+Y-3] == turn && i_board[X*15+Y-4] == turn) &&
            (i_board[X*15+Y-1] == l))
            valid[pointer][offset +56] = 1;
        else
            valid[pointer][offset +56] = 0;
    // .lA.. ,270
        if( (Y < 13 && Y > 1) &&
            (i_board[X*15+Y+2] == turn && i_board[X*15+Y-1] == turn && i_board[X*15+Y-2] == turn) &&
            (i_board[X*15+Y+1] == l))
            valid[pointer][offset +57] = 1;
        else
            valid[pointer][offset +57] = 0;
    // .l.A. ,270
        if( (Y < 14 && Y > 2) &&
            (i_board[X*15+Y+3] == turn && i_board[X*15+Y+1] == turn && i_board[X*15+Y-1] == turn) &&
            (i_board[X*15+Y+2] == l))
            valid[pointer][offset +58] = 1;
        else
            valid[pointer][offset +58] = 0;
    // .l..A ,270
        if( (Y < 11) &&
            (i_board[X*15+Y+4] == turn && i_board[X*15+Y+2] == turn && i_board[X*15+Y+1] == turn) &&
            (i_board[X*15+Y+3] == l))
            valid[pointer][offset +59] = 1;
        else
            valid[pointer][offset +59] = 0;

    // Al... ,315
        if( (X < 11 && Y > 3) &&
            (i_board[(X+2)*15+(Y-2)] == turn && i_board[(X-3)*15+(Y-3)] == turn && i_board[(X-4)*15+(Y-4)] == turn) &&
            (i_board[(X+1)*15+(Y-1)] == l))
            valid[pointer][offset +60] = 1;
        else
            valid[pointer][offset +60] = 0;
    // .lA.. ,315
        if( (X < 13 && X > 1 && Y < 13 && Y > 1) &&
            (i_board[(X-2)*15+(Y+2)] == turn && i_board[(X+1)*15+(Y-1)] == turn && i_board[(X+2)*15+(Y-2)] == turn) &&
            (i_board[(X-1)*15+(Y-1)] == l))
            valid[pointer][offset +61] = 1;
        else
            valid[pointer][offset +61] = 0;
    // .l.A. ,315
        if( (X < 14 && X > 2 && Y < 14 && Y > 2) &&
            (i_board[(X-3)*15+(Y+3)] == turn && i_board[(X-1)*15+(Y+1)] == turn && i_board[(X+1)*15+(Y-1)] == turn) &&
            (i_board[(X-2)*15+(Y+2)] == l))
            valid[pointer][offset +62] = 1;
        else
            valid[pointer][offset +62] = 0;
    // .l..A ,315
        if( (X > 3 &&  Y > 3) &&
            (i_board[(X-4)*15+(Y+4)] == turn && i_board[(X-2)*15+(Y+2)] == turn && i_board[(X-1)*15+(Y+1)] == turn) &&
            (i_board[(X-3)*15+(Y+3)] == l))
            valid[pointer][offset +63] = 1;
        else
            valid[pointer][offset +63] = 0;


            
// Third condition
    // A.l.. , 0
        if ((X < 11) &&
            (i_board[(X+1)*15+Y] == turn && i_board[(X+3)*15+Y] == turn && i_board[(X+4)*15+Y] == turn) &&
            (i_board[(X+2)*15+Y] == l))
            valid[pointer][offset +64] = 1;
        else
            valid[pointer][offset +64] = 0;
    // .Al.. , 0
        if ((X < 12 && X > 0) &&
            (i_board[(X-1)*15+Y] == turn && i_board[(X+2)*15+Y] == turn && i_board[(X+3)*15+Y] == turn) &&
            (i_board[(X+1)*15+Y] == l))
            valid[pointer][offset +65] = 1;
        else
            valid[pointer][offset +65] = 0;
    // ..lA. , 180
        if ((X < 14 && X > 2) &&
            (i_board[(X-3)*15+Y] == turn && i_board[(X-2)*15+Y] == turn && i_board[(X+1)*15+Y] == turn) &&
            (i_board[(X-1)*15+Y] == l))
            valid[pointer][offset +66] = 1;
        else
            valid[pointer][offset +66] = 0;
    // ..l.A , 180
        if ((X < 15 && X > 3) &&
            (i_board[(X-4)*15+Y] == turn && i_board[(X-3)*15+Y] == turn && i_board[(X-1)*15+Y] == turn) &&
            (i_board[(X-2)*15+Y] == l))
            valid[pointer][offset +67] = 1;
        else
            valid[pointer][offset +67] = 0;

    // A.l.. , 45
        if ((X < 11 && Y < 11) &&
            (i_board[(X+1)*15+Y+1] == turn && i_board[(X+3)*15+Y+3] == turn && i_board[(X+4)*15+Y+4] == turn) &&
            (i_board[(X+2)*15+Y+2] == l))
            valid[pointer][offset +68] = 1;
        else
            valid[pointer][offset +68] = 0;
    // .Al.. , 45
        if ((X < 12 && X > 0 && Y < 12 && Y > 0) &&
            (i_board[(X-1)*15+Y-1] == turn && i_board[(X+2)*15+Y+2] == turn && i_board[(X+3)*15+Y+3] == turn) &&
            (i_board[(X+1)*15+Y+1] == l))
            valid[pointer][offset +69] = 1;
        else
            valid[pointer][offset +69] = 0;
    // ..lA. , 225
        if ((X < 14 && X > 2 && Y < 14 && Y > 2) &&
            (i_board[(X-3)*15+Y-3] == turn && i_board[(X-2)*15+Y-2] == turn && i_board[(X+1)*15+Y+1] == turn) &&
            (i_board[(X-1)*15+Y-1] == l))
            valid[pointer][offset +70] = 1;
        else
            valid[pointer][offset +70] = 0;
    // ..l.A , 225
        if ((X > 3 &&  Y > 3) &&
            (i_board[(X-4)*15+Y-4] == turn && i_board[(X-3)*15+Y-3] == turn && i_board[(X-1)*15+Y-1] == turn) &&
            (i_board[(X-2)*15+Y-2] == l))
            valid[pointer][offset +71] = 1;
        else
            valid[pointer][offset +71] = 0;

    // A.l.. , 90
        if ((Y < 11) &&
            (i_board[X*15+Y+1] == turn && i_board[X*15+Y+3] == turn && i_board[X*15+Y+4] == turn) &&
            (i_board[X*15+Y+2] == l))
            valid[pointer][offset +72] = 1;
        else
            valid[pointer][offset +72] = 0;
    // .Al.. , 90
        if ((Y < 12 && Y > 0) &&
            (i_board[X*15+Y-2] == turn && i_board[X*15+Y+1] == turn && i_board[X*15+Y+2] == turn) &&
            (i_board[X*15+Y-1] == l))
            valid[pointer][offset +73] = 1;
        else
            valid[pointer][offset +73] = 0;
    // ..lA. , 270
        if ((Y < 14 && Y > 2) &&
            (i_board[X*15+Y-3] == turn && i_board[X*15+Y-2] == turn && i_board[X*15+Y+1] == turn) &&
            (i_board[X*15+Y-1] == l))
            valid[pointer][offset +74] = 1;
        else
            valid[pointer][offset +74] = 0;
    // ..l.A , 270
        if ((Y < 15 && Y > 3) &&
            (i_board[X*15+Y-4] == turn && i_board[X*15+Y-3] == turn && i_board[X*15+Y-1] == turn) &&
            (i_board[X*15+Y-2] == l))
            valid[pointer][offset +75] = 1;
        else
            valid[pointer][offset +75] = 0;

    // A.l.. , 315
        if ((X < 11 && Y > 3) &&
            (i_board[(X+1)*15+Y-1] == turn && i_board[(X+3)*15+Y-3] == turn && i_board[(X+4)*15+Y-4] == turn) &&
            (i_board[(X+2)*15+Y-2] == l))
            valid[pointer][offset +76] = 1;
        else
            valid[pointer][offset +76] = 0;
    // .Al.. , 315
        if ((X < 12 && X > 0 && Y < 14 && Y > 2) &&
            (i_board[(X-1)*15+Y+1] == turn && i_board[(X+2)*15+Y-2] == turn && i_board[(X+3)*15+Y-3] == turn) &&
            (i_board[(X+1)*15+Y-1] == l))
            valid[pointer][offset +77] = 1;
        else
            valid[pointer][offset +77] = 0;
    // ..lA. , 135
        if ((X < 14 && X > 2 && Y < 12 && Y > 2) &&
            (i_board[(X-3)*15+Y+3] == turn && i_board[(X-2)*15+Y+2] == turn && i_board[(X+1)*15+Y+1] == turn) &&
            (i_board[(X-1)*15+Y+1] == l))
            valid[pointer][offset +78] = 1;
        else
            valid[pointer][offset +78] = 0;
    // ..l.A , 135
        if ((X > 3 && Y < 11) &&
            (i_board[(X-4)*15+Y+4] == turn && i_board[(X-3)*15+Y+3] == turn && i_board[(X-1)*15+Y+1] == turn) &&
            (i_board[(X-2)*15+Y+2] == l))
            valid[pointer][offset +79] = 1;
        else
            valid[pointer][offset +79] = 0;

        assign check = i_board[X * 15 + Y][1] & (valid[pointer][offset] | valid[pointer][offset + 1] | valid[pointer][offset + 2] | valid[pointer][offset + 3]
     | valid[pointer][offset + 4] | valid[pointer][offset + 5] | valid[pointer][offset + 6] | valid[pointer][offset + 7]
      | valid[pointer][offset + 8] | valid[pointer][offset + 9] | valid[pointer][offset + 10] | valid[pointer][offset + 11]
       | valid[pointer][offset + 12] | valid[pointer][offset + 13] | valid[pointer][offset + 14] | valid[pointer][offset + 15]
        | valid[pointer][offset + 16] | valid[pointer][offset + 17] | valid[pointer][offset + 18] | valid[pointer][offset + 19]
         | valid[pointer][offset + 20] | valid[pointer][offset + 21] | valid[pointer][offset + 22] | valid[pointer][offset + 23]
          | valid[pointer][offset + 24] | valid[pointer][offset + 25] | valid[pointer][offset + 26] | valid[pointer][offset + 27]
           | valid[pointer][offset + 28] | valid[pointer][offset + 29] | valid[pointer][offset + 30] | valid[pointer][offset + 31]
            | valid[pointer][offset + 32] | valid[pointer][offset + 33] | valid[pointer][offset + 34] | valid[pointer][offset + 35]
             | valid[pointer][offset + 36] | valid[pointer][offset + 37] | valid[pointer][offset + 38] | valid[pointer][offset + 39]
              | valid[pointer][offset + 40] | valid[pointer][offset + 41] | valid[pointer][offset + 42] | valid[pointer][offset + 43]
               | valid[pointer][offset + 44] | valid[pointer][offset + 45] | valid[pointer][offset + 46] | valid[pointer][offset + 47]
                | valid[pointer][offset + 48] | valid[pointer][offset + 49] | valid[pointer][offset + 50] | valid[pointer][offset + 51]
                 | valid[pointer][offset + 52] | valid[pointer][offset + 53] | valid[pointer][offset + 54] | valid[pointer][offset + 55]
                  | valid[pointer][offset + 56] | valid[pointer][offset + 57] | valid[pointer][offset + 58] | valid[pointer][offset + 59]
                   | valid[pointer][offset + 60] | valid[pointer][offset + 61] | valid[pointer][offset + 62] | valid[pointer][offset + 63]
                    | valid[pointer][offset + 64] | valid[pointer][offset + 65] | valid[pointer][offset + 66] | valid[pointer][offset + 67]
                     | valid[pointer][offset + 68] | valid[pointer][offset + 69] | valid[pointer][offset + 70] | valid[pointer][offset + 71]
                      | valid[pointer][offset + 72] | valid[pointer][offset + 73] | valid[pointer][offset + 74] | valid[pointer][offset + 75]
                       | valid[pointer][offset + 76] | valid[pointer][offset + 77] | valid[pointer][offset + 78] | valid[pointer][offset + 79]);
endtask

task Offense_live_four(
    input   [3:0] X,
    input   [3:0] Y,
    input   [1:0] turn,
    input   [7:0] offset,
    output  check 
);
// live four first condition 
    // lA...l ,0
        if ((X < 11 ) && 
            (i_board[(X+1)*15+Y] == turn && i_board[(X+2)*15+Y] == turn && i_board[(X+3)*15+Y] == turn ) &&
            (i_board[(X+4)*15+Y] == l && i_board[(X-1)*15+Y] == l))
            valid[pointer][offset +0] = 1;
        else
            valid[pointer][offset +0] = 0;
    // lA...l ,45
       if ((X < 11 && Y < 11 ) && 
           (i_board[(X+1)*15+Y+1] == turn && i_board[(X+2)*15+Y+2] == turn && i_board[(X+3)*15+Y+3] == turn ) &&
           (i_board[(X+4)*15+Y+4] == l && i_board[(X-1)*15+Y-1] == l))
           valid[pointer][offset +1] = 1;
       else
           valid[pointer][offset +1] = 0;
    // lA...l ,90
        if ((Y < 11 ) && 
            (i_board[X*15+Y+1] == turn && i_board[X*15+Y+2] == turn && i_board[X*15+Y+3] == turn ) &&
            (i_board[X*15+Y+4] == l && i_board[X*15+Y-1] == l))
            valid[pointer][offset +2] = 1;
        else
            valid[pointer][offset +2] = 0;
    // lA...l ,135
        if ((X > 3 && Y < 11 ) && 
            (i_board[(X-1)*15+Y+1] == turn && i_board[(X-2)*15+Y+2] == turn && i_board[(X-3)*15+Y+3] == turn ) &&
            (i_board[(X-4)*15+Y+4] == l && i_board[(X+1)*15+Y-1] == l))
            valid[pointer][offset +3] = 1;
        else
            valid[pointer][offset +3] = 0;
    // lA...l ,180
        if ((X > 3 && X < 14 ) && 
            (i_board[(X-1)*15+Y] == turn && i_board[(X-2)*15+Y] == turn && i_board[(X-3)*15+Y] == turn ) &&
            (i_board[(X-4)*15+Y] == l && i_board[(X+1)*15+Y] == l))
            valid[pointer][offset +4] = 1;
        else
            valid[pointer][offset +4] = 0;
    // lA...l ,225
        if ((X > 3 && Y > 3) && 
            (i_board[(X-1)*15+Y-1] == turn && i_board[(X-2)*15+Y-2] == turn && i_board[(X-3)*15+Y-3] == turn ) &&
            (i_board[(X-4)*15+Y-4] == l && i_board[(X+1)*15+Y+1] == l))
            valid[pointer][offset +5] = 1;
        else
            valid[pointer][offset +5] = 0;
    // lA...l ,270
        if ((Y > 3) && 
            (i_board[X*15+Y-1] == turn && i_board[X*15+Y-2] == turn && i_board[X*15+Y-3] == turn ) &&
            (i_board[X*15+Y-4] == l && i_board[X*15+Y+1] == l))
            valid[pointer][offset +6] = 1;
        else
            valid[pointer][offset +6] = 0;
    // lA...l ,315
        if ((X < 11 && Y > 3 ) && 
            (i_board[(X+1)*15+Y-1] == turn && i_board[(X+2)*15+Y-2] == turn && i_board[(X+3)*15+Y-3] == turn ) &&
            (i_board[(X+4)*15+Y-4] == l && i_board[(X-1)*15+Y+1] == l))
            valid[pointer][offset +7] = 1;
        else
            valid[pointer][offset +7] = 0;

// live four second condition 
    // l.A..l ,0
        if ((X < 11 && X > 1) && 
            (i_board[(X-1)*15+Y] == turn && i_board[(X+1)*15+Y] == turn && i_board[(X+2)*15+Y] == turn ) &&
            (i_board[(X+3)*15+Y] == l && i_board[(X-2)*15+Y] == l))
            valid[pointer][offset +8] = 1;
        else
            valid[pointer][offset +8] = 0;
    // l.A..l ,45
        if ((X < 12 && Y < 12 && X > 1 && Y > 1) && 
            (i_board[(X+1)*15+Y+1] == turn && i_board[(X+2)*15+Y+2] == turn && i_board[(X-1)*15+Y-1] == turn ) &&
            (i_board[(X+3)*15+Y+3] == l && i_board[(X-2)*15+Y-2] == l))
            valid[pointer][offset +9] = 1;
        else
            valid[pointer][offset +9] = 0;
    // l.A..l ,90
        if ((Y < 12 && Y > 2 ) && 
            (i_board[X*15+Y-1] == turn && i_board[X*15+Y+1] == turn && i_board[X*15+Y+2] == turn ) &&
            (i_board[X*15+Y+3] == l && i_board[X*15+Y-2] == l))
            valid[pointer][offset +10] = 1;
        else
            valid[pointer][offset +10] = 0;
    // l.A..l ,135
        if ((X > 2 &&  X < 13 && Y < 12 && Y > 1) && 
            (i_board[(X-1)*15+Y+1] == turn && i_board[(X-2)*15+Y+2] == turn && i_board[(X+1)*15+Y-1] == turn ) &&
            (i_board[(X-3)*15+Y+3] == l && i_board[(X+2)*15+Y-2] == l))
            valid[pointer][offset +11] = 1;
        else
            valid[pointer][offset +11] = 0;
    // l.A..l ,180
        if ((X > 2 && X < 13 ) && 
            (i_board[(X+1)*15+Y] == turn && i_board[(X-1)*15+Y] == turn && i_board[(X-2)*15+Y] == turn ) &&
            (i_board[(X-3)*15+Y] == l && i_board[(X+2)*15+Y] == l))
            valid[pointer][offset +12] = 1;
        else
            valid[pointer][offset +12] = 0;
    // l.A..l ,225
        if ((X > 3 && Y > 3) && 
            (i_board[(X-1)*15+Y-1] == turn && i_board[(X+1)*15+Y+1] == turn && i_board[(X+2)*15+Y+2] == turn ) &&
            (i_board[(X-3)*15+Y-3] == l && i_board[(X+2)*15+Y+2] == l))
            valid[pointer][offset +13] = 1;
        else
            valid[pointer][offset +13] = 0;
    // l.A..l ,270
        if ((Y > 2 && Y < 13) && 
            (i_board[X*15+Y+1] == turn && i_board[X*15+Y-1] == turn && i_board[X*15+Y-2] == turn ) &&
            (i_board[X*15+Y-3] == l && i_board[X*15+Y+2] == l))
            valid[pointer][offset +14] = 1;
        else
            valid[pointer][offset +14] = 0;
    // l.A..l ,315
        if ((X < 12 && X > 1 && Y < 13 && Y > 2 ) && 
            (i_board[(X-1)*15+Y+1] == turn && i_board[(X+1)*15+Y-1] == turn && i_board[(X+2)*15+Y-2] == turn ) &&
            (i_board[(X+3)*15+Y-3] == l && i_board[(X-2)*15+Y+2] == l))
            valid[pointer][offset +15] = 1;
        else
            valid[pointer][offset +15] = 0;


    assign check = i_board[X * 15 + Y][1] & (valid[pointer][offset] | valid[pointer][offset + 1] | valid[pointer][offset + 2] | valid[pointer][offset + 3]
     | valid[pointer][offset + 4] | valid[pointer][offset + 5] | valid[pointer][offset + 6] | valid[pointer][offset + 7]
      | valid[pointer][offset + 8] | valid[pointer][offset + 9] | valid[pointer][offset + 10] | valid[pointer][offset + 11]
       | valid[pointer][offset + 12] | valid[pointer][offset + 13] | valid[pointer][offset + 14] | valid[pointer][offset + 15]);
endtask

task Defense_three(
    input [3:0] X,
    input [3:0] Y,
    input [1:0] turn,
    input [7:0] offset,
    output check
);
    // A o o o *  45
    if(X + 4 < 15 && Y + 4 < 15 && 
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[(X + 4) * 15 + (Y + 4)] == l)
        valid[pointer][offset] = 1;
    else
        valid[pointer][offset] = 0;
    // A o * o o *  45
    if(X + 5 < 15 && Y + 5 < 15 && 
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y + 2)] == l && 
        i_board[(X + 3) * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[(X + 4) * 15 + (Y + 4)] == {turn[1], ~turn[0]} && 
        i_board[(X + 5) * 15 + (Y + 5)] == l)
        valid[pointer][offset + 1] = 1;
    else
        valid[pointer][offset + 1] = 0;
    // A o o * o *  45
    if(X + 5 < 15 && Y + 5 < 15 && 
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + (Y + 3)] == l && 
        i_board[(X + 4) * 15 + (Y + 4)] == {turn[1], ~turn[0]} && 
        i_board[(X + 5) * 15 + (Y + 5)] == l)
        valid[pointer][offset + 2] = 1;
    else
        valid[pointer][offset + 2] = 0;
    // * o A o o *  45
    if(X + 3 < 15 && X - 2 >= 0 && Y + 3 < 15 && Y - 2 >= 0 && 
        i_board[(X - 2) * 15 + (Y - 2)] == l && 
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + (Y + 3)] == l)
        valid[pointer][offset + 3] = 1; 
    else
        valid[pointer][offset + 3] = 0;

    // A o o o *  90
    if(Y + 4 < 15 && 
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 4)] == l)
        valid[pointer][offset + 4] = 1;
    else
        valid[pointer][offset + 4] = 0;
    // A o * o o *  90
    if(Y + 5 < 15 && 
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 2)] == l && 
        i_board[X * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 4)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 5)] == l)
        valid[pointer][offset + 5] = 1;
    else
        valid[pointer][offset + 5] = 0;
    // A o o * o *  90
    if(Y + 5 < 15 && 
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 3)] == l && 
        i_board[X * 15 + (Y + 4)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 5)] == l)
        valid[pointer][offset + 6] = 1;
    else
        valid[pointer][offset + 6] = 0;
    // * o A o o *  90
    if(Y + 3 < 15 && Y - 2 >= 0 && 
        i_board[X * 15 + (Y - 2)] == l && 
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 3)] == l)
        valid[pointer][offset + 7] = 1; 
    else
        valid[pointer][offset + 7] = 0;

    // A o o o *  135
    if(X - 4 >= 0 && Y + 4 < 15 && 
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + (Y + 4)] == l)
        valid[pointer][offset + 8] = 1;
    else
        valid[pointer][offset + 8] = 0;
    // A o * o o *  135
    if(X - 5 < 15 && Y + 5 < 15 && 
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y + 2)] == l && 
        i_board[(X - 3) * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + (Y + 4)] == {turn[1], ~turn[0]} && 
        i_board[(X - 5) * 15 + (Y + 5)] == l)
        valid[pointer][offset + 9] = 1;
    else
        valid[pointer][offset + 9] = 0;
    // A o o * o *  135
    if(X - 5 < 15 && Y + 5 < 15 && 
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + (Y + 3)] == l && 
        i_board[(X - 4) * 15 + (Y + 4)] == {turn[1], ~turn[0]} && 
        i_board[(X - 5) * 15 + (Y + 5)] == l)
        valid[pointer][offset + 10] = 1;
    else
        valid[pointer][offset + 10] = 0;
    // * o A o o *  135
    if(X + 2 < 15 && X - 3 >= 0 && Y + 3 < 15 && Y - 2 >= 0 && 
        i_board[(X + 2) * 15 + (Y - 2)] == l && 
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + (Y + 3)] == l)
        valid[pointer][offset + 11] = 1; 
    else
        valid[pointer][offset + 11] = 0;
    
    // A o o o *  180
    if(X - 4 >= 0 && 
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + Y] == l)
        valid[pointer][offset + 12] = 1;
    else
        valid[pointer][offset + 12] = 0;
    // A o * o o *  180
    if(X - 5 >= 0 &&
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + Y] == l && 
        i_board[(X - 3) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 5) * 15 + Y] == l)
        valid[pointer][offset + 13] = 1;
    else
        valid[pointer][offset + 13] = 0;
    // A o o * o *  180
    if(X - 5 >= 0 && 
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + Y] == l && 
        i_board[(X - 4) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 5) * 15 + Y] == l)
        valid[pointer][offset + 14] = 1;
    else
        valid[pointer][offset + 14] = 0;
    // * o A o o *  180
    if(X + 2 < 15 && X - 3 >= 0 && 
        i_board[(X + 2) * 15 + Y] == l && 
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + Y] == l)
        valid[pointer][offset + 15] = 1; 
    else
        valid[pointer][offset + 15] = 0;

    // A o o o *  225
    if(X - 4 >= 0 && Y - 4 >= 0 && 
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + (Y - 4)] == l)
        valid[pointer][offset + 16] = 1;
    else
        valid[pointer][offset + 16] = 0;
    // A o * o o *  225
    if(X - 5 >= 0 && Y - 5 >= 0 && 
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y - 2)] == l && 
        i_board[(X - 3) * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + (Y - 4)] == {turn[1], ~turn[0]} && 
        i_board[(X - 5) * 15 + (Y - 5)] == l)
        valid[pointer][offset + 17] = 1;
    else
        valid[pointer][offset + 17] = 0;
    // A o o * o *  225
    if(X - 5 >= 0 && Y - 5 >= 0 && 
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + (Y - 3)] == l && 
        i_board[(X - 4) * 15 + (Y - 4)] == {turn[1], ~turn[0]} && 
        i_board[(X - 5) * 15 + (Y - 5)] == l)
        valid[pointer][offset + 18] = 1;
    else
        valid[pointer][offset + 18] = 0;
    // * o A o o *  225
    if(X + 2 < 15 && X - 3 >= 0 && Y + 2 < 15 && Y - 3 >= 0 && 
        i_board[(X + 2) * 15 + (Y + 2)] == l && 
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + (Y - 3)] == l)
        valid[pointer][offset + 19] = 1; 
    else
        valid[pointer][offset + 19] = 0;
    
    // A o o o *  270
    if(Y - 4 >= 0 && 
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 4)] == l)
        valid[pointer][offset + 20] = 1;
    else
        valid[pointer][offset + 20] = 0;
    // A o * o o *  270
    if(Y - 5 >= 0 && 
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 2)] == l && 
        i_board[X * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 4)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 5)] == l)
        valid[pointer][offset + 21] = 1;
    else
        valid[pointer][offset + 21] = 0;
    // A o o * o *  270
    if(Y - 5 >= 0 && 
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 3)] == l && 
        i_board[X * 15 + (Y - 4)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 5)] == l)
        valid[pointer][offset + 22] = 1;
    else
        valid[pointer][offset + 22] = 0;
    // * o A o o *  270
    if(Y + 2 < 15 && Y - 3 >= 0 && 
        i_board[X * 15 + (Y + 2)] == l && 
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 3)] == l)
        valid[pointer][offset + 23] = 1; 
    else
        valid[pointer][offset + 23] = 0;


    // A o o o *  315
    if(X + 4 < 15 && Y - 4 >= 0 && 
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[(X + 4) * 15 + (Y - 4)] == l)
        valid[pointer][offset + 24] = 1;
    else
        valid[pointer][offset + 24] = 0;
    // A o * o o *  315
    if(X + 5 < 15 && Y - 5 >= 0 && 
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y - 2)] == l && 
        i_board[(X + 3) * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[(X + 4) * 15 + (Y - 4)] == {turn[1], ~turn[0]} && 
        i_board[(X + 5) * 15 + (Y - 5)] == l)
        valid[pointer][offset + 25] = 1;
    else
        valid[pointer][offset + 25] = 0;
    // A o o * o *  315
    if(X + 5 < 15 && Y - 5 >= 0 && 
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + (Y - 3)] == l && 
        i_board[(X + 4) * 15 + (Y - 4)] == {turn[1], ~turn[0]} && 
        i_board[(X + 5) * 15 + (Y - 5)] == l)
        valid[pointer][offset + 26] = 1;
    else
        valid[pointer][offset + 26] = 0;
    // * o A o o *  315
    if(X + 3 < 15 && X - 2 >= 0 && Y + 2 < 15 && Y - 3 >= 0 && 
        i_board[(X - 2) * 15 + (Y + 2)] == l && 
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + (Y - 3)] == l)
        valid[pointer][offset + 27] = 1; 
    else
        valid[pointer][offset + 27] = 0;

    
    // A o o o *  0
    if(X + 4 < 15 && 
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 4) * 15 + Y] == l)
        valid[pointer][offset + 28] = 1;
    else
        valid[pointer][offset + 28] = 0;
    // A o * o o *  0
    if(X + 5 < 15 && 
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + Y] == l && 
        i_board[(X + 3) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 4) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 5) * 15 + Y] == l)
        valid[pointer][offset + 29] = 1;
    else
        valid[pointer][offset + 29] = 0;
    // A o o * o *  0
    if(X + 5 < 15 && 
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + Y] == l && 
        i_board[(X + 4) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 5) * 15 + Y] == l)
        valid[pointer][offset + 30] = 1;
    else
        valid[pointer][offset + 30] = 0;
    // * o A o o *  0
    if(X + 3 < 15 && X - 2 >= 0 && 
        i_board[(X - 2) * 15 + Y] == l && 
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + Y] == l)
        valid[pointer][offset + 31] = 1; 
    else
        valid[pointer][offset + 31] = 0;
    
    assign check = i_board[X * 15 + Y][1] & (valid[pointer][offset + 0] | valid[pointer][offset + 1] | valid[pointer][offset + 2] | valid[pointer][offset + 3] | valid[pointer][offset + 4]
     | valid[pointer][offset + 5] | valid[pointer][offset + 6] | valid[pointer][offset + 7] | valid[pointer][offset + 8] | valid[pointer][offset + 9]
      | valid[pointer][offset + 10] | valid[pointer][offset + 11] | valid[pointer][offset + 12] | valid[pointer][offset + 13] | valid[pointer][offset + 14]
       | valid[pointer][offset + 15] | valid[pointer][offset + 16] | valid[pointer][offset + 17] | valid[pointer][offset + 18] | valid[pointer][offset + 19]
        | valid[pointer][offset + 20] | valid[pointer][offset + 21] | valid[pointer][offset + 22] | valid[pointer][offset + 23] | valid[pointer][offset + 24]
         | valid[pointer][offset + 25] | valid[pointer][offset + 26] | valid[pointer][offset + 27] | valid[pointer][offset + 28] | valid[pointer][offset + 29]
          | valid[pointer][offset + 30] | valid[pointer][offset + 31]);
endtask



task Defense_four(
    input [3:0] X,
    input [3:0] Y,
    input [1:0] turn,
    input [7:0] offset,
    output check
);
    // A o o o o  45
    if(X + 4 < 15 && Y + 4 < 15 &&
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[(X + 4) * 15 + (Y + 4)] == {turn[1], ~turn[0]})
        valid[pointer][offset + 0] = 1;
    else
        valid[pointer][offset + 0] = 0;
    // o A o o o  45
    if(X - 1 >= 0 && X + 3 < 15 && Y - 1 >= 0 && Y + 3 < 15 &&
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} &&
        i_board[(X + 3) * 15 + (Y + 3)] == {turn[1], ~turn[0]})
        valid[pointer][offset + 1] = 1;
    else
        valid[pointer][offset + 1] = 0;
    // o o A o o  45
    if(X - 2 >= 0 && X + 2 < 15 && Y - 2 >= 0 && Y + 2 < 15 && 
        i_board[(X - 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]})
        valid[pointer][offset + 2] = 1;
    else
        valid[pointer][offset + 2] = 0;


    // A o o o o  90
    if(Y + 4 < 15 &&
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 4)] == {turn[1], ~turn[0]})
        valid[pointer][offset + 3] = 1;
    else
        valid[pointer][offset + 3] = 0;
    // o A o o o  90
    if(Y - 1 >= 0 && Y + 3 < 15 &&
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y + 2)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y + 3)] == {turn[1], ~turn[0]})
        valid[pointer][offset + 4] = 1;
    else
        valid[pointer][offset + 4] = 0;
    // o o A o o  90
    if(Y - 2 >= 0 && Y + 2 < 15 && 
        i_board[X * 15 + (Y - 2)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y + 2)] == {turn[1], ~turn[0]})
        valid[pointer][offset + 5] = 1;
    else
        valid[pointer][offset + 5] = 0;


    // A o o o o  135
    if(X - 4 < 15 && Y + 4 < 15 &&
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + (Y + 4)] == {turn[1], ~turn[0]})
        valid[pointer][offset + 6] = 1;
    else
        valid[pointer][offset + 6] = 0;
    // o A o o o  135
    if(X - 3 >= 0 && X + 1 < 15 && Y - 1 >= 0 && Y + 3 < 15 &&
        i_board[(X - 3) * 15 + (Y + 3)] == {turn[1], ~turn[0]} &&
        i_board[(X - 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]})
        valid[pointer][offset + 7] = 1;
    else
        valid[pointer][offset + 7] = 0;
    // o o A o o  135
    if(X - 2 >= 0 && X + 2 < 15 && Y - 2 >= 0 && Y + 2 < 15 && 
        i_board[(X - 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]})
        valid[pointer][offset + 8] = 1;
    else
        valid[pointer][offset + 8] = 0;


    // A o o o o  180
    if(X - 4 >= 0 &&
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + Y] == {turn[1], ~turn[0]})
        valid[pointer][offset + 9] = 1;
    else
        valid[pointer][offset + 9] = 0;
    // o A o o o  180
    if(X - 3 >= 0 && X + 1 < 15 &&
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X - 2) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X - 3) * 15 + Y] == {turn[1], ~turn[0]})
        valid[pointer][offset + 10] = 1;
    else
        valid[pointer][offset + 10] = 0;
    // o o A o o  180
    if(X - 2 >= 0 && X + 2 < 15 && 
        i_board[(X - 2) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + Y] == {turn[1], ~turn[0]})
        valid[pointer][offset + 11] = 1;
    else
        valid[pointer][offset + 11] = 0;


    // A o o o o  225
    if(X - 4 >= 0 && Y - 4 >= 0 &&
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + (Y - 4)] == {turn[1], ~turn[0]})
        valid[pointer][offset + 12] = 1;
    else
        valid[pointer][offset + 12] = 0;
    // o A o o o  225
    if(X - 3 >= 0 && X + 1 < 15 && Y - 3 >= 0 && Y + 1 < 15 &&
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[(X - 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} &&
        i_board[(X - 3) * 15 + (Y - 3)] == {turn[1], ~turn[0]})
        valid[pointer][offset + 13] = 1;
    else
        valid[pointer][offset + 13] = 0;
    // o o A o o  225
    if(X - 2 >= 0 && X + 2 < 15 && Y - 2 >= 0 && Y + 2 < 15 && 
        i_board[(X - 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]})
        valid[pointer][offset + 14] = 1;
    else
        valid[pointer][offset + 14] = 0;


    // A o o o o  270
    if(Y - 4 >= 0 &&
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 4)] == {turn[1], ~turn[0]})
        valid[pointer][offset + 15] = 1;
    else
        valid[pointer][offset + 15] = 0;
    // o A o o o  270
    if(Y - 3 >= 0 && Y + 1 < 15 &&
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y - 2)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y - 3)] == {turn[1], ~turn[0]})
        valid[pointer][offset + 16] = 1;
    else
        valid[pointer][offset + 16] = 0;
    // o o A o o  270
    if(Y - 2 >= 0 && Y + 2 < 15 && 
        i_board[X * 15 + (Y - 2)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y + 2)] == {turn[1], ~turn[0]})
        valid[pointer][offset + 17] = 1;
    else
        valid[pointer][offset + 17] = 0;



    // A o o o o  315
    if(X + 4 < 15 && Y - 4 >= 0 &&
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[(X + 4) * 15 + (Y - 4)] == {turn[1], ~turn[0]})
        valid[pointer][offset + 18] = 1;
    else
        valid[pointer][offset + 18] = 0;
    // o A o o o  315
    if(X - 1 >= 0 && X + 3 < 15 && Y - 3 >= 0 && Y + 1 < 15 &&
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} &&
        i_board[(X + 3) * 15 + (Y - 3)] == {turn[1], ~turn[0]})
        valid[pointer][offset + 19] = 1;
    else
        valid[pointer][offset + 19] = 0;
    // o o A o o  315
    if(X - 2 >= 0 && X + 2 < 15 && Y - 2 >= 0 && Y + 2 < 15 && 
        i_board[(X - 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]})
        valid[pointer][offset + 20] = 1;
    else
        valid[pointer][offset + 20] = 0;


    
    // A o o o o  0
    if(X + 4 < 15 &&
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 4) * 15 + Y] == {turn[1], ~turn[0]})
        valid[pointer][offset + 21] = 1;
    else
        valid[pointer][offset + 21] = 0;
    // o A o o o  0
    if(X - 1 >= 0 && X + 3 < 15 &&
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X + 3) * 15 + Y] == {turn[1], ~turn[0]})
        valid[pointer][offset + 22] = 1;
    else
        valid[pointer][offset + 22] = 0;
    // o o A o o  0
    if(X - 2 >= 0 && X + 2 < 15 && 
        i_board[(X - 2) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + Y] == {turn[1], ~turn[0]})
        valid[pointer][offset + 23] = 1;
    else
        valid[pointer][offset + 23] = 0;
    
    assign check = i_board[X * 15 + Y][1] & (valid[pointer][offset + 0] | valid[pointer][offset + 1] | valid[pointer][offset + 2] | valid[pointer][offset + 3] | valid[pointer][offset + 4]
     | valid[pointer][offset + 5] | valid[pointer][offset + 6] | valid[pointer][offset + 7] | valid[pointer][offset + 8] | valid[pointer][offset + 9]
      | valid[pointer][offset + 10] | valid[pointer][offset + 11] | valid[pointer][offset + 12] | valid[pointer][offset + 13] | valid[pointer][offset + 14]
       | valid[pointer][offset + 15] | valid[pointer][offset + 16] | valid[pointer][offset + 17] | valid[pointer][offset + 18] | valid[pointer][offset + 19]
        | valid[pointer][offset + 20] | valid[pointer][offset + 21] | valid[pointer][offset + 22] | valid[pointer][offset + 23]);
endtask

task Win(
    input [3:0] X,
    input [3:0] Y,
    input turn,
    output check
);
    if(i_board[X * 15 + Y][1] && ((X + 4 < 15 && Y + 4 < 15 && i_board[(X + 1) * 15 + (Y + 1)] == turn && i_board[(X + 2) * 15 + (Y + 2)] == turn && i_board[(X + 3) * 15 + (Y + 3)] == turn && i_board[(X + 4) * 15 + (Y + 4)] == turn) ||
        (Y + 4 < 15 && i_board[X * 15 + (Y + 1)] == turn && i_board[X * 15 + (Y + 2)] == turn && i_board[X * 15 + (Y + 3)] == turn && i_board[X * 15 + (Y + 4)] == turn) ||
        (X - 4 >= 0 && Y + 4 < 15 && i_board[(X - 1) * 15 + (Y + 1)] == turn && i_board[(X - 2) * 15 + (Y + 2)] == turn && i_board[(X - 3) * 15 + (Y + 3)] == turn && i_board[(X - 4) * 15 + (Y + 4)] == turn) ||
        (X - 4 >= 0 && i_board[(X - 1) * 15 + Y] == turn && i_board[(X - 2) * 15 + Y] == turn && i_board[(X - 3) * 15 + Y] == turn && i_board[(X - 4) * 15 + Y] == turn) ||
        (X - 4 >= 0 && Y - 4 >= 0 && i_board[(X - 1) * 15 + (Y - 1)] == turn && i_board[(X - 2) * 15 + (Y - 2)] == turn && i_board[(X - 3) * 15 + (Y - 3)] == turn && i_board[(X - 4) * 15 + (Y - 4)] == turn) || 
        (Y - 4 >= 0 && i_board[X * 15 + (Y - 1)] == turn && i_board[X * 15 + (Y - 2)] == turn && i_board[X * 15 + (Y - 3)] == turn && i_board[X * 15 + (Y - 4)] == turn) ||
        (X + 4 < 15 && Y - 4 >= 0 && i_board[(X + 1) * 15 + (Y - 1)] == turn && i_board[(X + 2) * 15 + (Y - 2)] == turn && i_board[(X + 3) * 15 + (Y - 3)] == turn && i_board[(X + 4) * 15 + (Y - 4)] == turn) ||
        (X + 4 < 15 && i_board[(X + 1) * 15 + Y] == turn && i_board[(X + 2) * 15 + Y] == turn && i_board[(X + 3) * 15 + Y] == turn && i_board[(X + 4) * 15 + Y] == turn) ||
        
        (X + 3 < 15 && Y + 3 < 15 && X - 1 >= 0 && Y - 1 >= 0 && i_board[(X - 1) * 15 + (Y - 1)] == turn && i_board[(X + 1) * 15 + (Y + 1)] == turn && i_board[(X + 2) * 15 + (Y + 2)] == turn && i_board[(X + 3) * 15 + (Y + 3)] == turn) || 
        (Y + 3 < 15 && Y - 1 >= 0 && i_board[X * 15 + (Y - 1)] == turn && i_board[X * 15 + (Y + 1)] == turn && i_board[X * 15 + (Y + 2)] == turn && i_board[X * 15 + (Y + 3)] == turn) ||
        (X + 1 < 15 && X - 3 >= 0 && Y - 1 >= 0 && Y + 3 < 15 && i_board[(X + 1) * 15 + (Y - 1)] == turn && i_board[(X - 1) * 15 + (Y + 1)] == turn && i_board[(X - 2) * 15 + (Y + 2)] == turn && i_board[(X - 3) * 15 + (Y + 3)] == turn) ||
        (X - 3 >= 0 && X + 1 < 15 && i_board[(X - 3) * 15 + Y] == turn && i_board[(X - 2) * 15 + Y] == turn && i_board[(X - 1) * 15 + Y] == turn && i_board[(X + 1) * 15 + Y] == turn) || 
        (X - 3 >= 0 && X + 1 < 15 && Y - 3 >= 0 && Y + 1 < 15 && i_board[(X - 3) * 15 + (Y - 3)] == turn && i_board[(X - 2) * 15 + (Y - 2)] == turn && i_board[(X - 1) * 15 + (Y - 1)] == turn && i_board[(X + 1) * 15 + (Y + 1)] == turn) ||
        (Y - 3 >= 0 && Y + 1 < 15 && i_board[X * 15 + (Y - 3)] == turn && i_board[X * 15 + (Y - 2)] == turn && i_board[X * 15 + (Y - 1)] == turn && i_board[X * 15 + (Y + 1)] == turn) ||
        (X + 3 < 15 && X - 1 >= 0 && Y - 3 >= 0 && Y + 1 < 15 && i_board[(X - 1) * 15 + (Y + 1)] == turn && i_board[(X + 1) * 15 + (Y - 1)] == turn && i_board[(X + 2) * 15 + (Y - 2)] == turn && i_board[(X + 3) * 15 + (Y - 3)] == turn) ||
        (X + 3 < 15 && X - 1 >= 0 && i_board[(X - 1) * 15 + Y] == turn && i_board[(X + 1) * 15 + Y] == turn && i_board[(X + 2) * 15 + Y] == turn && i_board[(X + 3) * 15 + Y] == turn) ||

        (X + 2 < 15 && X - 2 >= 0 && Y + 2 < 15 && Y - 2 >= 0 && i_board[(X - 2) * 15 + (Y - 2)] == turn && i_board[(X - 1) * 15 + (Y - 1)] == turn && i_board[(X + 1) * 15 + (Y + 1)] == turn && i_board[(X + 2) * 15 + (Y + 2)] == turn) ||
        (Y - 2 >= 0 && Y + 2 < 15 && i_board[X * 15 + (Y - 2)] == turn && i_board[X * 15 + (Y - 1)] == turn && i_board[X * 15 + (Y + 1)] == turn && i_board[X * 15 + (Y + 2)] == turn) ||
        (X + 2 < 15 && X - 2 >= 0 && Y + 2 < 15 && Y - 2 >= 0 && i_board[(X - 2) * 15 + (Y + 2)] == turn && i_board[(X - 1) * 15 + (Y + 1)] == turn && i_board[(X + 1) * 15 + (Y - 1)] == turn && i_board[(X + 2) * 15 + (Y - 2)] == turn) ||
        (X + 2 < 15 && X - 2 >= 0 && i_board[(X - 2) * 15 + Y] == turn && i_board[(X - 1) * 15 + Y] == turn && i_board[(X + 1) * 15 + Y] == turn && i_board[(X + 2) * 15 + Y] == turn)
    ))
        check = 1;
    else
        check = 0;
endtask

always_comb begin
    for(int i = 0; i < 16; i++) begin
        pointer_four_w[i] = pointer_four_r;
        pointer_normal_w[i] = pointer_normal_r;
        pointer_three_w[i] = pointer_three_r;    
    end
    state_w                 = state_r;
    finish_w                = finish_r;

    final_win_w             = final_win_r;
    normal_X_w              = normal_X_r;
    normal_X_w              = normal_X_r;
    defense_four_X_w        = defense_four_X_r;
    defense_four_Y_w        = defense_four_Y_r;
    defense_three_X_w       = defense_three_X_r;
    defense_three_Y_w       = defense_three_Y_r;
    
    final_pointer_w         = final_pointer_r;
    final_X_w               = final_X_r;
    final_Y_w               = final_Y_r;
    case (state_r)
        S_IDLE: begin
            finish_w = 1'b0;
            if(i_start) begin
                state_w = S_COUNT;
                pointer_four_w = 9'd499;
                pointer_three_w = 9'd499;
                pointer_normal_w = 9'd499;
                win_w = 1'b0;
                cnt_w = 4'd0;
            end
        end
        S_COUNT: begin
            cnt_w = cnt_r + 4'd1;
            if(cnt_r == 15) begin
                state_w = S_IDLE;
                finish_w = 1'b1;
                if(pointer_four_r != 499) begin
                    final_pointer_w = pointer_four_r[15];
                    final_X_w = defense_four_X_r;
                    final_Y_w = defense_four_Y_r;
                end
                else if(pointer_four_r != 499) begin
                    final_pointer_w = pointer_three_r[15];
                    final_X_w = defense_three_X_r;
                    final_Y_w = defense_three_Y_r;
                end
                else begin
                    final_pointer_w = pointer_normal_r[15];
                    final_X_w = normal_X_r;
                    final_Y_w = normal_Y_r;
                end
            end
            else begin
                for(int i = 0; i < 15; i++) begin
                    Offense_live_three(.X(cnt_r), .Y(i[3:0]), .turn(i_turn), .pointer(i[3:0]), .offset(8'd0), .check(offense_livethree_w[i]));
                    Offense_blocked_four(.X(cnt_r), .Y(i[3:0]), .turn(i_turn), .pointer(i[3:0]), .offset(8'd36), .check(offense_blockedfour_w[i]));
                    Offense_live_four(.X(cnt_r), .Y(i[3:0]), .turn(i_turn), .pointer(i[3:0]), .offset(8'd116), .check(offense_livefour_w[i]));
                    
                    Defense_three(.X(cnt_r), .Y(i[3:0]), .turn(i_turn), .pointer(i[3:0]), .offset(8'd132), .check(defense_livethree_w[i]));
                    Defense_four(.X(cnt_r), .Y(i[3:0]), .turn(i_turn), .pointer(i[3:0]), .offset(8'd164), .check(defense_blockedfour_w[i]));
                    Win(.X(cnt_r), .Y(i[3:0]), .turn(i_turn), .check(win_w[i]));

                    // default 
                    pointer_three_w[i + 1]  = pointer_three_w[i];
                    pointer_four_w[i + 1]   = pointer_three_w[i];
                    pointer_normal_w[i + 1] = pointer_normal_w[i];
                    
                    if(defense_blockedfour_w[i]) begin
                        defense_four_X_w[pointer_four_w[i] -: 4] = cnt_r;
                        defense_four_Y_w[pointer_four_w[i] -: 4] = i[3:0];
                        pointer_four_w[i + 1] = pointer_four_w[i] - 9'd4;
                    end
                    if(defense_livethree_w[i] || offense_blockedfour_w[i]) begin
                        defense_three_X_w[pointer_three_w[i] -: 4] = cnt_r;
                        defense_three_Y_w[pointer_three_w[i] -: 4] = i[3:0];
                        pointer_three_w[i + 1] = pointer_three_w[i] - 9'd4;
                    end
                    if(offense_blockedfour_w[i] || offense_livefour_w[i] || offense_livethree_w[i]) begin
                        normal_X_w[pointer_normal_w[i] -: 4] = cnt_r;
                        normal_X_w[pointer_normal_w[i] -: 4] = i[3:0];
                        pointer_normal_w[i + 1] = pointer_normal_w[i] - 9'd4;
                    end
                end
                final_win_w = final_win_r | win_w[0] | win_w[1] | win_w[2] | win_w[3] | win_w[4] | win_w[5] | win_w[6] | win_w[7]
                    | win_w[8] | win_w[9] | win_w[10] | win_w[11] | win_w[12] | win_w[13] | win_w[14];
            end
        end
    endcase
end

always_ff @(posedge i_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        pointer_four_r          <= 9'd0;
        pointer_normal_r        <= 9'd0;
        pointer_three_r         <= 9'd0;    
        state_r                 <= S_IDLE;
        finish_r                <= 1'b0;
        final_win_r             <= 1'b0;
        normal_X_r              <= 500'd0;
        defense_four_X_r        <= 500'd0;
        defense_four_Y_r        <= 500'd0;
        defense_three_X_r       <= 500'd0;
        defense_three_Y_r       <= 500'd0;
        final_pointer_r         <= 9'd0;
        final_X_r               <= 500'd0;
        final_Y_r               <= 500'd0;
    end
    else begin
        pointer_four_r          <= pointer_four_w[15];
        pointer_normal_r        <= pointer_normal_w[15];
        pointer_three_r         <= pointer_three_w[15];    
        state_r                 <= state_w;
        finish_r                <= finish_w;
        final_win_r                   <= win_w;
        normal_X_r              <= normal_X_w;
        normal_X_r              <= normal_X_w;
        defense_four_X_r        <= defense_four_X_w;
        defense_four_Y_r        <= defense_four_Y_w;
        defense_three_X_r       <= defense_three_X_w;
        defense_three_Y_r       <= defense_three_Y_w;
        final_pointer_r         <= final_pointer_w;
        final_X_r               <= final_X_w;
        final_Y_r               <= final_Y_w;
    end
end
endmodule