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
            if(i_board[i * 15 + j] == i_turn && ((i + 4 < 15 && j + 4 < 15 && i_board[(i + 1) * 15 + (j + 1)] == i_turn && i_board[(i + 2) * 15 + (j + 2)] == i_turn && i_board[(i + 3) * 15 + (j + 3)] == i_turn && i_board[(i + 4) * 15 + (j + 4)] == i_turn) ||
                (j + 4 < 15 && i_board[i * 15 + (j + 1)] == i_turn && i_board[i * 15 + (j + 2)] == i_turn && i_board[i * 15 + (j + 3)] == i_turn && i_board[i * 15 + (j + 4)] == i_turn) ||
                (i - 4 >= 0 && j + 4 < 15 && i_board[(i - 1) * 15 + (j + 1)] == i_turn && i_board[(i - 2) * 15 + (j + 2)] == i_turn && i_board[(i - 3) * 15 + (j + 3)] == i_turn && i_board[(i - 4) * 15 + (j + 4)] == i_turn) || 
                (i - 4 >= 0 && i_board[(i - 1) * 15 + j] == i_turn && i_board[(i - 2) * 15 + j] == i_turn && i_board[(i - 3) * 15 + j] == i_turn && i_board[(i - 4) * 15 + j] == i_turn) ||
                (i - 4 >= 0 && j - 4 >= 0 && i_board[(i - 1) * 15 + (j - 1)] == i_turn && i_board[(i - 2) * 15 + (j - 2)] == i_turn && i_board[(i - 3) * 15 + (j - 3)] == i_turn && i_board[(i - 4) * 15 + (j - 4)] == i_turn))) begin
                win_w = 1'b1;                
            end
        end
    end
end
endmodule