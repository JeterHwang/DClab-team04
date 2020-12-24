module Threats(
    input               i_clk,
	input               i_rst_n,
	input               i_start,
	input               i_turn,
    input     board     i_board,
    output   [49:0]     o_posX,
    output   [49:0]     o_posY,
    output   [5:0]      o_size,
    output   [1:0]      o_win,
    output              o_finish
);

parameter b         = 2'd0;
parameter w         = 2'd1;
parameter l         = 2'd2;

parameter S_IDLE    = 1'd0;
parameter S_COUNT   = 1'd1;

logic state_r, state_w;
logic finish_r, finish_w;
logic [5:0] pointer[226];
logic [49:0] output_X;
logic [49:0] output_Y;

logic valid[15][15][225];
logic ok[15][15];

assign o_posX   = output_X;
assign o_posY   = output_Y;
assign o_size   = pointer[225];
assign o_finish = finish_r;
assign o_win    = 1'b1;

task three(
    input   [3:0] X,
    input   [3:0] Y,
    input   [1:0] turn,
    output  check 
);
    valid[X][Y][0] = 0;
// live threes
    // middle blank
    if(X < 13 && X >= 2 && Y < 13 && Y >= 2 && i_board[(X + 2) * 15 + (Y + 2)] == l && i_board[(X + 1) * 15 + (Y + 1)] == turn && i_board[(X - 1) * 15 + (Y - 1)] == turn && i_board[(X - 2) * 15 + (Y - 2)] == l) 
        valid[X][Y][1] = valid[X][Y][0] | 1;
    else 
        valid[X][Y][1] = valid[X][Y][0];
    if(X < 13 && X >= 2 && i_board[(X + 2) * 15 + Y] == l && i_board[(X + 1) * 15 + Y] == turn && i_board[(X - 1) * 15 + Y] == turn && i_board[(X - 2) * 15 + Y] == l)
        valid[X][Y][2] = valid[X][Y][1] | 1;
    else
        valid[X][Y][2] = valid[X][Y][1];
    if(Y < 13 && Y >= 2 && i_board[X * 15 + (Y + 2)] == l && i_board[X * 15 + (Y + 1)] == turn && i_board[X * 15 + (Y - 1)] == turn && i_board[X * 15 + (Y - 2)] == l)
        valid[X][Y][3] = valid[X][Y][2] | 1;
    else
        valid[X][Y][3] = valid[X][Y][2];
    if(X < 13 && Y < 13 && X >= 2 && Y >= 2 && i_board[(x - 2) * 15 + (Y + 2)] == l &&i_board[(X - 1) * 15 + (Y + 1)] == turn && i_board[(X + 1) * 15 + (Y - 1)] == turn && i_board[(X + 2) * 15 + (Y - 2)] == turn) 
        valid[X][Y][4] = valid[X][Y][3] | 1;
    else
        valid[X][Y][4] = valid[X][Y][3];
    
    // * x . . * 45  
    if(X < 12 && Y < 12 && X >= 1 && Y >= 1 && i_board[(X + 3) * 15 + (Y + 3)] == l && i_board[(X + 1) * 15 + (Y + 1)] == turn && i_board[(X + 2) * 15 + (Y + 2)] == turn && i_board[(X - 1) * 15 + (Y - 1)] == l)
        valid[X][Y][5] = valid[X][Y][4] | 1;
    else
        valid[X][Y][5] = valid[X][Y][4];
    // * x . . * 135  
    if(X < 14 && X >= 3 && i_board[(X - 3) * 15 + (Y - 3)] == l && i_board[(X - 2) * 15 + (Y - 2)] == turn && i_board[(X - 1) * 15 + (Y - 1)] == turn && i_board[(X + 1) * 15 + (Y + 1)] == l)
        valid[X][Y][6] = valid[X][Y][5] | 1;
    else
        valid[X][Y][6] = valid[X][Y][5];
    // * x . . * 315  
    if(X < 12 && X >= 1 && Y < 14 && Y >= 3 && i_board[(X + 1) * 15 + (Y - 1)] == turn && i_board[(X + 2) * 15 + (Y - 2)] == turn && i_board[(X + 3) * 15 + (Y - 3)] == l && i_board[(X - 1) * 15 + (Y + 1)] == l)
        valid[X][Y][7] = valid[X][Y][6] | 1;
    else
        valid[X][Y][7] = valid[X][Y][6];
    // * x . . * 225  
    if(X >= 3 && X < 14 && Y < 12 && Y >= 1 && i_board[(X - 3) * 15 + (Y + 3)] == l && i_board[(X - 1) * 15 + (Y + 1)] == turn && i_board[(X - 2) * 15 + (Y + 2)] == turn && i_board[(X + 1) * 15 + (Y - 1)] == l)
        valid[X][Y][8] = valid[X][Y][7] | 1;
    else
        valid[X][Y][8] = valid[X][Y][7];
    // * x . . * 0  
    if(X < 12 && X >= 1 && i_board[(X - 1) * 15 + Y] == l && i_board[(X + 1) * 15 + Y] == turn && i_board[(X + 2) * 15 + Y] == turn && i_board[(X + 3) * 15 + Y] == l)
        valid[X][Y][9] = valid[X][Y][8] | 1;
    else
        valid[X][Y][9] = valid[X][Y][8];
    // * x . . * 180  
    if(X >= 3 && X < 14 && i_board[(X + 1) * 15 + Y] == l && i_board[(X - 1) * 15 + Y] == turn && i_board[(X - 2) * 15 + Y] == turn && i_board[(X - 3) * 15 + Y] == l)
        valid[X][Y][10] = valid[X][Y][9] | 1;
    else
        valid[X][Y][10] = valid[X][Y][9];
    // * x . . * 90 
    if(Y < 12 && Y >= 1 && i_board[X * 15 + (Y - 1)] == l && i_board[X * 15 + (Y + 1)] == turn && i_board[X * 15 + (Y + 2)] == turn && i_board[X * 15 + (Y + 3)] == l)
        valid[X][Y][11] = valid[X][Y][10] | 1;
    else
        valid[X][Y][11] = valid[X][Y][10];
    // * x . . * 270  
    if(Y >= 3 && Y < 14 && i_board[X * 15 + (Y + 1)] == l && i_board[X * 15 + (Y - 1)] == turn && i_board[X * 15 + (Y - 2)] == turn && i_board[X * 15 + (Y - 3)] == l)
        valid[X][Y][12] = valid[X][Y][11] | 1;
    else
        valid[X][Y][12] = valid[X][Y][11];
    
    
    // * A . X . * 45
    if(X >= 1 && X < 11 && Y >= 1 && Y < 11 && i_board[(X - 1) * 15 + (Y - 1)] == l && i_board[(X + 1) * 15 + (Y + 1)] == turn && i_board[(X + 2) * 15 + (Y + 2)] == l && i_board[(X + 3) * 15 + (Y + 3)] == turn && i_board[(X + 4) * 15 + (Y + 4)])
        valid[X][Y][13] = valid[X][Y][12] | 1;
    else
        valid[X][Y][13] = valid[X][Y][12];
    // * A X . . * 45
    if(X >= 1 && X < 11 && Y >= 1 && Y < 11 && i_board[(X - 1) * 15 + (Y - 1)] == l && i_board[(X + 1) * 15 + (Y + 1)] == l && i_board[(X + 2) * 15 + (Y + 2)] == turn && i_board[(X + 3) * 15 + (Y + 3)] == turn && i_board[(X + 4) * 15 + (Y + 4)])
        valid[X][Y][14] = valid[X][Y][13] | 1;
    else
        valid[X][Y][14] = valid[X][Y][13];
    // * A . X . * 90
    if(Y >= 1 && Y < 11 && i_board[X * 15 + (Y - 1)] == l && i_board[X * 15 + (Y + 1)] == turn && i_board[X * 15 + (Y + 2)] == l && i_board[X * 15 + (Y + 3)] == turn && i_board[X * 15 + (Y + 4)] == l)
        valid[X][Y][15] = valid[X][Y][14] | 1;
    else
        valid[X][Y][15] = valid[X][Y][14];
    // * A X . . * 90
    if(Y >= 1 && Y < 11 && i_board[X * 15 + (Y - 1)] == l && i_board[X * 15 + (Y + 1)] == l && i_board[X * 15 + (Y + 2)] == turn && i_board[X * 15 + (Y + 3)] == turn && i_board[X * 15 + (Y + 4)] == l)
        valid[X][Y][16] = valid[X][Y][15] | 1;
    else
        valid[X][Y][16] = valid[X][Y][15];
    // * A . X . * 135
    if(X >= 4 && X < 14 && Y >= 1 && Y < 11 && i_board[(X + 1) * 15 + (Y - 1)] == l && i_board[(X - 1) * 15 + (Y + 1)] == turn && i_board[(X - 2) * 15 + (Y + 2)] == l && i_board[(X - 3) * 15 + (Y + 3)] == turn && i_board[(X - 4) * 15 + (Y + 4)] == l)
        valid[X][Y][17] = valid[X][Y][16] | 1;
    else
        valid[X][Y][17] = valid[X][Y][16];
    // * A X . . * 135
    if(X >= 4 && X < 14 && Y >= 1 && Y < 11 && i_board[(X + 1) * 15 + (Y - 1)] == l && i_board[(X - 1) * 15 + (Y + 1)] == l && i_board[(X - 2) * 15 + (Y + 2)] == turn && i_board[(X - 3) * 15 + (Y + 3)] == turn && i_board[(X - 4) * 15 + (Y + 4)] == l)
        valid[X][Y][18] = valid[X][Y][17] | 1;
    else
        valid[X][Y][18] = valid[X][Y][17];
    // * A . X . * 180
    if(X >= 4 && X < 14 && i_board[(X + 1) * 15 + Y] && i_board[(X - 1) * 15 + Y] == turn && i_board[(X - 2) * 15 + Y] == l && i_board[(X - 3) * 15 + Y] == turn && i_board[(X - 4) * 15 + Y] == l)
        valid[X][Y][19] = valid[X][Y][18] | 1;
    else
        valid[X][Y][19] = valid[X][Y][18];
    // * A X . . * 180
    if(X >= 4 && X < 14 && i_board[(X + 1) * 15 + Y] && i_board[(X - 1) * 15 + Y] == l && i_board[(X - 2) * 15 + Y] == turn && i_board[(X - 3) * 15 + Y] == turn && i_board[(X - 4) * 15 + Y] == l)
        valid[X][Y][20] = valid[X][Y][19] | 1;
    else
        valid[X][Y][20] = valid[X][Y][19];
    // * A . X . * 225
    if(X >= 4 && X < 14 && Y >= 4 && Y < 14 && i_board[(X + 1) * 15 + (Y + 1)] == l && i_board[(X - 1) * 15 + (Y - 1)] == turn && i_board[(X - 2) * 15 + (Y - 2)] == l && i_board[(X - 3) * 15 + (Y - 3)] == turn && i_board[(X - 4) * 15 + (Y - 4)] == l)
        valid[X][Y][21] = valid[X][Y][20] | 1;
    else
        valid[X][Y][21] = valid[X][Y][20];
    // * A X . . * 225
    if(X >= 4 && X < 14 && Y >= 4 && Y < 14 && i_board[(X + 1) * 15 + (Y + 1)] == l && i_board[(X - 1) * 15 + (Y - 1)] == l && i_board[(X - 2) * 15 + (Y - 2)] == turn && i_board[(X - 3) * 15 + (Y - 3)] == turn && i_board[(X - 4) * 15 + (Y - 4)] == l)
        valid[X][Y][22] = valid[X][Y][21] | 1;
    else
        valid[X][Y][22] = valid[X][Y][21];
    // * A . X . * 270
    if(Y >= 4 && Y < 14 && i_board[X * 15 + (Y + 1)] == l && i_board[X * 15 + (Y - 1)] == turn && i_board[X * 15 + (Y - 2)] == l && i_board[X * 15 + (Y - 3)] == turn && i_board[X * 15 + (Y -4)] == l)
        valid[X][Y][23] = valid[X][Y][22] | 1;
    else
        valid[X][Y][23] = valid[X][Y][22];
    // * A X . . * 270
    if(Y >= 4 && Y < 14 && i_board[X * 15 + (Y + 1)] == l && i_board[X * 15 + (Y - 1)] == l && i_board[X * 15 + (Y - 2)] == turn && i_board[X * 15 + (Y - 3)] == turn && i_board[X * 15 + (Y -4)] == l)
        valid[X][Y][24] = valid[X][Y][23] | 1;
    else
        valid[X][Y][24] = valid[X][Y][23];
    // * A . X . * 315
    if(Y >= 4 && Y < 14 && X < 11 && X >= 1 && i_board[(X - 1) * 15 + (Y + 1)] == l && i_board[(X + 1) * 15 + (Y - 1)] == turn && i_board[(X + 2) * 15 + (Y - 2)] == l && i_board[(X + 3) * 15 + (Y - 3)] == turn && i_board[(X + 4) * 15 + (Y - 4)] == l)
        valid[X][Y][25] = valid[X][Y][24] | 1;
    else
        valid[X][Y][25] = valid[X][Y][24];
    // * A X . . * 315
    if(Y >= 4 && Y < 14 && X < 11 && X >= 1 && i_board[(X - 1) * 15 + (Y + 1)] == l && i_board[(X + 1) * 15 + (Y - 1)] == l && i_board[(X + 2) * 15 + (Y - 2)] == turn && i_board[(X + 3) * 15 + (Y - 3)] == turn && i_board[(X + 4) * 15 + (Y - 4)] == l)    
        valid[X][Y][26] = valid[X][Y][25] | 1;
    else
        valid[X][Y][26] = valid[X][Y][25];
    // * A . X . * 0
    if(X >= 1 && X < 11 && i_board[(X - 1) * 15 + Y] == l && i_board[(X + 1) * 15 + Y] == turn && i_board[(X + 2) * 15 + Y] == l && i_board[(X + 3) * 15 + Y] == turn && i_board[(X + 4) * 15 + Y] == l)
        valid[X][Y][27] = valid[X][Y][26] | 1;
    else
        valid[X][Y][27] = valid[X][Y][26];
    // * A X . . * 0
    if(X >= 1 && X < 11 && i_board[(X - 1) * 15 + Y] == l && i_board[(X + 1) * 15 + Y] == l && i_board[(X + 2) * 15 + Y] == turn && i_board[(X + 3) * 15 + Y] == turn && i_board[(X + 4) * 15 + Y] == l)
        valid[X][Y][28] = valid[X][Y][27] | 1;
    else
        valid[X][Y][28] = valid[X][Y][27];

    // * . A X . * 45
    if(X >= 2 && X < 12 && Y >= 2 && Y < 12 && i_board[(x -2) * 15 + (Y - 2)] == l && i_board[(X - 1) * 15 + (Y - 1)] == turn && i_board[(X + 1) * 15 + (Y + 1)] == l && i_board[(X + 2) * 15 + (Y + 2)] == turn && i_board[(X + 3) * 15 + (Y + 3)] == l)
        valid[X][Y][29] = valid[X][Y][28] | 1;
    else
        valid[X][Y][29] = valid[X][Y][28];
    // * . A X . * 90
    if(Y >= 2 && Y < 12 && i_board[X * 15 + (Y - 2)] == l && i_board[X * 15 + (Y - 1)] == turn && i_board[X * 15 + (Y + 1)] == l && i_board[X * 15 + (Y + 2)] == turn && i_board[X * 15 + (Y + 3)] == l)
        valid[X][Y][30] = valid[X][Y][29] | 1;
    else
        valid[X][Y][30] = valid[X][Y][29];
    // * . A X . * 135
    if(X < 13 && X >= 3 && Y >= 2 && X < 12 && i_board[(X + 2) * 15 + (Y - 2)] == l && i_board[(X + 1) * 15 + (Y - 1)] == turn && i_board[(X - 1) * 15 + (Y + 1)] == l && i_board[(X - 2) * 15 + (Y + 2)] == turn && i_board[(X - 3) * 15 + (Y + 3)] == l)
        valid[X][Y][31] = valid[X][Y][30] | 1;
    else
        valid[X][Y][31] = valid[X][Y][30];
    // * . A X . * 180
    if(X < 13 && X >= 3 && i_board[(X + 2) * 15 + Y] == l && i_board[(X + 1) * 15 + Y] == turn && i_board[(X - 1) * 15 + Y] == l && i_board[(X - 2) * 15 + Y] == turn && i_board[(X - 3) * 15 + Y] == l)
        valid[X][Y][32] = valid[X][Y][31] | 1;
    else
        valid[X][Y][32] = valid[X][Y][31];
    // * . A X . * 225
    if(X < 13 && X >= 3 && Y < 13 && Y >= 3 && i_board[(X + 2) * 15 + (Y + 2)] == l && i_board[(X + 1) * 15 + (Y + 1)] == turn && i_board[(X - 1) * 15 + (Y - 1)] == l && i_board[(X - 2) * 15 + (Y - 2)] == turn && i_board[(X - 3) * 15 + (Y - 3)] == l)
        valid[X][Y][33] = valid[X][Y][32] | 1;
    else
        valid[X][Y][33] = valid[X][Y][32];
    // * . A X . * 270
    if(Y < 13 && Y >= 3 && i_board[X * 15 + (Y + 2)] == l && i_board[X * 15 + (Y + 1)] == turn && i_board[X * 15 + (Y - 1)] == l && i_board[X * 15 + (Y - 2)] == turn && i_board[X * 15 + (Y - 3)] == l)
        valid[X][Y][34] = valid[X][Y][33] | 1;
    else
        valid[X][Y][34] = valid[X][Y][33];
    // * . A X . * 315
    if(X >= 2 && X < 12 && Y >= 3 && Y  < 13 && i_board[(X - 2) * 15 + (Y + 2)] == l && i_board[(X - 1) * 15 + (Y + 1)] == turn && i_board[(X + 1) * 15 + (Y - 1)] == l && i_board[(X + 2) * 15 + (Y - 2)] == turn && i_board[(X + 3) * 15 + (Y - 3)] == l)
        valid[X][Y][35] = valid[X][Y][34] | 1;
    else
        valid[X][Y][35] = valid[X][Y][34];
    // * . A X . * 0
    if(X < 13 && X >= 3 && i_board[(X - 2) * 15 + Y] == l && i_board[(X - 1) * 15 + Y] == turn && i_board[(X + 1) * 15 + Y] == l && i_board[(X + 2) * 15 + Y] == turn &7 i_board[(X + 3) * 15 + Y] == l)
        valid[X][Y][36] = valid[X][Y][35] | 1;
    else
        valid[X][Y][36] = valid[X][Y][35];


