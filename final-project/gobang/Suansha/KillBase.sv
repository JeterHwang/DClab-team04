typedef logic [1:0] chess_board [224:0];
module Kill_base(
    input               i_clk,
	input               i_rst_n,
	input               i_start,
    input     [4:0]     i_depth,
	input  chess_board  i_board,
    output              o_sha,
    output              o_finish
);

chess_board board_r, board_w;
logic [4:0] state_r, state_w;
logic [4:0] depth_r, depth_w;
logic [49:0] cand_X_r [0:9];
logic [49:0] cand_X_w [0:9];
logic [49:0] cand_Y_r [0:9];
logic [49:0] cand_Y_w [0:9];
logic [4:0]  size_r   [0:9];
logic [4:0]  size_w   [0:9];
logic result_r [0:9];
logic result_r [0:9];

generate;
    for(genvar i = 0; i < 10; i++) begin
        Kill_node node(
            .i_clk(),
            .i_rst_n(),
            .i_start(),
            .i_depth(),
            .i_next(),
            .i_sha(),
            .i_board(),
            .i_Xpos
        );
    end
endgenerate

always_comb begin
    case(state_r)
        S_IDLE: begin
            if(i_start) begin
                board_w = i_board;
                depth_w = 5'd0;
                threat_start_w = 1'b1;
                threat_turn_w  = 1'b0;
            end
        end
        S_DEPTH0: begin // 0 offense
            if(threat_finish) begin
                cand_X_w[0]     = X_buffer;
                cand_Y_w[0]     = Y_buffer;
                size_w[0]       = SZ_buffer;
            end
            if(size_r[0] == 5'd0) begin
                state_w         = S_RETURN;
            end
            else begin
                size_w[0] = size_r[0] - 5'd1;
            end
            depth_w = depth_r + 5'd1;
        end
        S_DEPTH1: begin // 1 defense
            depth_w = depth_r + 5'd1;
            
        end
        S_DEPTH2: begin // 0 offense
            depth_w = depth_r + 5'd1;
        end
        S_DEPTH3: begin // 1 defense
            depth_w = depth_r + 5'd1;
        end
        S_DEPTH4: begin // 0 offense
            depth_w = depth_r + 5'd1;
        end
        S_DEPTH5: begin // 1 defense
            depth_w = depth_r + 5'd1;
        end
        S_DEPTH6: begin // 0 offense
            depth_w = depth_r + 5'd1;
        end
        S_DEPTH7: begin // 1 defense
            depth_w = depth_r + 5'd1;
        end
        S_DEPTH8: begin // 0 offense
            depth_w = depth_r + 5'd1;
        end
        S_DEPTH9: begin // 1 defense
            depth_w = depth_r + 5'd1;
        end
        S_RETURN: begin
            
        end
    endcase    
end
always_ff @(posedge i_clk, negedge i_rst_n) begin
    if(!i_rst_n) begin
        state_r     => 5'd0;
    end
    else begin
        state_r     => state_w;
    end
end
endmodule