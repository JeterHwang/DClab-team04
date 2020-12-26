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
logic offense[15][15];
logic defense[15][15];
logic win[15][15];
logic ok[15][15];

assign o_posX   = output_X;
assign o_posY   = output_Y;
assign o_size   = pointer[225];
assign o_finish = finish_r;
assign o_win    = win_r;

task Offense(
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


// blocked fours
    // lA...x ,0
    if((X < 11 &&  X > 0) && 
        (i_board[(X+1)*15 + Y] == turn &&  i_board[(X+2)*15 + Y] == turn  && i_board[(X+3)*15 + Y] == turn)  &&
        (i_board[(X+4)*15 + Y] == {turn[1],~turn[0]}) &&
        (i_board[(X-1)*15 + Y] == l))
            valid[X][Y][pointer + 36] = 1;
    else    
        valid[X][Y][pointer + 36] = 0;
    // l.A..x ,0
    if((X < 12 && X > 1) && 
        (i_board[(X+1)*15+Y] == turn &&  i_board[(X+2)*15+Y] == turn  && i_board[(X-1)*15+Y] == turn)  &&
        (i_board[(X+3)*15+Y] == {turn[1],~turn[0]}) &&
        (i_board[(X-2)*15+Y] == l))
        valid[X][Y][pointer + 37] = 1;
    else
        valid[X][Y][pointer + 37] = 0;
    // l..A.x ,0
    if((X < 13 && X > 2) && 
        (i_board[(X+1)*15+Y] == turn &&  i_board[(X-1)*15+Y] == turn  && i_board[(X-2)*15+Y] == turn)  &&
        (i_board[(X+2)*15+Y] == {turn[1],~turn[0]}) &&
        (i_board[(X-3)*15+Y] == l))
        valid[X][Y][pointer + 38] = 1;
    else
        valid[X][Y][pointer + 38] = 0;
    // l...Ax ,0
    if( (X < 14 && X > 3) && 
        (i_board[(X-1)*15+Y] == turn &&  i_board[(X-2)*15+Y] == turn  && i_board[(X-3)*15+Y] == turn)  &&
        (i_board[(X+1)*15+Y] == {turn[1],~turn[0]}) &&
        (i_board[(X-4)*15+Y] == l))
        valid[X][Y][pointer + 39] = 1;
    else
        valid[X][Y][pointer + 39] = 0;
    // lA ...x ,45
    if((X < 11 && Y < 11 && X > 0 && Y > 0) && 
        (i_board[(X+1)*15+(Y+1)] == turn &&  i_board[(X+2)*15+(Y+2)] == turn  && i_board[(X+3)*15+(Y+3)] == turn)  &&
        (i_board[(X+4)*15+(Y+4)] == {turn[1],~turn[0]}) &&
        (i_board[(X-1)*15+(Y-1)] == l))
        valid[X][Y][pointer + 40] = 1;
    else
        valid[X][Y][pointer + 40] = 0;
    // l.A..x ,45
    if((X < 12 && Y < 12 && X > 1 && Y > 1) && 
        (i_board[(X+1)*15+(Y+1)] == turn &&  i_board[(X+2)*15+(Y+2)] == turn  && i_board[(X-1)*15+(Y-1)] == turn)  &&
        (i_board[(X+3)*15+(Y+3)] == {turn[1],~turn[0]}) &&
        (i_board[(X-2)*15+(Y-2)] == l))
        valid[X][Y][pointer + 41] = 1;
    else
        valid[X][Y][pointer + 41] = 0;
    // l..A.x ,45
    if((X < 13 && Y < 13 && X > 2 && Y > 2) && 
        (i_board[(X+1)*15+(Y+1)] == turn &&  i_board[(X-2)*15+(Y-2)] == turn  && i_board[(X-1)*15+(Y-1)] == turn)  &&
        (i_board[(X+2)*15+(Y+2)] == {turn[1],~turn[0]}) &&
        (i_board[(X-3)*15+(Y-3)] == l))
        valid[X][Y][pointer + 42] = 1;
    else
        valid[X][Y][pointer + 42] = 0;
    // l...Ax ,45
    if( (X < 14 && Y < 14 && X > 3 && Y > 3) && 
        (i_board[(X-3)*15+(Y-3)] == turn &&  i_board[(X-2)*15+(Y-2)] == turn  && i_board[(X-1)*15+(Y-1)] == turn)  &&
        (i_board[(X+1)*15+(Y+1)] == {turn[1],~turn[0]}) &&
        (i_board[(X-4)*15+(Y-4)] == l))
        valid[X][Y][pointer + 43] = 1;
    else
        valid[X][Y][pointer + 43] = 0;
    // lA...x ,90
    if( (Y < 11 && Y > 0) && 
        (i_board[X*15+Y+1] == turn &&  i_board[X*15+Y+2] == turn  && i_board[X*15+Y+3] == turn)  &&
        (i_board[X*15+Y+4] == {turn[1],~turn[0]}) &&
        (i_board[X*15+Y-1] == l))
        valid[X][Y][pointer + 44] = 1;
    else
        valid[X][Y][pointer + 44] = 0;
    // l.A..x ,90
    if( (Y < 12 && Y > 1) && 
        (i_board[X*15+Y+1] == turn &&  i_board[X*15+Y+2] == turn  && i_board[X*15+Y-1] == turn)  &&
        (i_board[X*15+Y+3] == {turn[1],~turn[0]}) &&
        (i_board[X*15+Y-2] == l))
        valid[X][Y][pointer + 45] = 1;
    else
        valid[X][Y][pointer + 45] = 0;
    // l..A.x ,90
    if( (Y < 13 && Y > 2) && 
        (i_board[X*15+Y+1] == turn &&  i_board[X*15+Y-2] == turn  && i_board[X*15+Y-1] == turn)  &&
        (i_board[X*15+Y+2] == {turn[1],~turn[0]}) &&
        (i_board[X*15+Y-3] == l))
        valid[X][Y][pointer + 46] = 1;
    else
        valid[X][Y][pointer + 46] = 0;
    // l...Ax ,90
    if( (Y < 14 && Y > 3) && 
        (i_board[X*15+Y-3] == turn &&  i_board[X*15+Y-2] == turn  && i_board[X*15+Y-1] == turn)  &&
        (i_board[X*15+Y+1] == {turn[1],~turn[0]}) &&
        (i_board[X*15+(Y-4)] == l))
        valid[X][Y][pointer + 47] = 1;
    else
        valid[X][Y][pointer + 47] = 0;
    // x...Al ,135
    if((X < 14 && Y < 11 && X > 3 && Y > 0) && 
        (i_board[(X-1)*15+(Y+1)] == turn &&  i_board[(X-2)*15+(Y+2)] == turn  && i_board[(X-3)*15+(Y+3)] == turn)  &&
        (i_board[(X-4)*15+(Y+4)] == {turn[1],~turn[0]}) &&
        (i_board[(X+1)*15+(Y-1)] == l))
        valid[X][Y][pointer + 48] = 1;
    else
        valid[X][Y][pointer + 48] = 0;
    // x..A.l ,135
    if((X < 13 && Y < 12 && X > 2 && Y > 1) && 
        (i_board[(X-1)*15+(Y+1)] == turn &&  i_board[(X-2)*15+(Y+2)] == turn  && i_board[(X+1)*15+(Y-1)] == turn)  &&
        (i_board[(X-3)*15+(Y+3)] == {turn[1],~turn[0]}) &&
        (i_board[(X+2)*15+(Y-2)] == l))
        valid[X][Y][pointer + 49] = 1;
    else
        valid[X][Y][pointer + 49] = 0;
    // x.A..l ,135
    if((X < 12 && Y < 13 && X > 1 && Y > 2) && 
        (i_board[(X-1)*15+(Y+1)] == turn &&  i_board[(X+1)*15+(Y-1)] == turn  && i_board[(X+2)*15+(Y-2)] == turn)  &&
        (i_board[(X-2)*15+(Y+2)] == {turn[1],~turn[0]}) &&
        (i_board[(X+3)*15+(Y-3)] == l))
        valid[X][Y][pointer + 50] = 1;
    else
        valid[X][Y][pointer + 50] = 0;
    // xA...l ,135
    if( (X < 11 && Y < 14 && X > 0 && Y > 3) && 
        (i_board[(X+1)*15+(Y-1)] == turn &&  i_board[(X+2)*15+(Y-2)] == turn  && i_board[(X+3)*15+(Y-3)] == turn)  &&
        (i_board[(X-1)*15+(Y+1)] == {turn[1],~turn[0]}) &&
        (i_board[(X+4)*15+(Y-4)] == l))
        valid[X][Y][pointer + 51] = 1;
    else
        valid[X][Y][pointer + 51] = 0;
    // x...Al ,180
    if((X < 14 &&  X > 3) && 
        (i_board[(X-1)*15+Y] == turn &&  i_board[(X-2)*15+Y] == turn  && i_board[(X-3)*15+Y] == turn)  &&
        (i_board[(X-4)*15+Y] == {turn[1],~turn[0]}) &&
        (i_board[(X+1)*15+Y] == l))
        valid[X][Y][pointer + 52] = 1;
    else
        valid[X][Y][pointer + 52] = 0;
    // x..A.l ,180
    if((X < 13 && X > 2) && 
        (i_board[(X-1)*15+Y] == turn &&  i_board[(X-2)*15+Y] == turn  && i_board[(X+1)*15+Y] == turn)  &&
        (i_board[(X-3)*15+Y] == {turn[1],~turn[0]}) &&
        (i_board[(X+2)*15+Y] == l))
        valid[X][Y][pointer + 53] = 1;
    else
        valid[X][Y][pointer + 53] = 0;
    // x.A..l ,180
    if((X < 12 && X > 1) && 
        (i_board[(X-1)*15+Y] == turn &&  i_board[(X+1)*15+Y] == turn  && i_board[(X+2)*15+Y] == turn)  &&
        (i_board[(X-2)*15+Y] == {turn[1],~turn[0]}) &&
        (i_board[(X+3)*15+Y] == l))
        valid[X][Y][pointer + 54] = 1;
    else
        valid[X][Y][pointer + 54] = 0;
    // xA...l ,180
    if( (X < 11 && X > 0) && 
        (i_board[(X+1)*15+Y] == turn &&  i_board[(X+2)*15+Y] == turn  && i_board[(X+3)*15+Y] == turn)  &&
        (i_board[(X-1)*15+Y] == {turn[1],~turn[0]}) &&
        (i_board[(X+4)*15+Y] == l))
        valid[X][Y][pointer + 55] = 1;
    else
        valid[X][Y][pointer + 55] = 0;
    // x...Al ,225
    if((X < 14 && Y < 14 && X > 3 && Y > 3) && 
        (i_board[(X-1)*15+(Y-1)] == turn &&  i_board[(X-2)*15+(Y-2)] == turn  && i_board[(X-3)*15+(Y-3)] == turn)  &&
        (i_board[(X-4)*15+(Y-4)] == {turn[1],~turn[0]}) &&
        (i_board[(X+1)*15+(Y+1)] == l))
        valid[X][Y][pointer + 56] = 1;
    else
        valid[X][Y][pointer + 56] = 0;
    // x..A.l ,225
    if((X < 13 && Y < 13 && X > 2 && Y > 2) && 
        (i_board[(X-1)*15+(Y-1)] == turn &&  i_board[(X-2)*15+(Y-2)] == turn  && i_board[(X+1)*15+(Y+1)] == turn)  &&
        (i_board[(X-3)*15+(Y-3)] == {turn[1],~turn[0]}) &&
        (i_board[(X+2)*15+(Y+2)] == l))
        valid[X][Y][pointer + 57] = 1;
    else
        valid[X][Y][pointer + 57] = 0;
    // x.A..l ,225
    if((X < 12 && Y < 12 && X > 1 && Y > 1) && 
        (i_board[(X-1)*15+(Y-1)] == turn &&  i_board[(X+1)*15+(Y+1)] == turn  && i_board[(X+2)*15+(Y+2)] == turn)  &&
        (i_board[(X-2)*15+(Y-2)] == {turn[1],~turn[0]}) &&
        (i_board[(X+3)*15+(Y+3)] == l))
        valid[X][Y][pointer + 58] = 1;
    else
        valid[X][Y][pointer + 58] = 0;
    // xA...l ,225
    if( (X < 11 && Y < 11 && X > 0 && Y > 0) && 
       (i_board[(X+1)*15+(Y+1)] == turn &&  i_board[(X+2)*15+(Y+2)] == turn  && i_board[(X+3)*15+(Y+3)] == turn)  &&
        (i_board[(X-1)*15+(Y-1)] == {turn[1],~turn[0]}) &&
        (i_board[(X+4)*15+(Y+4)] == l))
        valid[X][Y][pointer + 59] = 1;
    else
        valid[X][Y][pointer + 59] = 0;
    // lA...x ,270
    if( (Y < 14 && Y > 3) && 
        (i_board[X*15+Y-1] == turn &&  i_board[X*15+Y-2] == turn  && i_board[X*15+Y-3] == turn)  &&
        (i_board[X*15+Y-4] == {turn[1],~turn[0]}) &&
        (i_board[X*15+Y+1] == l))
        valid[X][X*15+Y][pointer + 60] = 1;
    else
        valid[X][Y][pointer + 60] = 0;
    // l.A..x ,270
    if( (Y < 13 && Y > 2) && 
        (i_board[X*15+Y-1] == turn &&  i_board[X*15+Y-2] == turn  && i_board[X*15+Y+1] == turn)  &&
        (i_board[X*15+Y-3] == {turn[1],~turn[0]}) &&
        (i_board[X*15+Y+2] == l))
        valid[X][Y][pointer + 61] = 1;
    else
        valid[X][Y][pointer + 61] = 0;
    // l..A.x ,270
    if( (Y < 12 && Y > 1) && 
        (i_board[X*15+Y-1] == turn &&  i_board[X*15+Y+1] == turn  && i_board[X*15+Y+2] == turn)  &&
        (i_board[X*15+Y-2] == {turn[1],~turn[0]}) &&
        (i_board[X*15+Y+3] == l))
        valid[X][Y][pointer + 62] = 1;
    else
        valid[X][Y][pointer + 62] = 0;
    // l...Ax ,270
    if( (Y < 11 && Y > 0) && 
        (i_board[X*15+Y+3] == turn &&  i_board[X*15+Y+2] == turn  && i_board[X*15+Y+1] == turn)  &&
        (i_board[X*15+Y-1] == {turn[1],~turn[0]}) &&
        (i_board[X*15+(Y+4)] == l))
        valid[X][Y][pointer + 63] = 1;
    else
        valid[X][Y][pointer + 63] = 0;
    // lA ...x ,315
    if((X < 11 && Y < 14 && X > 0 && Y > 3) && 
        (i_board[(X+1)*15+(Y-1)] == turn &&  i_board[(X+2)*15+(Y+2)] == turn  && i_board[(X+3)*15+(Y-3)] == turn)  &&
        (i_board[(X+4)*15+(Y-4)] == {turn[1],~turn[0]}) &&
        (i_board[(X-1)*15+(Y+1)] == l))
        valid[X][Y][pointer + 64] = 1;
    else
        valid[X][Y][pointer + 64] = 0;
    // l.A..x ,315
    if((X < 12 && Y < 13 && X > 1 && Y > 2) && 
        (i_board[(X+1)*15+(Y-1)] == turn &&  i_board[(X+2)*15+(Y-2)] == turn  && i_board[(X-1)*15+(Y+1)] == turn)  &&
        (i_board[(X+3)*15+(Y-3)] == {turn[1],~turn[0]}) &&
        (i_board[(X-2)*15+(Y+2)] == l))
        valid[X][Y][pointer + 65] = 1;
    else
        valid[X][Y][pointer + 65] = 0;
    // l..A.x ,315
    if((X < 13 && Y < 12 && X > 2 && Y > 1) && 
        (i_board[(X+1)*15+(Y-1)] == turn &&  i_board[(X-1)*15+(Y+1)] == turn  && i_board[(X-2)*15+(Y-2)] == turn)  &&
        (i_board[(X+2)*15+(Y-2)] == {turn[1],~turn[0]}) &&
        (i_board[(X-3)*15+(Y+3)] == l))
        valid[X][Y][pointer + 66] = 1;
    else
        valid[X][Y][pointer + 66] = 0;
    // l...Ax ,315
    if( (X < 14 && Y < 11 && X > 3 && Y > 0) && 
        (i_board[(X-3)*15+(Y+3)] == turn &&  i_board[(X-2)*15+(Y+2)] == turn  && i_board[(X-1)*15+(Y+1)] == turn)  &&
        (i_board[(X+1)*15+(Y-1)] == {turn[1],~turn[0]}) &&
        (i_board[(X-4)*15+(Y+4)] == l))
        valid[X][Y][pointer + 67] = 1;
    else
        valid[X][Y][pointer + 67] = 0;


//Second condition
    // Al... ,0
        if( (X < 11) &&
            (i_board[(X+2)*15+Y] == turn && i_board[(X+3)*15+Y] == turn && i_board[(X+4)*15+Y] == turn) &&
            (i_board[(X+1)*15+Y] == l))
            valid[X][Y][pointer +68] = 1;
        else 
            valid[X][Y][pointer +68] = 0;
    // .lA.. ,0
        if( (X < 13 && X > 1) &&
            (i_board[(X-2)*15+Y] == turn && i_board[(X+1)*15+Y] == turn && i_board[(X+2)*15+Y] == turn) &&
            (i_board[(X-1)*15+Y] == l))
            valid[X][Y][pointer +69] = 1;
        else
            valid[X][Y][pointer +69] = 0;
    // .l.A. ,0
        if( (X < 14 && X > 2) &&
            (i_board[(X-3)*15+Y] == turn && i_board[(X-1)*15+Y] == turn && i_board[(X+1)*15+Y] == turn) &&
            (i_board[(X-2)*15+Y] == l))
            valid[X][Y][pointer +70] = 1;
        else 
            valid[X][Y][pointer +70] = 0;
    // .l..A ,0
        if( ( X > 3) &&
            (i_board[(X-4)*15+Y] == turn && i_board[(X-2)*15+Y] == turn && i_board[(X-1)*15+Y] == turn) &&
            (i_board[(X-3)*15+Y] == l))
            valid[X][Y][pointer +71] = 1;
        else
            valid[X][Y][pointer +71] = 0;
    // lA...l ,45
        if ((X < 11 && Y < 11 ) && 
            (i_board[(X+1)*15+Y+1] == turn && i_board[(X+2)*15+Y+2] == turn && i_board[(X+3)*15+Y+3] == turn ) &&
            (i_board[(X+4)*15+Y+4] == l && i_board[(X-1)*15+Y-1] == l)) begin
            valid[X][Y][pointer +117] = 1;
            $display("live four !!");
        end
        else
            valid[X][Y][pointer +117] = 0;
    // Al... ,45
    //    if( (X < 11 && Y < 11) &&
    //        (i_board[(X+2)*15+(Y+2)] == turn && i_board[(X+3)*15+(Y+3)] == turn && i_board[(X+4)*15+(Y+4)] == turn) &&
    //        (i_board[(X+1)*15+(Y+1)] == l)) begin
    //        valid[X][Y][pointer +72] = 1;
    //        $display("blocked four !!");
    //    end
    //    else
    //        valid[X][Y][pointer +72] = 0;
    // .lA.. ,45
        if( (X < 13 && X > 1 && Y < 13 && Y > 1) &&
            (i_board[(X-2)*15+(Y-2)] == turn && i_board[(X+1)*15+(Y+1)] == turn && i_board[(X+2)*15+(Y+2)] == turn) &&
            (i_board[(X-1)*15+(Y-1)] == l))
            valid[X][Y][pointer +73] = 1;
        else
            valid[X][Y][pointer +73] = 0;
    // .l.A. ,45
        if( (X < 14 && X > 2 && Y < 14 && Y > 2) &&
            (i_board[(X-3)*15+(Y-3)] == turn && i_board[(X-1)*15+(Y-1)] == turn && i_board[(X+1)*15+(Y+1)] == turn) &&
            (i_board[(X-2)*15+(Y-2)] == l))
            valid[X][Y][pointer +74] = 1;
        else
            valid[X][Y][pointer +74] = 0;
    // .l..A ,45
        if( (X > 3 &&  Y > 3) &&
            (i_board[(X-4)*15+(Y-4)] == turn && i_board[(X-2)*15+(Y-2)] == turn && i_board[(X-1)*15+(Y-1)] == turn) &&
            (i_board[(X-3)*15+(Y-3)] == l))
            valid[X][Y][pointer +75] = 1;
        else
            valid[X][Y][pointer +75] = 0;

    // Al... ,90
        if( (Y < 11) &&
            (i_board[X*15+Y+2] == turn && i_board[X*15+Y+3] == turn && i_board[X*15+Y+4] == turn) &&
            (i_board[X*15+Y+1] == l))
            valid[X][Y][pointer +76] = 1;
        else
            valid[X][Y][pointer +76] = 0;
    // .lA.. ,90
        if( (Y < 13 && Y > 1) &&
            (i_board[X*15+Y-2] == turn && i_board[X*15+Y+1] == turn && i_board[X*15+Y+2] == turn) &&
            (i_board[X*15+Y-1] == l))
            valid[X][Y][pointer +77] = 1;
        else
            valid[X][Y][pointer +77] = 0;
    // .l.A. ,90
        if( (Y < 14 && Y > 2) &&
            (i_board[X*15+Y-3] == turn && i_board[X*15+Y-1] == turn && i_board[X*15+Y+1] == turn) &&
            (i_board[X*15+Y-2] == l))
            valid[X][Y][pointer +78] = 1;
        else
            valid[X][Y][pointer +78] = 0;
    // .l..A ,90
        if( (Y > 3) &&
            (i_board[X*15+Y-4] == turn && i_board[X*15+Y-2] == turn && i_board[X*15+Y-1] == turn) &&
            (i_board[X*15+Y-3] == l))
            valid[X][Y][pointer +79] = 1;
        else
            valid[X][Y][pointer +79] = 0;

    // ...lA ,135
        if( (X > 3 && Y < 11) &&
            (i_board[(X-2)*15+(Y+2)] == turn && i_board[(X-3)*15+(Y+3)] == turn && i_board[(X-4)*15+(Y+4)] == turn) &&
            (i_board[(X-1)*15+(Y+1)] == l))
            valid[X][Y][pointer +80] = 1;
        else
            valid[X][Y][pointer +80] = 0;
    // ..Al. ,135
        if( (X < 13 && X > 1 && Y < 13 && Y > 1) &&
            (i_board[(X-2)*15+(Y+2)] == turn && i_board[(X-1)*15+(Y+1)] == turn && i_board[(X+2)*15+(Y-2)] == turn) &&
            (i_board[(X+1)*15+(Y-1)] == l))
            valid[X][Y][pointer +81] = 1;
        else
            valid[X][Y][pointer +81] = 0;
    // .A.l. ,135
        if( (X < 12 && X > 0 && Y < 14 && Y > 2) &&
            (i_board[(X-1)*15+(Y+1)] == turn && i_board[(X+1)*15+(Y-1)] == turn && i_board[(X+3)*15+(Y-3)] == turn) &&
            (i_board[(X-2)*15+(Y-2)] == l))
            valid[X][Y][pointer +82] = 1;
        else
            valid[X][Y][pointer +82] = 0;
    // A..l. ,135
        if( (X < 11 && Y > 3) &&
            (i_board[(X+1)*15+(Y-1)] == turn && i_board[(X+2)*15+(Y-2)] == turn && i_board[(X+4)*15+(Y-4)] == turn) &&
            (i_board[(X+3)*15+(Y-3)] == l))
            valid[X][Y][pointer +83] = 1;
        else
            valid[X][Y][pointer +83] = 0;

    // ...lA ,180
        if( (X > 3) &&
            (i_board[(X-2)*15+Y] == turn && i_board[(X-3)*15+Y] == turn && i_board[(X-4)*15+Y] == turn) &&
            (i_board[(X-1)*15+Y] == l))
            valid[X][Y][pointer +84] = 1;
        else
            valid[X][Y][pointer +84] = 0;
    // ..Al. ,180
        if( (X < 13 && X > 1) &&
            (i_board[(X-2)*15+Y] == turn && i_board[(X-1)*15+Y] == turn && i_board[(X+2)*15+Y] == turn) &&
            (i_board[(X-1)*15+Y] == l))
            valid[X][Y][pointer +85] = 1;
        else
            valid[X][Y][pointer +85] = 0;
    // .A.l. ,180
        if( (X < 12 && X > 0) &&
            (i_board[(X+3)*15+Y] == turn && i_board[(X-1)*15+Y] == turn && i_board[(X+1)*15+Y] == turn) &&
            (i_board[(X+2)*15+Y] == l))
            valid[X][Y][pointer +86] = 1;
        else
            valid[X][Y][pointer +86] = 0;
    // A..l. ,180
        if( (X < 11 ) &&
            (i_board[(X+4)*15+Y] == turn && i_board[(X+2)*15+Y] == turn && i_board[(X+1)*15+Y] == turn) &&
            (i_board[(X+3)*15+Y] == l))
            valid[X][Y][pointer +87] = 1;
        else
            valid[X][Y][pointer +87] = 0;

    // ...lA ,225
        if( (X > 3 && Y > 3) &&
            (i_board[(X-2)*15+(Y-2)] == turn && i_board[(X-3)*15+(Y-3)] == turn && i_board[(X-4)*15+(Y-4)] == turn) &&
            (i_board[(X-1)*15+(Y-1)] == l))
            valid[X][Y][pointer +88] = 1;
        else
            valid[X][Y][pointer +88] = 0;
    // ..Al. ,225
        if( (X < 13 && X > 1 && Y < 13 && Y > 1) &&
            (i_board[(X-2)*15+(Y-2)] == turn && i_board[(X-1)*15+(Y-1)] == turn && i_board[(X+2)*15+(Y+2)] == turn) &&
            (i_board[(X+1)*15+(Y+1)] == l))
            valid[X][Y][pointer +89] = 1;
        else
            valid[X][Y][pointer +89] = 0;
    // .A.l. ,225
        if( (X < 12 && X > 0 && Y < 12 && Y > 0) &&
            (i_board[(X+3)*15+(Y+3)] == turn && i_board[(X+1)*15+(Y+1)] == turn && i_board[(X-1)*15+(Y-1)] == turn) &&
            (i_board[(X+2)*15+(Y+2)] == l))
            valid[X][Y][pointer +90] = 1;
        else
            valid[X][Y][pointer +90] = 0;
    // A..l. ,225
        if( (X < 11 &&  Y < 11) &&
            (i_board[(X+4)*15+(Y+4)] == turn && i_board[(X+2)*15+(Y+2)] == turn && i_board[(X+1)*15+(Y+1)] == turn) &&
            (i_board[(X+3)*15+(Y+3)] == l))
            valid[X][Y][pointer +91] = 1;
        else
            valid[X][Y][pointer +91] = 0;

    // Al... ,270
        if( (Y > 3) &&
            (i_board[X*15+Y-2] == turn && i_board[X*15+Y-3] == turn && i_board[X*15+Y-4] == turn) &&
            (i_board[X*15+Y-1] == l))
            valid[X][Y][pointer +92] = 1;
        else
            valid[X][Y][pointer +92] = 0;
    // .lA.. ,270
        if( (Y < 13 && Y > 1) &&
            (i_board[X*15+Y+2] == turn && i_board[X*15+Y-1] == turn && i_board[X*15+Y-2] == turn) &&
            (i_board[X*15+Y+1] == l))
            valid[X][Y][pointer +93] = 1;
        else
            valid[X][Y][pointer +93] = 0;
    // .l.A. ,270
        if( (Y < 14 && Y > 2) &&
            (i_board[X*15+Y+3] == turn && i_board[X*15+Y+1] == turn && i_board[X*15+Y-1] == turn) &&
            (i_board[X*15+Y+2] == l))
            valid[X][Y][pointer +94] = 1;
        else
            valid[X][Y][pointer +94] = 0;
    // .l..A ,270
        if( (Y < 11) &&
            (i_board[X*15+Y+4] == turn && i_board[X*15+Y+2] == turn && i_board[X*15+Y+1] == turn) &&
            (i_board[X*15+Y+3] == l))
            valid[X][Y][pointer +95] = 1;
        else
            valid[X][Y][pointer +95] = 0;

    // Al... ,315
        if( (X < 11 && Y > 3) &&
            (i_board[(X+2)*15+(Y-2)] == turn && i_board[(X-3)*15+(Y-3)] == turn && i_board[(X-4)*15+(Y-4)] == turn) &&
            (i_board[(X+1)*15+(Y-1)] == l))
            valid[X][Y][pointer +96] = 1;
        else
            valid[X][Y][pointer +96] = 0;
    // .lA.. ,315
        if( (X < 13 && X > 1 && Y < 13 && Y > 1) &&
            (i_board[(X-2)*15+(Y+2)] == turn && i_board[(X+1)*15+(Y-1)] == turn && i_board[(X+2)*15+(Y-2)] == turn) &&
            (i_board[(X-1)*15+(Y-1)] == l))
            valid[X][Y][pointer +97] = 1;
        else
            valid[X][Y][pointer +97] = 0;
    // .l.A. ,315
        if( (X < 14 && X > 2 && Y < 14 && Y > 2) &&
            (i_board[(X-3)*15+(Y+3)] == turn && i_board[(X-1)*15+(Y+1)] == turn && i_board[(X+1)*15+(Y-1)] == turn) &&
            (i_board[(X-2)*15+(Y+2)] == l))
            valid[X][Y][pointer +98] = 1;
        else
            valid[X][Y][pointer +98] = 0;
    // .l..A ,315
        if( (X > 3 &&  Y > 3) &&
            (i_board[(X-4)*15+(Y+4)] == turn && i_board[(X-2)*15+(Y+2)] == turn && i_board[(X-1)*15+(Y+1)] == turn) &&
            (i_board[(X-3)*15+(Y+3)] == l))
            valid[X][Y][pointer +99] = 1;
        else
            valid[X][Y][pointer +99] = 0;
// Third condition
    // A.l.. , 0
        if ((X < 11) &&
            (i_board[(X+1)*15+Y] == turn && i_board[(X+3)*15+Y] == turn && i_board[(X+4)*15+Y] == turn) &&
            (i_board[(X+2)*15+Y] == l))
            valid[X][Y][pointer +100] = 1;
        else
            valid[X][Y][pointer +100] = 0;
    // .Al.. , 0
        if ((X < 12 && X > 0) &&
            (i_board[(X-1)*15+Y] == turn && i_board[(X+2)*15+Y] == turn && i_board[(X+3)*15+Y] == turn) &&
            (i_board[(X+1)*15+Y] == l))
            valid[X][Y][pointer +101] = 1;
        else
            valid[X][Y][pointer +101] = 0;
    // ..lA. , 180
        if ((X < 14 && X > 2) &&
            (i_board[(X-3)*15+Y] == turn && i_board[(X-2)*15+Y] == turn && i_board[(X+1)*15+Y] == turn) &&
            (i_board[(X-1)*15+Y] == l))
            valid[X][Y][pointer +102] = 1;
        else
            valid[X][Y][pointer +102] = 0;
    // ..l.A , 180
        if ((X < 15 && X > 3) &&
            (i_board[(X-4)*15+Y] == turn && i_board[(X-3)*15+Y] == turn && i_board[(X-1)*15+Y] == turn) &&
            (i_board[(X-2)*15+Y] == l))
            valid[X][Y][pointer +103] = 1;
        else
            valid[X][Y][pointer +103] = 0;

    // A.l.. , 45
        if ((X < 11 && Y < 11) &&
            (i_board[(X+1)*15+Y+1] == turn && i_board[(X+3)*15+Y+3] == turn && i_board[(X+4)*15+Y+4] == turn) &&
            (i_board[(X+2)*15+Y+2] == l))
            valid[X][Y][pointer +104] = 1;
        else
            valid[X][Y][pointer +104] = 0;
    // .Al.. , 45
        if ((X < 12 && X > 0 && Y < 12 && Y > 0) &&
            (i_board[(X-1)*15+Y-1] == turn && i_board[(X+2)*15+Y+2] == turn && i_board[(X+3)*15+Y+3] == turn) &&
            (i_board[(X+1)*15+Y+1] == l))
            valid[X][Y][pointer +105] = 1;
        else
            valid[X][Y][pointer +105] = 0;
    // ..lA. , 225
        if ((X < 14 && X > 2 && Y < 14 && Y > 2) &&
            (i_board[(X-3)*15+Y-3] == turn && i_board[(X-2)*15+Y-2] == turn && i_board[(X+1)*15+Y+1] == turn) &&
            (i_board[(X-1)*15+Y-1] == l))
            valid[X][Y][pointer +106] = 1;
        else
            valid[X][Y][pointer +106] = 0;
    // ..l.A , 225
        if ((X > 3 &&  Y > 3) &&
            (i_board[(X-4)*15+Y-4] == turn && i_board[(X-3)*15+Y-3] == turn && i_board[(X-1)*15+Y-1] == turn) &&
            (i_board[(X-2)*15+Y-2] == l))
            valid[X][Y][pointer +107] = 1;
        else
            valid[X][Y][pointer +107] = 0;

    // A.l.. , 90
        if ((Y < 11) &&
            (i_board[X*15+Y+1] == turn && i_board[X*15+Y+3] == turn && i_board[X*15+Y+4] == turn) &&
            (i_board[X*15+Y+2] == l))
            valid[X][Y][pointer +108] = 1;
        else
            valid[X][Y][pointer +108] = 0;
    // .Al.. , 90
        if ((Y < 12 && Y > 0) &&
            (i_board[X*15+Y-2] == turn && i_board[X*15+Y+1] == turn && i_board[X*15+Y+2] == turn) &&
            (i_board[X*15+Y-1] == l))
            valid[X][Y][pointer +109] = 1;
        else
            valid[X][Y][pointer +109] = 0;
    // ..lA. , 270
        if ((Y < 14 && Y > 2) &&
            (i_board[X*15+Y-3] == turn && i_board[X*15+Y-2] == turn && i_board[X*15+Y+1] == turn) &&
            (i_board[X*15+Y-1] == l))
            valid[X][Y][pointer +110] = 1;
        else
            valid[X][Y][pointer +110] = 0;
    // ..l.A , 270
        if ((Y < 15 && Y > 3) &&
            (i_board[X*15+Y-4] == turn && i_board[X*15+Y-3] == turn && i_board[X*15+Y-1] == turn) &&
            (i_board[X*15+Y-2] == l))
            valid[X][Y][pointer +111] = 1;
        else
            valid[X][Y][pointer +111] = 0;

    // A.l.. , 315
        if ((X < 11 && Y > 3) &&
            (i_board[(X+1)*15+Y-1] == turn && i_board[(X+3)*15+Y-3] == turn && i_board[(X+4)*15+Y-4] == turn) &&
            (i_board[(X+2)*15+Y-2] == l))
            valid[X][Y][pointer +112] = 1;
        else
            valid[X][Y][pointer +112] = 0;
    // .Al.. , 315
        if ((X < 12 && X > 0 && Y < 14 && Y > 2) &&
            (i_board[(X-1)*15+Y+1] == turn && i_board[(X+2)*15+Y-2] == turn && i_board[(X+3)*15+Y-3] == turn) &&
            (i_board[(X+1)*15+Y-1] == l))
            valid[X][Y][pointer +113] = 1;
        else
            valid[X][Y][pointer +113] = 0;
    // ..lA. , 135
        if ((X < 14 && X > 2 && Y < 12 && Y > 2) &&
            (i_board[(X-3)*15+Y+3] == turn && i_board[(X-2)*15+Y+2] == turn && i_board[(X+1)*15+Y+1] == turn) &&
            (i_board[(X-1)*15+Y+1] == l))
            valid[X][Y][pointer +114] = 1;
        else
            valid[X][Y][pointer +114] = 0;
    // ..l.A , 135
        if ((X > 3 && Y < 11) &&
            (i_board[(X-4)*15+Y+4] == turn && i_board[(X-3)*15+Y+3] == turn && i_board[(X-1)*15+Y+1] == turn) &&
            (i_board[(X-2)*15+Y+2] == l))
            valid[X][Y][pointer +115] = 1;
        else
            valid[X][Y][pointer +115] = 0;


// live four first condition 
    // lA...l ,0
        if ((X < 11 ) && 
            (i_board[(X+1)*15+Y] == turn && i_board[(X+2)*15+Y] == turn && i_board[(X+3)*15+Y] == turn ) &&
            (i_board[(X+4)*15+Y] == l && i_board[(X-1)*15+Y] == l))
            valid[X][Y][pointer +116] = 1;
        else
            valid[X][Y][pointer +116] = 0;
    // lA...l ,45
    //    if ((X < 11 && Y < 11 ) && 
    //        (i_board[(X+1)*15+Y+1] == turn && i_board[(X+2)*15+Y+2] == turn && i_board[(X+3)*15+Y+3] == turn ) &&
    //        (i_board[(X+4)*15+Y+4] == l && i_board[(X-1)*15+Y-1] == l))
    //        valid[X][Y][pointer +117] = 1;
    //    else
    //        valid[X][Y][pointer +117] = 0;
    // lA...l ,90
        if ((Y < 11 ) && 
            (i_board[X*15+Y+1] == turn && i_board[X*15+Y+2] == turn && i_board[X*15+Y+3] == turn ) &&
            (i_board[X*15+Y+4] == l && i_board[X*15+Y-1] == l))
            valid[X][Y][pointer +118] = 1;
        else
            valid[X][Y][pointer +118] = 0;
    // lA...l ,135
        if ((X > 3 && Y < 11 ) && 
            (i_board[(X-1)*15+Y+1] == turn && i_board[(X-2)*15+Y+2] == turn && i_board[(X-3)*15+Y+3] == turn ) &&
            (i_board[(X-4)*15+Y+4] == l && i_board[(X+1)*15+Y-1] == l))
            valid[X][Y][pointer +119] = 1;
        else
            valid[X][Y][pointer +119] = 0;
    // lA...l ,180
        if ((X > 3 ) && 
            (i_board[(X-1)*15+Y] == turn && i_board[(X-2)*15+Y] == turn && i_board[(X-3)*15+Y] == turn ) &&
            (i_board[(X-4)*15+Y] == l && i_board[(X+1)*15+Y] == l))
            valid[X][Y][pointer +120] = 1;
        else
            valid[X][Y][pointer +120] = 0;
    // lA...l ,225
        if ((X > 3 && Y > 3) && 
            (i_board[(X-1)*15+Y-1] == turn && i_board[(X-2)*15+Y-2] == turn && i_board[(X-3)*15+Y-3] == turn ) &&
            (i_board[(X-4)*15+Y-4] == l && i_board[(X+1)*15+Y+1] == l))
            valid[X][Y][pointer +121] = 1;
        else
            valid[X][Y][pointer +121] = 0;
    // lA...l ,270
        if ((Y > 3) && 
            (i_board[X*15+Y-1] == turn && i_board[X*15+Y-2] == turn && i_board[X*15+Y-3] == turn ) &&
            (i_board[X*15+Y-4] == l && i_board[X*15+Y+1] == l))
            valid[X][Y][pointer +122] = 1;
        else
            valid[X][Y][pointer +122] = 0;
    // lA...l ,315
        if ((X < 11 && Y > 3 ) && 
            (i_board[(X+1)*15+Y-1] == turn && i_board[(X+2)*15+Y-2] == turn && i_board[(X+3)*15+Y-3] == turn ) &&
            (i_board[(X+4)*15+Y-4] == l && i_board[(X-1)*15+Y+1] == l))
            valid[X][Y][pointer +123] = 1;
        else
            valid[X][Y][pointer +123] = 0;

// live four second condition 
    // l.A..l ,0
        if ((X < 11 && X > 1) && 
            (i_board[(X-1)*15+Y] == turn && i_board[(X+1)*15+Y] == turn && i_board[(X+2)*15+Y] == turn ) &&
            (i_board[(X+3)*15+Y] == l && i_board[(X-2)*15+Y] == l))
            valid[X][Y][pointer +124] = 1;
        else
            valid[X][Y][pointer +124] = 0;
    // l.A..l ,45
        if ((X < 12 && Y < 12 && X > 1 && Y > 1) && 
            (i_board[(X+1)*15+Y+1] == turn && i_board[(X+2)*15+Y+2] == turn && i_board[(X-1)*15+Y-1] == turn ) &&
            (i_board[(X+3)*15+Y+3] == l && i_board[(X-2)*15+Y-2] == l))
            valid[X][Y][pointer +125] = 1;
        else
            valid[X][Y][pointer +125] = 0;
    // l.A..l ,90
        if ((Y < 12 && Y < 2 ) && 
            (i_board[X*15+Y-1] == turn && i_board[X*15+Y+1] == turn && i_board[X*15+Y+2] == turn ) &&
            (i_board[X*15+Y+3] == l && i_board[X*15+Y-2] == l))
            valid[X][Y][pointer +126] = 1;
        else
            valid[X][Y][pointer +126] = 0;
    // l.A..l ,135
        if ((X > 2 &&  X < 13 && Y < 12 && Y > 1) && 
            (i_board[(X-1)*15+Y+1] == turn && i_board[(X-2)*15+Y+2] == turn && i_board[(X+1)*15+Y-1] == turn ) &&
            (i_board[(X-3)*15+Y+3] == l && i_board[(X+2)*15+Y-2] == l))
            valid[X][Y][pointer +127] = 1;
        else
            valid[X][Y][pointer +127] = 0;
    // l.A..l ,180
        if ((X > 2 && X > 13 ) && 
            (i_board[(X+1)*15+Y] == turn && i_board[(X-1)*15+Y] == turn && i_board[(X-2)*15+Y] == turn ) &&
            (i_board[(X-3)*15+Y] == l && i_board[(X+2)*15+Y] == l))
            valid[X][Y][pointer +128] = 1;
        else
            valid[X][Y][pointer +128] = 0;
    // l.A..l ,225
        if ((X > 3 && Y > 3) && 
            (i_board[(X-1)*15+Y-1] == turn && i_board[(X+1)*15+Y+1] == turn && i_board[(X+2)*15+Y+2] == turn ) &&
            (i_board[(X-3)*15+Y-3] == l && i_board[(X+2)*15+Y+2] == l))
            valid[X][Y][pointer +129] = 1;
        else
            valid[X][Y][pointer +129] = 0;
    // l.A..l ,270
        if ((Y > 2 && Y < 13) && 
            (i_board[X*15+Y+1] == turn && i_board[X*15+Y-1] == turn && i_board[X*15+Y-2] == turn ) &&
            (i_board[X*15+Y-3] == l && i_board[X*15+Y+2] == l))
            valid[X][Y][pointer +130] = 1;
        else
            valid[X][Y][pointer +130] = 0;
    // l.A..l ,315
        if ((X < 12 && X > 1 && Y < 13 && Y > 2 ) && 
            (i_board[(X-1)*15+Y+1] == turn && i_board[(X+1)*15+Y-1] == turn && i_board[(X+2)*15+Y-2] == turn ) &&
            (i_board[(X+3)*15+Y-3] == l && i_board[(X-2)*15+Y+2] == l))
            valid[X][Y][pointer +131] = 1;
        else
            valid[X][Y][pointer +131] = 0;


    check = valid[X][Y][pointer] | valid[X][Y][pointer + 1] | valid[X][Y][pointer + 2] | valid[X][Y][pointer + 3]
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
                       | valid[X][Y][pointer + 76] | valid[X][Y][pointer + 77] | valid[X][Y][pointer + 78] | valid[X][Y][pointer + 79]
                        | valid[X][Y][pointer + 80] | valid[X][Y][pointer + 81] | valid[X][Y][pointer + 82] | valid[X][Y][pointer + 83]
                         | valid[X][Y][pointer + 84] | valid[X][Y][pointer + 85] | valid[X][Y][pointer + 86] | valid[X][Y][pointer + 87]
                          | valid[X][Y][pointer + 88] | valid[X][Y][pointer + 89] | valid[X][Y][pointer + 90] | valid[X][Y][pointer + 91]
                           | valid[X][Y][pointer + 92] | valid[X][Y][pointer + 93] | valid[X][Y][pointer + 94] | valid[X][Y][pointer + 95]
                            | valid[X][Y][pointer + 96] | valid[X][Y][pointer + 97] | valid[X][Y][pointer + 98] | valid[X][Y][pointer + 99]
                             | valid[X][Y][pointer + 100] | valid[X][Y][pointer + 101] | valid[X][Y][pointer + 102] | valid[X][Y][pointer + 103]
                              | valid[X][Y][pointer + 104] | valid[X][Y][pointer + 105] | valid[X][Y][pointer + 106] | valid[X][Y][pointer + 107]
                               | valid[X][Y][pointer + 108] | valid[X][Y][pointer + 109] | valid[X][Y][pointer + 110] | valid[X][Y][pointer + 111]
                                | valid[X][Y][pointer + 112] | valid[X][Y][pointer + 113] | valid[X][Y][pointer + 114] | valid[X][Y][pointer + 115]
                                | valid[X][Y][pointer + 116] | valid[X][Y][pointer + 117] | valid[X][Y][pointer + 118] | valid[X][Y][pointer + 119]
                                | valid[X][Y][pointer + 120] | valid[X][Y][pointer + 121] | valid[X][Y][pointer + 122] | valid[X][Y][pointer + 123]
                                | valid[X][Y][pointer + 124] | valid[X][Y][pointer + 125] | valid[X][Y][pointer + 126] | valid[X][Y][pointer + 127]
                                | valid[X][Y][pointer + 128] | valid[X][Y][pointer + 129] | valid[X][Y][pointer + 130] | valid[X][Y][pointer + 131];
endtask

task Defense(
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
    // A o o o o  45
    if(X + 4 < 15 && Y + 4 < 15 &&
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[(X + 4) * 15 + (Y + 4)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 4] = 1;
    else
        valid[X][Y][pointer + 4] = 0;
    // o A o o o  45
    if(X - 1 >= 0 && X + 3 < 15 && Y - 1 >= 0 && Y + 3 < 15 &&
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} &&
        i_board[(X + 3) * 15 + (Y + 3)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 5] = 1;
    else
        valid[X][Y][pointer + 5] = 0;
    // o o A o o  45
    if(X - 2 >= 0 && X + 2 < 15 && Y - 2 >= 0 && Y + 2 < 15 && 
        i_board[(X - 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 6] = 1;
    else
        valid[X][Y][pointer + 6] = 0;


    // A o o o *  90
    if(Y + 4 < 15 && 
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 4)] == l)
        valid[X][Y][pointer + 7] = 1;
    else
        valid[X][Y][pointer + 7] = 0;
    // A o * o o *  90
    if(Y + 5 < 15 && 
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 2)] == l && 
        i_board[X * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 4)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 5)] == l)
        valid[X][Y][pointer + 8] = 1;
    else
        valid[X][Y][pointer + 8] = 0;
    // A o o * o *  90
    if(Y + 5 < 15 && 
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 3)] == l && 
        i_board[X * 15 + (Y + 4)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 5)] == l)
        valid[X][Y][pointer + 9] = 1;
    else
        valid[X][Y][pointer + 9] = 0;
    // * o A o o *  90
    if(Y + 3 < 15 && Y - 2 >= 0 && 
        i_board[X * 15 + (Y - 2)] == l && 
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 3)] == l)
        valid[X][Y][pointer + 10] = 1; 
    else
        valid[X][Y][pointer + 10] = 0;
    // A o o o o  90
    if(Y + 4 < 15 &&
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y + 4)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 11] = 1;
    else
        valid[X][Y][pointer + 11] = 0;
    // o A o o o  90
    if(Y - 1 >= 0 && Y + 3 < 15 &&
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y + 2)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y + 3)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 12] = 1;
    else
        valid[X][Y][pointer + 12] = 0;
    // o o A o o  90
    if(Y - 2 >= 0 && Y + 2 < 15 && 
        i_board[X * 15 + (Y - 2)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y + 2)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 13] = 1;
    else
        valid[X][Y][pointer + 13] = 0;


    // A o o o *  135
    if(X - 4 >= 0 && Y + 4 < 15 && 
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + (Y + 4)] == l)
        valid[X][Y][pointer + 14] = 1;
    else
        valid[X][Y][pointer + 14] = 0;
    // A o * o o *  135
    if(X - 5 < 15 && Y + 5 < 15 && 
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y + 2)] == l && 
        i_board[(X - 3) * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + (Y + 4)] == {turn[1], ~turn[0]} && 
        i_board[(X - 5) * 15 + (Y + 5)] == l)
        valid[X][Y][pointer + 15] = 1;
    else
        valid[X][Y][pointer + 15] = 0;
    // A o o * o *  135
    if(X - 5 < 15 && Y + 5 < 15 && 
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + (Y + 3)] == l && 
        i_board[(X - 4) * 15 + (Y + 4)] == {turn[1], ~turn[0]} && 
        i_board[(X - 5) * 15 + (Y + 5)] == l)
        valid[X][Y][pointer + 16] = 1;
    else
        valid[X][Y][pointer + 16] = 0;
    // * o A o o *  135
    if(X + 2 < 15 && X - 3 >= 0 && Y + 3 < 15 && Y - 2 >= 0 && 
        i_board[(X + 2) * 15 + (Y - 2)] == l && 
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + (Y + 3)] == l)
        valid[X][Y][pointer + 17] = 1; 
    else
        valid[X][Y][pointer + 17] = 0;
    // A o o o o  135
    if(X - 4 < 15 && Y + 4 < 15 &&
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + (Y + 4)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 18] = 1;
    else
        valid[X][Y][pointer + 18] = 0;
    // o A o o o  135
    if(X - 3 >= 0 && X + 1 < 15 && Y - 1 >= 0 && Y + 3 < 15 &&
        i_board[(X - 3) * 15 + (Y + 3)] == {turn[1], ~turn[0]} &&
        i_board[(X - 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 19] = 1;
    else
        valid[X][Y][pointer + 19] = 0;
    // o o A o o  135
    if(X - 2 >= 0 && X + 2 < 15 && Y - 2 >= 0 && Y + 2 < 15 && 
        i_board[(X - 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 20] = 1;
    else
        valid[X][Y][pointer + 20] = 0;


    
    // A o o o *  180
    if(X - 4 >= 0 && 
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + Y] == l)
        valid[X][Y][pointer + 21] = 1;
    else
        valid[X][Y][pointer + 21] = 0;
    // A o * o o *  180
    if(X - 5 >= 0 &&
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + Y] == l && 
        i_board[(X - 3) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 5) * 15 + Y] == l)
        valid[X][Y][pointer + 22] = 1;
    else
        valid[X][Y][pointer + 22] = 0;
    // A o o * o *  180
    if(X - 5 >= 0 && 
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + Y] == l && 
        i_board[(X - 4) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 5) * 15 + Y] == l)
        valid[X][Y][pointer + 23] = 1;
    else
        valid[X][Y][pointer + 23] = 0;
    // * o A o o *  180
    if(X + 2 < 15 && X - 3 >= 0 && 
        i_board[(X + 2) * 15 + Y] == l && 
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + Y] == l)
        valid[X][Y][pointer + 24] = 1; 
    else
        valid[X][Y][pointer + 24] = 0;
    // A o o o o  180
    if(X - 4 >= 0 &&
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + (Y + 3)] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + (Y + 4)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 25] = 1;
    else
        valid[X][Y][pointer + 25] = 0;
    // o A o o o  180
    if(X - 3 >= 0 && X + 1 < 15 &&
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X - 2) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X - 3) * 15 + Y] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 26] = 1;
    else
        valid[X][Y][pointer + 26] = 0;
    // o o A o o  180
    if(X - 2 >= 0 && X + 2 < 15 && 
        i_board[(X - 2) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + Y] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 27] = 1;
    else
        valid[X][Y][pointer + 27] = 0;


    // A o o o *  225
    if(X - 4 >= 0 && Y - 4 >= 0 && 
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + (Y - 4)] == l)
        valid[X][Y][pointer + 28] = 1;
    else
        valid[X][Y][pointer + 28] = 0;
    // A o * o o *  225
    if(X - 5 >= 0 && Y - 5 >= 0 && 
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y - 2)] == l && 
        i_board[(X - 3) * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + (Y - 4)] == {turn[1], ~turn[0]} && 
        i_board[(X - 5) * 15 + (Y - 5)] == l)
        valid[X][Y][pointer + 29] = 1;
    else
        valid[X][Y][pointer + 29] = 0;
    // A o o * o *  225
    if(X - 5 >= 0 && Y - 5 >= 0 && 
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + (Y - 3)] == l && 
        i_board[(X - 4) * 15 + (Y - 4)] == {turn[1], ~turn[0]} && 
        i_board[(X - 5) * 15 + (Y - 5)] == l)
        valid[X][Y][pointer + 30] = 1;
    else
        valid[X][Y][pointer + 30] = 0;
    // * o A o o *  225
    if(X + 2 < 15 && X - 3 >= 0 && Y + 2 < 15 && Y - 3 >= 0 && 
        i_board[(X + 2) * 15 + (Y + 2)] == l && 
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + (Y - 3)] == l)
        valid[X][Y][pointer + 31] = 1; 
    else
        valid[X][Y][pointer + 31] = 0;
    // A o o o o  225
    if(X - 4 >= 0 && Y - 4 >= 0 &&
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X - 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[(X - 3) * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[(X - 4) * 15 + (Y - 4)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 32] = 1;
    else
        valid[X][Y][pointer + 32] = 0;
    // o A o o o  225
    if(X - 3 >= 0 && X + 1 < 15 && Y - 3 >= 0 && Y + 1 < 15 &&
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[(X - 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} &&
        i_board[(X - 3) * 15 + (Y - 3)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 33] = 1;
    else
        valid[X][Y][pointer + 33] = 0;
    // o o A o o  225
    if(X - 2 >= 0 && X + 2 < 15 && Y - 2 >= 0 && Y + 2 < 15 && 
        i_board[(X - 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 34] = 1;
    else
        valid[X][Y][pointer + 34] = 0;


    // A o o o *  270
    if(Y - 4 >= 0 && 
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 4)] == l)
        valid[X][Y][pointer + 35] = 1;
    else
        valid[X][Y][pointer + 35] = 0;
    // A o * o o *  270
    if(Y - 5 >= 0 && 
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 2)] == l && 
        i_board[X * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 4)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 5)] == l)
        valid[X][Y][pointer + 36] = 1;
    else
        valid[X][Y][pointer + 36] = 0;
    // A o o * o *  270
    if(Y - 5 >= 0 && 
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 3)] == l && 
        i_board[X * 15 + (Y - 4)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 5)] == l)
        valid[X][Y][pointer + 37] = 1;
    else
        valid[X][Y][pointer + 37] = 0;
    // * o A o o *  270
    if(Y + 2 < 15 && Y - 3 >= 0 && 
        i_board[X * 15 + (Y + 2)] == l && 
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 3)] == l)
        valid[X][Y][pointer + 38] = 1; 
    else
        valid[X][Y][pointer + 38] = 0;
    // A o o o o  270
    if(Y - 4 >= 0 &&
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[X * 15 + (Y - 4)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 39] = 1;
    else
        valid[X][Y][pointer + 39] = 0;
    // o A o o o  270
    if(Y - 3 >= 0 && Y + 1 < 15 &&
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y - 2)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y - 3)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 40] = 1;
    else
        valid[X][Y][pointer + 40] = 0;
    // o o A o o  270
    if(Y - 2 >= 0 && Y + 2 < 15 && 
        i_board[X * 15 + (Y - 2)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[X * 15 + (Y + 2)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 41] = 1;
    else
        valid[X][Y][pointer + 41] = 0;



    // A o o o *  315
    if(X + 4 < 15 && Y - 4 >= 0 && 
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[(X + 4) * 15 + (Y - 4)] == l)
        valid[X][Y][pointer + 42] = 1;
    else
        valid[X][Y][pointer + 42] = 0;
    // A o * o o *  315
    if(X + 5 < 15 && Y - 5 >= 0 && 
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y - 2)] == l && 
        i_board[(X + 3) * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[(X + 4) * 15 + (Y - 4)] == {turn[1], ~turn[0]} && 
        i_board[(X + 5) * 15 + (Y - 5)] == l)
        valid[X][Y][pointer + 43] = 1;
    else
        valid[X][Y][pointer + 43] = 0;
    // A o o * o *  315
    if(X + 5 < 15 && Y - 5 >= 0 && 
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + (Y - 3)] == l && 
        i_board[(X + 4) * 15 + (Y - 4)] == {turn[1], ~turn[0]} && 
        i_board[(X + 5) * 15 + (Y - 5)] == l)
        valid[X][Y][pointer + 44] = 1;
    else
        valid[X][Y][pointer + 44] = 0;
    // * o A o o *  315
    if(X + 3 < 15 && X - 2 >= 0 && Y + 2 < 15 && Y - 3 >= 0 && 
        i_board[(X - 2) * 15 + (Y + 2)] == l && 
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + (Y - 3)] == l)
        valid[X][Y][pointer + 45] = 1; 
    else
        valid[X][Y][pointer + 45] = 0;
    // A o o o o  315
    if(X + 4 < 15 && Y - 4 >= 0 &&
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + (Y - 3)] == {turn[1], ~turn[0]} && 
        i_board[(X + 4) * 15 + (Y - 4)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 46] = 1;
    else
        valid[X][Y][pointer + 46] = 0;
    // o A o o o  315
    if(X - 1 >= 0 && X + 3 < 15 && Y - 3 >= 0 && Y + 1 < 15 &&
        i_board[(X - 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} &&
        i_board[(X + 3) * 15 + (Y - 3)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 47] = 1;
    else
        valid[X][Y][pointer + 47] = 0;
    // o o A o o  315
    if(X - 2 >= 0 && X + 2 < 15 && Y - 2 >= 0 && Y + 2 < 15 && 
        i_board[(X - 2) * 15 + (Y - 2)] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + (Y - 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + (Y + 1)] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + (Y + 2)] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 48] = 1;
    else
        valid[X][Y][pointer + 48] = 0;


    
    // A o o o *  0
    if(X + 4 < 15 && 
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 4) * 15 + Y] == l)
        valid[X][Y][pointer + 49] = 1;
    else
        valid[X][Y][pointer + 49] = 0;
    // A o * o o *  0
    if(X + 5 < 15 && 
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + Y] == l && 
        i_board[(X + 3) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 4) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 5) * 15 + Y] == l)
        valid[X][Y][pointer + 50] = 1;
    else
        valid[X][Y][pointer + 50] = 0;
    // A o o * o *  0
    if(X + 5 < 15 && 
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + Y] == l && 
        i_board[(X + 4) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 5) * 15 + Y] == l)
        valid[X][Y][pointer + 51] = 1;
    else
        valid[X][Y][pointer + 51] = 0;
    // * o A o o *  0
    if(X + 3 < 15 && X - 2 >= 0 && 
        i_board[(X - 2) * 15 + Y] == l && 
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + Y] == l)
        valid[X][Y][pointer + 52] = 1; 
    else
        valid[X][Y][pointer + 52] = 0;
    // A o o o o  0
    if(X + 4 < 15 &&
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 2) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 3) * 15 + Y] == {turn[1], ~turn[0]} && 
        i_board[(X + 4) * 15 + Y] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 53] = 1;
    else
        valid[X][Y][pointer + 53] = 0;
    // o A o o o  0
    if(X - 1 >= 0 && X + 3 < 15 &&
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X + 3) * 15 + Y] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 54] = 1;
    else
        valid[X][Y][pointer + 54] = 0;
    // o o A o o  0
    if(X - 2 >= 0 && X + 2 < 15 && 
        i_board[(X - 2) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X - 1) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X + 1) * 15 + Y] == {turn[1], ~turn[0]} &&
        i_board[(X + 2) * 15 + Y] == {turn[1], ~turn[0]})
        valid[X][Y][pointer + 55] = 1;
    else
        valid[X][Y][pointer + 55] = 0;
    
    assign check = valid[X][Y][pointer + 0] | valid[X][Y][pointer + 1] | valid[X][Y][pointer + 2] | valid[X][Y][pointer + 3] | valid[X][Y][pointer + 4]
     | valid[X][Y][pointer + 5] | valid[X][Y][pointer + 6] | valid[X][Y][pointer + 1] | valid[X][Y][pointer + 1] | valid[X][Y][pointer + 1]
      | valid[X][Y][pointer + 10] | valid[X][Y][pointer + 11] | valid[X][Y][pointer + 12] | valid[X][Y][pointer + 13] | valid[X][Y][pointer + 14]
       | valid[X][Y][pointer + 15] | valid[X][Y][pointer + 16] | valid[X][Y][pointer + 17] | valid[X][Y][pointer + 18] | valid[X][Y][pointer + 19]
        | valid[X][Y][pointer + 20] | valid[X][Y][pointer + 21] | valid[X][Y][pointer + 22] | valid[X][Y][pointer + 23] | valid[X][Y][pointer + 24]
         | valid[X][Y][pointer + 25] | valid[X][Y][pointer + 26] | valid[X][Y][pointer + 27] | valid[X][Y][pointer + 28] | valid[X][Y][pointer + 29]
          | valid[X][Y][pointer + 30] | valid[X][Y][pointer + 31] | valid[X][Y][pointer + 32] | valid[X][Y][pointer + 33] | valid[X][Y][pointer + 34]
           | valid[X][Y][pointer + 35] | valid[X][Y][pointer + 36] | valid[X][Y][pointer + 37] | valid[X][Y][pointer + 38] | valid[X][Y][pointer + 39]
            | valid[X][Y][pointer + 40] | valid[X][Y][pointer + 41] | valid[X][Y][pointer + 42] | valid[X][Y][pointer + 43] | valid[X][Y][pointer + 44]
             | valid[X][Y][pointer + 45] | valid[X][Y][pointer + 46] | valid[X][Y][pointer + 47] | valid[X][Y][pointer + 48] | valid[X][Y][pointer + 49]
              | valid[X][Y][pointer + 50] | valid[X][Y][pointer + 51] | valid[X][Y][pointer + 52] | valid[X][Y][pointer + 53] | valid[X][Y][pointer + 54] | valid[X][Y][pointer + 55];