// blocked fours
    // lA...x ,0
    if((X < 11 &&  X > 0) && 
        (i_board[(X+1)*15] == turn &&  i_board[(X+2)*15] == turn  && i_board[(X+3)*15] == turn)  &&
        (i_board[(X+4)*15] == {turn[1],~turn[0]}) &&
        (i_board[(X-1)*15] == l))
        valid[X][Y][37] = valid[X][Y][36] | 1;
    else    
        valid[X][Y][37] = valid[X][Y][36];
    // l.A..x ,0
    if((X < 12 && X > 1) && 
        (i_board[(X+1)*15] == turn &&  i_board[(X+2)*15] == turn  && i_board[(X-1)*15] == turn)  &&
        (i_board[(X+3)*15] == {turn[1],~turn[0]}) &&
        (i_board[(X-2)*15] == l))
        valid[X][Y][38] = valid[X][Y][37] | 1;
    else
        valid[X][Y][38] = valid[X][Y][37];
    // l..A.x ,0
    if((X < 13 && X > 2) && 
        (i_board[(X+1)*15] == turn &&  i_board[(X-1)*15] == turn  && i_board[(X-2)*15] == turn)  &&
        (i_board[(X+2)*15] == {turn[1],~turn[0]}) &&
        (i_board[(X-3)*15] == l))
        valid[X][Y][39] = valid[X][Y][38] | 1;
    else
        valid[X][Y][39] = valid[X][Y][38];
    // l...Ax ,0
    if( (X < 14 && X > 3) && 
        (i_board[(X-1)*15)] == turn &&  i_board[(X-2)*15] == turn  && i_board[(X-3)*15] == turn)  &&
        (i_board[(X+1)*15] == {turn[1],~turn[0]}) &&1
        (i_board[(X-4)*15] == l))
        valid[X][Y][40] = valid[X][Y][39] | 1;
    else
        valid[X][Y][40] = valid[X][Y][39];
    // lA ...x ,45
    if((X < 11 && Y < 11 && X > 0 && Y > 0) && 
        (i_board[(X+1)*15+(Y+1)] == turn &&  i_board[(X+2)*15+(Y+2)] == turn  && i_board[(X+3)*15+(Y+3)] == turn)  &&
        (i_board[(X+4)*15+(Y+4)] == {turn[1],~turn[0]}) &&
        (i_board[(X-1)*15+(Y-1)] == l))
        valid[X][Y][41] = valid[X][Y][40] | 1;
    else
        valid[X][Y][41] = valid[X][Y][40];
    // l.A..x ,45
    if((X < 12 && Y < 12 && X > 1 && Y > 1) && 
        (i_board[(X+1)*15+(Y+1)] == turn &&  i_board[(X+2)*15+(Y+2)] == turn  && i_board[(X-1)*15+(Y-1)] == turn)  &&
        (i_board[(X+3)*15+(Y+3)] == {turn[1],~turn[0]}) &&
        (i_board[(X-2)*15+(Y-2)] == l))
        valid[X][Y][42] = valid[X][Y][41] | 1;
    else
        valid[X][Y][42] = valid[X][Y][41];
    // l..A.x ,45
    if((X < 13 && Y < 13 && X > 2 && Y > 2) && 
        (i_board[(X+1)*15+(Y+1)] == turn &&  i_board[(X-2)*15+(Y-2)] == turn  && i_board[(X-1)*15+(Y-1)] == turn)  &&
        (i_board[(X+2)*15+(Y+2)] == {turn[1],~turn[0]}) &&
        (i_board[(X-3)*15+(Y-3)] == l))
        valid[X][Y][43] = valid[X][Y][42] | 1;
    else
        valid[X][Y][43] = valid[X][Y][42];
    // l...Ax ,45
    if( (X < 14 && Y < 14 && X > 3 && Y > 3) && 
        (i_board[(X-3)*15+(Y-3)] == turn &&  i_board[(X-2)*15+(Y-2)] == turn  && i_board[(X-1)*15+(Y-1)] == turn)  &&
        (i_board[(X+1)*15+(Y+1)] == {turn[1],~turn[0]}) &&
        (i_board[(X-4)*15+(Y-4)] == l))
        valid[X][Y][44] = valid[X][Y][43] | 1;
    else
        valid[X][Y][44] = valid[X][Y][43];
    // lA...x ,90
    if( (Y < 11 && Y > 0) && 
        (i_board[Y+1] == turn &&  i_board[Y+2] == turn  && i_board[Y+3] == turn)  &&
        (i_board[Y+4] == {turn[1],~turn[0]}) &&
        (i_board[Y-1] == l))
        valid[X][Y][45] = valid[X][Y][44] | 1;
    else
        valid[X][Y][45] = valid[X][Y][44];
    // l.A..x ,90
    if( (Y < 12 && Y > 1) && 
        (i_board[Y+1] == turn &&  i_board[Y+2] == turn  && i_board[Y-1] == turn)  &&
        (i_board[Y+3] == {turn[1],~turn[0]}) &&
        (i_board[Y-2] == l))
        valid[X][Y][46] = valid[X][Y][45] | 1;
    else
        valid[X][Y][46] = valid[X][Y][45];
    // l..A.x ,90
    if( (Y < 13 && Y > 2) && 
        (i_board[Y+1] == turn &&  i_board[Y-2] == turn  && i_board[Y-1] == turn)  &&
        (i_board[Y+2] == {turn[1],~turn[0]}) &&
        i_board[Y-3] == l))
        valid[X][Y][47] = valid[X][Y][46] | 1;
    else
        valid[X][Y][47] = valid[X][Y][46];
    // l...Ax ,90
    if( (Y < 14 && Y > 3) && 
        (i_board[Y-3] == turn &&  i_board[Y-2] == turn  && i_board[Y-1] == turn)  &&
        (i_board[Y+1] == {turn[1],~turn[0]}) &&
        (i_board[(Y-4)] == l))
        valid[X][Y][48] = valid[X][Y][47] | 1;
    else
        valid[X][Y][48] = valid[X][Y][47];
    // x...Al ,135
    if((X < 14 && Y < 11 && X > 3 && Y > 0) && 
        (i_board[(X-1)*15+(Y+1)] == turn &&  i_board[(X-2)*15+(Y+2)] == turn  && i_board[(X-3)*15+(Y+3)] == turn)  &&
        (i_board[(X-4)*15+(Y+4)] == {turn[1],~turn[0]}) &&
        (i_board[(X+1)*15+(Y-1)] == l))
        valid[X][Y][49] = valid[X][Y][48] | 1;
    else
        valid[X][Y][49] = valid[X][Y][48];
    // x..A.l ,135
    if((X < 13 && Y < 12 && X > 2 && Y > 1) && 
        (i_board[(X-1)*15+(Y+1)] == turn &&  i_board[(X-2)*15+(Y+2)] == turn  && i_board[(X+1)*15+(Y-1)] == turn)  &&
        (i_board[(X-3)*15+(Y+3)] == {turn[1],~turn[0]}) &&
        (i_board[(X+2)*15+(Y-2)] == l))
        valid[X][Y][50] = valid[X][Y][49] | 1;
    else
        valid[X][Y][50] = valid[X][Y][49];
    // x.A..l ,135
    if((X < 12 && Y < 13 && X > 1 && Y > 2) && 
        (i_board[(X-1)*15+(Y+1)] == turn &&  i_board[(X+1)*15+(Y-1)] == turn  && i_board[(X+2)*15+(Y-2)] == turn)  &&
        (i_board[(X-2)*15+(Y+2)] == {turn[1],~turn[0]}) &&
        (i_board[(X+3)*15+(Y-3)] == l))
        valid[X][Y][51] = valid[X][Y][50] | 1;
    else
        valid[X][Y][51] = valid[X][Y][50];
    // xA...l ,135
    if( (X < 11 && Y < 14 && X > 0 && Y > 3) && 
        (i_board[(X+1)*15+(Y-1)] == turn &&  i_board[(X+2)*15+(Y-2)] == turn  && i_board[(X+3)*15+(Y-3)] == turn)  &&
        (i_board[(X-1)*15+(Y+1)] == {turn[1],~turn[0]}) &&
        (i_board[(X+4)*15+(Y-4)] == l))
        valid[X][Y][52] = valid[X][Y][51] | 1;
    else
        valid[X][Y][52] = valid[X][Y][51];
    // x...Al ,180
    if((X < 14 &&  X > 3) && 
        (i_board[(X-1)*15] == turn &&  i_board[(X-2)*15] == turn  && i_board[(X-3)*15] == turn)  &&
        (i_board[(X-4)*15] == {turn[1],~turn[0]}) &&
        (i_board[(X+1)*15] == l))
        valid[X][Y][53] = valid[X][Y][52] | 1;
    else
        valid[X][Y][53] = valid[X][Y][52];
    // x..A.l ,180
    if((X < 13 && X > 2) && 
        (i_board[(X-1)*15] == turn &&  i_board[(X-2)*15] == turn  && i_board[(X+1)*15] == turn)  &&
        (i_board[(X-3)*15] == {turn[1],~turn[0]}) &&
        (i_board[(X+2)*15] == l))
        valid[X][Y][54] = valid[X][Y][53] | 1;
    else
        valid[X][Y][54] = valid[X][Y][53];
    // x.A..l ,180
    if((X < 12 && X > 1) && 
        (i_board[(X-1)*15] == turn &&  i_board[(X+1)*15] == turn  && i_board[(X+2)*15] == turn)  &&
        (i_board[(X-2)*15] == {turn[1],~turn[0]}) &&
        (i_board[(X+3)*15] == l))
        valid[X][Y][54] = valid[X][Y][53] | 1;
    else
        valid[X][Y][54] = valid[X][Y][53];
    // xA...l ,180
    if( (X < 11 && X > 0) && 
        (i_board[(X+1)*15)] == turn &&  i_board[(X+2)*15] == turn  && i_board[(X+3)*15] == turn)  &&
        (i_board[(X-1)*15] == {turn[1],~turn[0]}) &&1
        (i_board[(X+4)*15] == l))
        valid[X][Y][55] = valid[X][Y][54] | 1;
    else
        valid[X][Y][55] = valid[X][Y][54];
    // x...Al ,225
    if((X < 14 && Y < 14 && X > 3 && Y > 3) && 
        (i_board[(X-1)*15+(Y-1)] == turn &&  i_board[(X-2)*15+(Y-2)] == turn  && i_board[(X-3)*15+(Y-3)] == turn)  &&
        (i_board[(X-4)*15+(Y-4)] == {turn[1],~turn[0]}) &&
        (i_board[(X+1)*15+(Y+1)] == l))
        valid[X][Y][56] = valid[X][Y][55] | 1;
    else
        valid[X][Y][56] = valid[X][Y][55];
    // x..A.l ,225
    if((X < 13 && Y < 13 && X > 2 && Y > 2) && 
        (i_board[(X-1)*15+(Y-1)] == turn &&  i_board[(X-2)*15+(Y-2)] == turn  && i_board[(X+1)*15+(Y+1)] == turn)  &&
        (i_board[(X-3)*15+(Y-3)] == {turn[1],~turn[0]}) &&
        (i_board[(X+2)*15+(Y+2)] == l))
        valid[X][Y][57] = valid[X][Y][56] | 1;
    else
        valid[X][Y][57] = valid[X][Y][56];
    // x.A..l ,225
    if((X < 12 && Y < 12 && X > 1 && Y > 1) && 
        (i_board[(X-1)*15+(Y-1)] == turn &&  i_board[(X+1)*15+(Y+1)] == turn  && i_board[(X+2)*15+(Y+2)] == turn)  &&
        (i_board[(X-2)*15+(Y-2)] == {turn[1],~turn[0]}) &&
        (i_board[(X+3)*15+(Y+3)] == l))
        valid[X][Y][58] = valid[X][Y][57] | 1;
    else
        valid[X][Y][58] = valid[X][Y][57];
    // xA...l ,225
    if( (X < 11 && Y < 11 && X > 0 && Y > 0) && 
       (i_board[(X+1)*15+(Y+1)] == turn &&  i_board[(X+2)*15+(Y+2)] == turn  && i_board[(X+3)*15+(Y+3)] == turn)  &&
        (i_board[(X-1)*15+(Y-1)] == {turn[1],~turn[0]}) &&
        (i_board[(X+4)*15+(Y+4)] == l))
        valid[X][Y][59] = valid[X][Y][58] | 1;
    else
        valid[X][Y][59] = valid[X][Y][58];
    // lA...x ,270
    if( (Y < 14 && Y > 3) && 
        (i_board[Y-1] == turn &&  i_board[Y-2] == turn  && i_board[Y-3] == turn)  &&
        (i_board[Y-4] == {turn[1],~turn[0]}) &&
        (i_board[Y+1] == l))
        valid[X][Y][60] = valid[X][Y][59] | 1;
    else
        valid[X][Y][60] = valid[X][Y][59];
    // l.A..x ,270
    if( (Y < 13 && Y > 2) && 
        (i_board[Y-1] == turn &&  i_board[Y-2] == turn  && i_board[Y+1] == turn)  &&
        (i_board[Y-3] == {turn[1],~turn[0]}) &&
        (i_board[Y+2] == l))
        valid[X][Y][61] = valid[X][Y][60] | 1;
    else
        valid[X][Y][61] = valid[X][Y][60];
    // l..A.x ,270
    if( (Y < 12 && Y > 1) && 
        (i_board[Y-1] == turn &&  i_board[Y+1] == turn  && i_board[Y+2] == turn)  &&
        (i_board[Y-2] == {turn[1],~turn[0]}) &&
        i_board[Y+3] == l))
        valid[X][Y][62] = valid[X][Y][61] | 1;
    else
        valid[X][Y][62] = valid[X][Y][61];
    // l...Ax ,270
    if( (Y < 11 && Y > 0) && 
        (i_board[Y+3] == turn &&  i_board[Y+2] == turn  && i_board[Y+1] == turn)  &&
        (i_board[Y-1] == {turn[1],~turn[0]}) &&
        (i_board[(Y+4)] == l))
        valid[X][Y][62] = valid[X][Y][61] | 1;
    else
        valid[X][Y][62] = valid[X][Y][61];
    // lA ...x ,315
    if((X < 11 && Y < 14 && X > 0 && Y > 3) && 
        (i_board[(X+1)*15+(Y-1)] == turn &&  i_board[(X+2)*15+(Y+2)] == turn  && i_board[(X+3)*15+(Y-3)] == turn)  &&
        (i_board[(X+4)*15+(Y-4)] == {turn[1],~turn[0]}) &&
        (i_board[(X-1)*15+(Y+1)] == l))
        valid[X][Y][63] = valid[X][Y][62] | 1;
    else
        valid[X][Y][63] = valid[X][Y][62];
    // l.A..x ,315
    if((X < 12 && Y < 13 && X > 1 && Y > 2) && 
        (i_board[(X+1)*15+(Y-1)] == turn &&  i_board[(X+2)*15+(Y-2)] == turn  && i_board[(X-1)*15+(Y+1)] == turn)  &&
        (i_board[(X+3)*15+(Y-3)] == {turn[1],~turn[0]}) &&
        (i_board[(X-2)*15+(Y+2)] == l))
        valid[X][Y][64] = valid[X][Y][63] | 1;
    else
        valid[X][Y][64] = valid[X][Y][63];
    // l..A.x ,315
    if((X < 13 && Y < 12 && X > 2 && Y > 1) && 
        (i_board[(X+1)*15+(Y-1)] == turn &&  i_board[(X-1)*15+(Y+1)] == turn  && i_board[(X-2)*15+(Y-2)] == turn)  &&
        (i_board[(X+2)*15+(Y-2)] == {turn[1],~turn[0]}) &&
        (i_board[(X-3)*15+(Y+3)] == l))
        valid[X][Y][65] = valid[X][Y][64] | 1;
    else
        valid[X][Y][65] = valid[X][Y][64];
    // l...Ax ,315
    if( (X < 14 && Y < 11 && X > 3 && Y > 0) && 
        (i_board[(X-3)*15+(Y+3)] == turn &&  i_board[(X-2)*15+(Y+2)] == turn  && i_board[(X-1)*15+(Y+1)] == turn)  &&
        (i_board[(X+1)*15+(Y-1)] == {turn[1],~turn[0]}) &&
        (i_board[(X-4)*15+(Y+4)] == l))
        valid[X][Y][66] = valid[X][Y][65] | 1;
    else
        valid[X][Y][66] = valid[X][Y][65];
    check = valid[X][Y][66];
endtask
always_comb begin
    state_w         = state_r;
    finish_w        = finish_r;
    case (state_r)
        S_IDLE: begin
            finish_w = 1'b0;
            if(i_start) begin
                state_w = S_COUNT;
                for(int i = 0; i < 15; i++) begin
                    for(int j = 0; j < 15; j++) begin
                        three(.X(i[3:0]), .Y(j[3:0]), .turn(i_turn), .check(valid[i][j][67]));
                        if(i_board[i * 15 + j] == l && valid[i][j][67])
                            ok[i][j] = 1;
                        else
                            ok[i][j] = 0;
                    end
                    $display("%b %b %b %b %b %b %b %b %b %b %b %b %b %b %b\n", ok[i][0], ok[i][1], ok[i][2], ok[i][3], ok[i][4], ok[i][5], ok[i][6], ok[i][7], ok[i][8], ok[i][9], ok[i][10], ok[i][11], ok[i][12], ok[i][13], ok[i][14]);
                end
            end
        end
        S_COUNT: begin
            pointer[0] = 6'd49;
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
    end
    else begin
        state_r         <= state_w;
        finish_r        <= finish_w;
    end
end
endmodule