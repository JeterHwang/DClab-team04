module Threats(
    input               i_clk,
	input               i_rst_n,
	input               i_start,
	input               i_turn,
    input     board     i_board,
    output   [999:0]     o_posX,
    output   [999:0]     o_posY,
    output   [9:0]      o_size,
    output              o_win,
    output              o_finish
);

parameter b         = 2'd0;
parameter w         = 2'd1;
parameter l         = 2'd2;

parameter S_IDLE    = 1'd0;
parameter S_COUNT   = 1'd1;

logic state_r, state_w;
logic finish_r, finish_w;
logic win_r, win_w;
logic [9:0] pointer[226];
logic [999:0] output_X;
logic [999:0] output_Y;

logic valid[15][15][225];
logic offense_livethree[15][15];
logic offense_livefour[15][15];
logic offense_blockedfour[15][15];
logic defense_blockedfour[15][15];
logic defense_livethree[15][15];
logic win[15][15];

logic blocked_four_threat;
logic live_three_threat;

assign o_posX   = output_X;
assign o_posY   = output_Y;
assign o_size   = pointer[225];
assign o_finish = finish_r;
assign o_win    = win_r;

task Offense_live_three(
    input   [3:0] X,
    input   [3:0] Y,
    input   [1:0] turn,
    input   [7:0] pointer,
    output  check 
);
    
// live threes
    // middle blank
    if(X < 13 && X >= 2 && Y < 13 && Y >= 2 && i_board[(X + 2) * 15 + (Y + 2)] == l && i_board[(X + 1) * 15 + (Y + 1)] == turn && i_board[(X - 1) * 15 + (Y - 1)] == turn && i_board[(X - 2) * 15 + (Y - 2)] == l)
        valid[X][Y][pointer + 0] = 1;
    else 
        valid[X][Y][pointer + 0] = 0;
    if(X < 13 && X >= 2 && i_board[(X + 2) * 15 + Y] == l && i_board[(X + 1) * 15 + Y] == turn && i_board[(X - 1) * 15 + Y] == turn && i_board[(X - 2) * 15 + Y] == l)
        valid[X][Y][pointer + 1] = 1;
    else
        valid[X][Y][pointer + 1] = 0;
    if(Y < 13 && Y >= 2 && i_board[X * 15 + (Y + 2)] == l && i_board[X * 15 + (Y + 1)] == turn && i_board[X * 15 + (Y - 1)] == turn && i_board[X * 15 + (Y - 2)] == l)
        valid[X][Y][pointer + 2] = 1;
    else
        valid[X][Y][pointer + 2] = 0;
    if(X < 13 && Y < 13 && X >= 2 && Y >= 2 && i_board[(X - 2) * 15 + (Y + 2)] == l && i_board[(X - 1) * 15 + (Y + 1)] == turn && i_board[(X + 1) * 15 + (Y - 1)] == turn && i_board[(X + 2) * 15 + (Y - 2)] == l)
        valid[X][Y][pointer + 3] = 1;
    else
        valid[X][Y][pointer + 3] = 0;
    
    // * x . . * 45  
    if(X < 12 && Y < 12 && X >= 1 && Y >= 1 && i_board[(X + 3) * 15 + (Y + 3)] == l && i_board[(X + 1) * 15 + (Y + 1)] == turn && i_board[(X + 2) * 15 + (Y + 2)] == turn && i_board[(X - 1) * 15 + (Y - 1)] == l)
        valid[X][Y][pointer + 4] = 1;
    else
        valid[X][Y][pointer + 4] = 0;
    // * x . . * 135  
    if(X < 14 && X >= 3 && i_board[(X - 3) * 15 + (Y - 3)] == l && i_board[(X - 2) * 15 + (Y - 2)] == turn && i_board[(X - 1) * 15 + (Y - 1)] == turn && i_board[(X + 1) * 15 + (Y + 1)] == l)
        valid[X][Y][pointer + 5] = 1;
    else
        valid[X][Y][pointer + 5] = 0;
    // * x . . * 315  
    if(X < 12 && X >= 1 && Y < 14 && Y >= 3 && i_board[(X + 1) * 15 + (Y - 1)] == turn && i_board[(X + 2) * 15 + (Y - 2)] == turn && i_board[(X + 3) * 15 + (Y - 3)] == l && i_board[(X - 1) * 15 + (Y + 1)] == l)
        valid[X][Y][pointer + 6] = 1;
    else
        valid[X][Y][pointer + 6] = 0;
    // * x . . * 225  
    if(X >= 3 && X < 14 && Y < 12 && Y >= 1 && i_board[(X - 3) * 15 + (Y + 3)] == l && i_board[(X - 1) * 15 + (Y + 1)] == turn && i_board[(X - 2) * 15 + (Y + 2)] == turn && i_board[(X + 1) * 15 + (Y - 1)] == l)
        valid[X][Y][pointer + 7] = 1;
    else
        valid[X][Y][pointer + 7] = 0;
    // * x . . * 0  
    if(X < 12 && X >= 1 && i_board[(X - 1) * 15 + Y] == l && i_board[(X + 1) * 15 + Y] == turn && i_board[(X + 2) * 15 + Y] == turn && i_board[(X + 3) * 15 + Y] == l)
        valid[X][Y][pointer + 8] = 1;
    else
        valid[X][Y][pointer + 8] = 0;
    // * x . . * 180  
    if(X >= 3 && X < 14 && i_board[(X + 1) * 15 + Y] == l && i_board[(X - 1) * 15 + Y] == turn && i_board[(X - 2) * 15 + Y] == turn && i_board[(X - 3) * 15 + Y] == l)
        valid[X][Y][pointer + 9] = 1;
    else
        valid[X][Y][pointer + 9] = 0;
    // * x . . * 90 
    if(Y < 12 && Y >= 1 && i_board[X * 15 + (Y - 1)] == l && i_board[X * 15 + (Y + 1)] == turn && i_board[X * 15 + (Y + 2)] == turn && i_board[X * 15 + (Y + 3)] == l)
        valid[X][Y][pointer + 10] = 1;
    else
        valid[X][Y][pointer + 10] = 0;
    // * x . . * 270  
    if(Y >= 3 && Y < 14 && i_board[X * 15 + (Y + 1)] == l && i_board[X * 15 + (Y - 1)] == turn && i_board[X * 15 + (Y - 2)] == turn && i_board[X * 15 + (Y - 3)] == l)
        valid[X][Y][pointer + 11] = 1;
    else
        valid[X][Y][pointer + 11] = 0;
    
    
    // * A . X . * 45
    if(X >= 1 && X < 11 && Y >= 1 && Y < 11 && i_board[(X - 1) * 15 + (Y - 1)] == l && i_board[(X + 1) * 15 + (Y + 1)] == turn && i_board[(X + 2) * 15 + (Y + 2)] == l && i_board[(X + 3) * 15 + (Y + 3)] == turn && i_board[(X + 4) * 15 + (Y + 4)])
        valid[X][Y][pointer + 12] = 1;
    else
        valid[X][Y][pointer + 12] = 0;
    // * A X . . * 45
    if(X >= 1 && X < 11 && Y >= 1 && Y < 11 && i_board[(X - 1) * 15 + (Y - 1)] == l && i_board[(X + 1) * 15 + (Y + 1)] == l && i_board[(X + 2) * 15 + (Y + 2)] == turn && i_board[(X + 3) * 15 + (Y + 3)] == turn && i_board[(X + 4) * 15 + (Y + 4)])
        valid[X][Y][pointer + 13] = 1;
    else
        valid[X][Y][pointer + 13] = 0;
    // * A . X . * 90
    if(Y >= 1 && Y < 11 && i_board[X * 15 + (Y - 1)] == l && i_board[X * 15 + (Y + 1)] == turn && i_board[X * 15 + (Y + 2)] == l && i_board[X * 15 + (Y + 3)] == turn && i_board[X * 15 + (Y + 4)] == l)
        valid[X][Y][pointer + 14] = 1;
    else
        valid[X][Y][pointer + 14] = 0;
    // * A X . . * 90
    if(Y >= 1 && Y < 11 && i_board[X * 15 + (Y - 1)] == l && i_board[X * 15 + (Y + 1)] == l && i_board[X * 15 + (Y + 2)] == turn && i_board[X * 15 + (Y + 3)] == turn && i_board[X * 15 + (Y + 4)] == l)
        valid[X][Y][pointer + 15] = 1;
    else
        valid[X][Y][pointer + 15] = 0;
    // * A . X . * 135
    if(X >= 4 && X < 14 && Y >= 1 && Y < 11 && i_board[(X + 1) * 15 + (Y - 1)] == l && i_board[(X - 1) * 15 + (Y + 1)] == turn && i_board[(X - 2) * 15 + (Y + 2)] == l && i_board[(X - 3) * 15 + (Y + 3)] == turn && i_board[(X - 4) * 15 + (Y + 4)] == l)
        valid[X][Y][pointer + 16] = 1;
    else
        valid[X][Y][pointer + 16] = 0;
    // * A X . . * 135
    if(X >= 4 && X < 14 && Y >= 1 && Y < 11 && i_board[(X + 1) * 15 + (Y - 1)] == l && i_board[(X - 1) * 15 + (Y + 1)] == l && i_board[(X - 2) * 15 + (Y + 2)] == turn && i_board[(X - 3) * 15 + (Y + 3)] == turn && i_board[(X - 4) * 15 + (Y + 4)] == l)
        valid[X][Y][pointer + 17] = 1;
    else
        valid[X][Y][pointer + 17] = 0;
    // * A . X . * 180
    if(X >= 4 && X < 14 && i_board[(X + 1) * 15 + Y] && i_board[(X - 1) * 15 + Y] == turn && i_board[(X - 2) * 15 + Y] == l && i_board[(X - 3) * 15 + Y] == turn && i_board[(X - 4) * 15 + Y] == l)
        valid[X][Y][pointer + 18] = 1;
    else
        valid[X][Y][pointer + 18] = 0;
    // * A X . . * 180
    if(X >= 4 && X < 14 && i_board[(X + 1) * 15 + Y] && i_board[(X - 1) * 15 + Y] == l && i_board[(X - 2) * 15 + Y] == turn && i_board[(X - 3) * 15 + Y] == turn && i_board[(X - 4) * 15 + Y] == l)
        valid[X][Y][pointer + 19] = 1;
    else
        valid[X][Y][pointer + 19] = 0;
    // * A . X . * 225
    if(X >= 4 && X < 14 && Y >= 4 && Y < 14 && i_board[(X + 1) * 15 + (Y + 1)] == l && i_board[(X - 1) * 15 + (Y - 1)] == turn && i_board[(X - 2) * 15 + (Y - 2)] == l && i_board[(X - 3) * 15 + (Y - 3)] == turn && i_board[(X - 4) * 15 + (Y - 4)] == l)
        valid[X][Y][pointer + 20] = 1;
    else
        valid[X][Y][pointer + 20] = 0;
    // * A X . . * 225
    if(X >= 4 && X < 14 && Y >= 4 && Y < 14 && i_board[(X + 1) * 15 + (Y + 1)] == l && i_board[(X - 1) * 15 + (Y - 1)] == l && i_board[(X - 2) * 15 + (Y - 2)] == turn && i_board[(X - 3) * 15 + (Y - 3)] == turn && i_board[(X - 4) * 15 + (Y - 4)] == l)
        valid[X][Y][pointer + 21] = 1;
    else
        valid[X][Y][pointer + 21] = 0;
    // * A . X . * 270
    if(Y >= 4 && Y < 14 && i_board[X * 15 + (Y + 1)] == l && i_board[X * 15 + (Y - 1)] == turn && i_board[X * 15 + (Y - 2)] == l && i_board[X * 15 + (Y - 3)] == turn && i_board[X * 15 + (Y -4)] == l)
        valid[X][Y][pointer + 22] = 1;
    else
        valid[X][Y][pointer + 22] = 0;
    // * A X . . * 270
    if(Y >= 4 && Y < 14 && i_board[X * 15 + (Y + 1)] == l && i_board[X * 15 + (Y - 1)] == l && i_board[X * 15 + (Y - 2)] == turn && i_board[X * 15 + (Y - 3)] == turn && i_board[X * 15 + (Y -4)] == l)
        valid[X][Y][pointer + 23] = 1;
    else
        valid[X][Y][pointer + 23] = 0;
    // * A . X . * 315
    if(Y >= 4 && Y < 14 && X < 11 && X >= 1 && i_board[(X - 1) * 15 + (Y + 1)] == l && i_board[(X + 1) * 15 + (Y - 1)] == turn && i_board[(X + 2) * 15 + (Y - 2)] == l && i_board[(X + 3) * 15 + (Y - 3)] == turn && i_board[(X + 4) * 15 + (Y - 4)] == l)
        valid[X][Y][pointer + 24] = 1;
    else
        valid[X][Y][pointer + 24] = 0;
    // * A X . . * 315
    if(Y >= 4 && Y < 14 && X < 11 && X >= 1 && i_board[(X - 1) * 15 + (Y + 1)] == l && i_board[(X + 1) * 15 + (Y - 1)] == l && i_board[(X + 2) * 15 + (Y - 2)] == turn && i_board[(X + 3) * 15 + (Y - 3)] == turn && i_board[(X + 4) * 15 + (Y - 4)] == l)    
        valid[X][Y][pointer + 25] = 1;
    else
        valid[X][Y][pointer + 25] = 0;
    // * A . X . * 0
    if(X >= 1 && X < 11 && i_board[(X - 1) * 15 + Y] == l && i_board[(X + 1) * 15 + Y] == turn && i_board[(X + 2) * 15 + Y] == l && i_board[(X + 3) * 15 + Y] == turn && i_board[(X + 4) * 15 + Y] == l)
        valid[X][Y][pointer + 26] = 1;
    else
        valid[X][Y][pointer + 26] = 0;
    // * A X . . * 0
    if(X >= 1 && X < 11 && i_board[(X - 1) * 15 + Y] == l && i_board[(X + 1) * 15 + Y] == l && i_board[(X + 2) * 15 + Y] == turn && i_board[(X + 3) * 15 + Y] == turn && i_board[(X + 4) * 15 + Y] == l)
        valid[X][Y][pointer + 27] = 1;
    else
        valid[X][Y][pointer + 27] = 0;

    // * . A X . * 45
    if(X >= 2 && X < 12 && Y >= 2 && Y < 12 && i_board[(X - 2) * 15 + (Y - 2)] == l && i_board[(X - 1) * 15 + (Y - 1)] == turn && i_board[(X + 1) * 15 + (Y + 1)] == l && i_board[(X + 2) * 15 + (Y + 2)] == turn && i_board[(X + 3) * 15 + (Y + 3)] == l)
        valid[X][Y][pointer + 28] = 1;
    else
        valid[X][Y][pointer + 28] = 0;
    // * . A X . * 90
    if(Y >= 2 && Y < 12 && i_board[X * 15 + (Y - 2)] == l && i_board[X * 15 + (Y - 1)] == turn && i_board[X * 15 + (Y + 1)] == l && i_board[X * 15 + (Y + 2)] == turn && i_board[X * 15 + (Y + 3)] == l)
        valid[X][Y][pointer + 29] = 1;
    else
        valid[X][Y][pointer + 29] = 0;
    // * . A X . * 135
    if(X < 13 && X >= 3 && Y >= 2 && X < 12 && i_board[(X + 2) * 15 + (Y - 2)] == l && i_board[(X + 1) * 15 + (Y - 1)] == turn && i_board[(X - 1) * 15 + (Y + 1)] == l && i_board[(X - 2) * 15 + (Y + 2)] == turn && i_board[(X - 3) * 15 + (Y + 3)] == l)
        valid[X][Y][pointer + 30] = 1;
    else
        valid[X][Y][pointer + 30] = 0;
    // * . A X . * 180
    if(X < 13 && X >= 3 && i_board[(X + 2) * 15 + Y] == l && i_board[(X + 1) * 15 + Y] == turn && i_board[(X - 1) * 15 + Y] == l && i_board[(X - 2) * 15 + Y] == turn && i_board[(X - 3) * 15 + Y] == l)
        valid[X][Y][pointer + 31] = 1;
    else
        valid[X][Y][pointer + 31] = 0;
    // * . A X . * 225
    if(X < 13 && X >= 3 && Y < 13 && Y >= 3 && i_board[(X + 2) * 15 + (Y + 2)] == l && i_board[(X + 1) * 15 + (Y + 1)] == turn && i_board[(X - 1) * 15 + (Y - 1)] == l && i_board[(X - 2) * 15 + (Y - 2)] == turn && i_board[(X - 3) * 15 + (Y - 3)] == l)
        valid[X][Y][pointer + 32] = 1;
    else
        valid[X][Y][pointer + 32] = 0;
    // * . A X . * 270
    if(Y < 13 && Y >= 3 && i_board[X * 15 + (Y + 2)] == l && i_board[X * 15 + (Y + 1)] == turn && i_board[X * 15 + (Y - 1)] == l && i_board[X * 15 + (Y - 2)] == turn && i_board[X * 15 + (Y - 3)] == l)
        valid[X][Y][pointer + 33] = 1;
    else
        valid[X][Y][pointer + 33] = 0;
    // * . A X . * 315
    if(X >= 2 && X < 12 && Y >= 3 && Y  < 13 && i_board[(X - 2) * 15 + (Y + 2)] == l && i_board[(X - 1) * 15 + (Y + 1)] == turn && i_board[(X + 1) * 15 + (Y - 1)] == l && i_board[(X + 2) * 15 + (Y - 2)] == turn && i_board[(X + 3) * 15 + (Y - 3)] == l)
        valid[X][Y][pointer + 34] = 1;
    else
        valid[X][Y][pointer + 34] = 0;
    // * . A X . * 0
    if(X < 13 && X >= 3 && i_board[(X - 2) * 15 + Y] == l && i_board[(X - 1) * 15 + Y] == turn && i_board[(X + 1) * 15 + Y] == l && i_board[(X + 2) * 15 + Y] == turn && i_board[(X + 3) * 15 + Y] == l)
        valid[X][Y][pointer + 35] = 1;
    else
        valid[X][Y][pointer + 35] = 0;

    assign check = i_board[X * 15 + Y][1] & (valid[X][Y][pointer] | valid[X][Y][pointer + 1] | valid[X][Y][pointer + 2] | valid[X][Y][pointer + 3]
     | valid[X][Y][pointer + 4] | valid[X][Y][pointer + 5] | valid[X][Y][pointer + 6] | valid[X][Y][pointer + 7]
      | valid[X][Y][pointer + 8] | valid[X][Y][pointer + 9] | valid[X][Y][pointer + 10] | valid[X][Y][pointer + 11]
       | valid[X][Y][pointer + 12] | valid[X][Y][pointer + 13] | valid[X][Y][pointer + 14] | valid[X][Y][pointer + 15]
        | valid[X][Y][pointer + 16] | valid[X][Y][pointer + 17] | valid[X][Y][pointer + 18] | valid[X][Y][pointer + 19]
         | valid[X][Y][pointer + 20] | valid[X][Y][pointer + 21] | valid[X][Y][pointer + 22] | valid[X][Y][pointer + 23]
          | valid[X][Y][pointer + 24] | valid[X][Y][pointer + 25] | valid[X][Y][pointer + 26] | valid[X][Y][pointer + 27]
           | valid[X][Y][pointer + 28] | valid[X][Y][pointer + 29] | valid[X][Y][pointer + 30] | valid[X][Y][pointer + 31]
            | valid[X][Y][pointer + 32] | valid[X][Y][pointer + 33] | valid[X][Y][pointer + 34] | valid[X][Y][pointer + 35]);


