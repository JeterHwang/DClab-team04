// 找尋己方必須防守的點 和 可以攻擊的點
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

parameter S_ATTACK = 1'd0;
parameter S_DEFEND = 1'd1;

parameter b         = 2'd0;
parameter w         = 2'd1;
parameter l         = 2'd2;

// one piece to three
parameter black_con_two_1       [11:0] = {l, l, l, b, b ,l};
parameter black_con_two_2       [11:0] = {l, b, b, l, l ,l};
parameter black_con_two_3       [9:0]  = {l, l, b, b ,l};
parameter black_con_two_4       [9:0]  = {l, b, b, l ,l};
parameter black_blank_one_two_1 [11:0] = {l, l, b, l ,b, l};
parameter black_blank_one_two_2 [11:0] = {l, b, l, b ,l, l};
parameter black_blank_two_two_1 [11:0] = {l, b, l, l ,b, l};

// one piece to con four
parameter black_blocked_con_three_1       [11:0] = {l, l, b, b ,b, w};
parameter black_blocked_con_three_2       [11:0] = {w, b, b, b ,l, l};
parameter black_blocked_blank_one_three_1 [11:0] = {l, b, l, b ,b, w};
parameter black_blocked_blank_one_three_2 [11:0] = {w, b, b, l ,b, l};
parameter black_blocked_blank_two_three_1 [11:0] = {l, b, b, l ,b, w};
parameter black_blocked_blank_two_three_2 [11:0] = {w, b, l, b ,b, l};
parameter black_blocked_jump_one_three_1  [9:0]  = {b, l, l, b, b};
parameter black_blocked_jump_one_three_2  [9:0]  = {b, b, l, l, b};
parameter black_blocked_jump_two_three_1  [9:0]  = {b, l, b, l, b};
parameter black_blocked_double_three_1    [13:0] = {w, l, b, b, b, l, w};

// defense blocked four
parameter black_blocked_con_four_o        [11:0] = {l, b, b, b, b, w };
parameter black_blocked_con_four_r        [11:0] = {w, b, b, b, b, l };
parameter black_blocked_jump_one_four_o   [9:0]  = {b, l, b, b, b};
parameter black_blocked_jump_one_four_r   [9:0]  = {b, b, b, l, b};
parameter black_blocked_jump_two_four     [9:0]  = {b, b, l, b, b};

// defense three 
parameter black_con_three                 [9:0]  = {l, b, b, b, l};
parameter black_jump_one_three_o          [11:0] = {l, b, l, b, b, l};
parameter black_jump_one_three_r          [11:0] = {l, b, b, l, b, l};

logic [3:0] state_r, state_w;
logic []
logic finish_r, finish_w;

