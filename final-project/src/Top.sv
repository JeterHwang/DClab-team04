typedef logic [1:0] board [256];
typedef logic [4:0] depth;
typedef logic [4:0] horizontal;
typedef logic [4:0] vertical;
typedef logic signed [31:0] MinMax_output;

module Top(
    input           i_clk,
    input           i_rst_n,
    input           i_start,
    output  [4:0]   o_horizontal,
    output  [4:0]   o_vertical
);

logic           turn_w[5];
logic           start_w[5];
depth           depth_w[5];
board           board_w[5];
horizontal      horizontal_w[5];
vertical        vertical_w[5];  
MinMax_output   MinMax_output_w[5];

generate
    for(genvar i = 3'd0; i <= 3'd4; i = i + 3'd1) begin: iter1
        if(i == 0) begin
            Minmax base(
                .i_clk(i_clk),
                .i_rst_n(i_rst_n),
                .i_start(MinMax_start_r),
                .i_board(chess_board_r),
                .i_turn(1'b0),
                .i_depth(5'd4),
                .o_horizontal(horizontal_w[i]),
                .o_vertical(vertical_w[i]),
                .o_point(MinMax_output_w[i])
                .o_finish(MinMax_finish_w)
            );
        end
        else begin
            Minmax minmax(
                .i_clk(i_clk),
                .i_rst_n(i_rst_n),
                .i_start(),
                .i_board(),
                .i_turn(),
                .i_depth(),
                .o_horizontal(),
                .o_vertical(),
                .o_point()
            );
        end
    end
endgenerate

board chess_board_r, chess_board_w;
logic MinMax_start_r, MinMax_start_w;
logic MinMax_x_pos_r, MinMax_x_pos_w; 
logic MinMax_y_pos_r, MinMax_y_pos_w;
logic MinMax_finish_w;
always_comb begin
    
end
always_ff @(posedge i_clk, negedge i_rst_n) begin
    if(!i_rst_n) begin
        
    end
    else begin
        
    end
end
endmodule