endtask


task Offense_blocked_four(
    input   [3:0] X,
    input   [3:0] Y,
    input   [1:0] turn,
    input   [7:0] pointer,
    output  check 
);
// blocked fours
    // lA...x ,0
    if((X < 11 &&  X > 0) && 
        (i_board[(X+1)*15 + Y] == turn &&  i_board[(X+2)*15 + Y] == turn  && i_board[(X+3)*15 + Y] == turn)  &&
        (i_board[(X+4)*15 + Y] == {turn[1],~turn[0]}) &&
        (i_board[(X-1)*15 + Y] == l))
        valid[X][Y][pointer + 0] = 1;
    else    
        valid[X][Y][pointer + 0] = 0;
    // l.A..x ,0
    if((X < 12 && X > 1) && 
        (i_board[(X+1)*15+Y] == turn &&  i_board[(X+2)*15+Y] == turn  && i_board[(X-1)*15+Y] == turn)  &&
        (i_board[(X+3)*15+Y] == {turn[1],~turn[0]}) &&
        (i_board[(X-2)*15+Y] == l))
        valid[X][Y][pointer + 1] = 1;
    else
        valid[X][Y][pointer + 1] = 0;
    // l..A.x ,0
    if((X < 13 && X > 2) && 
        (i_board[(X+1)*15+Y] == turn &&  i_board[(X-1)*15+Y] == turn  && i_board[(X-2)*15+Y] == turn)  &&
        (i_board[(X+2)*15+Y] == {turn[1],~turn[0]}) &&
        (i_board[(X-3)*15+Y] == l))
        valid[X][Y][pointer + 2] = 1;
    else
        valid[X][Y][pointer + 2] = 0;
    // l...Ax ,0
    if( (X < 14 && X > 3) && 
        (i_board[(X-1)*15+Y] == turn &&  i_board[(X-2)*15+Y] == turn  && i_board[(X-3)*15+Y] == turn)  &&
        (i_board[(X+1)*15+Y] == {turn[1],~turn[0]}) &&
        (i_board[(X-4)*15+Y] == l))
        valid[X][Y][pointer + 3] = 1;
    else
        valid[X][Y][pointer + 3] = 0;
    // lA ...x ,45
    if((X < 11 && Y < 11 && X > 0 && Y > 0) && 
        (i_board[(X+1)*15+(Y+1)] == turn &&  i_board[(X+2)*15+(Y+2)] == turn  && i_board[(X+3)*15+(Y+3)] == turn)  &&
        (i_board[(X+4)*15+(Y+4)] == {turn[1],~turn[0]}) &&
        (i_board[(X-1)*15+(Y-1)] == l))
        valid[X][Y][pointer + 4] = 1;
    else
        valid[X][Y][pointer + 4] = 0;
    // l.A..x ,45
    if((X < 12 && Y < 12 && X > 1 && Y > 1) && 
        (i_board[(X+1)*15+(Y+1)] == turn &&  i_board[(X+2)*15+(Y+2)] == turn  && i_board[(X-1)*15+(Y-1)] == turn)  &&
        (i_board[(X+3)*15+(Y+3)] == {turn[1],~turn[0]}) &&
        (i_board[(X-2)*15+(Y-2)] == l))
        valid[X][Y][pointer + 5] = 1;
    else
        valid[X][Y][pointer + 5] = 0;
    // l..A.x ,45
    if((X < 13 && Y < 13 && X > 2 && Y > 2) && 
        (i_board[(X+1)*15+(Y+1)] == turn &&  i_board[(X-2)*15+(Y-2)] == turn  && i_board[(X-1)*15+(Y-1)] == turn)  &&
        (i_board[(X+2)*15+(Y+2)] == {turn[1],~turn[0]}) &&
        (i_board[(X-3)*15+(Y-3)] == l))
        valid[X][Y][pointer + 6] = 1;
    else
        valid[X][Y][pointer + 6] = 0;
    // l...Ax ,45
    if( (X < 14 && Y < 14 && X > 3 && Y > 3) && 
        (i_board[(X-3)*15+(Y-3)] == turn &&  i_board[(X-2)*15+(Y-2)] == turn  && i_board[(X-1)*15+(Y-1)] == turn)  &&
        (i_board[(X+1)*15+(Y+1)] == {turn[1],~turn[0]}) &&
        (i_board[(X-4)*15+(Y-4)] == l))
        valid[X][Y][pointer + 7] = 1;
    else
        valid[X][Y][pointer + 7] = 0;
    // lA...x ,90
    if( (Y < 11 && Y > 0) && 
        (i_board[X*15+Y+1] == turn &&  i_board[X*15+Y+2] == turn  && i_board[X*15+Y+3] == turn)  &&
        (i_board[X*15+Y+4] == {turn[1],~turn[0]}) &&
        (i_board[X*15+Y-1] == l))
        valid[X][Y][pointer + 8] = 1;
    else
        valid[X][Y][pointer + 8] = 0;
    // l.A..x ,90
    if( (Y < 12 && Y > 1) && 
        (i_board[X*15+Y+1] == turn &&  i_board[X*15+Y+2] == turn  && i_board[X*15+Y-1] == turn)  &&
        (i_board[X*15+Y+3] == {turn[1],~turn[0]}) &&
        (i_board[X*15+Y-2] == l))
        valid[X][Y][pointer + 9] = 1;
    else
        valid[X][Y][pointer + 9] = 0;
    // l..A.x ,90
    if( (Y < 13 && Y > 2) && 
        (i_board[X*15+Y+1] == turn &&  i_board[X*15+Y-2] == turn  && i_board[X*15+Y-1] == turn)  &&
        (i_board[X*15+Y+2] == {turn[1],~turn[0]}) &&
        (i_board[X*15+Y-3] == l))
        valid[X][Y][pointer + 10] = 1;
    else
        valid[X][Y][pointer + 10] = 0;
    // l...Ax ,90
    if( (Y < 14 && Y > 3) && 
        (i_board[X*15+Y-3] == turn &&  i_board[X*15+Y-2] == turn  && i_board[X*15+Y-1] == turn)  &&
        (i_board[X*15+Y+1] == {turn[1],~turn[0]}) &&
        (i_board[X*15+(Y-4)] == l))
        valid[X][Y][pointer + 11] = 1;
    else
        valid[X][Y][pointer + 11] = 0;
    // x...Al ,135
    if((X < 14 && Y < 11 && X > 3 && Y > 0) && 
        (i_board[(X-1)*15+(Y+1)] == turn &&  i_board[(X-2)*15+(Y+2)] == turn  && i_board[(X-3)*15+(Y+3)] == turn)  &&
        (i_board[(X-4)*15+(Y+4)] == {turn[1],~turn[0]}) &&
        (i_board[(X+1)*15+(Y-1)] == l))
        valid[X][Y][pointer + 12] = 1;
    else
        valid[X][Y][pointer + 12] = 0;
    // x..A.l ,135
    if((X < 13 && Y < 12 && X > 2 && Y > 1) && 
        (i_board[(X-1)*15+(Y+1)] == turn &&  i_board[(X-2)*15+(Y+2)] == turn  && i_board[(X+1)*15+(Y-1)] == turn)  &&
        (i_board[(X-3)*15+(Y+3)] == {turn[1],~turn[0]}) &&
        (i_board[(X+2)*15+(Y-2)] == l))
        valid[X][Y][pointer + 13] = 1;
    else
        valid[X][Y][pointer + 13] = 0;
    // x.A..l ,135
    if((X < 12 && Y < 13 && X > 1 && Y > 2) && 
        (i_board[(X-1)*15+(Y+1)] == turn &&  i_board[(X+1)*15+(Y-1)] == turn  && i_board[(X+2)*15+(Y-2)] == turn)  &&
        (i_board[(X-2)*15+(Y+2)] == {turn[1],~turn[0]}) &&
        (i_board[(X+3)*15+(Y-3)] == l))
        valid[X][Y][pointer + 14] = 1;
    else
        valid[X][Y][pointer + 14] = 0;
    // xA...l ,135
    if( (X < 11 && Y < 14 && X > 0 && Y > 3) && 
        (i_board[(X+1)*15+(Y-1)] == turn &&  i_board[(X+2)*15+(Y-2)] == turn  && i_board[(X+3)*15+(Y-3)] == turn)  &&
        (i_board[(X-1)*15+(Y+1)] == {turn[1],~turn[0]}) &&
        (i_board[(X+4)*15+(Y-4)] == l))
        valid[X][Y][pointer + 15] = 1;
    else
        valid[X][Y][pointer + 15] = 0;
    // x...Al ,180
    if((X < 14 &&  X > 3) && 
        (i_board[(X-1)*15+Y] == turn &&  i_board[(X-2)*15+Y] == turn  && i_board[(X-3)*15+Y] == turn)  &&
        (i_board[(X-4)*15+Y] == {turn[1],~turn[0]}) &&
        (i_board[(X+1)*15+Y] == l))
        valid[X][Y][pointer + 16] = 1;
    else
        valid[X][Y][pointer + 16] = 0;
    // x..A.l ,180
    if((X < 13 && X > 2) && 
        (i_board[(X-1)*15+Y] == turn &&  i_board[(X-2)*15+Y] == turn  && i_board[(X+1)*15+Y] == turn)  &&
        (i_board[(X-3)*15+Y] == {turn[1],~turn[0]}) &&
        (i_board[(X+2)*15+Y] == l))
        valid[X][Y][pointer + 17] = 1;
    else
        valid[X][Y][pointer + 17] = 0;
    // x.A..l ,180
    if((X < 12 && X > 1) && 
        (i_board[(X-1)*15+Y] == turn &&  i_board[(X+1)*15+Y] == turn  && i_board[(X+2)*15+Y] == turn)  &&
        (i_board[(X-2)*15+Y] == {turn[1],~turn[0]}) &&
        (i_board[(X+3)*15+Y] == l))
        valid[X][Y][pointer + 18] = 1;
    else
        valid[X][Y][pointer + 18] = 0;
    // xA...l ,180
    if( (X < 11 && X > 0) && 
        (i_board[(X+1)*15+Y] == turn &&  i_board[(X+2)*15+Y] == turn  && i_board[(X+3)*15+Y] == turn)  &&
        (i_board[(X-1)*15+Y] == {turn[1],~turn[0]}) &&
        (i_board[(X+4)*15+Y] == l))
        valid[X][Y][pointer + 19] = 1;
    else
        valid[X][Y][pointer + 19] = 0;
    // x...Al ,225
    if((X < 14 && Y < 14 && X > 3 && Y > 3) && 
        (i_board[(X-1)*15+(Y-1)] == turn &&  i_board[(X-2)*15+(Y-2)] == turn  && i_board[(X-3)*15+(Y-3)] == turn)  &&
        (i_board[(X-4)*15+(Y-4)] == {turn[1],~turn[0]}) &&
        (i_board[(X+1)*15+(Y+1)] == l))
        valid[X][Y][pointer + 20] = 1;
    else
        valid[X][Y][pointer + 20] = 0;
    // x..A.l ,225
    if((X < 13 && Y < 13 && X > 2 && Y > 2) && 
        (i_board[(X-1)*15+(Y-1)] == turn &&  i_board[(X-2)*15+(Y-2)] == turn  && i_board[(X+1)*15+(Y+1)] == turn)  &&
        (i_board[(X-3)*15+(Y-3)] == {turn[1],~turn[0]}) &&
        (i_board[(X+2)*15+(Y+2)] == l))
        valid[X][Y][pointer + 21] = 1;
    else
        valid[X][Y][pointer + 21] = 0;
    // x.A..l ,225
    if((X < 12 && Y < 12 && X > 1 && Y > 1) && 
        (i_board[(X-1)*15+(Y-1)] == turn &&  i_board[(X+1)*15+(Y+1)] == turn  && i_board[(X+2)*15+(Y+2)] == turn)  &&
        (i_board[(X-2)*15+(Y-2)] == {turn[1],~turn[0]}) &&
        (i_board[(X+3)*15+(Y+3)] == l))
        valid[X][Y][pointer + 22] = 1;
    else
        valid[X][Y][pointer + 22] = 0;
    // xA...l ,225
    if( (X < 11 && Y < 11 && X > 0 && Y > 0) && 
       (i_board[(X+1)*15+(Y+1)] == turn &&  i_board[(X+2)*15+(Y+2)] == turn  && i_board[(X+3)*15+(Y+3)] == turn)  &&
        (i_board[(X-1)*15+(Y-1)] == {turn[1],~turn[0]}) &&
        (i_board[(X+4)*15+(Y+4)] == l))
        valid[X][Y][pointer + 23] = 1;
    else
        valid[X][Y][pointer + 23] = 0;
    // lA...x ,270
    if( (Y < 14 && Y > 3) && 
        (i_board[X*15+Y-1] == turn &&  i_board[X*15+Y-2] == turn  && i_board[X*15+Y-3] == turn)  &&
        (i_board[X*15+Y-4] == {turn[1],~turn[0]}) &&
        (i_board[X*15+Y+1] == l))
        valid[X][Y][pointer + 24] = 1;
    else
        valid[X][Y][pointer + 24] = 0;
    // l.A..x ,270
    if( (Y < 13 && Y > 2) && 
        (i_board[X*15+Y-1] == turn &&  i_board[X*15+Y-2] == turn  && i_board[X*15+Y+1] == turn)  &&
        (i_board[X*15+Y-3] == {turn[1],~turn[0]}) &&
        (i_board[X*15+Y+2] == l))
        valid[X][Y][pointer + 25] = 1;
    else
        valid[X][Y][pointer + 25] = 0;
    // l..A.x ,270
    if( (Y < 12 && Y > 1) && 
        (i_board[X*15+Y-1] == turn &&  i_board[X*15+Y+1] == turn  && i_board[X*15+Y+2] == turn)  &&
        (i_board[X*15+Y-2] == {turn[1],~turn[0]}) &&
        (i_board[X*15+Y+3] == l))
        valid[X][Y][pointer + 26] = 1;
    else
        valid[X][Y][pointer + 26] = 0;
    // l...Ax ,270
    if( (Y < 11 && Y > 0) && 
        (i_board[X*15+Y+3] == turn &&  i_board[X*15+Y+2] == turn  && i_board[X*15+Y+1] == turn)  &&
        (i_board[X*15+Y-1] == {turn[1],~turn[0]}) &&
        (i_board[X*15+(Y+4)] == l))
        valid[X][Y][pointer + 27] = 1;
    else
        valid[X][Y][pointer + 27] = 0;
    // lA ...x ,315
    if((X < 11 && Y < 14 && X > 0 && Y > 3) && 
        (i_board[(X+1)*15+(Y-1)] == turn &&  i_board[(X+2)*15+(Y+2)] == turn  && i_board[(X+3)*15+(Y-3)] == turn)  &&
        (i_board[(X+4)*15+(Y-4)] == {turn[1],~turn[0]}) &&
        (i_board[(X-1)*15+(Y+1)] == l))
        valid[X][Y][pointer + 28] = 1;
    else
        valid[X][Y][pointer + 28] = 0;
    // l.A..x ,315
    if((X < 12 && Y < 13 && X > 1 && Y > 2) && 
        (i_board[(X+1)*15+(Y-1)] == turn &&  i_board[(X+2)*15+(Y-2)] == turn  && i_board[(X-1)*15+(Y+1)] == turn)  &&
        (i_board[(X+3)*15+(Y-3)] == {turn[1],~turn[0]}) &&
        (i_board[(X-2)*15+(Y+2)] == l))
        valid[X][Y][pointer + 29] = 1;
    else
        valid[X][Y][pointer + 29] = 0;
    // l..A.x ,315
    if((X < 13 && Y < 12 && X > 2 && Y > 1) && 
        (i_board[(X+1)*15+(Y-1)] == turn &&  i_board[(X-1)*15+(Y+1)] == turn  && i_board[(X-2)*15+(Y-2)] == turn)  &&
        (i_board[(X+2)*15+(Y-2)] == {turn[1],~turn[0]}) &&
        (i_board[(X-3)*15+(Y+3)] == l))
        valid[X][Y][pointer + 30] = 1;
    else
        valid[X][Y][pointer + 30] = 0;
    // l...Ax ,315
    if( (X < 14 && Y < 11 && X > 3 && Y > 0) && 
        (i_board[(X-3)*15+(Y+3)] == turn &&  i_board[(X-2)*15+(Y+2)] == turn  && i_board[(X-1)*15+(Y+1)] == turn)  &&
        (i_board[(X+1)*15+(Y-1)] == {turn[1],~turn[0]}) &&
        (i_board[(X-4)*15+(Y+4)] == l))
        valid[X][Y][pointer + 31] = 1;
    else
        valid[X][Y][pointer + 31] = 0;


