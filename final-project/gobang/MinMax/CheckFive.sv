module CheckFive (
	input   board i_board,         // 15*15*2 bit chess board       
    input   i_turn,                 // 0 black 1 white
    output  o_win                 // 0 none / 1 have
);


parameter b = 2'd0;
parameter w = 2'd1;
parameter l = 2'd2;


parameter black_con_five = {b, b, b, b, b};
parameter white_con_five = {w, w, w, w, w};

logic score_up;
logic score_left;
logic score_upper_left;
logic score_upper_right;
assign o_win = score_up || score_left || score_upper_left || score_upper_right;

always_comb begin
`   if(i_turn == 0) begin
        for(int i = 0; i <= 10; i++) begin
            for(int j = 0; j <= 14; j++) begin
                if({chess_board[j+i*15], chess_board[j+(i+1)*15], chess_board[j+(i+2)*15], chess_board[j+(i+3)*15], chess_board[j+(i+4)*15] } == black_con_five) begin
                    score_up = 1;
                end
                else begin
                    score_up = 0
                end
            end
        end
        for(int i = 0; i < 15; i++) begin
            for(int j = 0; j <= 10; j++) begin
                if({chess_board[i * 15 + j], chess_board[i * 15 + j + 1], chess_board[i * 15 + j + 2], chess_board[i * 15 + j + 3], chess_board[i * 15 + j + 4] } === black_con_five) begin
                    score_left = 1;
                end
                else begin
                    score_left = 0
                end
            end     
        end

        for(int i = 0; i <= 10; i++) begin
            for(int j = 0; j <= 10 ; j++) begin
                if( { chess_board[i * 15 + j], chess_board[(i + 1) * 15 + j + 1], chess_board[(i+2)*15 + j+2], chess_board[(i + 3) * 15 + j + 3], chess_board[(i + 4) * 15 + j + 4] } == black_con_five) begin
                    score_upper_left = 1;
                end
                else begin
                    score_upper_left = 0
                end
            end     
        end

        for(int i = 0; i <= 10; i++) begin
            for(int j = 0; j <= 10; j++) begin for(int k=0; k < 10; k++) begin
                if({chess_board[i * 15 +  j + 4], chess_board[(i + 1) * 15 + j + 3 ], chess_board[(i + 2) * 15 + j + 2], chess_board[(i + 3) * 15 + j + 1], chess_board[(i + 4) * 15 + j] } === black_con_five) begin
                    score_upper_right = 1;
                end
                else begin
                    score_upper_right = 0
                end
                        
            end     
        end
    end
    else begin
        for(int i = 0; i <= 10; i++) begin
            for(int j = 0; j <= 14; j++) begin
                if({chess_board[j+i*15], chess_board[j+(i+1)*15], chess_board[j+(i+2)*15], chess_board[j+(i+3)*15], chess_board[j+(i+4)*15] } == white_con_five) begin
                    score_up = 1;
                end
                else begin
                    score_up = 0
                end
            end
        end
        for(int i = 0; i < 15; i++) begin
            for(int j = 0; j <= 10; j++) begin
                if({chess_board[i * 15 + j], chess_board[i * 15 + j + 1], chess_board[i * 15 + j + 2], chess_board[i * 15 + j + 3], chess_board[i * 15 + j + 4] } === white_con_five) begin
                    score_left = 1;
                end
                else begin
                    score_left = 0
                end
            end     
        end

        for(int i = 0; i <= 10; i++) begin
            for(int j = 0; j <= 10 ; j++) begin
                if( { chess_board[i * 15 + j], chess_board[(i + 1) * 15 + j + 1], chess_board[(i+2)*15 + j+2], chess_board[(i + 3) * 15 + j + 3], chess_board[(i + 4) * 15 + j + 4] } == white_con_five) begin
                    score_upper_left = 1;
                end
                else begin
                    score_upper_left = 0
                end
            end     
        end

        for(int i = 0; i <= 10; i++) begin
            for(int j = 0; j <= 10; j++) begin for(int k=0; k < 10; k++) begin
                if({chess_board[i * 15 +  j + 4], chess_board[(i + 1) * 15 + j + 3 ], chess_board[(i + 2) * 15 + j + 2], chess_board[(i + 3) * 15 + j + 1], chess_board[(i + 4) * 15 + j] } === white_con_five) begin
                    score_upper_right = 1;
                end
                else begin
                    score_upper_right = 0
                end
                        
            end     
        end




    end

    
end



endmodule