endtask

task Win(
    input [3:0] X,
    input [3:0] Y,
    input turn,
    output check
);
    if((X + 4 < 15 && Y + 4 < 15 && i_board[(X + 1) * 15 + (Y + 1)] == turn && i_board[(X + 2) * 15 + (Y + 2)] == turn && i_board[(X + 3) * 15 + (Y + 3)] == turn && i_board[(X + 4) * 15 + (Y + 4)] == turn) ||
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
    )
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
                        Offense(.X(i[3:0]), .Y(j[3:0]), .turn(i_turn), .pointer(8'd0), .check(offense[i][j]));
                        Defense(.X(i[3:0]), .Y(j[3:0]), .turn(i_turn), .pointer(8'd132), .check(defense[i][j]));
                        Win(.X(i[3:0]), .Y(j[3:0]), .turn(i_turn), .check(win[i][j]));

                        if(i_board[i * 15 + j] == l && (offense[i][j] || defense[i][j]) )
                            ok[i][j] = 1;
                        else
                            ok[i][j] = 0;
                    end
                    //$display("%b %b %b %b %b %b %b %b %b %b %b %b %b %b %b\n", ok[i][0], ok[i][1], ok[i][2], ok[i][3], ok[i][4], ok[i][5], ok[i][6], ok[i][7], ok[i][8], ok[i][9], ok[i][10], ok[i][11], ok[i][12], ok[i][13], ok[i][14]);
                end
            end
        end
        S_COUNT: begin
            pointer[0] = 10'd999;
            for(int i = 0; i < 15; i++) begin
                for(int j = 0; j < 15; j++) begin
                    if(ok[i][j] == 1'b1) begin
                        output_X[pointer[i * 15 + j] -: 4] = i[3:0];
                        output_Y[pointer[i * 15 + j] -: 4] = j[3:0];
                        pointer[i * 15 + j + 1] = pointer[i * 15 + j] - 4;
                    end
                    else begin
                        pointer[i * 15 + j + 1] = pointer[i * 15 + j];
                    end

                    if(win[i][j])
                        win_w = 1'b1;
                end
            end
            finish_w    = 1'b1;
            state_w     = S_IDLE;
        end
    endcase
end

always_ff @(negedge i_clk or negedge i_rst_n) begin
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