//Second condition
    // Al... ,0
        if( (X < 11) &&
            (i_board[(X+2)*15+Y] == turn && i_board[(X+3)*15+Y] == turn && i_board[(X+4)*15+Y] == turn) &&
            (i_board[(X+1)*15+Y] == l))
            valid[X][Y][pointer +32] = 1;
        else 
            valid[X][Y][pointer +32] = 0;
    // .lA.. ,0
        if( (X < 13 && X > 1) &&
            (i_board[(X-2)*15+Y] == turn && i_board[(X+1)*15+Y] == turn && i_board[(X+2)*15+Y] == turn) &&
            (i_board[(X-1)*15+Y] == l))
            valid[X][Y][pointer +33] = 1;
        else
            valid[X][Y][pointer +33] = 0;
    // .l.A. ,0
        if( (X < 14 && X > 2) &&
            (i_board[(X-3)*15+Y] == turn && i_board[(X-1)*15+Y] == turn && i_board[(X+1)*15+Y] == turn) &&
            (i_board[(X-2)*15+Y] == l))
            valid[X][Y][pointer +34] = 1;
        else 
            valid[X][Y][pointer +34] = 0;
    // .l..A ,0
        if( ( X > 3) &&
            (i_board[(X-4)*15+Y] == turn && i_board[(X-2)*15+Y] == turn && i_board[(X-1)*15+Y] == turn) &&
            (i_board[(X-3)*15+Y] == l))
            valid[X][Y][pointer +35] = 1;
        else
            valid[X][Y][pointer +35] = 0;

    // Al... ,45
       if( (X < 11 && Y < 11) &&
           (i_board[(X+2)*15+(Y+2)] == turn && i_board[(X+3)*15+(Y+3)] == turn && i_board[(X+4)*15+(Y+4)] == turn) &&
           (i_board[(X+1)*15+(Y+1)] == l)) 
           valid[X][Y][pointer +36] = 1;
       else
           valid[X][Y][pointer +36] = 0;
    // .lA.. ,45
        if( (X < 13 && X > 1 && Y < 13 && Y > 1) &&
            (i_board[(X-2)*15+(Y-2)] == turn && i_board[(X+1)*15+(Y+1)] == turn && i_board[(X+2)*15+(Y+2)] == turn) &&
            (i_board[(X-1)*15+(Y-1)] == l))
            valid[X][Y][pointer +37] = 1;
        else
            valid[X][Y][pointer +37] = 0;
    // .l.A. ,45
        if( (X < 14 && X > 2 && Y < 14 && Y > 2) &&
            (i_board[(X-3)*15+(Y-3)] == turn && i_board[(X-1)*15+(Y-1)] == turn && i_board[(X+1)*15+(Y+1)] == turn) &&
            (i_board[(X-2)*15+(Y-2)] == l))
            valid[X][Y][pointer +38] = 1;
        else
            valid[X][Y][pointer +38] = 0;
    // .l..A ,45
        if( (X > 3 &&  Y > 3) &&
            (i_board[(X-4)*15+(Y-4)] == turn && i_board[(X-2)*15+(Y-2)] == turn && i_board[(X-1)*15+(Y-1)] == turn) &&
            (i_board[(X-3)*15+(Y-3)] == l))
            valid[X][Y][pointer +39] = 1;
        else
            valid[X][Y][pointer +39] = 0;

    // Al... ,90
        if( (Y < 11) &&
            (i_board[X*15+Y+2] == turn && i_board[X*15+Y+3] == turn && i_board[X*15+Y+4] == turn) &&
            (i_board[X*15+Y+1] == l))
            valid[X][Y][pointer +40] = 1;
        else
            valid[X][Y][pointer +40] = 0;
    // .lA.. ,90
        if( (Y < 13 && Y > 1) &&
            (i_board[X*15+Y-2] == turn && i_board[X*15+Y+1] == turn && i_board[X*15+Y+2] == turn) &&
            (i_board[X*15+Y-1] == l))
            valid[X][Y][pointer +41] = 1;
        else
            valid[X][Y][pointer +41] = 0;
    // .l.A. ,90
        if( (Y < 14 && Y > 2) &&
            (i_board[X*15+Y-3] == turn && i_board[X*15+Y-1] == turn && i_board[X*15+Y+1] == turn) &&
            (i_board[X*15+Y-2] == l))
            valid[X][Y][pointer +42] = 1;
        else
            valid[X][Y][pointer +42] = 0;
    // .l..A ,90
        if( (Y > 3) &&
            (i_board[X*15+Y-4] == turn && i_board[X*15+Y-2] == turn && i_board[X*15+Y-1] == turn) &&
            (i_board[X*15+Y-3] == l))
            valid[X][Y][pointer +43] = 1;
        else
            valid[X][Y][pointer +43] = 0;

    // ...lA ,135
        if( (X > 3 && Y < 11) &&
            (i_board[(X-2)*15+(Y+2)] == turn && i_board[(X-3)*15+(Y+3)] == turn && i_board[(X-4)*15+(Y+4)] == turn) &&
            (i_board[(X-1)*15+(Y+1)] == l))
            valid[X][Y][pointer +44] = 1;
        else
            valid[X][Y][pointer +44] = 0;
    // ..Al. ,135
        if( (X < 13 && X > 1 && Y < 13 && Y > 1) &&
            (i_board[(X-2)*15+(Y+2)] == turn && i_board[(X-1)*15+(Y+1)] == turn && i_board[(X+2)*15+(Y-2)] == turn) &&
            (i_board[(X+1)*15+(Y-1)] == l))
            valid[X][Y][pointer +45] = 1;
        else
            valid[X][Y][pointer +45] = 0;
    // .A.l. ,135
        if( (X < 12 && X > 0 && Y < 14 && Y > 2) &&
            (i_board[(X-1)*15+(Y+1)] == turn && i_board[(X+1)*15+(Y-1)] == turn && i_board[(X+3)*15+(Y-3)] == turn) &&
            (i_board[(X-2)*15+(Y-2)] == l))
            valid[X][Y][pointer +46] = 1;
        else
            valid[X][Y][pointer +46] = 0;
    // A..l. ,135
        if( (X < 11 && Y > 3) &&
            (i_board[(X+1)*15+(Y-1)] == turn && i_board[(X+2)*15+(Y-2)] == turn && i_board[(X+4)*15+(Y-4)] == turn) &&
            (i_board[(X+3)*15+(Y-3)] == l))
            valid[X][Y][pointer +47] = 1;
        else
            valid[X][Y][pointer +47] = 0;

    // ...lA ,180
        if( (X > 3) &&
            (i_board[(X-2)*15+Y] == turn && i_board[(X-3)*15+Y] == turn && i_board[(X-4)*15+Y] == turn) &&
            (i_board[(X-1)*15+Y] == l))
            valid[X][Y][pointer +48] = 1;
        else
            valid[X][Y][pointer +48] = 0;
    // ..Al. ,180
        if( (X < 13 && X > 1) &&
            (i_board[(X-2)*15+Y] == turn && i_board[(X-1)*15+Y] == turn && i_board[(X+2)*15+Y] == turn) &&
            (i_board[(X-1)*15+Y] == l))
            valid[X][Y][pointer +49] = 1;
        else
            valid[X][Y][pointer +49] = 0;
    // .A.l. ,180
        if( (X < 12 && X > 0) &&
            (i_board[(X+3)*15+Y] == turn && i_board[(X-1)*15+Y] == turn && i_board[(X+1)*15+Y] == turn) &&
            (i_board[(X+2)*15+Y] == l))
            valid[X][Y][pointer +50] = 1;
        else
            valid[X][Y][pointer +50] = 0;
    // A..l. ,180
        if( (X < 11 ) &&
            (i_board[(X+4)*15+Y] == turn && i_board[(X+2)*15+Y] == turn && i_board[(X+1)*15+Y] == turn) &&
            (i_board[(X+3)*15+Y] == l))
            valid[X][Y][pointer +51] = 1;
        else
            valid[X][Y][pointer +51] = 0;

    // ...lA ,225
        if( (X > 3 && Y > 3) &&
            (i_board[(X-2)*15+(Y-2)] == turn && i_board[(X-3)*15+(Y-3)] == turn && i_board[(X-4)*15+(Y-4)] == turn) &&
            (i_board[(X-1)*15+(Y-1)] == l))
            valid[X][Y][pointer +52] = 1;
        else
            valid[X][Y][pointer +52] = 0;
    // ..Al. ,225
        if( (X < 13 && X > 1 && Y < 13 && Y > 1) &&
            (i_board[(X-2)*15+(Y-2)] == turn && i_board[(X-1)*15+(Y-1)] == turn && i_board[(X+2)*15+(Y+2)] == turn) &&
            (i_board[(X+1)*15+(Y+1)] == l))
            valid[X][Y][pointer +53] = 1;
        else
            valid[X][Y][pointer +53] = 0;
    // .A.l. ,225
        if( (X < 12 && X > 0 && Y < 12 && Y > 0) &&
            (i_board[(X+3)*15+(Y+3)] == turn && i_board[(X+1)*15+(Y+1)] == turn && i_board[(X-1)*15+(Y-1)] == turn) &&
            (i_board[(X+2)*15+(Y+2)] == l))
            valid[X][Y][pointer +54] = 1;
        else
            valid[X][Y][pointer +54] = 0;
    // A..l. ,225
        if( (X < 11 &&  Y < 11) &&
            (i_board[(X+4)*15+(Y+4)] == turn && i_board[(X+2)*15+(Y+2)] == turn && i_board[(X+1)*15+(Y+1)] == turn) &&
            (i_board[(X+3)*15+(Y+3)] == l))
            valid[X][Y][pointer +55] = 1;
        else
            valid[X][Y][pointer +55] = 0;

    // Al... ,270
        if( (Y > 3) &&
            (i_board[X*15+Y-2] == turn && i_board[X*15+Y-3] == turn && i_board[X*15+Y-4] == turn) &&
            (i_board[X*15+Y-1] == l))
            valid[X][Y][pointer +56] = 1;
        else
            valid[X][Y][pointer +56] = 0;
    // .lA.. ,270
        if( (Y < 13 && Y > 1) &&
            (i_board[X*15+Y+2] == turn && i_board[X*15+Y-1] == turn && i_board[X*15+Y-2] == turn) &&
            (i_board[X*15+Y+1] == l))
            valid[X][Y][pointer +57] = 1;
        else
            valid[X][Y][pointer +57] = 0;
    // .l.A. ,270
        if( (Y < 14 && Y > 2) &&
            (i_board[X*15+Y+3] == turn && i_board[X*15+Y+1] == turn && i_board[X*15+Y-1] == turn) &&
            (i_board[X*15+Y+2] == l))
            valid[X][Y][pointer +58] = 1;
        else
            valid[X][Y][pointer +58] = 0;
    // .l..A ,270
        if( (Y < 11) &&
            (i_board[X*15+Y+4] == turn && i_board[X*15+Y+2] == turn && i_board[X*15+Y+1] == turn) &&
            (i_board[X*15+Y+3] == l))
            valid[X][Y][pointer +59] = 1;
        else
            valid[X][Y][pointer +59] = 0;

    // Al... ,315
        if( (X < 11 && Y > 3) &&
            (i_board[(X+2)*15+(Y-2)] == turn && i_board[(X-3)*15+(Y-3)] == turn && i_board[(X-4)*15+(Y-4)] == turn) &&
            (i_board[(X+1)*15+(Y-1)] == l))
            valid[X][Y][pointer +60] = 1;
        else
            valid[X][Y][pointer +60] = 0;
    // .lA.. ,315
        if( (X < 13 && X > 1 && Y < 13 && Y > 1) &&
            (i_board[(X-2)*15+(Y+2)] == turn && i_board[(X+1)*15+(Y-1)] == turn && i_board[(X+2)*15+(Y-2)] == turn) &&
            (i_board[(X-1)*15+(Y-1)] == l))
            valid[X][Y][pointer +61] = 1;
        else
            valid[X][Y][pointer +61] = 0;
    // .l.A. ,315
        if( (X < 14 && X > 2 && Y < 14 && Y > 2) &&
            (i_board[(X-3)*15+(Y+3)] == turn && i_board[(X-1)*15+(Y+1)] == turn && i_board[(X+1)*15+(Y-1)] == turn) &&
            (i_board[(X-2)*15+(Y+2)] == l))
            valid[X][Y][pointer +62] = 1;
        else
            valid[X][Y][pointer +62] = 0;
    // .l..A ,315
        if( (X > 3 &&  Y > 3) &&
            (i_board[(X-4)*15+(Y+4)] == turn && i_board[(X-2)*15+(Y+2)] == turn && i_board[(X-1)*15+(Y+1)] == turn) &&
            (i_board[(X-3)*15+(Y+3)] == l))
            valid[X][Y][pointer +63] = 1;
        else
            valid[X][Y][pointer +63] = 0;


            