task three(
    input   [3:0] X,
    input   [3:0] Y,
    input   [1:0] turn,
    output  [11:0] out
);
    // middle blank
    if(X + 1 < 15 && X - 1 > 0 && Y + 1 < 15 && Y - 1 > 0 && i_board[(X + 1) * 15 + (Y + 1)] == turn && i_board[(X - 1) * 15 + (Y - 1)] == turn) 
        out = out & 1;
    if(X + 1 < 15 && X - 1 > 0 && i_board[(X + 1) * 15 + Y] == turn && i_board[(X - 1) * 15 + Y] == turn)

    if(Y + 1 < 15 && Y - 1 > 0 && i_board[X * 15 + (Y + 1)] == turn && i_board[X * 15 + (Y - 1)] == turn)

    if(X + 1 < 15 && Y + 1 < 15 && X - 1 > 0 && Y - 1 > 0 && i_board[(X - 1) * 15 + (Y + 1)] == turn && i_board[(X + 1) * 15 + (Y - 1)]) 

    //  
    if(X + 2 < 15 && Y + 2 < 15 && i_board[(X + 1) * 15 + (Y + 1)] == turn && i_board[(X + 2) * 15 + (Y + 2)] == turn)

    if(X - 2 < 15 && Y - 2 < 15 && i_board[(X - 1) * 15 + (Y - 1)] == turn && i_board[(X - 2) * 15 + (Y - 2)] == turn)

    if(X + 2 < 15 && X - 2 > 0 && Y + 2 < 15 && Y - 2 > 0 && i_board[(X + 1) * 15 + (Y - 1)] == turn && i_board[(X + 2) * 15 + (Y - 2)] == turn)

    if(X + 2 < 15 && X - 2 > 0 && Y + 2 < 15 && Y - 2 > 0 && i_board[(X - 1) * 15 + (Y + 1)] == turn && i_board[(X - 2) * 15 + (Y + 2)] == turn)

    if(X + 2 < 15 && i_board[(X + 1) * 15 + Y] == turn && i_board[(X + 2) * 15 + Y] == turn)

    if(X - 2 > 0 && i_board[(X - 1) * 15 + Y] == turn && i_board[(X - 2) * 15 + Y] == turn)

    if(Y + 2 < 15 && i_board[X * 15 + (Y + 1)] == turn && i_board[X * 15 + (Y + 2)] == turn)

    if(Y - 2 > 0 && i_board[X * 15 + (Y - 1)] == turn && i_board[X * 15 + (Y - 2)] == turn)

    
    // . . X .
    if(X + 3 < 15 && Y + 3 < 15 && i_board[(X + 1) * 15 + (Y + 1)] == turn && i_board[(X + 2) * 15 + (Y + 2)] == l && i_board[(X + 3) * 15 + (Y + 3)] == turn)

    if(X + 3 < 15 && Y + 3 < 15 && i_board[(X + 1) * 15 + (Y + 1)] == l && i_board[(X + 2) * 15 + (Y + 2)] == turn && i_board[(X + 3) * 15 + (Y + 3)] == turn)

    if(Y + 3 < 15 && i_board[X * 15 + (Y + 1)] == turn && i_board[X * 15 + (Y + 2)] == l && i_board[X * 15 + (Y + 3)] == turn)

    if(Y + 3 < 15 && i_board[X * 15 + (Y + 1)] == l && i_board[X * 15 + (Y + 2)] == turn && i_board[X * 15 + (Y + 3)] == turn)

    if(X - 3 > 0  && Y + 3 < 15 && i_board[(X - 1) * 15 + (Y + 1)] == turn && i_board[(X - 2) * 15 + (Y + 2)] == l && i_board[(X - 3) * 15 + (Y + 3)] == turn)

    if(X - 3 > 0  && Y + 3 < 15 && i_board[(X - 1) * 15 + (Y + 1)] == l && i_board[(X - 2) * 15 + (Y + 2)] == turn && i_board[(X - 3) * 15 + (Y + 3)] == turn)

    if(X - 3 > 0  && i_board[(X - 1) * 15 + Y] == turn && i_board[(X - 2) * 15 + Y] == l && i_board[(X - 3) * 15 + Y] == turn)

    if(X - 3 > 0  && i_board[(X - 1) * 15 + Y] == l && i_board[(X - 2) * 15 + Y] == turn && i_board[(X - 3) * 15 + Y] == turn)

    if(X - 3 > 0 && Y - 3 > 0 && i_board[(X - 1) * 15 + (Y - 1)] == turn && i_board[(X - 2) * 15 + (Y - 2)] == l && i_board[(x - 3) * 15 + (Y - 3)] == turn)

    if(X - 3 > 0 && Y - 3 > 0 && i_board[(X - 1) * 15 + (Y - 1)] == l && i_board[(X - 2) * 15 + (Y - 2)] == turn && i_board[(x - 3) * 15 + (Y - 3)] == turn)

    if(Y - 3 > 0 && i_board[X * 15 + (Y - 1)] == turn && i_board[X * 15 + (Y - 2)] == l && i_board[X * 15 + (Y - 3)] == turn)

    if(Y - 3 > 0 && i_board[X * 15 + (Y - 1)] == l && i_board[X * 15 + (Y - 2)] == turn && i_board[X * 15 + (Y - 3)] == turn)

    if(Y - 3 > 0 && X + 3 < 15 && i_board[(X + 1) * 15 + (Y - 1)] == turn && i_board[(X + 2) * 15 + (Y - 2)] == l && i_board[(X + 3) * 15 + (Y - 3)] == turn)

    if(Y - 3 > 0 && X + 3 < 15 && i_board[(X + 1) * 15 + (Y - 1)] == l && i_board[(X + 2) * 15 + (Y - 2)] == turn && i_board[(X + 3) * 15 + (Y - 3)] == turn)    

    if(X + 3 < 15 && i_board[(X + 1) * 15 + Y] == turn && i_board[(X + 2) * 15 + Y] == l && i_board[(X + 3) * 15 + Y] == turn)

    if(X + 3 < 15 && i_board[(X + 1) * 15 + Y] == l && i_board[(X + 2) * 15 + Y] == turn && i_board[(X + 3) * 15 + Y] == turn)


    if(X - 1 > 0 && X + 2 < 15 && Y - 1 > 0 && Y + 2 < 15 && i_board[(X - 1) * 15 + (Y - 1)] == turn && i_board[(X + 1) * 15 + (Y + 1)] == l && i_board[(X + 2) * 15 + (Y + 2)] == turn)

    if(Y - 1 > 0 && Y + 2 < 15 && i_board[X * 15 + (Y - 1)] == turn && i_board[X * 15 + (Y + 1)] == l && i_board[X * 15 + (Y + 2)] == turn)

    if(X + 1 < 15 && X - 2 > 0 && Y - 1 > 0 && X + 2 < 15 && i_board[(X + 1) * 15 + (Y - 1)] == turn && i_board[(X - 1) * 15 + (Y + 1)] == l && i_board[(X - 2) * 15 + (Y - 2)] == turn)

    if(X + 1 < 15 && X - 2 > 0 && i_board[(X + 1) * 15 + Y] == turn && i_board[(X - 1) * 15 + Y] == l && i_board[(X - 2) * 15 + Y] == turn)

    if(X + 1 < 15 && X - 2 > 0 && Y + 1 < 15 && Y - 2 > 0 && i_board[(X + 1) * 15 + (Y + 1)] == turn && i_board[(X - 1) * 15 + (Y - 1)] == l && i_board[(X - 2) * 15 + (Y - 2)] == turn)

    if(Y + 1 < 15 && Y - 2 > 0 && i_board[X * 15 + (Y + 1)] == turn && i_board[X * 15 + (Y - 1)] == l && i_board[X * 15 + (Y - 2)] == turn)

    if(X - 1 > 0 && X + 2 < 15 && Y - 2 > 0 && Y + 1 < 15 && i_board[(X - 1) * 15 + (Y + 1)] == turn && i_board[(X + 1) * 15 + (Y - 1)] == l && i_board[(X + 2) * 15 + (Y - 2)] == turn)
    
    if(X + 1 < 15 && X - 2 > 0 && i_board[(X + 1) * 15 + Y] == turn && i_board[(X - 1) * 15 + Y] == l && i_board[(X - 2) * 15 + Y] == turn)
