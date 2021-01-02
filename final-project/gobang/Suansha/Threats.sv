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
parameter x         = 2'd3;

parameter S_IDLE    = 2'd0;
parameter S_COUNT   = 2'd1;
parameter S_EVAL    = 2'd2;

logic [1:0] state_r, state_w;
logic finish_r, finish_w;
logic final_win_r, final_win_w;
logic blocked_four_threat_r, blocked_four_threat_w;
logic live_three_threat_r, live_three_threat_w;
logic [499:0] final_X_r, final_X_w;
logic [499:0] final_Y_r, final_Y_w;
logic [8:0] final_pointer_r, final_pointer_w;
logic [3:0] X_r, X_w;
logic [3:0] Y_r, Y_w;

logic [8:0] pointer_three_r, pointer_three_w;
logic [8:0] pointer_four_r, pointer_four_w;
logic [8:0] pointer_normal_r, pointer_normal_w;
logic [499:0] defense_four_X_r, defense_four_X_w, defense_four_Y_r, defense_four_Y_w;
logic [499:0] defense_three_X_r, defense_three_X_w, defense_three_Y_r, defense_three_Y_w;
logic [499:0] normal_X_r, normal_X_w, normal_Y_r, normal_Y_w;


// wires
logic offense_livethree_w;
logic offense_livefour_w;
logic offense_blockedfour_w;
logic defense_blockedfour_w;
logic defense_livethree_w;
logic win_w;

logic [4:0] X_extended;
logic [4:0] Y_extended;

assign o_posX   = final_X_r;
assign o_posY   = final_Y_r;
assign o_size   = final_pointer_r;
assign o_finish = finish_r;
assign o_win    = final_win_r;

task Offense_live_three(
    input   [4:0] X,
    input   [4:0] Y,
    input   [1:0] turn,
    output  check 
);
    
// live threes
    // middle blank
    check = 0;
    if(i_board[X * 25 + Y] == l) begin
        // . . .
        if({i_board[(X + 2) * 25 + Y], i_board[(X + 1) * 25 + Y], i_board[(X - 1) * 25 + Y], i_board[(X - 2) * 25 + Y]} == {l, turn, turn, l}) 
            check = 1;
        if({i_board[X * 25 + (Y + 2)], i_board[X * 25 + (Y + 1)], i_board[X * 25 + (Y - 1)], i_board[X * 25 + (Y - 2)]} == {l, turn, turn, l})
            check = 1; 
        if({i_board[(X - 2) * 25 + (Y + 2)], i_board[(X - 1) * 25 + (Y + 1)], i_board[(X + 1) * 25 + (Y - 1)], i_board[(X + 2) * 25 + (Y - 2)]} == {l, turn, turn, l})
            check = 1;
        if({i_board[(X + 3) * 25 + (Y + 3)], i_board[(X + 1) * 25 + (Y + 1)], i_board[(X + 2) * 25 + (Y + 2)], i_board[(X - 1) * 25 + (Y - 1)]} == {l, turn, turn, l})
            check = 1;
        if({i_board[(X - 3) * 25 + (Y - 3)], i_board[(X - 2) * 25 + (Y - 2)], i_board[(X - 1) * 25 + (Y - 1)], i_board[(X + 1) * 25 + (Y + 1)]} == {l, turn, turn, l})
            check = 1;
        if({i_board[(X + 1) * 25 + (Y - 1)], i_board[(X + 2) * 25 + (Y - 2)], i_board[(X + 3) * 25 + (Y - 3)], i_board[(X - 1) * 25 + (Y + 1)]} == {turn, turn, l, l})
            check = 1;
        if({i_board[(X - 3) * 25 + (Y + 3)], i_board[(X - 1) * 25 + (Y + 1)], i_board[(X - 2) * 25 + (Y + 2)], i_board[(X + 1) * 25 + (Y - 1)]} == {l, turn, turn, l})
            check = 1;
        if({i_board[(X - 1) * 25 + Y], i_board[(X + 1) * 25 + Y], i_board[(X + 2) * 25 + Y], i_board[(X + 3) * 25 + Y]} == {l, turn ,turn, l})
            check = 1;
        if({i_board[(X + 1) * 25 + Y], i_board[(X - 1) * 25 + Y], i_board[(X - 2) * 25 + Y], i_board[(X - 3) * 25 + Y]} == {l, turn, turn, l})
            check = 1;
        if({i_board[X * 25 + (Y - 1)], i_board[X * 25 + (Y + 1)], i_board[X * 25 + (Y + 2)], i_board[X * 25 + (Y + 3)]} == {l, turn, turn, l})
            check = 1;
        if({i_board[X * 25 + (Y + 1)], i_board[X * 25 + (Y - 1)], i_board[X * 25 + (Y - 2)], i_board[X * 25 + (Y - 3)]} == {l, turn, turn, l})
            check = 1;

        // . . X .
        if({i_board[(X - 1) * 25 + (Y - 1)], i_board[(X + 1) * 25 + (Y + 1)], i_board[(X + 2) * 25 + (Y + 2)], i_board[(X + 3) * 25 + (Y + 3)], i_board[(X + 4) * 25 + (Y + 4)]} == {l, turn, l, turn, l})
            check = 1;
        if({i_board[(X - 1) * 25 + (Y - 1)], i_board[(X + 1) * 25 + (Y + 1)], i_board[(X + 2) * 25 + (Y + 2)], i_board[(X + 3) * 25 + (Y + 3)], i_board[(X + 4) * 25 + (Y + 4)]} == {l, l, turn, turn, l})
            check = 1;
        if({i_board[X * 25 + (Y - 1)], i_board[X * 25 + (Y + 1)], i_board[X * 25 + (Y + 2)], i_board[X * 25 + (Y + 3)], i_board[X * 25 + (Y + 4)]} == {l, turn, l, turn, l})
            check = 1;
        if({i_board[X * 25 + (Y - 1)],i_board[X * 25 + (Y + 1)], i_board[X * 25 + (Y + 2)], i_board[X * 25 + (Y + 3)], i_board[X * 25 + (Y + 4)]} == {l, l, turn, turn, l})
            check = 1;
        if({i_board[(X + 1) * 25 + (Y - 1)], i_board[(X - 1) * 25 + (Y + 1)], i_board[(X - 2) * 25 + (Y + 2)], i_board[(X - 3) * 25 + (Y + 3)], i_board[(X - 4) * 25 + (Y + 4)]} == {l, turn, l, turn, l})
            check = 1;
        if({i_board[(X + 1) * 25 + (Y - 1)], i_board[(X - 1) * 25 + (Y + 1)], i_board[(X - 2) * 25 + (Y + 2)], i_board[(X - 3) * 25 + (Y + 3)], i_board[(X - 4) * 25 + (Y + 4)]} == {l, l, turn, turn, l})
            check = 1;
        if({i_board[(X + 1) * 25 + Y], i_board[(X - 1) * 25 + Y], i_board[(X - 2) * 25 + Y], i_board[(X - 3) * 25 + Y], i_board[(X - 4) * 25 + Y]} == {l, turn, l, turn, l})
            check = 1;
        if({i_board[(X + 1) * 25 + Y], i_board[(X - 1) * 25 + Y], i_board[(X - 2) * 25 + Y], i_board[(X - 3) * 25 + Y], i_board[(X - 4) * 25 + Y]} == {l, l, turn, turn, l})
            check = 1;
        if({i_board[(X + 1) * 25 + (Y + 1)], i_board[(X - 1) * 25 + (Y - 1)], i_board[(X - 2) * 25 + (Y - 2)], i_board[(X - 3) * 25 + (Y - 3)], i_board[(X - 4) * 25 + (Y - 4)]} == {l, turn, l, turn, l})
            check = 1;
        if({i_board[(X + 1) * 25 + (Y + 1)], i_board[(X - 1) * 25 + (Y - 1)], i_board[(X - 2) * 25 + (Y - 2)], i_board[(X - 3) * 25 + (Y - 3)], i_board[(X - 4) * 25 + (Y - 4)]} == {l, l, turn, turn, l})
            check = 1;
        if({i_board[X * 25 + (Y + 1)], i_board[X * 25 + (Y - 1)], i_board[X * 25 + (Y - 2)], i_board[X * 25 + (Y - 3)], i_board[X * 25 + (Y -4)]} == {l, turn, l, turn, l})
            check = 1;
        if({i_board[X * 25 + (Y + 1)], i_board[X * 25 + (Y - 1)], i_board[X * 25 + (Y - 2)], i_board[X * 25 + (Y - 3)], i_board[X * 25 + (Y -4)]} == {l, l, turn, turn, l})
            check = 1;
        if({i_board[(X - 1) * 25 + (Y + 1)], i_board[(X + 1) * 25 + (Y - 1)], i_board[(X + 2) * 25 + (Y - 2)], i_board[(X + 3) * 25 + (Y - 3)], i_board[(X + 4) * 25 + (Y - 4)]} == {l, turn, l, turn, l})
            check = 1;
        if({i_board[(X - 1) * 25 + (Y + 1)], i_board[(X + 1) * 25 + (Y - 1)], i_board[(X + 2) * 25 + (Y - 2)], i_board[(X + 3) * 25 + (Y - 3)], i_board[(X + 4) * 25 + (Y - 4)]} == {l, l, turn, turn, l})
            check = 1;
        if({i_board[(X - 1) * 25 + Y], i_board[(X + 1) * 25 + Y], i_board[(X + 2) * 25 + Y], i_board[(X + 3) * 25 + Y], i_board[(X + 4) * 25 + Y]} == {l, turn, l, turn, l})
            check = 1;
        if({i_board[(X - 1) * 25 + Y], i_board[(X + 1) * 25 + Y], i_board[(X + 2) * 25 + Y], i_board[(X + 3) * 25 + Y], i_board[(X + 4) * 25 + Y]} == {l, l, turn, turn, l})
            check = 1;
        if({i_board[(X - 2) * 25 + (Y - 2)], i_board[(X - 1) * 25 + (Y - 1)], i_board[(X + 1) * 25 + (Y + 1)], i_board[(X + 2) * 25 + (Y + 2)], i_board[(X + 3) * 25 + (Y + 3)]} == {l, turn, l, turn, l})
            check = 1;
        if({i_board[X * 25 + (Y - 2)], i_board[X * 25 + (Y - 1)], i_board[X * 25 + (Y + 1)], i_board[X * 25 + (Y + 2)], i_board[X * 25 + (Y + 3)]} == {l, turn, l, turn, l})
            check = 1;
        if({i_board[(X + 2) * 25 + (Y - 2)], i_board[(X + 1) * 25 + (Y - 1)], i_board[(X - 1) * 25 + (Y + 1)], i_board[(X - 2) * 25 + (Y + 2)], i_board[(X - 3) * 25 + (Y + 3)]} == {l, turn, l, turn, l})
            check = 1;
        if({i_board[(X + 2) * 25 + Y], i_board[(X + 1) * 25 + Y], i_board[(X - 1) * 25 + Y], i_board[(X - 2) * 25 + Y], i_board[(X - 3) * 25 + Y]} == {l, turn, l, turn, l})
            check = 1;
        if({i_board[(X + 2) * 25 + (Y + 2)], i_board[(X + 1) * 25 + (Y + 1)], i_board[(X - 1) * 25 + (Y - 1)], i_board[(X - 2) * 25 + (Y - 2)], i_board[(X - 3) * 25 + (Y - 3)]} == {l, turn, l, turn, l})
            check = 1;
        if({i_board[X * 25 + (Y + 2)], i_board[X * 25 + (Y + 1)], i_board[X * 25 + (Y - 1)], i_board[X * 25 + (Y - 2)], i_board[X * 25 + (Y - 3)]} == {l, turn, l, turn, l})
            check = 1;
        if({i_board[(X - 2) * 25 + (Y + 2)], i_board[(X - 1) * 25 + (Y + 1)], i_board[(X + 1) * 25 + (Y - 1)], i_board[(X + 2) * 25 + (Y - 2)], i_board[(X + 3) * 25 + (Y - 3)]} == {l, turn, l, turn, l})
            check = 1;
        if({i_board[(X - 2) * 25 + Y], i_board[(X - 1) * 25 + Y], i_board[(X + 1) * 25 + Y], i_board[(X + 2) * 25 + Y], i_board[(X + 3) * 25 + Y]} == {l, turn, l, turn, l})
            check = 1;
    end
