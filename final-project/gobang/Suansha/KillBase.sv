typedef logic [1:0] chess_board [225];
module Kill_base(
    input               i_clk,
	input               i_rst_n,
	input               i_start,
    input     [4:0]     i_depth,
	input  chess_board  i_board,
    output              o_sha,
    output              o_finish
);

// wires 
chess_board board_w[11];
logic finish_w[11];
logic result_w[11];
logic start_w[11];

assign o_sha = result_w[0];
assign o_finish = finish_w[0];

generate;
    for(genvar i = 5'd0, j = i_depth; i < 5'd10; i = i + 5'd1) begin
        if(j != 5'd0)
            j = j - 5'd1;
        if(i == 5'd0) begin
            Kill_node node(
                .i_clk(i_clk),
                .i_rst_n(i_rst_n),
                .i_start(i_start),
                .i_depth(j),
                .i_next(finish_w[1]),
                .i_sha(result_w[1]),
                .i_board(i_board),
                .o_board(board_w[0]),
                .o_sha(result_w[0]),
                .o_finish(finish_w[0]),
                .o_start(start_w[0])
            );    
        end
        else begin
            Kill_node node(
                .i_clk(i_clk),
                .i_rst_n(i_rst_n),
                .i_start(start_w[i-1]),
                .i_depth(j),
                .i_next(finish_w[i+1]),
                .i_sha(result_w[i+1]),
                .i_board(board_w[i-1]),
                .o_board(board_w[i]),
                .o_sha(result_w[i]),
                .o_finish(finish_w[i]),
                .o_start(start_w[i])
            );
        end
    end
endgenerate