// Third condition
    // A.l.. , 0
        if ((X < 11) &&
            (i_board[(X+1)*15+Y] == turn && i_board[(X+3)*15+Y] == turn && i_board[(X+4)*15+Y] == turn) &&
            (i_board[(X+2)*15+Y] == l))
            valid[X][Y][pointer +64] = 1;
        else
            valid[X][Y][pointer +64] = 0;
    // .Al.. , 0
        if ((X < 12 && X > 0) &&
            (i_board[(X-1)*15+Y] == turn && i_board[(X+2)*15+Y] == turn && i_board[(X+3)*15+Y] == turn) &&
            (i_board[(X+1)*15+Y] == l))
            valid[X][Y][pointer +65] = 1;
        else
            valid[X][Y][pointer +65] = 0;
    // ..lA. , 180
        if ((X < 14 && X > 2) &&
            (i_board[(X-3)*15+Y] == turn && i_board[(X-2)*15+Y] == turn && i_board[(X+1)*15+Y] == turn) &&
            (i_board[(X-1)*15+Y] == l))
            valid[X][Y][pointer +66] = 1;
        else
            valid[X][Y][pointer +66] = 0;
    // ..l.A , 180
        if ((X < 15 && X > 3) &&
            (i_board[(X-4)*15+Y] == turn && i_board[(X-3)*15+Y] == turn && i_board[(X-1)*15+Y] == turn) &&
            (i_board[(X-2)*15+Y] == l))
            valid[X][Y][pointer +67] = 1;
        else
            valid[X][Y][pointer +67] = 0;

    // A.l.. , 45
        if ((X < 11 && Y < 11) &&
            (i_board[(X+1)*15+Y+1] == turn && i_board[(X+3)*15+Y+3] == turn && i_board[(X+4)*15+Y+4] == turn) &&
            (i_board[(X+2)*15+Y+2] == l))
            valid[X][Y][pointer +68] = 1;
        else
            valid[X][Y][pointer +68] = 0;
    // .Al.. , 45
        if ((X < 12 && X > 0 && Y < 12 && Y > 0) &&
            (i_board[(X-1)*15+Y-1] == turn && i_board[(X+2)*15+Y+2] == turn && i_board[(X+3)*15+Y+3] == turn) &&
            (i_board[(X+1)*15+Y+1] == l))
            valid[X][Y][pointer +69] = 1;
        else
            valid[X][Y][pointer +69] = 0;
    // ..lA. , 225
        if ((X < 14 && X > 2 && Y < 14 && Y > 2) &&
            (i_board[(X-3)*15+Y-3] == turn && i_board[(X-2)*15+Y-2] == turn && i_board[(X+1)*15+Y+1] == turn) &&
            (i_board[(X-1)*15+Y-1] == l))
            valid[X][Y][pointer +70] = 1;
        else
            valid[X][Y][pointer +70] = 0;
    // ..l.A , 225
        if ((X > 3 &&  Y > 3) &&
            (i_board[(X-4)*15+Y-4] == turn && i_board[(X-3)*15+Y-3] == turn && i_board[(X-1)*15+Y-1] == turn) &&
            (i_board[(X-2)*15+Y-2] == l))
            valid[X][Y][pointer +71] = 1;
        else
            valid[X][Y][pointer +71] = 0;

    // A.l.. , 90
        if ((Y < 11) &&
            (i_board[X*15+Y+1] == turn && i_board[X*15+Y+3] == turn && i_board[X*15+Y+4] == turn) &&
            (i_board[X*15+Y+2] == l))
            valid[X][Y][pointer +72] = 1;
        else
            valid[X][Y][pointer +72] = 0;
    // .Al.. , 90
        if ((Y < 12 && Y > 0) &&
            (i_board[X*15+Y-2] == turn && i_board[X*15+Y+1] == turn && i_board[X*15+Y+2] == turn) &&
            (i_board[X*15+Y-1] == l))
            valid[X][Y][pointer +73] = 1;
        else
            valid[X][Y][pointer +73] = 0;
    // ..lA. , 270
        if ((Y < 14 && Y > 2) &&
            (i_board[X*15+Y-3] == turn && i_board[X*15+Y-2] == turn && i_board[X*15+Y+1] == turn) &&
            (i_board[X*15+Y-1] == l))
            valid[X][Y][pointer +74] = 1;
        else
            valid[X][Y][pointer +74] = 0;
    // ..l.A , 270
        if ((Y < 15 && Y > 3) &&
            (i_board[X*15+Y-4] == turn && i_board[X*15+Y-3] == turn && i_board[X*15+Y-1] == turn) &&
            (i_board[X*15+Y-2] == l))
            valid[X][Y][pointer +75] = 1;
        else
            valid[X][Y][pointer +75] = 0;

    // A.l.. , 315
        if ((X < 11 && Y > 3) &&
            (i_board[(X+1)*15+Y-1] == turn && i_board[(X+3)*15+Y-3] == turn && i_board[(X+4)*15+Y-4] == turn) &&
            (i_board[(X+2)*15+Y-2] == l))
            valid[X][Y][pointer +76] = 1;
        else
            valid[X][Y][pointer +76] = 0;
    // .Al.. , 315
        if ((X < 12 && X > 0 && Y < 14 && Y > 2) &&
            (i_board[(X-1)*15+Y+1] == turn && i_board[(X+2)*15+Y-2] == turn && i_board[(X+3)*15+Y-3] == turn) &&
            (i_board[(X+1)*15+Y-1] == l))
            valid[X][Y][pointer +77] = 1;
        else
            valid[X][Y][pointer +77] = 0;
    // ..lA. , 135
        if ((X < 14 && X > 2 && Y < 12 && Y > 2) &&
            (i_board[(X-3)*15+Y+3] == turn && i_board[(X-2)*15+Y+2] == turn && i_board[(X+1)*15+Y+1] == turn) &&
            (i_board[(X-1)*15+Y+1] == l))
            valid[X][Y][pointer +78] = 1;
        else
            valid[X][Y][pointer +78] = 0;
    // ..l.A , 135
        if ((X > 3 && Y < 11) &&
            (i_board[(X-4)*15+Y+4] == turn && i_board[(X-3)*15+Y+3] == turn && i_board[(X-1)*15+Y+1] == turn) &&
            (i_board[(X-2)*15+Y+2] == l))
            valid[X][Y][pointer +79] = 1;
        else
            valid[X][Y][pointer +79] = 0;

        assign check = i_board[X * 15 + Y][1] & (valid[X][Y][pointer] | valid[X][Y][pointer + 1] | valid[X][Y][pointer + 2] | valid[X][Y][pointer + 3]
     | valid[X][Y][pointer + 4] | valid[X][Y][pointer + 5] | valid[X][Y][pointer + 6] | valid[X][Y][pointer + 7]
      | valid[X][Y][pointer + 8] | valid[X][Y][pointer + 9] | valid[X][Y][pointer + 10] | valid[X][Y][pointer + 11]
       | valid[X][Y][pointer + 12] | valid[X][Y][pointer + 13] | valid[X][Y][pointer + 14] | valid[X][Y][pointer + 15]
        | valid[X][Y][pointer + 16] | valid[X][Y][pointer + 17] | valid[X][Y][pointer + 18] | valid[X][Y][pointer + 19]
         | valid[X][Y][pointer + 20] | valid[X][Y][pointer + 21] | valid[X][Y][pointer + 22] | valid[X][Y][pointer + 23]
          | valid[X][Y][pointer + 24] | valid[X][Y][pointer + 25] | valid[X][Y][pointer + 26] | valid[X][Y][pointer + 27]
           | valid[X][Y][pointer + 28] | valid[X][Y][pointer + 29] | valid[X][Y][pointer + 30] | valid[X][Y][pointer + 31]
            | valid[X][Y][pointer + 32] | valid[X][Y][pointer + 33] | valid[X][Y][pointer + 34] | valid[X][Y][pointer + 35]
             | valid[X][Y][pointer + 36] | valid[X][Y][pointer + 37] | valid[X][Y][pointer + 38] | valid[X][Y][pointer + 39]
              | valid[X][Y][pointer + 40] | valid[X][Y][pointer + 41] | valid[X][Y][pointer + 42] | valid[X][Y][pointer + 43]
               | valid[X][Y][pointer + 44] | valid[X][Y][pointer + 45] | valid[X][Y][pointer + 46] | valid[X][Y][pointer + 47]
                | valid[X][Y][pointer + 48] | valid[X][Y][pointer + 49] | valid[X][Y][pointer + 50] | valid[X][Y][pointer + 51]
                 | valid[X][Y][pointer + 52] | valid[X][Y][pointer + 53] | valid[X][Y][pointer + 54] | valid[X][Y][pointer + 55]
                  | valid[X][Y][pointer + 56] | valid[X][Y][pointer + 57] | valid[X][Y][pointer + 58] | valid[X][Y][pointer + 59]
                   | valid[X][Y][pointer + 60] | valid[X][Y][pointer + 61] | valid[X][Y][pointer + 62] | valid[X][Y][pointer + 63]
                    | valid[X][Y][pointer + 64] | valid[X][Y][pointer + 65] | valid[X][Y][pointer + 66] | valid[X][Y][pointer + 67]
                     | valid[X][Y][pointer + 68] | valid[X][Y][pointer + 69] | valid[X][Y][pointer + 70] | valid[X][Y][pointer + 71]
                      | valid[X][Y][pointer + 72] | valid[X][Y][pointer + 73] | valid[X][Y][pointer + 74] | valid[X][Y][pointer + 75]
                       | valid[X][Y][pointer + 76] | valid[X][Y][pointer + 77] | valid[X][Y][pointer + 78] | valid[X][Y][pointer + 79]);
