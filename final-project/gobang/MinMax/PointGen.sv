// 0  1  2  3  4
// 15 16 17 18 5
// 14 23    19 6
// 13 22 21 20 7
// 12 11 10 9  8
module point_generator(
    input           i_clk,
    input           i_rst_n,
    input           i_start,
    input   board   i_board,
    output  [399:0] o_posX,
    output  [399:0] o_posY,
    output  [8:0]   o_size,
    output          o_finish          // whether all the empty points are found 
);
parameter S_IDLE    = 1'd0;
parameter S_COUNT   = 1'd1;

logic state_r, state_w;
logic finish_r, finish_w;
logic [8:0] pointer[226];
logic [399:0] output_X;
logic [399:0] output_Y;

// logic [74:0] X_buffer[15];
// logic [74:0] Y_buffer[15];
// logic [6:0] pointer[15]

logic valid[15][15];

assign o_posX = output_X;
assign o_posY = output_Y;
assign o_size = pointer[225];
assign o_finish = finish_r;

always_comb begin
    state_w = state_r;
    finish_w = finish_r;
    case(state_r)
        S_IDLE: begin
            finish_w    = 1'b0;
            if(i_start) begin
                state_w = S_COUNT;
                for(int i = 0; i < 15; i++) begin
                    for(int j = 0; j < 15; j++) begin
                        valid[i][j] = 1'b0;
                        // 0
                        if(i >= 2 && j >= 2) begin
                            if(i_board[(i - 2) * 15 + (j - 2)] != 2'd2)
                                valid[i][j] = 1'b1;               
                        end
                        // 1
                        if(i >= 2 && j >= 1) begin
                            if(i_board[(i - 2) * 15 + (j - 1)] != 2'd2)
                                valid[i][j] = 1'b1;               
                        end
                        // 2
                        if(i >= 2) begin
                            if(i_board[(i - 2) * 15 + (j)] != 2'd2)
                                valid[i][j] = 1'b1;               
                        end
                        // 3
                        if(i >= 2 && j + 1 <= 14) begin
                            if(i_board[(i - 2) * 15 + (j + 1)] != 2'd2)
                                valid[i][j] = 1'b1;               
                        end
                        // 4
                        if(i >= 2 && j + 2 <= 14) begin
                            if(i_board[(i - 2) * 15 + (j + 2)] != 2'd2)
                                valid[i][j] = 1'b1;               
                        end
                        // 5
                        if(i >= 1 && j + 2 <= 14) begin
                            if(i_board[(i - 1) * 15 + (j + 2)] != 2'd2)
                                valid[i][j] = 1'b1;               
                        end
                        // 6
                        if(j + 2 <= 14) begin
                            if(i_board[i * 15 + (j + 2)] != 2'd2)
                                valid[i][j] = 1'b1;               
                        end
                        // 7
                        if(i + 1 <= 14 && j + 2 <= 14) begin
                            if(i_board[(i + 1) * 15 + (j + 2)] != 2'd2)
                                valid[i][j] = 1'b1;               
                        end
                        // 8
                        if(i + 2 <= 14 && j + 2 <= 14) begin
                            if(i_board[(i + 2) * 15 + (j + 2)] != 2'd2)
                                valid[i][j] = 1'b1;               
                        end
                        // 9
                        if(i + 2 <= 14 && j + 1 <= 14) begin
                            if(i_board[(i + 2) * 15 + (j + 1)] != 2'd2)
                                valid[i][j] = 1'b1;               
                        end
                        // 10
                        if(i + 2 <= 14) begin
                            if(i_board[(i + 2) * 15 + j] != 2'd2)
                                valid[i][j] = 1'b1;               
                        end
                        // 11
                        if(i + 2 <= 14 && j >= 1) begin
                            if(i_board[(i + 2) * 15 + (j - 1)] != 2'd2)
                                valid[i][j] = 1'b1;               
                        end
                        // 12
                        if(i + 2 <= 14 && j >= 2) begin
                            if(i_board[(i + 2) * 15 + (j - 2)] != 2'd2)
                                valid[i][j] = 1'b1;               
                        end
                        // 13
                        if(i + 1 <= 14 && j >= 2) begin
                            if(i_board[(i + 1) * 15 + (j - 2)] != 2'd2)
                                valid[i][j] = 1'b1;               
                        end
                        // 14
                        if(j >= 2) begin
                            if(i_board[i * 15 + (j - 2)] != 2'd2)
                                valid[i][j] = 1'b1;               
                        end
                        // 15
                        if(i >= 1 && j >= 2) begin
                            if(i_board[(i - 1) * 15 + (j - 2)] != 2'd2)
                                valid[i][j] = 1'b1;               
                        end
                        // 16
                        if(i >= 1 && j >= 1) begin
                            if(i_board[(i - 1) * 15 + (j - 1)] != 2'd2)
                                valid[i][j] = 1'b1;               
                        end
                        // 17
                        if(i >= 1) begin
                            if(i_board[(i - 1) * 15 + j] != 2'd2)
                                valid[i][j] = 1'b1;               
                        end
                        // 18
                        if(i >= 1 && j + 1 <= 14) begin
                            if(i_board[(i - 1) * 15 + (j + 1)] != 2'd2)
                                valid[i][j] = 1'b1;               
                        end
                        // 19
                        if(j + 1 <= 14) begin
                            if(i_board[i * 15 + (j + 1)] != 2'd2)
                                valid[i][j] = 1'b1;               
                        end
                        // 20
                        if(i + 1 <= 14 && j + 1 <= 14) begin
                            if(i_board[(i + 1) * 15 + (j + 1)] != 2'd2)
                                valid[i][j] = 1'b1;               
                        end
                        // 21
                        if(i + 1 <= 14) begin
                            if(i_board[(i + 1) * 15 + j] != 2'd2)
                                valid[i][j] = 1'b1;               
                        end
                        // 22
                        if(i + 1 <= 14 && j >= 1) begin
                            if(i_board[(i + 1) * 15 + (j - 1)] != 2'd2)
                                valid[i][j] = 1'b1;               
                        end
                        // 23
                        if(j >= 1) begin
                            if(i_board[i * 15 + (j - 1)] != 2'd2)
                                valid[i][j] = 1'b1;               
                        end
                        if(i_board[i * 15 + j] != 2'd2)
                            valid[i][j] = 1'b0;
                    end
                end            
            end
        end
        S_COUNT: begin
            pointer[0] = 9'd399;
            for(int i = 0; i < 15; i++) begin
                for(int j = 0; j < 15; j++) begin
                    // pointer[i] = 7'd74;
                    // if(valid[i][j]) begin
                    //     X_buffer[i][pointer[i] -: 5] = i[4:0];
                    //     X_buffer[i][pointer[i] -: 5] = j[4:0];
                    //     pointer[i] = pointer[i] - 5;
                    // end
                    if(valid[i][j] == 1'b1) begin
                        output_X[pointer[i * 15 + j] -: 5] = i[4:0];
                        output_Y[pointer[i * 15 + j] -: 5] = j[4:0];
                        pointer[i * 15 + j + 1] = pointer[i * 15 + j] - 5;
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

always_ff @(posedge i_clk, negedge i_rst_n) begin
    if(!i_rst_n) begin
        state_r         <= S_IDLE;
        finish_r        <= 1'b0;
    end
    else begin
        state_r         <= state_w;
        finish_r        <= finish_w;
    end
end
endmodule