endtask
task blocked_four(
    input   [3:0] X,
    input   [3:0] Y,
    input   [1:0] turn,
    output  [11:0] out
); 
// lA...x ,0
    if((X < 11 &&  X > 0) && 
        (i_board[(X+1)*15] == turn &&  i_board[(X+2)*15] == turn  && i_board[(X+3)*15] == turn)  &&
        (i_board[(X+4)*15] == {turn[1],~turn[0]}) &&
        (i_board[(X-1)*15] == l))
// l.A..x ,0
    if((X < 12 && X > 1) && 
        (i_board[(X+1)*15] == turn &&  i_board[(X+2)*15] == turn  && i_board[(X-1)*15] == turn)  &&
        (i_board[(X+3)*15] == {turn[1],~turn[0]}) &&
        (i_board[(X-2)*15] == l))
// l..A.x ,0
    if((X < 13 && X > 2) && 
        (i_board[(X+1)*15] == turn &&  i_board[(X-1)*15] == turn  && i_board[(X-2)*15] == turn)  &&
        (i_board[(X+2)*15] == {turn[1],~turn[0]}) &&
        (i_board[(X-3)*15] == l))
// l...Ax ,0
    if( (X < 14 && X > 3) && 
        (i_board[(X-1)*15)] == turn &&  i_board[(X-2)*15] == turn  && i_board[(X-3)*15] == turn)  &&
        (i_board[(X+1)*15] == {turn[1],~turn[0]}) &&1
        (i_board[(X-4)*15] == l))

