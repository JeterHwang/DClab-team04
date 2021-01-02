module CheckFive (
	input   board i_board,         // 25*25*2 bit chess board       
    input   i_turn,                 // 0 black 1 white
    output  o_win                 // 0 none / 1 have
);


parameter b = 2'd0;
parameter w = 2'd1;
parameter l = 2'd2;
parameter x = 2'd3;

logic win_w;

assign o_win = win_w;

always_comb begin
    win_w = 1'b0;
    for(int i = 5; i < 20; i++) begin
        for(int j = 5; j < 20; j++) begin
            if(i_board[i * 25 + j] == i_turn && (
                ({i_board[(i + 1) * 25 + (j + 1)], i_board[(i + 2) * 25 + (j + 2)], i_board[(i + 3) * 25 + (j + 3)], i_board[(i + 4) * 25 + (j + 4)]} == {i_turn, i_turn, i_turn, i_turn}) ||
                ({i_board[i * 25 + (j + 1)], i_board[i * 25 + (j + 2)], i_board[i * 25 + (j + 3)], i_board[i * 25 + (j + 4)]} == {i_turn, i_turn, i_turn, i_turn}) ||
                ({i_board[(i - 1) * 25 + (j + 1)], i_board[(i - 2) * 25 + (j + 2)], i_board[(i - 3) * 25 + (j + 3)], i_board[(i - 4) * 25 + (j + 4)]} == {i_turn, i_turn, i_turn, i_turn}) || 
                ({i_board[(i - 1) * 25 + j], i_board[(i - 2) * 25 + j], i_board[(i - 3) * 25 + j], i_board[(i - 4) * 25 + j]} == {i_turn, i_turn, i_turn, i_turn}) ||
                ({i_board[(i - 1) * 25 + (j - 1)], i_board[(i - 2) * 25 + (j - 2)], i_board[(i - 3) * 25 + (j - 3)], i_board[(i - 4) * 25 + (j - 4)]} == {i_turn, i_turn, i_turn, i_turn}))) begin
                win_w = 1'b1;                
            end
        end
    end
end
endmodule