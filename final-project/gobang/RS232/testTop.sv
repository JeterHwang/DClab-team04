typedef logic [1:0] board [225];

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
    .computer_data(computer_point_r),
    .ready_to_send(cal_finished_r)
);

DFS dfs(		// 
	.i_clk(avm_clk),
	.i_rst_n(avm_rst),
	.i_start(cal_start_r),
	.i_depth(5'd2),
	.i_board(my_board_r),    
    .o_Xpos(computer_x),     
	.o_Ypos(computer_y),      
	.o_finish(cal_finished_w),
	.o_kill(ai_got_kill)
);
logic [7:0] user_point;
logic [7:0] computer_point_r,computer_point_w;
// logic [7:0] user_coordinate_w,user_coordinate_r;
logic rs232_finish_read;
logic cal_finished_r,cal_finished_w;
logic cal_start_r,cal_start_w;
logic [3:0] computer_x,computer_y;
logic [3:0] state_w,state_r;
logic ai_got_kill;
board my_board_r,my_board_w;

parameter S_IDLE  = 0;
parameter S_READ  = 1;
parameter S_CALCULATE = 2;
parameter S_WRITE = 3;

always_comb begin
    state_w = state_r;
    cal_start_w = cal_start_r;
    cal_finished_w = cal_finished_r;
    computer_point_w = computer_point_r;
    case (state_r)
        S_IDLE:begin
                state_w = S_READ;
        end
        S_READ:begin
            if(rs232_finish_read == 1)begin
                state_w = S_CALCULATE;
                cal_start_w = 1;
                my_board_w[user_point] = 1;
            end
        end
        S_CALCULATE:begin
            cal_start_w = 0;
            if(cal_finished_w == 1)begin
                state_w = S_WRITE;
                computer_point_w = {computer_x,computer_y};
            end
        end
        S_WRITE:begin
            state_w = S_IDLE;
			cal_finished_w = 0;
        end
        
        default: begin
            state_w = state_r;
            cal_finished_w = cal_finished_r;
            computer_point_w = computer_point_r;
        end
    endcase
    
end
always_ff @(posedge avm_clk or negedge avm_rst) begin
    if (!avm_rst) begin
        computer_point_r        <= 8'b0;
        state_r                 <= S_IDLE;
        cal_finished_r          <= 0;
        cal_start_r             <= 0;
    end 
    else begin
        computer_point_r    <= computer_point_w;
        state_r             <= state_w;
        cal_finished_r      <= cal_finished_w;
        cal_start_r         <= cal_start_w;
    end
end
endmodule