// lA ...x ,45
    if((X < 11 && Y < 11 && X > 0 && Y > 0) && 
        (i_board[(X+1)*15+(Y+1)] == turn &&  i_board[(X+2)*15+(Y+2)] == turn  && i_board[(X+3)*15+(Y+3)] == turn)  &&
        (i_board[(X+4)*15+(Y+4)] == {turn[1],~turn[0]}) &&
        (i_board[(X-1)*15+(Y-1)] == l))
// l.A..x ,45
    if((X < 12 && Y < 12 && X > 1 && Y > 1) && 
        (i_board[(X+1)*15+(Y+1)] == turn &&  i_board[(X+2)*15+(Y+2)] == turn  && i_board[(X-1)*15+(Y-1)] == turn)  &&
        (i_board[(X+3)*15+(Y+3)] == {turn[1],~turn[0]}) &&
        (i_board[(X-2)*15+(Y-2)] == l))
// l..A.x ,45
    if((X < 13 && Y < 13 && X > 2 && Y > 2) && 
        (i_board[(X+1)*15+(Y+1)] == turn &&  i_board[(X-2)*15+(Y-2)] == turn  && i_board[(X-1)*15+(Y-1)] == turn)  &&
        (i_board[(X+2)*15+(Y+2)] == {turn[1],~turn[0]}) &&
        (i_board[(X-3)*15+(Y-3)] == l))
// l...Ax ,45
    if( (X < 14 && Y < 14 && X > 3 && Y > 3) && 
        (i_board[(X-3)*15+(Y-3)] == turn &&  i_board[(X-2)*15+(Y-2)] == turn  && i_board[(X-1)*15+(Y-1)] == turn)  &&
        (i_board[(X+1)*15+(Y+1)] == {turn[1],~turn[0]}) &&
        (i_board[(X-4)*15+(Y-4)] == l))
// lA...x ,90
    if( (Y < 11 && Y > 0) && 
        (i_board[Y+1] == turn &&  i_board[Y+2] == turn  && i_board[Y+3] == turn)  &&
        (i_board[Y+4] == {turn[1],~turn[0]}) &&
        (i_board[Y-1] == l))
// l.A..x ,90
    if( (Y < 12 && Y > 1) && 
        (i_board[Y+1] == turn &&  i_board[Y+2] == turn  && i_board[Y-1] == turn)  &&
        (i_board[Y+3] == {turn[1],~turn[0]}) &&
        (i_board[Y-2] == l))
// l..A.x ,90
    if( (Y < 13 && Y > 2) && 
        (i_board[Y+1] == turn &&  i_board[Y-2] == turn  && i_board[Y-1] == turn)  &&
        (i_board[Y+2] == {turn[1],~turn[0]}) &&
        i_board[Y-3] == l))
// l...Ax ,90
    if( (Y < 14 && Y > 3) && 
        (i_board[Y-3] == turn &&  i_board[Y-2] == turn  && i_board[Y-1] == turn)  &&
        (i_board[Y+1] == {turn[1],~turn[0]}) &&
        (i_board[(Y-4)] == l))

