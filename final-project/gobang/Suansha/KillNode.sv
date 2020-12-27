//typedef logic [1:0] board [225];
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
    input      board    i_board,
    output     board    o_board,
    output              o_sha,     
    output              o_finish,
    output              o_start         
);

parameter S_IDLE = 2'd0;
parameter S_PEND = 2'd1;
parameter S_WAIT = 2'd2;
parameter S_DFS  = 2'd3;

// local variables
board board_r, board_w;
logic [1:0] state_r, state_w;
logic [9:0] pointer_r, pointer_w;
logic result_r, result_w;
logic finish_r, finish_w;
logic next_start_r, next_start_w;
logic [9:0] coor_1D_w;

// Threats variables
logic turn;
logic you_win;
logic [999:0] X_buffer;
logic [999:0] Y_buffer;
logic [9:0] SZ_buffer;

// submodule input signal 
assign turn     = i_depth[0] & 1;
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
    .i_start(i_start),
    .i_turn(turn),
    .i_board(i_board),
    .o_posX(X_buffer),
    .o_posY(Y_buffer),
    .o_size(SZ_buffer),
    .o_win(you_win),
    .o_finish(threat_finish)
);

always_comb begin
    board_w     = board_r;
    state_w     = state_r;
    pointer_w   = pointer_r;
    result_w    = result_r;
    finish_w    = finish_r;
    next_start_w = next_start_r;
    
    case (state_r)
        S_IDLE: begin
            finish_w    = 1'b0;
            result_w    = 1'b1;
            if(i_start) begin
                state_w     = S_PEND;     
            end
        end
        S_PEND: begin
            if(threat_finish) begin
                if(i_depth == 3 && i_board[7 * 15 + 7] == 2'd0) begin
                    $display("=========== depth : %d ===========\n", i_depth);
                    $display("Youwin : %b\n", you_win);
                    $display("Pointer Lowerbound = %d\n", SZ_buffer);
                    $display("Pointer = %d %d\n", pointer_r, pointer_w);
                    for(int i = 0; i < 15; i++) begin
                        $display("%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d\n", i_board[i*15+0], i_board[i*15+1], i_board[i*15+2], i_board[i*15+3], i_board[i*15+4], i_board[i*15+5], i_board[i*15+6], i_board[i*15+7], i_board[i*15+8], i_board[i*15+9], i_board[i*15+10], i_board[i*15+11], i_board[i*15+12], i_board[i*15+13], i_board[i*15+14]);
                    end
                    $display("==================================");
                end
                if(i_depth == 0) begin
                    state_w = S_IDLE;
                    finish_w = 1'b1;
                    if(turn)
                        result_w = 1'b1;
                    else
                        result_w = you_win;
                end
                else begin
                    if(you_win) begin
                        state_w = S_IDLE;
                        finish_w = 1'b1;
                        result_w = 1'b1;
                    end
                    else begin
                        state_w     = S_WAIT;
                        pointer_w   = 10'd999;    
                    end
                end
            end
        end
        S_WAIT: begin
            if(pointer_r <= SZ_buffer || result_r == 1'b0) begin
                finish_w    = 1'b1;
                state_w     = S_IDLE;
                result_w    = (~result_r);
            end
            else begin
                next_start_w        = 1'b1;
                state_w             = S_DFS;
                coor_1D_w           = 15 * X_buffer[pointer_r -: 4] + Y_buffer[pointer_r -: 4];
                for(int i = 0; i < 15; i++) begin
                    for(int j = 0; j < 15; j++) begin
                        board_w[i * 15 + j] = i_board[i * 15 + j];
                    end
                end
                //if(i_depth == 1) begin
                //    $display("=========== depth : %d ===========\n", i_depth);
                //    $display("Pointer Lowerbound = %d\n", SZ_buffer);
                //    $display("Pointer = %d %d\n", pointer_r, pointer_w);
                //    for(int i = 0; i < 15; i++) begin
                //        $display("%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d\n", board_w[i*15+0], board_w[i*15+1], board_w[i*15+2], board_w[i*15+3], board_w[i*15+4], board_w[i*15+5], board_w[i*15+6], board_w[i*15+7], board_w[i*15+8], board_w[i*15+9], board_w[i*15+10], board_w[i*15+11], board_w[i*15+12], board_w[i*15+13], board_w[i*15+14]);
                //    end
                //    $display("==================================");
                //end
                board_w[coor_1D_w]  = turn;
                pointer_w           = pointer_r - 4;
            end
        end
        S_DFS: begin
            next_start_w    = 1'b0;
            if(i_next) begin
                // calculate result
                result_w    = result_r & i_sha;
                state_w     = S_WAIT;
            end
        end
    endcase    
end

always_ff @(posedge i_clk, negedge i_rst_n) begin
    if(!i_rst_n) begin
        board_r         <= board_w;
        state_r         <= 2'd0;
        pointer_r       <= 10'd0;
        result_r        <= 1'b0;
        finish_r        <= 1'b0;
        next_start_r    <= 1'b0;
    end
    else begin
        board_r         <= board_w;
        state_r         <= state_w;
        pointer_r       <= pointer_w;
        result_r        <= result_w;
        finish_r        <= finish_w;
        next_start_r    <= next_start_w;
    end
end
endmodule