endtask


task Offense_blocked_four(
    input   [4:0] X,
    input   [4:0] Y,
    input   [1:0] turn,
    output  check 
);
// blocked fours
    // lA...x ,0
    if(i_board[X * 25 + Y] == l) begin
        // first condition
    if( {i_board[(X+1)*25+Y],i_board[(X+2)*25+Y],i_board[(X+3)*25+Y],i_board[(X+4)*25+Y],i_board[(X-1)*25+Y] } == {turn,turn,turn,{turn[1],~turn[0]},l} ||
        {i_board[(X+1)*25+Y],i_board[(X+2)*25+Y],i_board[(X-1)*25+Y],i_board[(X+3)*25+Y],i_board[(X-2)*25+Y] } == {turn,turn,turn,{turn[1],~turn[0]},l} ||
        {i_board[(X+1)*25+Y],i_board[(X-1)*25+Y],i_board[(X-2)*25+Y],i_board[(X+2)*25+Y],i_board[(X-3)*25+Y] } == {turn,turn,turn,{turn[1],~turn[0]},l} ||
        {i_board[(X-1)*25+Y],i_board[(X-2)*25+Y],i_board[(X-3)*25+Y],i_board[(X+1)*25+Y],i_board[(X-4)*25+Y] } == {turn,turn,turn,{turn[1],~turn[0]},l} ||
        
        {i_board[(X+1)*25+(Y+1)],i_board[(X+2)*25+(Y+2)],i_board[(X+3)*25+(Y+3)],i_board[(X+4)*25+(Y+4)],i_board[(X-1)*25+(Y-1)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||
        {i_board[(X+1)*25+(Y+1)],i_board[(X+2)*25+(Y+2)],i_board[(X-1)*25+(Y-1)],i_board[(X+3)*25+(Y+3)],i_board[(X-2)*25+(Y-2)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||
        {i_board[(X+1)*25+(Y+1)],i_board[(X-2)*25+(Y-2)],i_board[(X-1)*25+(Y-1)],i_board[(X+2)*25+(Y+2)],i_board[(X-3)*25+(Y-3)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||
        {i_board[(X-3)*25+(Y-3)],i_board[(X-2)*25+(Y-2)],i_board[(X-1)*25+(Y-1)],i_board[(X+1)*25+(Y+1)],i_board[(X-4)*25+(Y-4)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||
        
        {i_board[(X)*25+(Y+1)],i_board[(X)*25+(Y+2)],i_board[(X)*25+(Y+3)],i_board[(X)*15+(Y+4)],i_board[X*25+(Y-1)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||
        {i_board[(X)*25+(Y+1)],i_board[(X)*25+(Y+2)],i_board[(X)*25+(Y-1)],i_board[(X)*15+(Y+3)],i_board[X*25+(Y-2)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||
        {i_board[(X)*25+(Y+1)],i_board[(X)*25+(Y-2)],i_board[(X)*25+(Y-1)],i_board[(X)*15+(Y+2)],i_board[X*25+(Y-3)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||
        {i_board[(X)*25+(Y-3)],i_board[(X)*25+(Y-2)],i_board[(X)*25+(Y-1)],i_board[(X)*15+(Y+1)],i_board[X*25+(Y-4)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||

        {i_board[(X-1)*25+(Y+1)],i_board[(X-2)*25+(Y+2)],i_board[(X-3)*25+(Y+3)],i_board[(X-4)*25+(Y+4)],i_board[(X-4)*25+(Y+4)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||
        {i_board[(X-1)*25+(Y+1)],i_board[(X-2)*25+(Y+2)],i_board[(X+1)*25+(Y-1)],i_board[(X-3)*25+(Y+3)],i_board[(X-3)*25+(Y+3)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||
        {i_board[(X-1)*25+(Y+1)],i_board[(X+1)*25+(Y-1)],i_board[(X+2)*25+(Y+2)],i_board[(X-2)*25+(Y+2)],i_board[(X-2)*25+(Y+2)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||
        {i_board[(X+1)*25+(Y-1)],i_board[(X+2)*25+(Y-2)],i_board[(X+3)*25+(Y+3)],i_board[(X-1)*25+(Y+1)],i_board[(X-1)*25+(Y+1)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||
        
        {i_board[(X-1)*25+(Y)],i_board[(X-2)*25+(Y)],i_board[(X-3)*25+(Y)],i_board[(X-4)*25+(Y)],i_board[(X-4)*25+(Y)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||
        {i_board[(X-1)*25+(Y)],i_board[(X-2)*25+(Y)],i_board[(X+1)*25+(Y)],i_board[(X-3)*25+(Y)],i_board[(X-3)*25+(Y)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||
        {i_board[(X-1)*25+(Y)],i_board[(X+1)*25+(Y)],i_board[(X+2)*25+(Y)],i_board[(X-2)*25+(Y)],i_board[(X-2)*25+(Y)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||
        {i_board[(X+1)*25+(Y)],i_board[(X+2)*25+(Y)],i_board[(X+3)*25+(Y)],i_board[(X-1)*25+(Y)],i_board[(X-1)*25+(Y)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||
        
        {i_board[(X-1)*25+(Y-1)],i_board[(X-2)*25+(Y-1)],i_board[(X-3)*25+(Y-3)],i_board[(X-4)*25+(Y+4)],i_board[(X-4)*25+(Y-4)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||
        {i_board[(X-1)*25+(Y-1)],i_board[(X-2)*25+(Y-1)],i_board[(X+1)*25+(Y+1)],i_board[(X-3)*25+(Y+3)],i_board[(X-3)*25+(Y-3)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||
        {i_board[(X-1)*25+(Y-1)],i_board[(X+1)*25+(Y-1)],i_board[(X+2)*25+(Y+2)],i_board[(X-2)*25+(Y+2)],i_board[(X-2)*25+(Y-2)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||
        {i_board[(X+1)*25+(Y+1)],i_board[(X+2)*25+(Y+1)],i_board[(X+3)*25+(Y+3)],i_board[(X-1)*25+(Y+1)],i_board[(X-1)*25+(Y-1)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||

        {i_board[(X)*25+(Y-1)],i_board[(X)*25+(Y-2)],i_board[(X)*25+(Y-3)],i_board[(X)*15+(Y-4)],i_board[X*25+(Y+1)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||
        {i_board[(X)*25+(Y-1)],i_board[(X)*25+(Y-2)],i_board[(X)*25+(Y+1)],i_board[(X)*15+(Y-3)],i_board[X*25+(Y+2)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||
        {i_board[(X)*25+(Y-1)],i_board[(X)*25+(Y+2)],i_board[(X)*25+(Y+1)],i_board[(X)*15+(Y-2)],i_board[X*25+(Y+3)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||
        {i_board[(X)*25+(Y+3)],i_board[(X)*25+(Y+2)],i_board[(X)*25+(Y+1)],i_board[(X)*15+(Y-1)],i_board[X*25+(Y+4)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||

        {i_board[(X+1)*25+(Y-1)],i_board[(X+2)*25+(Y-2)],i_board[(X+3)*25+(Y-3)],i_board[(X+4)*25+(Y-4)],i_board[(X-1)*25+(Y+1)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||
        {i_board[(X+1)*25+(Y-1)],i_board[(X+2)*25+(Y-2)],i_board[(X-1)*25+(Y+1)],i_board[(X+3)*25+(Y-3)],i_board[(X-2)*25+(Y+2)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||
        {i_board[(X+1)*25+(Y-1)],i_board[(X-2)*25+(Y+2)],i_board[(X-1)*25+(Y+1)],i_board[(X+2)*25+(Y-2)],i_board[(X-3)*25+(Y+3)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||
        {i_board[(X-3)*25+(Y+3)],i_board[(X-2)*25+(Y+2)],i_board[(X-1)*25+(Y+1)],i_board[(X+1)*25+(Y-1)],i_board[(X-4)*25+(Y+4)]} == {turn,turn,turn,{turn[1],~turn[0]},l}||
            
            // second condition
        {i_board[(X+2)*25+Y],i_board[(X+3)*25+Y],i_board[(X+4)*25+Y],i_board[(X+1)*25+Y]} == {turn,turn,turn,l} || 
        {i_board[(X-2)*25+Y],i_board[(X+1)*25+Y],i_board[(X+2)*25+Y],i_board[(X-2)*25+Y]} == {turn,turn,turn,l} || 
        {i_board[(X-3)*25+Y],i_board[(X-1)*25+Y],i_board[(X+1)*25+Y],i_board[(X-2)*25+Y]} == {turn,turn,turn,l} || 
        {i_board[(X-4)*25+Y],i_board[(X-2)*25+Y],i_board[(X-1)*25+Y],i_board[(X-3)*25+Y]} == {turn,turn,turn,l} || 

        {i_board[(X+2)*25+(Y+2)],i_board[(X+3)*25+(Y+3)],i_board[(X+4)*25+(Y+4)],i_board[(X+1)*25+(Y+1)]} == {turn,turn,turn,l} || 
        {i_board[(X-2)*25+(Y-2)],i_board[(X+1)*25+(Y+1)],i_board[(X+2)*25+(Y+2)],i_board[(X-1)*25+(Y-1)]} == {turn,turn,turn,l} || 
        {i_board[(X-3)*25+(Y-3)],i_board[(X-1)*25+(Y-1)],i_board[(X+1)*25+(Y+1)],i_board[(X-2)*25+(Y-2)]} == {turn,turn,turn,l} || 
        {i_board[(X-4)*25+(Y-4)],i_board[(X-2)*25+(Y-2)],i_board[(X-1)*25+(Y-1)],i_board[(X-3)*25+(Y-3)]} == {turn,turn,turn,l} || 
        
        {i_board[(X)*25+(Y+2)],i_board[(X)*25+(Y+3)],i_board[(X)*25+(Y+4)],i_board[(X)*25+(Y+1)]} == {turn,turn,turn,l} || 
        {i_board[(X)*25+(Y-2)],i_board[(X)*25+(Y+1)],i_board[(X)*25+(Y+2)],i_board[(X)*25+(Y-1)]} == {turn,turn,turn,l} || 
        {i_board[(X)*25+(Y-3)],i_board[(X)*25+(Y-1)],i_board[(X)*25+(Y+1)],i_board[(X)*25+(Y-2)]} == {turn,turn,turn,l} || 
        {i_board[(X)*25+(Y-4)],i_board[(X)*25+(Y-2)],i_board[(X)*25+(Y-1)],i_board[(X)*25+(Y-3)]} == {turn,turn,turn,l} || 
        
        {i_board[(X-2)*25+(Y+2)],i_board[(X-3)*25+(Y+3)],i_board[(X-4)*25+(Y+4)],i_board[(X-1)*25+(Y+1)]} == {turn,turn,turn,l}|| 
        {i_board[(X-2)*25+(Y+2)],i_board[(X-1)*25+(Y+1)],i_board[(X+2)*25+(Y-2)],i_board[(X+1)*25+(Y-1)]} == {turn,turn,turn,l}|| 
        {i_board[(X-1)*25+(Y+1)],i_board[(X+1)*25+(Y-1)],i_board[(X+3)*25+(Y-3)],i_board[(X-2)*25+(Y-2)]} == {turn,turn,turn,l}|| 
        {i_board[(X+1)*25+(Y-1)],i_board[(X+2)*25+(Y-2)],i_board[(X+4)*25+(Y-4)],i_board[(X+3)*25+(Y-3)]} == {turn,turn,turn,l}|| 

        {i_board[(X+3)*25+Y],i_board[(X-1)*25+Y],i_board[(X+1)*25+Y],i_board[(X+2)*25+Y]} == {turn,turn,turn,l}|| 
        {i_board[(X-2)*25+Y],i_board[(X-3)*25+Y],i_board[(X-4)*25+Y],i_board[(X-1)*25+Y]} == {turn,turn,turn,l}|| 
        {i_board[(X-2)*25+Y],i_board[(X-1)*25+Y],i_board[(X+2)*25+Y],i_board[(X-1)*25+Y]} == {turn,turn,turn,l}||     
        {i_board[(X+4)*25+Y],i_board[(X+2)*25+Y],i_board[(X+1)*25+Y],i_board[(X+3)*25+Y]} == {turn,turn,turn,l}|| 
        
        {i_board[(X-2)*25+(Y-2)],i_board[(X-3)*25+(Y-3)],i_board[(X-4)*25+(Y-4)],i_board[(X-1)*25+(Y-1)]} == {turn,turn,turn,l}|| 
        {i_board[(X-2)*25+(Y-2)],i_board[(X-1)*25+(Y-1)],i_board[(X+2)*25+(Y+2)],i_board[(X+1)*25+(Y+1)]} == {turn,turn,turn,l}|| 
        {i_board[(X+3)*25+(Y+3)],i_board[(X+1)*25+(Y+1)],i_board[(X-1)*25+(Y-1)],i_board[(X+2)*25+(Y+2)]} == {turn,turn,turn,l}|| 
        {i_board[(X+4)*25+(Y+4)],i_board[(X+2)*25+(Y+2)],i_board[(X+1)*25+(Y+1)],i_board[(X+3)*25+(Y+3)]} == {turn,turn,turn,l}|| 
        
        {i_board[X*25+Y-2],i_board[X*25+Y-3],i_board[X*25+Y-4],i_board[X*25+Y-1]} == {turn,turn,turn,l} || 
        {i_board[X*25+Y+2],i_board[X*25+Y-1],i_board[X*25+Y-2],i_board[X*25+Y+1]} == {turn,turn,turn,l} || 
        {i_board[X*25+Y+3],i_board[X*25+Y+1],i_board[X*25+Y-1],i_board[X*25+Y+2]} == {turn,turn,turn,l} || 
        {i_board[X*25+Y+4],i_board[X*25+Y+2],i_board[X*25+Y+1],i_board[X*25+Y+3]} == {turn,turn,turn,l} || 
        
        {i_board[(X+2)*25+(Y-2)],i_board[(X-3)*25+(Y-3)],i_board[(X-4)*25+(Y-4)],i_board[(X+1)*25+(Y-1)]} == {turn,turn,turn,l} || 
        {i_board[(X-2)*25+(Y+2)],i_board[(X+1)*25+(Y-1)],i_board[(X+2)*25+(Y-2)],i_board[(X-1)*25+(Y-1)]} == {turn,turn,turn,l} || 
        {i_board[(X-3)*25+(Y+3)],i_board[(X-1)*25+(Y+1)],i_board[(X+1)*25+(Y-1)],i_board[(X-2)*25+(Y+2)]} == {turn,turn,turn,l} || 
        {i_board[(X-4)*25+(Y+4)],i_board[(X-2)*25+(Y+2)],i_board[(X-1)*25+(Y+1)],i_board[(X-3)*25+(Y+3)]} == {turn,turn,turn,l} || 
        
        //Third condition
        {i_board[(X+1)*25+Y],i_board[(X+3)*25+Y],i_board[(X+4)*25+Y],i_board[(X+2)*25+Y]} == {turn,turn,turn,l} || 
        {i_board[(X-1)*25+Y],i_board[(X+2)*25+Y],i_board[(X+3)*25+Y],i_board[(X+1)*25+Y]} == {turn,turn,turn,l} || 
        {i_board[(X-3)*25+Y],i_board[(X-2)*25+Y],i_board[(X+1)*25+Y],i_board[(X-1)*25+Y]} == {turn,turn,turn,l} || 
        {i_board[(X-4)*25+Y],i_board[(X-3)*25+Y],i_board[(X-1)*25+Y],i_board[(X-2)*25+Y]} == {turn,turn,turn,l} || 
        
        {i_board[(X+1)*25+Y+1],i_board[(X+3)*25+Y+3],i_board[(X+4)*25+Y+4],i_board[(X+2)*25+Y+2]} == {turn,turn,turn,l} || 
        {i_board[(X-1)*25+Y-1],i_board[(X+2)*25+Y+2],i_board[(X+3)*25+Y+3],i_board[(X+1)*25+Y+1]} == {turn,turn,turn,l} || 
        {i_board[(X-3)*25+Y-3],i_board[(X-2)*25+Y-2],i_board[(X+1)*25+Y+1],i_board[(X-1)*25+Y-1]} == {turn,turn,turn,l} || 
        {i_board[(X-4)*25+Y-4],i_board[(X-3)*25+Y-3],i_board[(X-1)*25+Y-1],i_board[(X-2)*25+Y-2]} == {turn,turn,turn,l} || 
        
        {i_board[X*25+Y+1],i_board[X*25+Y+3],i_board[X*25+Y+4],i_board[X*25+Y+2]} == {turn,turn,turn,l} || 
        {i_board[X*25+Y-2],i_board[X*25+Y+1],i_board[X*25+Y+2],i_board[X*25+Y-1]} == {turn,turn,turn,l} || 
        {i_board[X*25+Y-3],i_board[X*25+Y-2],i_board[X*25+Y+1],i_board[X*25+Y-1]} == {turn,turn,turn,l} || 
        {i_board[X*25+Y-4],i_board[X*25+Y-3],i_board[X*25+Y-1],i_board[X*25+Y-2]} == {turn,turn,turn,l} || 

        {i_board[(X+1)*25+Y-1],i_board[(X+3)*25+Y-3],i_board[(X+4)*25+Y-4],i_board[(X+2)*25+Y-2]} == {turn,turn,turn,l} || 
        {i_board[(X-1)*25+Y+1],i_board[(X+2)*25+Y-2],i_board[(X+3)*25+Y-3],i_board[(X+1)*25+Y-1]} == {turn,turn,turn,l} || 
        {i_board[(X-3)*25+Y+3],i_board[(X-2)*25+Y+2],i_board[(X+1)*25+Y+1],i_board[(X-1)*25+Y+1]} == {turn,turn,turn,l} || 
        {i_board[(X-4)*25+Y+4],i_board[(X-3)*25+Y+3],i_board[(X-1)*25+Y+1],i_board[(X-2)*25+Y+2]} == {turn,turn,turn,l}  ) 
        begin
            check = 1;     
        end
        else begin
            check = 0;
        end
    end
endtask

task Offense_live_four(
    input   [4:0] X,
    input   [4:0] Y,
    input   [1:0] turn,
    output  check 
);
// live four first condition 
    // lA...l ,0
    if(i_board[X * 25 + Y] == l) begin
        if( 
        {i_board[(X+1)*25+Y],i_board[(X+2)*25+Y],i_board[(X+3)*25+Y],i_board[(X+4)*25+Y],i_board[(X-1)*25+Y]} == {turn,turn,turn,l,l} || 
        {i_board[(X+1)*25+Y+1],i_board[(X+2)*25+Y+2],i_board[(X+3)*25+Y+3],i_board[(X+4)*25+Y+4],i_board[(X-1)*25+Y-1]} == {turn,turn,turn,l,l} || 
        {i_board[X*25+Y+1],i_board[X*25+Y+2],i_board[X*25+Y+3],i_board[X*25+Y+4],i_board[X*25+Y-1]} == {turn,turn,turn,l,l} ||
        {i_board[(X-1)*25+Y+1],i_board[(X-2)*25+Y+2],i_board[(X-3)*25+Y+3],i_board[(X-4)*25+Y+4],i_board[(X+1)*25+Y-1]}== {turn,turn,turn,l,l} || 
        {i_board[(X-1)*25+Y],i_board[(X-2)*25+Y],i_board[(X-3)*25+Y],i_board[(X-4)*25+Y],i_board[(X+1)*25+Y]}== {turn,turn,turn,l,l}|| 
        {i_board[(X-1)*25+Y-1],i_board[(X-2)*25+Y-2],i_board[(X-3)*25+Y-3],i_board[(X-4)*25+Y-4],i_board[(X+1)*25+Y+1]}== {turn,turn,turn,l,l} || 
        {i_board[X*25+Y-1],i_board[X*25+Y-2],i_board[X*25+Y-3],i_board[X*25+Y-4],i_board[X*25+Y+1]}== {turn,turn,turn,l,l}|| 
        {i_board[(X+1)*25+Y-1],i_board[(X+2)*25+Y-2],i_board[(X+3)*25+Y-3],i_board[(X+4)*25+Y-4],i_board[(X-1)*25+Y+1]}== {turn,turn,turn,l,l} || 
        {i_board[(X-1)*25+Y],i_board[(X+1)*25+Y],i_board[(X+2)*25+Y],i_board[(X+3)*25+Y],i_board[(X-2)*25+Y]} == {turn,turn,turn,l,l} || 
        {i_board[(X+1)*25+Y+1],i_board[(X+2)*25+Y+2],i_board[(X-1)*25+Y-1],i_board[(X+3)*25+Y+3],i_board[(X-2)*25+Y-2]}== {turn,turn,turn,l,l}|| 
        {i_board[X*25+Y-1],i_board[X*25+Y+1],i_board[X*25+Y+2],i_board[X*25+Y+3],i_board[X*25+Y-2]}== {turn,turn,turn,l,l} || 
        {i_board[(X-1)*25+Y+1],i_board[(X-2)*25+Y+2],i_board[(X+1)*25+Y-1],i_board[(X-3)*25+Y+3],i_board[(X+2)*25+Y-2]}== {turn,turn,turn,l,l} || 
        {i_board[(X+1)*25+Y],i_board[(X-1)*25+Y],i_board[(X-2)*25+Y],i_board[(X-3)*25+Y],i_board[(X+2)*25+Y]} == {turn,turn,turn,l,l}|| 
        {i_board[(X-1)*25+Y-1],i_board[(X+1)*25+Y+1],i_board[(X+2)*25+Y+2],i_board[(X-3)*25+Y-3],i_board[(X+2)*25+Y+2]}== {turn,turn,turn,l,l} || 
        {i_board[X*25+Y+1],i_board[X*25+Y-1],i_board[X*25+Y-2],i_board[X*25+Y-3],i_board[X*25+Y+2]} == {turn,turn,turn,l,l} || 
        {i_board[(X-1)*25+Y+1],i_board[(X+1)*25+Y-1],i_board[(X+2)*25+Y-2],i_board[(X+3)*25+Y-3],i_board[(X-2)*25+Y+2]} == {turn,turn,turn,l,l} ) begin
            check = 1;        
        end
        else begin
            check = 0;
        end
    end
    else begin
        check = 0;
    end
endtask

task Defense_three(
    input [4:0] X,
    input [4:0] Y,
    input [1:0] turn,
    output check
);
    // A o o o *  45
    if(i_board[X * 25 + Y] == l && (
        ({i_board[(X + 1) * 25 + (Y + 1)], i_board[(X + 2) * 25 + (Y + 2)], i_board[(X + 3) * 25 + (Y + 3)], i_board[(X + 4) * 25 + (Y + 4)]} == {{turn[1], ~turn[0]}, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l}) || 
        ({i_board[(X + 1) * 25 + (Y + 1)], i_board[(X + 2) * 25 + (Y + 2)], i_board[(X + 3) * 25 + (Y + 3)], i_board[(X + 4) * 25 + (Y + 4)], i_board[(X + 5) * 25 + (Y + 5)]} == {{turn[1], ~turn[0]}, l, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l}) || 
        ({i_board[(X + 1) * 25 + (Y + 1)], i_board[(X + 2) * 25 + (Y + 2)], i_board[(X + 3) * 25 + (Y + 3)], i_board[(X + 4) * 25 + (Y + 4)], i_board[(X + 5) * 25 + (Y + 5)]} == {{turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l, {turn[1], ~turn[0]}, l}) || 
        ({i_board[(X - 2) * 25 + (Y - 2)], i_board[(X - 1) * 25 + (Y - 1)], i_board[(X + 1) * 25 + (Y + 1)], i_board[(X + 2) * 25 + (Y + 2)], i_board[(X + 3) * 25 + (Y + 3)]} == {l, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l}) || 
        ({i_board[X * 25 + (Y + 1)], i_board[X * 25 + (Y + 2)], i_board[X * 25 + (Y + 3)], i_board[X * 25 + (Y + 4)]} == {{turn[1], ~turn[0]}, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l}) || 
        ({i_board[X * 25 + (Y + 1)], i_board[X * 25 + (Y + 2)], i_board[X * 25 + (Y + 3)], i_board[X * 25 + (Y + 4)], i_board[X * 25 + (Y + 5)]} == {{turn[1], ~turn[0]}, l, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l}) || 
        ({i_board[X * 25 + (Y + 1)], i_board[X * 25 + (Y + 2)], i_board[X * 25 + (Y + 3)], i_board[X * 25 + (Y + 4)], i_board[X * 25 + (Y + 5)]} == {{turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l, {turn[1], ~turn[0]}}) || 
        ({i_board[X * 25 + (Y - 2)], i_board[X * 25 + (Y - 1)], i_board[X * 25 + (Y + 1)], i_board[X * 25 + (Y + 2)], i_board[X * 25 + (Y + 3)]} == {l, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l}) || 
        ({i_board[(X - 1) * 25 + (Y + 1)], i_board[(X - 2) * 25 + (Y + 2)], i_board[(X - 3) * 25 + (Y + 3)], i_board[(X - 4) * 25 + (Y + 4)]} == {{turn[1], ~turn[0]}, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l}) || 
        ({i_board[(X - 1) * 25 + (Y + 1)], i_board[(X - 2) * 25 + (Y + 2)], i_board[(X - 3) * 25 + (Y + 3)], i_board[(X - 4) * 25 + (Y + 4)], i_board[(X - 5) * 25 + (Y + 5)]} == {{turn[1], ~turn[0]}, l, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l}) || 
        ({i_board[(X - 1) * 25 + (Y + 1)], i_board[(X - 2) * 25 + (Y + 2)], i_board[(X - 3) * 25 + (Y + 3)], i_board[(X - 4) * 25 + (Y + 4)], i_board[(X - 5) * 25 + (Y + 5)]} == {{turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l, {turn[1], ~turn[0]}, l}) || 
        ({i_board[(X + 2) * 25 + (Y - 2)], i_board[(X + 1) * 25 + (Y - 1)], i_board[(X - 1) * 25 + (Y + 1)], i_board[(X - 2) * 25 + (Y + 2)], i_board[(X - 3) * 25 + (Y + 3)]} == {l, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l}) || 
        ({i_board[(X - 1) * 25 + Y], i_board[(X - 2) * 25 + Y], i_board[(X - 3) * 25 + Y], i_board[(X - 4) * 25 + Y]} == {{turn[1], ~turn[0]}, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l}) || 
        ({i_board[(X - 1) * 25 + Y], i_board[(X - 2) * 25 + Y], i_board[(X - 3) * 25 + Y], i_board[(X - 4) * 25 + Y], i_board[(X - 5) * 25 + Y]} == {{turn[1], ~turn[0]}, l, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l}) || 
        ({i_board[(X - 1) * 25 + Y], i_board[(X - 2) * 25 + Y], i_board[(X - 3) * 25 + Y], i_board[(X - 4) * 25 + Y], i_board[(X - 5) * 25 + Y]} == {{turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l ,{turn[1], ~turn[0]}, l}) || 
        ({i_board[(X + 2) * 25 + Y], i_board[(X + 1) * 25 + Y], i_board[(X - 1) * 25 + Y], i_board[(X - 2) * 25 + Y], i_board[(X - 3) * 25 + Y]} == {l, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l}) || 
        ({i_board[(X - 1) * 25 + (Y - 1)], i_board[(X - 2) * 25 + (Y - 2)], i_board[(X - 3) * 25 + (Y - 3)], i_board[(X - 4) * 25 + (Y - 4)]} == {{turn[1], ~turn[0]}, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l}) || 
        ({i_board[(X - 1) * 25 + (Y - 1)], i_board[(X - 2) * 25 + (Y - 2)], i_board[(X - 3) * 25 + (Y - 3)], i_board[(X - 4) * 25 + (Y - 4)], i_board[(X - 5) * 25 + (Y - 5)]} == {{turn[1], ~turn[0]}, l, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l}) || 
        ({i_board[(X - 1) * 25 + (Y - 1)], i_board[(X - 2) * 25 + (Y - 2)], i_board[(X - 3) * 25 + (Y - 3)], i_board[(X - 4) * 25 + (Y - 4)], i_board[(X - 5) * 25 + (Y - 5)]} == {{turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l, {turn[1], ~turn[0]}, l}) || 
        ({i_board[(X + 2) * 25 + (Y + 2)], i_board[(X + 1) * 25 + (Y + 1)], i_board[(X - 1) * 25 + (Y - 1)], i_board[(X - 2) * 25 + (Y - 2)], i_board[(X - 3) * 25 + (Y - 3)]} == {l, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l}) || 
        ({i_board[X * 25 + (Y - 1)], i_board[X * 25 + (Y - 2)], i_board[X * 25 + (Y - 3)], i_board[X * 25 + (Y - 4)]} == {{turn[1], ~turn[0]}, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l}) || 
        ({i_board[X * 25 + (Y - 1)], i_board[X * 25 + (Y - 2)], i_board[X * 25 + (Y - 3)], i_board[X * 25 + (Y - 4)], i_board[X * 25 + (Y - 5)]} == {{turn[1], ~turn[0]}, l, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l}) || 
        ({i_board[X * 25 + (Y - 1)], i_board[X * 25 + (Y - 2)], i_board[X * 25 + (Y - 3)], i_board[X * 25 + (Y - 4)], i_board[X * 25 + (Y - 5)]} == {{turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l, {turn[1], ~turn[0]}, l}) || 
        ({i_board[X * 25 + (Y + 2)], i_board[X * 25 + (Y + 1)], i_board[X * 25 + (Y - 1)], i_board[X * 25 + (Y - 2)], i_board[X * 25 + (Y - 3)]} == {l, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l}) || 
        ({i_board[(X + 1) * 25 + (Y - 1)], i_board[(X + 2) * 25 + (Y - 2)], i_board[(X + 3) * 25 + (Y - 3)], i_board[(X + 4) * 25 + (Y - 4)]} == {{turn[1], ~turn[0]}, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l}) || 
        ({i_board[(X + 1) * 25 + (Y - 1)], i_board[(X + 2) * 25 + (Y - 2)], i_board[(X + 3) * 25 + (Y - 3)], i_board[(X + 4) * 25 + (Y - 4)], i_board[(X + 5) * 25 + (Y - 5)]} == {{turn[1], ~turn[0]}, l, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l}) || 
        ({i_board[(X + 1) * 25 + (Y - 1)], i_board[(X + 2) * 25 + (Y - 2)], i_board[(X + 3) * 25 + (Y - 3)], i_board[(X + 4) * 25 + (Y - 4)], i_board[(X + 5) * 25 + (Y - 5)]} == {{turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l, {turn[1], ~turn[0]}, l}) || 
        ({i_board[(X - 2) * 25 + (Y + 2)], i_board[(X - 1) * 25 + (Y + 1)], i_board[(X + 1) * 25 + (Y - 1)], i_board[(X + 2) * 25 + (Y - 2)], i_board[(X + 3) * 25 + (Y - 3)]} == {l, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l}) || 
        ({i_board[(X + 1) * 25 + Y], i_board[(X + 2) * 25 + Y], i_board[(X + 3) * 25 + Y], i_board[(X + 4) * 25 + Y]} == {{turn[1], ~turn[0]}, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l}) || 
        ({i_board[(X + 1) * 25 + Y], i_board[(X + 2) * 25 + Y], i_board[(X + 3) * 25 + Y], i_board[(X + 4) * 25 + Y], i_board[(X + 5) * 25 + Y]} == {{turn[1], ~turn[0]}, l, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l}) || 
        ({i_board[(X + 1) * 25 + Y], i_board[(X + 2) * 25 + Y], i_board[(X + 3) * 25 + Y], i_board[(X + 4) * 25 + Y], i_board[(X + 5) * 25 + Y]} == {{turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l, {turn[1], ~turn[0]}, l}) || 
        ({i_board[(X - 2) * 25 + Y], i_board[(X - 1) * 25 + Y], i_board[(X + 1) * 25 + Y], i_board[(X + 2) * 25 + Y], i_board[(X + 3) * 25 + Y]} == {l, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, {turn[1], ~turn[0]}, l}))) begin
        check = 1;            
    end
    else begin
        check = 0;
    end
endtask



task Defense_four(
    input [4:0] X,
    input [4:0] Y,
    input [1:0] turn,
    output check
);
    // A o o o o  45
    if(i_board[X * 25 + Y] == l)begin
        if(
        {i_board[(X+1)*25+(Y+1)],i_board[(X+2)*25+(Y+2)],i_board[(X+3)*25+(Y+3)],i_board[(X+4)*25+(Y+4)]}=={{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]}} || 
        {i_board[(X-1)*25+(Y-1)],i_board[(X+1)*25+(Y+1)],i_board[(X+2)*25+(Y+2)],i_board[(X+3)*25+(Y+3)]}=={{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]}} || 
        {i_board[(X-2)*25+(Y-2)],i_board[(X-1)*25+(Y-1)],i_board[(X+1)*25+(Y+1)],i_board[(X+2)*25+(Y+2)]}=={{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]}} || 

        {i_board[X*25+(Y+1)],i_board[X*25+(Y+2)],i_board[X*25+(Y+3)],i_board[X*25+(Y+4)]}  =={{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]}}|| 
        {i_board[X*25+(Y-1)],i_board[X*25+(Y+1)],i_board[X*25+(Y+2)],i_board[X*25+(Y+3)]}  =={{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]}}|| 
        {i_board[X*25+(Y-2)],i_board[X*25+(Y-1)],i_board[X*25+(Y+1)],i_board[X*25+(Y+2)]}  =={{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]}}|| 

        {i_board[(X-1)*25+(Y+1)],i_board[(X-2)*25+(Y+2)],i_board[(X-3)*25+(Y+3)],i_board[(X-4)*25+(Y+4)]}=={{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]}}|| 
        {i_board[(X-3)*25+(Y+3)],i_board[(X-2)*25+(Y+2)],i_board[(X-1)*25+(Y+1)],i_board[(X+1)*25+(Y-1)]}=={{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]}}|| 
        {i_board[(X-2)*25+(Y+2)],i_board[(X-1)*25+(Y+1)],i_board[(X+1)*25+(Y-1)],i_board[(X+2)*25+(Y-2)]}=={{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]}}|| 

        {i_board[(X-1)*25+Y],i_board[(X-2)*25+Y],i_board[(X-3)*5+Y],i_board[(X-4)*25+Y]}=={{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]}}|| 
        {i_board[(X+1)*25+Y],i_board[(X-1)*25+Y],i_board[(X-2)*5+Y],i_board[(X-3)*25+Y]}=={{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]}}|| 
        {i_board[(X-2)*25+Y],i_board[(X-1)*25+Y],i_board[(X+1)*5+Y],i_board[(X+2)*25+Y]}=={{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]}}||

        {i_board[(X-1)*25+(Y-1)],i_board[(X-2)*25+(Y-2)],i_board[(X-3)*25+(Y-3)],i_board[(X-4)*25+(Y-4)]}=={{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]}}|| 
        {i_board[(X+1)*25+(Y+1)],i_board[(X-1)*25+(Y-1)],i_board[(X-2)*25+(Y-2)],i_board[(X-3)*25+(Y-3)]}=={{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]}}|| 
        {i_board[(X-2)*25+(Y-2)],i_board[(X-1)*25+(Y-1)],i_board[(X+1)*25+(Y+1)],i_board[(X+2)*25+(Y+2)]}=={{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]}}|| 
        
        {i_board[X*25+(Y-1)],i_board[X*25+(Y-2)],i_board[X*25+(Y-3)],i_board[X*25+(Y-4)]} =={{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]}}|| 
        {i_board[X*25+(Y+1)],i_board[X*25+(Y-1)],i_board[X*25+(Y-2)],i_board[X*25+(Y-3)]} =={{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]}}|| 
        {i_board[X*25+(Y-2)],i_board[X*25+(Y-1)],i_board[X*25+(Y+1)],i_board[X*25+(Y+2)]} =={{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]}}|| 
    
        {i_board[(X+1)*25+(Y-1)],i_board[(X+2)*25+(Y-2)],i_board[(X+3)*25+(Y-3)],i_board[(X+4)*25+(Y-4)]} =={{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]}}|| 
        {i_board[(X-1)*25+(Y+1)],i_board[(X+1)*25+(Y-1)],i_board[(X+2)*25+(Y-2)],i_board[(X+3)*25+(Y-3)]} =={{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]}}|| 
        {i_board[(X-2)*25+(Y-2)],i_board[(X-1)*25+(Y-1)],i_board[(X+1)*25+(Y+1)],i_board[(X+2)*25+(Y+2)]} =={{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]}}|| 
        
        {i_board[(X+1)*25+Y],i_board[(X+2)*25+Y],i_board[(X+3)*25+Y],i_board[(X+4)*25+Y]} =={{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]}}|| 
        {i_board[(X-1)*25+Y],i_board[(X+1)*25+Y],i_board[(X+2)*25+Y],i_board[(X+3)*25+Y]} =={{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]}}|| 
        {i_board[(X-2)*25+Y],i_board[(X-1)*25+Y],i_board[(X+1)*25+Y],i_board[(X+2)*25+Y]} =={{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]},{turn[1], ~turn[0]}}) 
        begin
            check = 1;        
        end
        else begin
            check = 0;
        end
    end
    else begin
        check = 0;
    end
endtask

task Win(
    input [4:0] X,
    input [4:0] Y,
    input [1:0] turn,
    output check
);
    if(i_board[X * 25 + Y] == l && (
        ({i_board[(X + 1) * 25 + (Y + 1)], i_board[(X + 2) * 25 + (Y + 2)], i_board[(X + 3) * 25 + (Y + 3)], i_board[(X + 4) * 25 + (Y + 4)]} == {turn, turn, turn, turn}) ||
        ({i_board[X * 25 + (Y + 1)], i_board[X * 25 + (Y + 2)], i_board[X * 25 + (Y + 3)], i_board[X * 25 + (Y + 4)]} == {turn, turn, turn, turn}) ||
        ({i_board[(X - 1) * 25 + (Y + 1)], i_board[(X - 2) * 25 + (Y + 2)], i_board[(X - 3) * 25 + (Y + 3)], i_board[(X - 4) * 25 + (Y + 4)]} == {turn, turn, turn, turn}) ||
        ({i_board[(X - 1) * 25 + Y], i_board[(X - 2) * 25 + Y], i_board[(X - 3) * 25 + Y], i_board[(X - 4) * 25 + Y]} == {turn, turn, turn, turn}) ||
        ({i_board[(X - 1) * 25 + (Y - 1)], i_board[(X - 2) * 25 + (Y - 2)], i_board[(X - 3) * 25 + (Y - 3)], i_board[(X - 4) * 25 + (Y - 4)]} == {turn, turn, turn, turn}) || 
        ({i_board[X * 25 + (Y - 1)], i_board[X * 25 + (Y - 2)], i_board[X * 25 + (Y - 3)], i_board[X * 25 + (Y - 4)]} == {turn, turn, turn, turn}) ||
        ({i_board[(X + 1) * 25 + (Y - 1)], i_board[(X + 2) * 25 + (Y - 2)], i_board[(X + 3) * 25 + (Y - 3)], i_board[(X + 4) * 25 + (Y - 4)]} == {turn, turn, turn, turn}) ||
        ({i_board[(X + 1) * 25 + Y], i_board[(X + 2) * 25 + Y], i_board[(X + 3) * 25 + Y], i_board[(X + 4) * 25 + Y]} == {turn, turn, turn, turn}) ||
        
        ({i_board[(X - 1) * 25 + (Y - 1)], i_board[(X + 1) * 25 + (Y + 1)], i_board[(X + 2) * 25 + (Y + 2)], i_board[(X + 3) * 25 + (Y + 3)]} == {turn, turn, turn, turn}) || 
        ({i_board[X * 25 + (Y - 1)], i_board[X * 25 + (Y + 1)], i_board[X * 25 + (Y + 2)], i_board[X * 25 + (Y + 3)]} == {turn, turn, turn, turn}) ||
        ({i_board[(X + 1) * 25 + (Y - 1)], i_board[(X - 1) * 25 + (Y + 1)], i_board[(X - 2) * 25 + (Y + 2)], i_board[(X - 3) * 25 + (Y + 3)]} == {turn, turn, turn, turn}) ||
        ({i_board[(X - 3) * 25 + Y], i_board[(X - 2) * 25 + Y], i_board[(X - 1) * 25 + Y], i_board[(X + 1) * 25 + Y]} == {turn, turn, turn, turn}) || 
        ({i_board[(X - 3) * 25 + (Y - 3)], i_board[(X - 2) * 25 + (Y - 2)], i_board[(X - 1) * 25 + (Y - 1)], i_board[(X + 1) * 25 + (Y + 1)]} == {turn, turn, turn, turn}) ||
        ({i_board[X * 25 + (Y - 3)], i_board[X * 25 + (Y - 2)], i_board[X * 25 + (Y - 1)], i_board[X * 25 + (Y + 1)]} == {turn, turn, turn, turn}) ||
        ({i_board[(X - 1) * 25 + (Y + 1)], i_board[(X + 1) * 25 + (Y - 1)], i_board[(X + 2) * 25 + (Y - 2)], i_board[(X + 3) * 25 + (Y - 3)]} == {turn, turn, turn, turn}) ||
        ({i_board[(X - 1) * 25 + Y], i_board[(X + 1) * 25 + Y], i_board[(X + 2) * 25 + Y], i_board[(X + 3) * 25 + Y]} == {turn, turn, turn, turn}) ||

        ({i_board[(X - 2) * 25 + (Y - 2)], i_board[(X - 1) * 25 + (Y - 1)], i_board[(X + 1) * 25 + (Y + 1)], i_board[(X + 2) * 25 + (Y + 2)]} == {turn, turn, turn, turn}) ||
        ({i_board[X * 25 + (Y - 2)], i_board[X * 25 + (Y - 1)], i_board[X * 25 + (Y + 1)], i_board[X * 25 + (Y + 2)]} == {turn, turn, turn, turn}) ||
        ({i_board[(X - 2) * 25 + (Y + 2)], i_board[(X - 1) * 25 + (Y + 1)], i_board[(X + 1) * 25 + (Y - 1)], i_board[(X + 2) * 25 + (Y - 2)]} == {turn, turn, turn ,turn}) ||
        ({i_board[(X - 2) * 25 + Y], i_board[(X - 1) * 25 + Y], i_board[(X + 1) * 25 + Y], i_board[(X + 2) * 25 + Y]} == {turn, turn, turn, turn})
    )) begin
        check = 1;
    end
    else begin
        check = 0;
    end
endtask

always_comb begin
    
    state_w                 = state_r;
    finish_w                = finish_r;
    pointer_four_w          = pointer_four_r;
    pointer_normal_w        = pointer_normal_r;
    pointer_three_w         = pointer_three_r;    
    
    live_three_threat_w     = live_three_threat_r;
    blocked_four_threat_w   = blocked_four_threat_r;

    normal_X_w              = normal_X_r;
    normal_Y_w              = normal_Y_r;
    defense_four_X_w        = defense_four_X_r;
    defense_four_Y_w        = defense_four_Y_r;
    defense_three_X_w       = defense_three_X_r;
    defense_three_Y_w       = defense_three_Y_r;
    
    final_win_w             = final_win_r;
    final_pointer_w         = final_pointer_r;
    final_X_w               = final_X_r;
    final_Y_w               = final_Y_r;
    
    X_w                     = X_r;
    Y_w                     = Y_r;

    // wire default value 
    offense_livethree_w     = 1'b0;
    offense_livefour_w      = 1'b0;
    offense_blockedfour_w   = 1'b0;
    defense_blockedfour_w   = 1'b0;
    defense_livethree_w     = 1'b0;
    win_w                   = 1'b0;
    X_extended              = 5'd0;
    Y_extended              = 5'd0;
    
    case (state_r)
        S_IDLE: begin
            finish_w = 1'b0;
            final_win_w = 1'b0;
            if(i_start) begin
                state_w = S_COUNT;
                pointer_four_w  = 9'd499;
                pointer_three_w = 9'd499;
                pointer_normal_w = 9'd499;
                blocked_four_threat_w = 1'b0;
                live_three_threat_w = 1'b0;
                X_w = 4'd0;
                Y_w = 4'd0;
            end
        end
        S_COUNT: begin
            Y_w = Y_r + 4'd1;
            if(Y_r == 15) begin
                state_w = S_EVAL;
            end
            else begin
                X_extended = {1'b0, X_r} + 5'd5;
                Y_extended = {1'b0, Y_r} + 5'd5;
                Offense_live_three(.X(X_extended), .Y(Y_extended), .turn({1'b0, i_turn}), .check(offense_livethree_w));
                Offense_blocked_four(.X(X_extended), .Y(Y_extended), .turn({1'b0, i_turn}), .check(offense_blockedfour_w));
                Offense_live_four(.X(X_extended), .Y(Y_extended), .turn({1'b0, i_turn}), .check(offense_livefour_w));
                    
                Defense_three(.X(X_extended), .Y(Y_extended), .turn({1'b0, i_turn}), .check(defense_livethree_w));
                Defense_four(.X(X_extended), .Y(Y_extended), .turn({1'b0, i_turn}), .check(defense_blockedfour_w));
                Win(.X(X_extended), .Y(Y_extended), .turn({1'b0, i_turn}), .check(win_w));

                if(defense_blockedfour_w) begin
                    defense_four_X_w[pointer_four_r -: 4] = X_r;
                    defense_four_Y_w[pointer_four_r -: 4] = Y_r;
                    pointer_four_w = pointer_four_r - 9'd4;
                end
                if(defense_livethree_w || offense_blockedfour_w || offense_livefour_w) begin
                    defense_three_X_w[pointer_three_r -: 4] = X_r;
                    defense_three_Y_w[pointer_three_r -: 4] = Y_r;
                    pointer_three_w = pointer_three_r - 9'd4;
                end
                if(offense_blockedfour_w || offense_livefour_w || offense_livethree_w) begin
                    normal_X_w[pointer_normal_r -: 4] = X_r;
                    normal_Y_w[pointer_normal_r -: 4] = Y_r;
                    pointer_normal_w = pointer_normal_r - 9'd4;
                end

                final_win_w = final_win_r | win_w;
                blocked_four_threat_w = blocked_four_threat_r | defense_blockedfour_w;
                live_three_threat_w = live_three_threat_r | defense_livethree_w;
            end
        end
        S_EVAL: begin
            if(X_r == 15) begin
                state_w = S_IDLE;
                finish_w = 1'b1;
                if(blocked_four_threat_r) begin
                    final_pointer_w = pointer_four_r;
                    final_X_w = defense_four_X_r;
                    final_Y_w = defense_four_Y_r;
                end
                else if(live_three_threat_r) begin
                    final_pointer_w = pointer_three_r;
                    final_X_w = defense_three_X_r;
                    final_Y_w = defense_three_Y_r;
                end
                else begin
                    final_pointer_w = pointer_normal_r;
                    final_X_w = normal_X_r;
                    final_Y_w = normal_Y_r;
                end
            end
            else begin
                state_w = S_COUNT;
                X_w = X_r + 4'd1;
                Y_w = 4'd0;
            end
        end
    endcase
end

always_ff @(posedge i_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        state_r                 <= S_IDLE;
        finish_r                <= 1'b0;
        pointer_four_r          <= 9'd0;
        pointer_normal_r        <= 9'd0;
        pointer_three_r         <= 9'd0;    
        live_three_threat_r     <= 1'b0;
        blocked_four_threat_r   <= 1'b0;
        normal_X_r              <= 500'd0;
        normal_Y_r              <= 500'd0;
        defense_four_X_r        <= 500'd0;
        defense_four_Y_r        <= 500'd0;
        defense_three_X_r       <= 500'd0;
        defense_three_Y_r       <= 500'd0;
        final_win_r             <= 1'b0;
        final_pointer_r         <= 9'd0;
        final_X_r               <= 500'd0;
        final_Y_r               <= 500'd0;
        X_r                     <= 4'd0;
        Y_r                     <= 4'd0;
    end
    else begin
        state_r                 <= state_w;
        finish_r                <= finish_w;
        pointer_four_r          <= pointer_four_w;
        pointer_normal_r        <= pointer_normal_w;
        pointer_three_r         <= pointer_three_w;    
        live_three_threat_r     <= live_three_threat_w;
        blocked_four_threat_r   <= blocked_four_threat_w;
        normal_X_r              <= normal_X_w;
        normal_Y_r              <= normal_Y_w;
        defense_four_X_r        <= defense_four_X_w;
        defense_four_Y_r        <= defense_four_Y_w;
        defense_three_X_r       <= defense_three_X_w;
        defense_three_Y_r       <= defense_three_Y_w;
        final_win_r             <= final_win_w;
        final_pointer_r         <= final_pointer_w;
        final_X_r               <= final_X_w;
        final_Y_r               <= final_Y_w;
        X_r                     <= X_w;
        Y_r                     <= Y_w;
    end
end
endmodule