// x...Al ,135
    if((X < 14 && Y < 11 && X > 3 && Y > 0) && 
        (i_board[(X-1)*15+(Y+1)] == turn &&  i_board[(X-2)*15+(Y+2)] == turn  && i_board[(X-3)*15+(Y+3)] == turn)  &&
        (i_board[(X-4)*15+(Y+4)] == {turn[1],~turn[0]}) &&
        (i_board[(X+1)*15+(Y-1)] == l))
// x..A.l ,135
    if((X < 13 && Y < 12 && X > 2 && Y > 1) && 
        (i_board[(X-1)*15+(Y+1)] == turn &&  i_board[(X-2)*15+(Y+2)] == turn  && i_board[(X+1)*15+(Y-1)] == turn)  &&
        (i_board[(X-3)*15+(Y+3)] == {turn[1],~turn[0]}) &&
        (i_board[(X+2)*15+(Y-2)] == l))
// x.A..l ,135
    if((X < 12 && Y < 13 && X > 1 && Y > 2) && 
        (i_board[(X-1)*15+(Y+1)] == turn &&  i_board[(X+1)*15+(Y-1)] == turn  && i_board[(X+2)*15+(Y-2)] == turn)  &&
        (i_board[(X-2)*15+(Y+2)] == {turn[1],~turn[0]}) &&
        (i_board[(X+3)*15+(Y-3)] == l))
// xA...l ,135
    if( (X < 11 && Y < 14 && X > 0 && Y > 3) && 
        (i_board[(X+1)*15+(Y-1)] == turn &&  i_board[(X+2)*15+(Y-2)] == turn  && i_board[(X+3)*15+(Y-3)] == turn)  &&
        (i_board[(X-1)*15+(Y+1)] == {turn[1],~turn[0]}) &&
        (i_board[(X+4)*15+(Y-4)] == l))

// x...Al ,180
    if((X < 14 &&  X > 3) && 
        (i_board[(X-1)*15] == turn &&  i_board[(X-2)*15] == turn  && i_board[(X-3)*15] == turn)  &&
        (i_board[(X-4)*15] == {turn[1],~turn[0]}) &&
        (i_board[(X+1)*15] == l))
// x..A.l ,180
    if((X < 13 && X > 2) && 
        (i_board[(X-1)*15] == turn &&  i_board[(X-2)*15] == turn  && i_board[(X+1)*15] == turn)  &&
        (i_board[(X-3)*15] == {turn[1],~turn[0]}) &&
        (i_board[(X+2)*15] == l))
// x.A..l ,180
    if((X < 12 && X > 1) && 
        (i_board[(X-1)*15] == turn &&  i_board[(X+1)*15] == turn  && i_board[(X+2)*15] == turn)  &&
        (i_board[(X-2)*15] == {turn[1],~turn[0]}) &&
        (i_board[(X+3)*15] == l))
// xA...l ,180
    if( (X < 11 && X > 0) && 
        (i_board[(X+1)*15)] == turn &&  i_board[(X+2)*15] == turn  && i_board[(X+3)*15] == turn)  &&
        (i_board[(X-1)*15] == {turn[1],~turn[0]}) &&1
        (i_board[(X+4)*15] == l))
    
// x...Al ,225
    if((X < 14 && Y < 14 && X > 3 && Y > 3) && 
        (i_board[(X-1)*15+(Y-1)] == turn &&  i_board[(X-2)*15+(Y-2)] == turn  && i_board[(X-3)*15+(Y-3)] == turn)  &&
        (i_board[(X-4)*15+(Y-4)] == {turn[1],~turn[0]}) &&
        (i_board[(X+1)*15+(Y+1)] == l))
// x..A.l ,225
    if((X < 13 && Y < 13 && X > 2 && Y > 2) && 
        (i_board[(X-1)*15+(Y-1)] == turn &&  i_board[(X-2)*15+(Y-2)] == turn  && i_board[(X+1)*15+(Y+1)] == turn)  &&
        (i_board[(X-3)*15+(Y-3)] == {turn[1],~turn[0]}) &&
        (i_board[(X+2)*15+(Y+2)] == l))
