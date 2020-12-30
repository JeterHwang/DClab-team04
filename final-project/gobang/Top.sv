typedef logic [1:0] board [225];
typedef logic signed [31:0] MinMax_output;

module Top (
    input         avm_rst,
    input         avm_clk,
    output  [4:0] avm_address,
    output        avm_read,
    input  [31:0] avm_readdata,
    output        avm_write,
    output [31:0] avm_writedata,
    input         avm_waitrequest
);
RS232 rs232(
    .avm_rst(avm_rst),
    .avm_clk(avm_clk),
    .avm_address(avm_address),
    .avm_read(avm_read),
    .avm_readdata(avm_readdata),
    .avm_write(avm_write),
    .avm_writedata(avm_writedata),
    .avm_waitrequest(avm_waitrequest),
    .user_data(user_point),
    .read_finished(rs232_finish_read),
    .computer_data(computer_point),
    .ready_to_send(cal_finished)
);
// Suansha killer(
//     .i_clk(avm_clk),
// 	.i_rst_n(avm_rst),
// 	.i_start(),
//     .i_depth(),
// 	.i_board(),
//     .o_sha(),
//     .o_finish()
// );

// local variables 
board chess_board_r, chess_board_w;
logic MinMax_start_r, MinMax_start_w;
logic [4:0] MinMax_x_pos_w; 
logic [4:0] MinMax_y_pos_w;
logic MinMax_finish_w;

// modules interconnection
logic           finish_w[6];
logic           start_w[6];
board           board_w[6];
MinMax_output   MinMax_output_w[6];

assign MinMax_finish_w = finish_w[0];

root MinMax_Base(
    .i_clk(i_clk),
    .i_rst_n(i_rst_n),
    .i_start(MinMax_start_r),
    .i_next(finish_w[1]),
    .i_board(chess_board_r),
    .i_turn(1'b0),
    .o_horizontal(MinMax_x_pos_w),
    .o_vertical(MinMax_y_pos_w),
    .o_board(board_w[0]),
    .o_finish(finish_w[0])
    .o_start(start_w[0])
);

generate
    for(genvar i = 3'd1; i <= 3'd4; i = i + 3'd1) begin: iter1
        Minmax MinMax_Node(
            .i_clk(i_clk),
            .i_rst_n(i_rst_n),
            .i_start(start_w[i-1]),
            .i_next(finish_w[i+1]),
            .i_board(board_w[i-1]),
            .i_turn(i[0] & 1'b1),
            .o_board(board_w[i]),
            .o_point(MinMax_output_w[i]),
            .o_finish(finish_w[i]),
            .o_start(start_w[i])
        );
    end
endgenerate

leaf_node MinMax_Leaf(
    .i_clk(i_clk),
    .i_rst_n(i_rst_n),
    .i_start(start_w[4]),
    .i_turn(1'b1),
    .i_board(board_w[4]),
    .o_point(MinMax_output_w[5]),
    .o_finish(finish_w[5])
);

always_comb begin
    
end
always_ff @(posedge i_clk, negedge i_rst_n) begin
    if(!i_rst_n) begin
        
    end
    else begin
        
    end
end
endmodule