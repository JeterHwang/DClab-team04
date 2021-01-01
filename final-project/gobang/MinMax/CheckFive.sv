module CheckFive (
	input   board i_board,         // 15*15*2 bit chess board       
    input   i_turn,                 // 0 black 1 white
    output  o_win                 // 0 none / 1 have
);


parameter b = 2'd0;
parameter w = 2'd1;
parameter l = 2'd2;

logic win_w;

assign o_win = win_w;

always_comb begin
    win_w = 1'b0;
    for(int i = 0; i < 15; i++) begin
        for(int j = 0; j < 15; j++) begin
            if(i_board[i * 15 + j] == l && ((i_board[(i + 1) * 15 + (j + 1)] == i_turn && i_board[(i + 2) * 15 + (j + 2)] == i_turn && i_board[(i + 3) * 15 + (j + 3)] == i_turn && i_board[(i + 4) * 15 + (j + 4)] == i_turn) ||
                (i_board[i * 15 + (j + 1)] == i_turn && i_board[i * 15 + (j + 2)] == i_turn && i_board[i * 15 + (j + 3)] == i_turn && i_board[i * 15 + (j + 4)] == i_turn) ||
                (i_board[(i - 1) * 15 + (j + 1)] == i_turn && i_board[(i - 2) * 15 + (j + 2)] == i_turn && i_board[(i - 3) * 15 + (j + 3)] == i_turn && i_board[(i - 4) * 15 + (j + 4)] == i_turn) || 
                (i_board[(i - 1) * 15 + j] == i_turn && i_board[(i - 2) * 15 + j] == i_turn && i_board[(i - 3) * 15 + j] == i_turn && i_board[(i - 4) * 15 + j] == i_turn) ||
                (i_board[(i - 1) * 15 + (j - 1)] == i_turn && i_board[(i - 2) * 15 + (j - 2)] == i_turn && i_board[(i - 3) * 15 + (j - 3)] == i_turn && i_board[(i - 4) * 15 + (j - 4)] == i_turn) || 
                (i_board[i * 15 + (j - 1)] == i_turn && i_board[i * 15 + (j - 2)] == i_turn && i_board[i * 15 + (j - 3)] == i_turn && i_board[i * 15 + (j - 4)] == i_turn) || 
                (i_board[(i + 1) * 15 + (j - 1)] == i_turn && i_board[(i + 2) * 15 + (j - 2)] == i_turn && i_board[(i + 3) * 15 + (j - 3)] == i_turn && i_board[(i + 4) * 15 + (j - 4)] == i_turn) ||
                (i_board[(i + 1) * 15 + j] == i_turn && i_board[(i + 2) * 15 + j] == i_turn && i_board[(i + 3) * 15 + j] == i_turn && i_board[(i + 4) * 15 + j] == i_turn
            )) begin
                
            end
        end
    end
    if(i_turn == 0) begin
        for(int i = 0; i <= 10; i++) begin
            for(int j = 0; j <= 14; j++) begin
                if({i_board[j+i*15], i_board[j+(i+1)*15], i_board[j+(i+2)*15], i_board[j+(i+3)*15], i_board[j+(i+4)*15] } == black_con_five) begin
                    score_up = 1;
                end
            end
        end
        for(int i = 0; i < 15; i++) begin
            for(int j = 0; j <= 10; j++) begin
                if({i_board[i * 15 + j], i_board[i * 15 + j + 1], i_board[i * 15 + j + 2], i_board[i * 15 + j + 3], i_board[i * 15 + j + 4] } === black_con_five) begin
                    score_left = 1;
                end
            end     
        end
        for(int i = 0; i <= 10; i++) begin
            for(int j = 0; j <= 10 ; j++) begin
                if( { i_board[i * 15 + j], i_board[(i + 1) * 15 + j + 1], i_board[(i+2)*15 + j+2], i_board[(i + 3) * 15 + j + 3], i_board[(i + 4) * 15 + j + 4] } == black_con_five) begin
                    score_upper_left = 1;
                end
            end     
        end
        for(int i = 0; i <= 10; i++) begin
            for(int j = 0; j <= 10; j++) begin
                if({i_board[i * 15 +  j + 4], i_board[(i + 1) * 15 + j + 3 ], i_board[(i + 2) * 15 + j + 2], i_board[(i + 3) * 15 + j + 1], i_board[(i + 4) * 15 + j] } === black_con_five) begin
                    score_upper_right = 1;
                end            
            end     
        end
    end
    else begin
        for(int i = 0; i <= 10; i++) begin
            for(int j = 0; j <= 14; j++) begin
                if({i_board[j+i*15], i_board[j+(i+1)*15], i_board[j+(i+2)*15], i_board[j+(i+3)*15], i_board[j+(i+4)*15] } == white_con_five) begin
                    score_up = 1;
                end
            end
        end
        for(int i = 0; i < 15; i++) begin
            for(int j = 0; j <= 10; j++) begin
                if({i_board[i * 15 + j], i_board[i * 15 + j + 1], i_board[i * 15 + j + 2], i_board[i * 15 + j + 3], i_board[i * 15 + j + 4] } === white_con_five) begin
                    score_left = 1;
                end
            end     
        end
        for(int i = 0; i <= 10; i++) begin
            for(int j = 0; j <= 10 ; j++) begin
                if( { i_board[i * 15 + j], i_board[(i + 1) * 15 + j + 1], i_board[(i+2)*15 + j+2], i_board[(i + 3) * 15 + j + 3], i_board[(i + 4) * 15 + j + 4] } == white_con_five) begin
                    score_upper_left = 1;
                end
            end     
        end
        for(int i = 0; i <= 10; i++) begin
            for(int j = 0; j <= 10; j++) begin
                if({i_board[i * 15 +  j + 4], i_board[(i + 1) * 15 + j + 3 ], i_board[(i + 2) * 15 + j + 2], i_board[(i + 3) * 15 + j + 1], i_board[(i + 4) * 15 + j] } === white_con_five) begin
                    score_upper_right = 1;
                end     
            end     
        end
    end
end
endmodule