endtask

task Offense_live_four(
    input   [3:0] X,
    input   [3:0] Y,
    input   [1:0] turn,
    input   [7:0] pointer,
    output  check 
);
// live four first condition 
    // lA...l ,0
        if ((X < 11 ) && 
            (i_board[(X+1)*15+Y] == turn && i_board[(X+2)*15+Y] == turn && i_board[(X+3)*15+Y] == turn ) &&
            (i_board[(X+4)*15+Y] == l && i_board[(X-1)*15+Y] == l))
            valid[X][Y][pointer +0] = 1;
        else
            valid[X][Y][pointer +0] = 0;
    // lA...l ,45
       if ((X < 11 && Y < 11 ) && 
           (i_board[(X+1)*15+Y+1] == turn && i_board[(X+2)*15+Y+2] == turn && i_board[(X+3)*15+Y+3] == turn ) &&
           (i_board[(X+4)*15+Y+4] == l && i_board[(X-1)*15+Y-1] == l))
           valid[X][Y][pointer +1] = 1;
       else
           valid[X][Y][pointer +1] = 0;
    // lA...l ,90
        if ((Y < 11 ) && 
            (i_board[X*15+Y+1] == turn && i_board[X*15+Y+2] == turn && i_board[X*15+Y+3] == turn ) &&
            (i_board[X*15+Y+4] == l && i_board[X*15+Y-1] == l))
            valid[X][Y][pointer +2] = 1;
        else
            valid[X][Y][pointer +2] = 0;
    // lA...l ,135
        if ((X > 3 && Y < 11 ) && 
            (i_board[(X-1)*15+Y+1] == turn && i_board[(X-2)*15+Y+2] == turn && i_board[(X-3)*15+Y+3] == turn ) &&
            (i_board[(X-4)*15+Y+4] == l && i_board[(X+1)*15+Y-1] == l))
            valid[X][Y][pointer +3] = 1;
        else
            valid[X][Y][pointer +3] = 0;
    // lA...l ,180
        if ((X > 3 && X < 14 ) && 
            (i_board[(X-1)*15+Y] == turn && i_board[(X-2)*15+Y] == turn && i_board[(X-3)*15+Y] == turn ) &&
            (i_board[(X-4)*15+Y] == l && i_board[(X+1)*15+Y] == l))
            valid[X][Y][pointer +4] = 1;
        else
            valid[X][Y][pointer +4] = 0;
    // lA...l ,225
        if ((X > 3 && Y > 3) && 
            (i_board[(X-1)*15+Y-1] == turn && i_board[(X-2)*15+Y-2] == turn && i_board[(X-3)*15+Y-3] == turn ) &&
            (i_board[(X-4)*15+Y-4] == l && i_board[(X+1)*15+Y+1] == l))
            valid[X][Y][pointer +5] = 1;
        else
            valid[X][Y][pointer +5] = 0;
    // lA...l ,270
        if ((Y > 3) && 
            (i_board[X*15+Y-1] == turn && i_board[X*15+Y-2] == turn && i_board[X*15+Y-3] == turn ) &&
            (i_board[X*15+Y-4] == l && i_board[X*15+Y+1] == l))
            valid[X][Y][pointer +6] = 1;
        else
            valid[X][Y][pointer +6] = 0;
    // lA...l ,315
        if ((X < 11 && Y > 3 ) && 
            (i_board[(X+1)*15+Y-1] == turn && i_board[(X+2)*15+Y-2] == turn && i_board[(X+3)*15+Y-3] == turn ) &&
            (i_board[(X+4)*15+Y-4] == l && i_board[(X-1)*15+Y+1] == l))
            valid[X][Y][pointer +7] = 1;
        else
            valid[X][Y][pointer +7] = 0;

