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
    output          o_PGfinish          // whether all the empty points are found 
);
parameter S_IDLE    = 2'd0;
parameter S_COUNT   = 2'd1;
parameter S_EVAL    = 2'd2;

logic [1:0] state_r, state_w;
logic finish_r, finish_w;
logic [8:0] pointer_r, pointer_w;
logic [3:0] X_r, X_w;
logic [3:0] Y_r, Y_w;
logic [399:0] output_X_w, output_X_r;
logic [399:0] output_Y_w, output_Y_r;

assign o_posX = output_X_r;
assign o_posY = output_Y_r;
assign o_size = pointer_r;
assign o_PGfinish = finish_r;

always_comb begin
    state_w         = state_r;
    finish_w        = finish_r;
    pointer_w       = pointer_r;
    output_X_w      = output_X_r;
    output_Y_w      = output_Y_r;
    X_w             = X_r;
    Y_w             = Y_r;
    
    case(state_r)
        S_IDLE: begin
            finish_w    = 1'b0;
            if(i_start) begin
                state_w     = S_COUNT;
                pointer_w   = 9'd399;
                X_w         = 4'd0;
                Y_w         = 4'd0;            
            end
        end
        S_COUNT: begin
            Y_w = Y_r + 4'd1;
            if(Y_r == 15) begin
                state_w = S_EVAL;
            end
            else begin
                if(i_board[(X_r + 5) * 25 + (Y_r + 5)] == 2) begin
                    if( (i_board[(X_r + 4) * 25 + (Y_r + 4)] != 2 && i_board[(X_r + 4) * 25 + (Y_r + 4)] != 3) || 
                        (i_board[(X_r + 4) * 25 + Y_r + 5] != 2 && i_board[(X_r + 4) * 25 + Y_r + 5] != 3) ||
                        (i_board[(X_r + 4) * 25 + (Y_r + 6)] != 2 && i_board[(X_r + 4) * 25 + (Y_r + 6)] != 3) ||
                        (i_board[(X_r + 5) * 25 + (Y_r + 6)] != 2 && i_board[(X_r + 5) * 25 + (Y_r + 6)] != 3) || 
                        (i_board[(X_r + 6) * 25 + (Y_r + 6)] != 2 && i_board[(X_r + 6) * 25 + (Y_r + 6)] != 3) ||
                        (i_board[(X_r + 6) * 25 + Y_r + 5] != 2 && i_board[(X_r + 6) * 25 + Y_r + 5] != 3) ||
                        (i_board[(X_r + 6) * 25 + (Y_r + 4)] != 2 && i_board[(X_r + 6) * 25 + (Y_r + 4)] != 3) ||
                        (i_board[(X_r + 5) * 25 + (Y_r + 4)] != 2 && i_board[(X_r + 5) * 25 + (Y_r + 4)] != 3)) begin
                        output_X_w[pointer_w -: 4] = X_r;
                        output_Y_w[pointer_w -: 4] = Y_r;
                        pointer_w = pointer_r - 9'd4;               
                    end
                end
            end
        end
        S_EVAL: begin
            if(X_r == 15) begin
                state_w = S_IDLE;
                finish_w = 1'b1;
            end
            else begin
                X_w = X_r + 4'd1;
                Y_w = 4'd0;
                state_w = S_COUNT;
            end
        end
    endcase            
end

always_ff @(posedge i_clk, negedge i_rst_n) begin
    if(!i_rst_n) begin
        state_r         <= S_IDLE;
        finish_r        <= 1'b0;
        pointer_r       <= 9'd0;
        output_X_r      <= 400'd0;
        output_Y_r      <= 400'd0;
        X_r             <= 4'd0;
        Y_r             <= 4'd0;
    end
    else begin
        state_r         <= state_w;
        finish_r        <= finish_w;
        pointer_r       <= pointer_w;
        output_X_r      <= output_X_w;
        output_Y_r      <= output_Y_w;
        X_r             <= X_w;
        Y_r             <= Y_w;
    end
end
endmodule