// x.A..l ,225
    if((X < 12 && Y < 12 && X > 1 && Y > 1) && 
        (i_board[(X-1)*15+(Y-1)] == turn &&  i_board[(X+1)*15+(Y+1)] == turn  && i_board[(X+2)*15+(Y+2)] == turn)  &&
        (i_board[(X-2)*15+(Y-2)] == {turn[1],~turn[0]}) &&
        (i_board[(X+3)*15+(Y+3)] == l))
// xA...l ,225
    if( (X < 11 && Y < 11 && X > 0 && Y > 0) && 
       (i_board[(X+1)*15+(Y+1)] == turn &&  i_board[(X+2)*15+(Y+2)] == turn  && i_board[(X+3)*15+(Y+3)] == turn)  &&
        (i_board[(X-1)*15+(Y-1)] == {turn[1],~turn[0]}) &&
        (i_board[(X+4)*15+(Y+4)] == l))

// lA...x ,270
    if( (Y < 15 && Y > 3) && 
        (i_board[Y-1] == turn &&  i_board[Y-2] == turn  && i_board[Y-3] == turn)  &&
        (i_board[Y-4] == {turn[1],~turn[0]}) &&
        (i_board[Y+1] == l))
// l.A..x ,270
    if( (Y < 14 && Y > 2) && 
        (i_board[Y-1] == turn &&  i_board[Y-2] == turn  && i_board[Y+1] == turn)  &&
        (i_board[Y-3] == {turn[1],~turn[0]}) &&
        (i_board[Y+2] == l))
// l..A.x ,270
    if( (Y < 12 && Y > 1) && 
        (i_board[Y-1] == turn &&  i_board[Y+1] == turn  && i_board[Y+2] == turn)  &&
        (i_board[Y-2] == {turn[1],~turn[0]}) &&
        i_board[Y+3] == l))
// l...Ax ,270
    if( (Y < 11 && Y > 0) && 
        (i_board[Y+3] == turn &&  i_board[Y+2] == turn  && i_board[Y+1] == turn)  &&
        (i_board[Y-1] == {turn[1],~turn[0]}) &&
        (i_board[(Y+4)] == l))

// lA ...x ,315
    if((X < 11 && Y < 11 && X > 3 && Y > 3) && 
        (i_board[(X+1)*15+(Y-1)] == turn &&  i_board[(X+2)*15+(Y+2)] == turn  && i_board[(X+3)*15+(Y-3)] == turn)  &&
        (i_board[(X+4)*15+(Y-4)] == {turn[1],~turn[0]}) &&
        (i_board[(X-1)*15+(Y+1)] == l))
// l.A..x ,315













    if((X < 12 && Y < 12 && X > 2 && Y > 2) && 
        (i_board[(X+1)*15+(Y-1)] == turn &&  i_board[(X+2)*15+(Y-2)] == turn  && i_board[(X-1)*15+(Y+1)] == turn)  &&
        (i_board[(X+3)*15+(Y-3)] == {turn[1],~turn[0]}) &&
        (i_board[(X-2)*15+(Y+2)] == l))
// l..A.x ,315
    if((X < 13 && Y < 13 && X > 1 && Y > 1) && 
        (i_board[(X+1)*15+(Y-1)] == turn &&  i_board[(X-1)*15+(Y+1)] == turn  && i_board[(X-0)*15+(Y-2)] == turn)  &&
        (i_board[(X+2)*15+(Y-2)] == {turn[1],~turn[0]}) &&
        (i_board[(X-3)*15+(Y+3)] == l))
// l...Ax ,315
    if( (X < 14 && Y < 14 && X > 0 && Y > 0) && 
        (i_board[(X-3)*15+(Y+3)] == turn &&  i_board[(X-2)*15+(Y+2)] == turn  && i_board[(X-1)*15+(Y+1)] == turn)  &&
        (i_board[(X+1)*15+(Y-1)] == {turn[1],~turn[0]}) &&
        (i_board[(X-4)*15+(Y+4)] == l))

// Al... ,0
    if( (X < 14))
        

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