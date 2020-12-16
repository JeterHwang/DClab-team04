typedef logic [1:0] chess_board [224:0];
// 我方：找尋所有死四，活三點
// 敵方：找尋所有死四，防守點
module Kill_node(
    // Top module signal
    input               i_clk,
    input               i_rst_n,
    input     [4:0]     i_depth,
    input               i_start,
    // next module result
    input               i_next,
    input               i_sha,
    // previous module signal
    input  chess_board  i_board,
    output chess_board  o_board,
    output              o_sha,     // 1代表我方必勝 或 對方守住了
    output              o_finish,
    output              o_start         
);

parameter S_IDLE = 2'd0;
parameter S_PEND = 2'd1;
parameter S_WAIT = 2'd2;

// local variables
chess_board board_r, board_w;
logic [1:0] state_r, state_w;
logic [5:0] pointer_r, pointer_w;
logic result_r, result_w;
logic finish_r, finish_w;
logic next_start_r, next_start_w;
logic [9:0] 1D_coor_w;

// Threats variables
logic turn;
logic threat
logic [49:0] X_buffer;
logic [49:0] Y_buffer;
logic [5:0] SZ_buffer;
logic threat_start;

// Win variables
logic win_start;
logic win_finish;
logic [1:0] who_win;

// submodule input signal 
assign turn     = i_depth[0] & 1;
assign threat_start = (i_depth != 5'd0 && i_start) ? 1'b1 : 1'b0;
assign win_start = (i_depth != 5'd0 && i_start) ? 1'b1 : 1'b0;
// for prev level
assign o_sha    = result_r;
assign o_finish = finish_r;
// for next level
assign o_start  = next_start_r;
assign o_board  = board_r;

Threats threat(
    .i_clk(i_clk),
    .i_rst_n(i_rst_n),
    .i_start(threat_start),
    .i_turn(turn),
    .i_board(i_board),
    .o_posX(X_buffer),
    .o_posY(Y_buffer),
    .o_size(SZ_buffer),
    .o_win(who_win),
    .o_finish(threat_finish)
);

always_comb begin
    borad_w     = board_r;
    state_w     = state_r;
    pointer_w   = pointer_r;
    result_w    = result_r;
    finish_w    = finish_r;
    next_start_w = next_start_r;
    cand_X_w    = cand_X_r;
    cand_Y_w    = cand_Y_r;

    case (state_r)
        S_IDLE: begin
            finish_w    = 1'b0;
            if(i_start) begin
                if(i_depth == 5'd0) begin
                    finish_w    = 1'b1;
                    if(turn)
                        result_w    = 1'b1;
                    else
                        result_w    = 1'b0;
                end
                else begin
                    state_w     = S_PEND;
                    result_w    = 1'b1;    
                end
            end
        end
        S_PEND: begin
            if(threat_finish) begin
                if(who_win == 2'd2) begin // no one wins
                    state_w     = S_WAIT;
                    pointer_w   = SZ_buffer;    
                end
                else if(who_win == turn) begin // player considered wins
                    state_w     = S_IDLE;
                    result_w    = 1'b1;
                    finish_w    = 1'b1;
                end
                else begin
                    state_w     = S_IDLE; // oppponent wins
                    result_w    = 1'b0;
                    finish_w    = 1'b1;
                end
            end
        end
        S_WAIT: begin
            next_start_w    = 1'b0;
            if(i_next) begin
                // calculate result
                result_w    = result_r & i_sha;
                // change state
                if(pointer_r == 6'd0 || result_w == 1'b0) begin
                    finish_w        = 1'b1;
                    state_w         = S_IDLE;
                    result_w        = ~result_w;
                end
                else begin
                    next_start_w    = 1'b1;
                    1D_coor_w       = 10'd15 * X_buffer[pointer_r : pointer_r - 4] + Y_buffer[pointer_r : pointer_r - 4];
                    board_w[1D_coor_w] = turn;
                    if(pointer_r > 6'd5)
                        pointer_w       = pointer_r - 6'd5;
                    else
                        pointer_w       = 6'd0;
                end
            end
        end
    endcase    
end

always_ff @(posedge i_clk, negedge i_rst_n) begin
    if(!i_rst_n) begin
        borad_r         <= board_w;
        state_r         <= 2'd0;
        pointer_r       <= 6'd0;
        result_r        <= 1'b0;
        finish_r        <= 1'b0;
        next_start_r    <= 1'b0;
    end
    else begin
        borad_r         <= board_w;
        state_r         <= state_w;
        pointer_r       <= pointer_w;
        result_r        <= result_w;
        finish_r        <= finish_w;
        next_start_r    <= next_start_w;
    end
end
endmodule