// live four second condition 
    // l.A..l ,0
        if ((X < 11 && X > 1) && 
            (i_board[(X-1)*15+Y] == turn && i_board[(X+1)*15+Y] == turn && i_board[(X+2)*15+Y] == turn ) &&
            (i_board[(X+3)*15+Y] == l && i_board[(X-2)*15+Y] == l))
            valid[X][Y][pointer +8] = 1;
        else
            valid[X][Y][pointer +8] = 0;
    // l.A..l ,45
        if ((X < 12 && Y < 12 && X > 1 && Y > 1) && 
            (i_board[(X+1)*15+Y+1] == turn && i_board[(X+2)*15+Y+2] == turn && i_board[(X-1)*15+Y-1] == turn ) &&
            (i_board[(X+3)*15+Y+3] == l && i_board[(X-2)*15+Y-2] == l))
            valid[X][Y][pointer +9] = 1;
        else
            valid[X][Y][pointer +9] = 0;
    // l.A..l ,90
        if ((Y < 12 && Y > 2 ) && 
            (i_board[X*15+Y-1] == turn && i_board[X*15+Y+1] == turn && i_board[X*15+Y+2] == turn ) &&
            (i_board[X*15+Y+3] == l && i_board[X*15+Y-2] == l))
            valid[X][Y][pointer +10] = 1;
        else
            valid[X][Y][pointer +10] = 0;
    // l.A..l ,135
        if ((X > 2 &&  X < 13 && Y < 12 && Y > 1) && 
            (i_board[(X-1)*15+Y+1] == turn && i_board[(X-2)*15+Y+2] == turn && i_board[(X+1)*15+Y-1] == turn ) &&
            (i_board[(X-3)*15+Y+3] == l && i_board[(X+2)*15+Y-2] == l))
            valid[X][Y][pointer +11] = 1;
        else
            valid[X][Y][pointer +11] = 0;
    // l.A..l ,180
        if ((X > 2 && X < 13 ) && 
            (i_board[(X+1)*15+Y] == turn && i_board[(X-1)*15+Y] == turn && i_board[(X-2)*15+Y] == turn ) &&
            (i_board[(X-3)*15+Y] == l && i_board[(X+2)*15+Y] == l))
            valid[X][Y][pointer +12] = 1;
        else
            valid[X][Y][pointer +12] = 0;
    // l.A..l ,225
        if ((X > 3 && Y > 3) && 
            (i_board[(X-1)*15+Y-1] == turn && i_board[(X+1)*15+Y+1] == turn && i_board[(X+2)*15+Y+2] == turn ) &&
            (i_board[(X-3)*15+Y-3] == l && i_board[(X+2)*15+Y+2] == l))
            valid[X][Y][pointer +13] = 1;
        else
            valid[X][Y][pointer +13] = 0;
    // l.A..l ,270
        if ((Y > 2 && Y < 13) && 
            (i_board[X*15+Y+1] == turn && i_board[X*15+Y-1] == turn && i_board[X*15+Y-2] == turn ) &&
            (i_board[X*15+Y-3] == l && i_board[X*15+Y+2] == l))
            valid[X][Y][pointer +14] = 1;
        else
            valid[X][Y][pointer +14] = 0;
    // l.A..l ,315
        if ((X < 12 && X > 1 && Y < 13 && Y > 2 ) && 
            (i_board[(X-1)*15+Y+1] == turn && i_board[(X+1)*15+Y-1] == turn && i_board[(X+2)*15+Y-2] == turn ) &&
            (i_board[(X+3)*15+Y-3] == l && i_board[(X-2)*15+Y+2] == l))
            valid[X][Y][pointer +15] = 1;
        else
            valid[X][Y][pointer +15] = 0;


    assign check = i_board[X * 15 + Y][1] & (valid[X][Y][pointer] | valid[X][Y][pointer + 1] | valid[X][Y][pointer + 2] | valid[X][Y][pointer + 3]
     | valid[X][Y][pointer + 4] | valid[X][Y][pointer + 5] | valid[X][Y][pointer + 6] | valid[X][Y][pointer + 7]
      | valid[X][Y][pointer + 8] | valid[X][Y][pointer + 9] | valid[X][Y][pointer + 10] | valid[X][Y][pointer + 11]
       | valid[X][Y][pointer + 12] | valid[X][Y][pointer + 13] | valid[X][Y][pointer + 14] | valid[X][Y][pointer + 15]);
endtask

task Defense_three(
    input [3:0] X,
    input [3:0] Y,
    input [1:0] turn,
    input [7:0] pointer,
    output check
);
    // A o o o *  45
    if(X + 4 < 15 && Y + 4 < 15 && 
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[(X + 4) * 15 + (Y + 4)] == l)
        valid[X][Y][pointer] = 1;
    else
        valid[X][Y][pointer] = 0;
    // A o * o o *  45
    if(X + 5 < 15 && Y + 5 < 15 && 
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y + 2)] == l && 
        i_board[(X + 3) * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[(X + 4) * 15 + (Y + 4)] == {turn[1], ~turn[0]} && 
        i_board[(X + 5) * 15 + (Y + 5)] == l)
        valid[X][Y][pointer + 1] = 1;
    else
        valid[X][Y][pointer + 1] = 0;
    // A o o * o *  45
    if(X + 5 < 15 && Y + 5 < 15 && 
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + (Y + 3)] == l && 
        i_board[(X + 4) * 15 + (Y + 4)] == {turn[1], ~turn[0]} && 
        i_board[(X + 5) * 15 + (Y + 5)] == l)
        valid[X][Y][pointer + 2] = 1;
    else
        valid[X][Y][pointer + 2] = 0;
    // * o A o o *  45
    if(X + 3 < 15 && X - 2 >= 0 && Y + 3 < 15 && Y - 2 >= 0 && 
        i_board[(X - 2) * 15 + (Y - 2)] == l && 
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + (Y + 3)] == l)
        valid[X][Y][pointer + 3] = 1; 
    else
        valid[X][Y][pointer + 3] = 0;

    // A o o o *  90
    if(Y + 4 < 15 && 
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 4)] == l)
        valid[X][Y][pointer + 4] = 1;
    else
        valid[X][Y][pointer + 4] = 0;
    // A o * o o *  90
    if(Y + 5 < 15 && 
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 2)] == l && 
        i_board[X * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 4)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 5)] == l)
        valid[X][Y][pointer + 5] = 1;
    else
        valid[X][Y][pointer + 5] = 0;
    // A o o * o *  90
    if(Y + 5 < 15 && 
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 3)] == l && 
        i_board[X * 15 + (Y + 4)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 5)] == l)
        valid[X][Y][pointer + 6] = 1;
    else
        valid[X][Y][pointer + 6] = 0;
    // * o A o o *  90
    if(Y + 3 < 15 && Y - 2 >= 0 && 
        i_board[X * 15 + (Y - 2)] == l && 
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 3)] == l)
        valid[X][Y][pointer + 7] = 1; 
    else
        valid[X][Y][pointer + 7] = 0;

    // A o o o *  135
    if(X - 4 >= 0 && Y + 4 < 15 && 
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + (Y + 4)] == l)
        valid[X][Y][pointer + 8] = 1;
    else
        valid[X][Y][pointer + 8] = 0;
    // A o * o o *  135
    if(X - 5 < 15 && Y + 5 < 15 && 
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y + 2)] == l && 
        i_board[(X - 3) * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + (Y + 4)] == {turn[1], ~turn[0]} && 
        i_board[(X - 5) * 15 + (Y + 5)] == l)
        valid[X][Y][pointer + 9] = 1;
    else
        valid[X][Y][pointer + 9] = 0;
    // A o o * o *  135
    if(X - 5 < 15 && Y + 5 < 15 && 
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + (Y + 3)] == l && 
        i_board[(X - 4) * 15 + (Y + 4)] == {turn[1], ~turn[0]} && 
        i_board[(X - 5) * 15 + (Y + 5)] == l)
        valid[X][Y][pointer + 10] = 1;
    else
        valid[X][Y][pointer + 10] = 0;
    // * o A o o *  135
    if(X + 2 < 15 && X - 3 >= 0 && Y + 3 < 15 && Y - 2 >= 0 && 
        i_board[(X + 2) * 15 + (Y - 2)] == l && 
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + (Y + 3)] == l)
        valid[X][Y][pointer + 11] = 1; 
    else
        valid[X][Y][pointer + 11] = 0;
    
    // A o o o *  180
    if(X - 4 >= 0 && 
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + Y] == l)
        valid[X][Y][pointer + 12] = 1;
    else
        valid[X][Y][pointer + 12] = 0;
    // A o * o o *  180
    if(X - 5 >= 0 &&
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + Y] == l && 
        i_board[(X - 3) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 5) * 15 + Y] == l)
        valid[X][Y][pointer + 13] = 1;
    else
        valid[X][Y][pointer + 13] = 0;
    // A o o * o *  180
    if(X - 5 >= 0 && 
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + Y] == l && 
        i_board[(X - 4) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 5) * 15 + Y] == l)
        valid[X][Y][pointer + 14] = 1;
    else
        valid[X][Y][pointer + 14] = 0;
    // * o A o o *  180
    if(X + 2 < 15 && X - 3 >= 0 && 
        i_board[(X + 2) * 15 + Y] == l && 
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + Y] == l)
        valid[X][Y][pointer + 15] = 1; 
    else
        valid[X][Y][pointer + 15] = 0;

    // A o o o *  225
    if(X - 4 >= 0 && Y - 4 >= 0 && 
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + (Y - 4)] == l)
        valid[X][Y][pointer + 16] = 1;
    else
        valid[X][Y][pointer + 16] = 0;
    // A o * o o *  225
    if(X - 5 >= 0 && Y - 5 >= 0 && 
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y - 2)] == l && 
        i_board[(X - 3) * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + (Y - 4)] == {turn[1], ~turn[0]} && 
        i_board[(X - 5) * 15 + (Y - 5)] == l)
        valid[X][Y][pointer + 17] = 1;
    else
        valid[X][Y][pointer + 17] = 0;
    // A o o * o *  225
    if(X - 5 >= 0 && Y - 5 >= 0 && 
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + (Y - 3)] == l && 
        i_board[(X - 4) * 15 + (Y - 4)] == {turn[1], ~turn[0]} && 
        i_board[(X - 5) * 15 + (Y - 5)] == l)
        valid[X][Y][pointer + 18] = 1;
    else
        valid[X][Y][pointer + 18] = 0;
    // * o A o o *  225
    if(X + 2 < 15 && X - 3 >= 0 && Y + 2 < 15 && Y - 3 >= 0 && 
        i_board[(X + 2) * 15 + (Y + 2)] == l && 
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + (Y - 3)] == l)
        valid[X][Y][pointer + 19] = 1; 
    else
        valid[X][Y][pointer + 19] = 0;
    
    // A o o o *  270
    if(Y - 4 >= 0 && 
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 4)] == l)
        valid[X][Y][pointer + 20] = 1;
    else
        valid[X][Y][pointer + 20] = 0;
    // A o * o o *  270
    if(Y - 5 >= 0 && 
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 2)] == l && 
        i_board[X * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 4)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 5)] == l)
        valid[X][Y][pointer + 21] = 1;
    else
        valid[X][Y][pointer + 21] = 0;
    // A o o * o *  270
    if(Y - 5 >= 0 && 
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 3)] == l && 
        i_board[X * 15 + (Y - 4)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 5)] == l)
        valid[X][Y][pointer + 22] = 1;
    else
        valid[X][Y][pointer + 22] = 0;
    // * o A o o *  270
    if(Y + 2 < 15 && Y - 3 >= 0 && 
        i_board[X * 15 + (Y + 2)] == l && 
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 3)] == l)
        valid[X][Y][pointer + 23] = 1; 
    else
        valid[X][Y][pointer + 23] = 0;


    // A o o o *  315
    if(X + 4 < 15 && Y - 4 >= 0 && 
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[(X + 4) * 15 + (Y - 4)] == l)
        valid[X][Y][pointer + 24] = 1;
    else
        valid[X][Y][pointer + 24] = 0;
    // A o * o o *  315
    if(X + 5 < 15 && Y - 5 >= 0 && 
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y - 2)] == l && 
        i_board[(X + 3) * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[(X + 4) * 15 + (Y - 4)] == {turn[1], ~turn[0]} && 
        i_board[(X + 5) * 15 + (Y - 5)] == l)
        valid[X][Y][pointer + 25] = 1;
    else
        valid[X][Y][pointer + 25] = 0;
    // A o o * o *  315
    if(X + 5 < 15 && Y - 5 >= 0 && 
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + (Y - 3)] == l && 
        i_board[(X + 4) * 15 + (Y - 4)] == {turn[1], ~turn[0]} && 
        i_board[(X + 5) * 15 + (Y - 5)] == l)
        valid[X][Y][pointer + 26] = 1;
    else
        valid[X][Y][pointer + 26] = 0;
    // * o A o o *  315
    if(X + 3 < 15 && X - 2 >= 0 && Y + 2 < 15 && Y - 3 >= 0 && 
        i_board[(X - 2) * 15 + (Y + 2)] == l && 
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + (Y - 3)] == l)
        valid[X][Y][pointer + 27] = 1; 
    else
        valid[X][Y][pointer + 27] = 0;

    
    // A o o o *  0
    if(X + 4 < 15 && 
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 4) * 15 + Y] == l)
        valid[X][Y][pointer + 28] = 1;
    else
        valid[X][Y][pointer + 28] = 0;
    // A o * o o *  0
    if(X + 5 < 15 && 
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + Y] == l && 
        i_board[(X + 3) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 4) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 5) * 15 + Y] == l)
        valid[X][Y][pointer + 29] = 1;
    else
        valid[X][Y][pointer + 29] = 0;
    // A o o * o *  0
    if(X + 5 < 15 && 
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + Y] == l && 
        i_board[(X + 4) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 5) * 15 + Y] == l)
        valid[X][Y][pointer + 30] = 1;
    else
        valid[X][Y][pointer + 30] = 0;
    // * o A o o *  0
    if(X + 3 < 15 && X - 2 >= 0 && 
        i_board[(X - 2) * 15 + Y] == l && 
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + Y] == l)
        valid[X][Y][pointer + 31] = 1; 
    else
        valid[X][Y][pointer + 31] = 0;
    
    assign check = i_board[X * 15 + Y][1] & (valid[X][Y][pointer + 0] | valid[X][Y][pointer + 1] | valid[X][Y][pointer + 2] | valid[X][Y][pointer + 3] | valid[X][Y][pointer + 4]
     | valid[X][Y][pointer + 5] | valid[X][Y][pointer + 6] | valid[X][Y][pointer + 7] | valid[X][Y][pointer + 8] | valid[X][Y][pointer + 9]
      | valid[X][Y][pointer + 10] | valid[X][Y][pointer + 11] | valid[X][Y][pointer + 12] | valid[X][Y][pointer + 13] | valid[X][Y][pointer + 14]
       | valid[X][Y][pointer + 15] | valid[X][Y][pointer + 16] | valid[X][Y][pointer + 17] | valid[X][Y][pointer + 18] | valid[X][Y][pointer + 19]
        | valid[X][Y][pointer + 20] | valid[X][Y][pointer + 21] | valid[X][Y][pointer + 22] | valid[X][Y][pointer + 23] | valid[X][Y][pointer + 24]
         | valid[X][Y][pointer + 25] | valid[X][Y][pointer + 26] | valid[X][Y][pointer + 27] | valid[X][Y][pointer + 28] | valid[X][Y][pointer + 29]
          | valid[X][Y][pointer + 30] | valid[X][Y][pointer + 31]);
endtask



task Defense_four(
    input [3:0] X,
    input [3:0] Y,
    input [1:0] turn,
    input [7:0] pointer,
    output check
);
    // A o o o o  45
    if(X + 4 < 15 && Y + 4 < 15 &&
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[(X + 4) * 15 + (Y + 4)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 0] = 1;
    else
        valid[X][Y][pointer + 0] = 0;
    // o A o o o  45
    if(X - 1 >= 0 && X + 3 < 15 && Y - 1 >= 0 && Y + 3 < 15 &&
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} &&
        i_board[(X + 3) * 15 + (Y + 3)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 1] = 1;
    else
        valid[X][Y][pointer + 1] = 0;
    // o o A o o  45
    if(X - 2 >= 0 && X + 2 < 15 && Y - 2 >= 0 && Y + 2 < 15 && 
        i_board[(X - 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 2] = 1;
    else
        valid[X][Y][pointer + 2] = 0;


    // A o o o o  90
    if(Y + 4 < 15 &&
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 4)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 3] = 1;
    else
        valid[X][Y][pointer + 3] = 0;
    // o A o o o  90
    if(Y - 1 >= 0 && Y + 3 < 15 &&
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y + 2)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y + 3)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 4] = 1;
    else
        valid[X][Y][pointer + 4] = 0;
    // o o A o o  90
    if(Y - 2 >= 0 && Y + 2 < 15 && 
        i_board[X * 15 + (Y - 2)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y + 2)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 5] = 1;
    else
        valid[X][Y][pointer + 5] = 0;


    // A o o o o  135
    if(X - 4 < 15 && Y + 4 < 15 &&
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + (Y + 4)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 6] = 1;
    else
        valid[X][Y][pointer + 6] = 0;
    // o A o o o  135
    if(X - 3 >= 0 && X + 1 < 15 && Y - 1 >= 0 && Y + 3 < 15 &&
        i_board[(X - 3) * 15 + (Y + 3)] == {turn[1], ~turn[0]} &&
        i_board[(X - 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 7] = 1;
    else
        valid[X][Y][pointer + 7] = 0;
    // o o A o o  135
    if(X - 2 >= 0 && X + 2 < 15 && Y - 2 >= 0 && Y + 2 < 15 && 
        i_board[(X - 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 8] = 1;
    else
        valid[X][Y][pointer + 8] = 0;


    // A o o o o  180
    if(X - 4 >= 0 &&
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + Y] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 9] = 1;
    else
        valid[X][Y][pointer + 9] = 0;
    // o A o o o  180
    if(X - 3 >= 0 && X + 1 < 15 &&
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X - 2) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X - 3) * 15 + Y] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 10] = 1;
    else
        valid[X][Y][pointer + 10] = 0;
    // o o A o o  180
    if(X - 2 >= 0 && X + 2 < 15 && 
        i_board[(X - 2) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + Y] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 11] = 1;
    else
        valid[X][Y][pointer + 11] = 0;


    // A o o o o  225
    if(X - 4 >= 0 && Y - 4 >= 0 &&
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + (Y - 4)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 12] = 1;
    else
        valid[X][Y][pointer + 12] = 0;
    // o A o o o  225
    if(X - 3 >= 0 && X + 1 < 15 && Y - 3 >= 0 && Y + 1 < 15 &&
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[(X - 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} &&
        i_board[(X - 3) * 15 + (Y - 3)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 13] = 1;
    else
        valid[X][Y][pointer + 13] = 0;
    // o o A o o  225
    if(X - 2 >= 0 && X + 2 < 15 && Y - 2 >= 0 && Y + 2 < 15 && 
        i_board[(X - 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 14] = 1;
    else
        valid[X][Y][pointer + 14] = 0;


    // A o o o o  270
    if(Y - 4 >= 0 &&
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 4)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 15] = 1;
    else
        valid[X][Y][pointer + 15] = 0;
    // o A o o o  270
    if(Y - 3 >= 0 && Y + 1 < 15 &&
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y - 2)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y - 3)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 16] = 1;
    else
        valid[X][Y][pointer + 16] = 0;
    // o o A o o  270
    if(Y - 2 >= 0 && Y + 2 < 15 && 
        i_board[X * 15 + (Y - 2)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y + 2)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 17] = 1;
    else
        valid[X][Y][pointer + 17] = 0;



    // A o o o o  315
    if(X + 4 < 15 && Y - 4 >= 0 &&
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[(X + 4) * 15 + (Y - 4)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 18] = 1;
    else
        valid[X][Y][pointer + 18] = 0;
    // o A o o o  315
    if(X - 1 >= 0 && X + 3 < 15 && Y - 3 >= 0 && Y + 1 < 15 &&
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} &&
        i_board[(X + 3) * 15 + (Y - 3)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 19] = 1;
    else
        valid[X][Y][pointer + 19] = 0;
    // o o A o o  315
    if(X - 2 >= 0 && X + 2 < 15 && Y - 2 >= 0 && Y + 2 < 15 && 
        i_board[(X - 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 20] = 1;
    else
        valid[X][Y][pointer + 20] = 0;


    
    // A o o o o  0
    if(X + 4 < 15 &&
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 4) * 15 + Y] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 21] = 1;
    else
        valid[X][Y][pointer + 21] = 0;
    // o A o o o  0
    if(X - 1 >= 0 && X + 3 < 15 &&
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X + 3) * 15 + Y] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 22] = 1;
    else
        valid[X][Y][pointer + 22] = 0;
    // o o A o o  0
    if(X - 2 >= 0 && X + 2 < 15 && 
        i_board[(X - 2) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + Y] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 23] = 1;
    else
        valid[X][Y][pointer + 23] = 0;
    
    assign check = i_board[X * 15 + Y][1] & (valid[X][Y][pointer + 0] | valid[X][Y][pointer + 1] | valid[X][Y][pointer + 2] | valid[X][Y][pointer + 3] | valid[X][Y][pointer + 4]
     | valid[X][Y][pointer + 5] | valid[X][Y][pointer + 6] | valid[X][Y][pointer + 7] | valid[X][Y][pointer + 8] | valid[X][Y][pointer + 9]
      | valid[X][Y][pointer + 10] | valid[X][Y][pointer + 11] | valid[X][Y][pointer + 12] | valid[X][Y][pointer + 13] | valid[X][Y][pointer + 14]
       | valid[X][Y][pointer + 15] | valid[X][Y][pointer + 16] | valid[X][Y][pointer + 17] | valid[X][Y][pointer + 18] | valid[X][Y][pointer + 19]
        | valid[X][Y][pointer + 20] | valid[X][Y][pointer + 21] | valid[X][Y][pointer + 22] | valid[X][Y][pointer + 23]);
endtask

task LiveThreeThreat(
    output check
);
    check = defense_livethree[0][0] | defense_livethree[0][1] | defense_livethree[0][2] | defense_livethree[0][3] | defense_livethree[0][4] | defense_livethree[0][5] | defense_livethree[0][6] | defense_livethree[0][7] | defense_livethree[0][8] | defense_livethree[0][9] | defense_livethree[0][10] | defense_livethree[0][11] | defense_livethree[0][12] | defense_livethree[0][13] | defense_livethree[0][14]
        | defense_livethree[1][0] | defense_livethree[1][1] | defense_livethree[1][2] | defense_livethree[1][3] | defense_livethree[1][4] | defense_livethree[1][5] | defense_livethree[1][6] | defense_livethree[1][7] | defense_livethree[1][8] | defense_livethree[1][9] | defense_livethree[1][10] | defense_livethree[1][11] | defense_livethree[1][12] | defense_livethree[1][13] | defense_livethree[1][14]
        | defense_livethree[2][0] | defense_livethree[2][1] | defense_livethree[2][2] | defense_livethree[2][3] | defense_livethree[2][4] | defense_livethree[2][5] | defense_livethree[2][6] | defense_livethree[2][7] | defense_livethree[2][8] | defense_livethree[2][9] | defense_livethree[2][10] | defense_livethree[2][11] | defense_livethree[2][12] | defense_livethree[2][13] | defense_livethree[2][14]
        | defense_livethree[3][0] | defense_livethree[3][1] | defense_livethree[3][2] | defense_livethree[3][3] | defense_livethree[3][4] | defense_livethree[3][5] | defense_livethree[3][6] | defense_livethree[3][7] | defense_livethree[3][8] | defense_livethree[3][9] | defense_livethree[3][10] | defense_livethree[3][11] | defense_livethree[3][12] | defense_livethree[3][13] | defense_livethree[3][14]
        | defense_livethree[4][0] | defense_livethree[4][1] | defense_livethree[4][2] | defense_livethree[4][3] | defense_livethree[4][4] | defense_livethree[4][5] | defense_livethree[4][6] | defense_livethree[4][7] | defense_livethree[4][8] | defense_livethree[4][9] | defense_livethree[4][10] | defense_livethree[4][11] | defense_livethree[4][12] | defense_livethree[4][13] | defense_livethree[4][14]
        | defense_livethree[5][0] | defense_livethree[5][1] | defense_livethree[5][2] | defense_livethree[5][3] | defense_livethree[5][4] | defense_livethree[5][5] | defense_livethree[5][6] | defense_livethree[5][7] | defense_livethree[5][8] | defense_livethree[5][9] | defense_livethree[5][10] | defense_livethree[5][11] | defense_livethree[5][12] | defense_livethree[5][13] | defense_livethree[5][14]
        | defense_livethree[6][0] | defense_livethree[6][1] | defense_livethree[6][2] | defense_livethree[6][3] | defense_livethree[6][4] | defense_livethree[6][5] | defense_livethree[6][6] | defense_livethree[6][7] | defense_livethree[6][8] | defense_livethree[6][9] | defense_livethree[6][10] | defense_livethree[6][11] | defense_livethree[6][12] | defense_livethree[6][13] | defense_livethree[6][14]
        | defense_livethree[7][0] | defense_livethree[7][1] | defense_livethree[7][2] | defense_livethree[7][3] | defense_livethree[7][4] | defense_livethree[7][5] | defense_livethree[7][6] | defense_livethree[7][7] | defense_livethree[7][8] | defense_livethree[7][9] | defense_livethree[7][10] | defense_livethree[7][11] | defense_livethree[7][12] | defense_livethree[7][13] | defense_livethree[7][14]
        | defense_livethree[8][0] | defense_livethree[8][1] | defense_livethree[8][2] | defense_livethree[8][3] | defense_livethree[8][4] | defense_livethree[8][5] | defense_livethree[8][6] | defense_livethree[8][7] | defense_livethree[8][8] | defense_livethree[8][9] | defense_livethree[8][10] | defense_livethree[8][11] | defense_livethree[8][12] | defense_livethree[8][13] | defense_livethree[8][14]
        | defense_livethree[9][0] | defense_livethree[9][1] | defense_livethree[9][2] | defense_livethree[9][3] | defense_livethree[9][4] | defense_livethree[9][5] | defense_livethree[9][6] | defense_livethree[9][7] | defense_livethree[9][8] | defense_livethree[9][9] | defense_livethree[9][10] | defense_livethree[9][11] | defense_livethree[9][12] | defense_livethree[9][13] | defense_livethree[9][14]
        | defense_livethree[10][0] | defense_livethree[10][1] | defense_livethree[10][2] | defense_livethree[10][3] | defense_livethree[10][4] | defense_livethree[10][5] | defense_livethree[10][6] | defense_livethree[10][7] | defense_livethree[10][8] | defense_livethree[10][9] | defense_livethree[10][10] | defense_livethree[10][11] | defense_livethree[10][12] | defense_livethree[10][13] | defense_livethree[10][14]
        | defense_livethree[11][0] | defense_livethree[11][1] | defense_livethree[11][2] | defense_livethree[11][3] | defense_livethree[11][4] | defense_livethree[11][5] | defense_livethree[11][6] | defense_livethree[11][7] | defense_livethree[11][8] | defense_livethree[11][9] | defense_livethree[11][10] | defense_livethree[11][11] | defense_livethree[11][12] | defense_livethree[11][13] | defense_livethree[11][14]
        | defense_livethree[12][0] | defense_livethree[12][1] | defense_livethree[12][2] | defense_livethree[12][3] | defense_livethree[12][4] | defense_livethree[12][5] | defense_livethree[12][6] | defense_livethree[12][7] | defense_livethree[12][8] | defense_livethree[12][9] | defense_livethree[12][10] | defense_livethree[12][11] | defense_livethree[12][12] | defense_livethree[12][13] | defense_livethree[12][14]
        | defense_livethree[13][0] | defense_livethree[13][1] | defense_livethree[13][2] | defense_livethree[13][3] | defense_livethree[13][4] | defense_livethree[13][5] | defense_livethree[13][6] | defense_livethree[13][7] | defense_livethree[13][8] | defense_livethree[13][9] | defense_livethree[13][10] | defense_livethree[13][11] | defense_livethree[13][12] | defense_livethree[13][13] | defense_livethree[13][14]
        | defense_livethree[14][0] | defense_livethree[14][1] | defense_livethree[14][2] | defense_livethree[14][3] | defense_livethree[14][4] | defense_livethree[14][5] | defense_livethree[14][6] | defense_livethree[14][7] | defense_livethree[14][8] | defense_livethree[14][9] | defense_livethree[14][10] | defense_livethree[14][11] | defense_livethree[14][12] | defense_livethree[14][13] | defense_livethree[14][14];
endtask
task BlockedFourThreat(
    output check
);
    check = defense_blockedfour[0][0] | defense_blockedfour[0][1] | defense_blockedfour[0][2] | defense_blockedfour[0][3] | defense_blockedfour[0][4] | defense_blockedfour[0][5] | defense_blockedfour[0][6] | defense_blockedfour[0][7] | defense_blockedfour[0][8] | defense_blockedfour[0][9] | defense_blockedfour[0][10] | defense_blockedfour[0][11] | defense_blockedfour[0][12] | defense_blockedfour[0][13] | defense_blockedfour[0][14]
        | defense_blockedfour[1][0] | defense_blockedfour[1][1] | defense_blockedfour[1][2] | defense_blockedfour[1][3] | defense_blockedfour[1][4] | defense_blockedfour[1][5] | defense_blockedfour[1][6] | defense_blockedfour[1][7] | defense_blockedfour[1][8] | defense_blockedfour[1][9] | defense_blockedfour[1][10] | defense_blockedfour[1][11] | defense_blockedfour[1][12] | defense_blockedfour[1][13] | defense_blockedfour[1][14]
        | defense_blockedfour[2][0] | defense_blockedfour[2][1] | defense_blockedfour[2][2] | defense_blockedfour[2][3] | defense_blockedfour[2][4] | defense_blockedfour[2][5] | defense_blockedfour[2][6] | defense_blockedfour[2][7] | defense_blockedfour[2][8] | defense_blockedfour[2][9] | defense_blockedfour[2][10] | defense_blockedfour[2][11] | defense_blockedfour[2][12] | defense_blockedfour[2][13] | defense_blockedfour[2][14]
        | defense_blockedfour[3][0] | defense_blockedfour[3][1] | defense_blockedfour[3][2] | defense_blockedfour[3][3] | defense_blockedfour[3][4] | defense_blockedfour[3][5] | defense_blockedfour[3][6] | defense_blockedfour[3][7] | defense_blockedfour[3][8] | defense_blockedfour[3][9] | defense_blockedfour[3][10] | defense_blockedfour[3][11] | defense_blockedfour[3][12] | defense_blockedfour[3][13] | defense_blockedfour[3][14]
        | defense_blockedfour[4][0] | defense_blockedfour[4][1] | defense_blockedfour[4][2] | defense_blockedfour[4][3] | defense_blockedfour[4][4] | defense_blockedfour[4][5] | defense_blockedfour[4][6] | defense_blockedfour[4][7] | defense_blockedfour[4][8] | defense_blockedfour[4][9] | defense_blockedfour[4][10] | defense_blockedfour[4][11] | defense_blockedfour[4][12] | defense_blockedfour[4][13] | defense_blockedfour[4][14]
        | defense_blockedfour[5][0] | defense_blockedfour[5][1] | defense_blockedfour[5][2] | defense_blockedfour[5][3] | defense_blockedfour[5][4] | defense_blockedfour[5][5] | defense_blockedfour[5][6] | defense_blockedfour[5][7] | defense_blockedfour[5][8] | defense_blockedfour[5][9] | defense_blockedfour[5][10] | defense_blockedfour[5][11] | defense_blockedfour[5][12] | defense_blockedfour[5][13] | defense_blockedfour[5][14]
        | defense_blockedfour[6][0] | defense_blockedfour[6][1] | defense_blockedfour[6][2] | defense_blockedfour[6][3] | defense_blockedfour[6][4] | defense_blockedfour[6][5] | defense_blockedfour[6][6] | defense_blockedfour[6][7] | defense_blockedfour[6][8] | defense_blockedfour[6][9] | defense_blockedfour[6][10] | defense_blockedfour[6][11] | defense_blockedfour[6][12] | defense_blockedfour[6][13] | defense_blockedfour[6][14]
        | defense_blockedfour[7][0] | defense_blockedfour[7][1] | defense_blockedfour[7][2] | defense_blockedfour[7][3] | defense_blockedfour[7][4] | defense_blockedfour[7][5] | defense_blockedfour[7][6] | defense_blockedfour[7][7] | defense_blockedfour[7][8] | defense_blockedfour[7][9] | defense_blockedfour[7][10] | defense_blockedfour[7][11] | defense_blockedfour[7][12] | defense_blockedfour[7][13] | defense_blockedfour[7][14]
        | defense_blockedfour[8][0] | defense_blockedfour[8][1] | defense_blockedfour[8][2] | defense_blockedfour[8][3] | defense_blockedfour[8][4] | defense_blockedfour[8][5] | defense_blockedfour[8][6] | defense_blockedfour[8][7] | defense_blockedfour[8][8] | defense_blockedfour[8][9] | defense_blockedfour[8][10] | defense_blockedfour[8][11] | defense_blockedfour[8][12] | defense_blockedfour[8][13] | defense_blockedfour[8][14]
        | defense_blockedfour[9][0] | defense_blockedfour[9][1] | defense_blockedfour[9][2] | defense_blockedfour[9][3] | defense_blockedfour[9][4] | defense_blockedfour[9][5] | defense_blockedfour[9][6] | defense_blockedfour[9][7] | defense_blockedfour[9][8] | defense_blockedfour[9][9] | defense_blockedfour[9][10] | defense_blockedfour[9][11] | defense_blockedfour[9][12] | defense_blockedfour[9][13] | defense_blockedfour[9][14]
        | defense_blockedfour[10][0] | defense_blockedfour[10][1] | defense_blockedfour[10][2] | defense_blockedfour[10][3] | defense_blockedfour[10][4] | defense_blockedfour[10][5] | defense_blockedfour[10][6] | defense_blockedfour[10][7] | defense_blockedfour[10][8] | defense_blockedfour[10][9] | defense_blockedfour[10][10] | defense_blockedfour[10][11] | defense_blockedfour[10][12] | defense_blockedfour[10][13] | defense_blockedfour[10][14]
        | defense_blockedfour[11][0] | defense_blockedfour[11][1] | defense_blockedfour[11][2] | defense_blockedfour[11][3] | defense_blockedfour[11][4] | defense_blockedfour[11][5] | defense_blockedfour[11][6] | defense_blockedfour[11][7] | defense_blockedfour[11][8] | defense_blockedfour[11][9] | defense_blockedfour[11][10] | defense_blockedfour[11][11] | defense_blockedfour[11][12] | defense_blockedfour[11][13] | defense_blockedfour[11][14]
        | defense_blockedfour[12][0] | defense_blockedfour[12][1] | defense_blockedfour[12][2] | defense_blockedfour[12][3] | defense_blockedfour[12][4] | defense_blockedfour[12][5] | defense_blockedfour[12][6] | defense_blockedfour[12][7] | defense_blockedfour[12][8] | defense_blockedfour[12][9] | defense_blockedfour[12][10] | defense_blockedfour[12][11] | defense_blockedfour[12][12] | defense_blockedfour[12][13] | defense_blockedfour[12][14]
        | defense_blockedfour[13][0] | defense_blockedfour[13][1] | defense_blockedfour[13][2] | defense_blockedfour[13][3] | defense_blockedfour[13][4] | defense_blockedfour[13][5] | defense_blockedfour[13][6] | defense_blockedfour[13][7] | defense_blockedfour[13][8] | defense_blockedfour[13][9] | defense_blockedfour[13][10] | defense_blockedfour[13][11] | defense_blockedfour[13][12] | defense_blockedfour[13][13] | defense_blockedfour[13][14]
        | defense_blockedfour[14][0] | defense_blockedfour[14][1] | defense_blockedfour[14][2] | defense_blockedfour[14][3] | defense_blockedfour[14][4] | defense_blockedfour[14][5] | defense_blockedfour[14][6] | defense_blockedfour[14][7] | defense_blockedfour[14][8] | defense_blockedfour[14][9] | defense_blockedfour[14][10] | defense_blockedfour[14][11] | defense_blockedfour[14][12] | defense_blockedfour[14][13] | defense_blockedfour[14][14];   
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
    state_w         = state_r;
    finish_w        = finish_r;
    win_w           = 1'b0;
    case (state_r)
        S_IDLE: begin
            finish_w = 1'b0;
            if(i_start) begin
                state_w = S_COUNT;
                for(int i = 0; i < 15; i++) begin
                    for(int j = 0; j < 15; j++) begin
                        Offense_live_three(.X(i[3:0]), .Y(j[3:0]), .turn(i_turn), .pointer(8'd0), .check(offense_livethree[i][j]));
                        Offense_blocked_four(.X(i[3:0]), .Y(j[3:0]), .turn(i_turn), .pointer(8'd36), .check(offense_blockedfour[i][j]));
                        Offense_live_four(.X(i[3:0]), .Y(j[3:0]), .turn(i_turn), .pointer(8'd116), .check(offense_livefour[i][j]));
                        Defense_three(.X(i[3:0]), .Y(j[3:0]), .turn(i_turn), .pointer(8'd132), .check(defense_livethree[i][j]));
                        Defense_four(.X(i[3:0]), .Y(j[3:0]), .turn(i_turn), .pointer(8'd164), .check(defense_blockedfour[i][j]));
                        Win(.X(i[3:0]), .Y(j[3:0]), .turn(i_turn), .check(win[i][j]));
                    end
                end
                LiveThreeThreat(.check(live_three_threat));
                BlockedFourThreat(.check(blocked_four_threat));
            end
        end
        S_COUNT: begin
            pointer[0] = 10'd999;
            if(blocked_four_threat) begin
                //$display("blocked four threat !!");
                for(int i = 0; i < 15; i++) begin
                    for(int j = 0; j < 15; j++) begin
                        if(defense_blockedfour[i][j]) begin
                            output_X[pointer[i * 15 + j] -: 4] = i[3:0];
                            output_Y[pointer[i * 15 + j] -: 4] = j[3:0];
                            pointer[i * 15 + j + 1] = pointer[i * 15 + j] - 4;
                        end
                        else begin
                            pointer[i * 15 + j + 1] = pointer[i * 15 + j];
                        end
                    end
                end    
            end
            else if(live_three_threat) begin
                //$display("live three threat !!");
                for(int i = 0; i < 15; i++) begin
                    for(int j = 0; j < 15; j++) begin
                        if(offense_blockedfour[i][j] || offense_livefour[i][j] || defense_livethree[i][j]) begin
                            output_X[pointer[i * 15 + j] -: 4] = i[3:0];
                            output_Y[pointer[i * 15 + j] -: 4] = j[3:0];
                            pointer[i * 15 + j + 1] = pointer[i * 15 + j] - 4;
                        end
                        else begin
                            pointer[i * 15 + j + 1] = pointer[i * 15 + j];
                        end
                    end
                end
            end
            else begin  // no threat !!
                for(int i = 0; i < 15; i++) begin
                    for(int j = 0; j < 15; j++) begin
                        if(offense_blockedfour[i][j] || offense_livefour[i][j] || offense_livethree[i][j]) begin
                            output_X[pointer[i * 15 + j] -: 4] = i[3:0];
                            output_Y[pointer[i * 15 + j] -: 4] = j[3:0];
                            pointer[i * 15 + j + 1] = pointer[i * 15 + j] - 4;
                        end
                        else begin
                            pointer[i * 15 + j + 1] = pointer[i * 15 + j];
                        end        
                    end
                end
            end
            
            // Check if win !! 
            for(int i = 0; i < 15; i++) begin
                for(int j = 0; j < 15; j++) begin
                    if(win[i][j])
                        win_w = 1'b1;
                end
            end
            finish_w    = 1'b1;
            state_w     = S_IDLE;
        end
    endcase
end

always_ff @(posedge i_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        state_r         <= S_IDLE;
        finish_r        <= 1'b0;
        win_r           <= 1'b0;
    end
    else begin
        state_r         <= state_w;
        finish_r        <= finish_w;
        win_r           <= win_w;
    end
end
endmodule