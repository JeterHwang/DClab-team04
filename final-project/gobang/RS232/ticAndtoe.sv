module tic(
    input       i_clk,
    input       i_rst,
    input       i_start,
    input [7:0] i_data,
    output[3:0] o_x,
	output[3:0] o_y,
    output      o_finished
);

    Find f1(
        .i_clk(i_clk),
        .i_rst(i_rst),
        .i_start(start_find_r),
        .i_board(board_r),
        .i_have_chess(have_chess_r),
        .o_x(find_x),
        .o_y(find_y),
        .o_finished(find_finished),
        .o_ans(find_ans)
    );
    parameter S_IDLE = 0;
    parameter S_DEFENSE = 1;
    parameter S_CONSTRACT = 2;
    parameter S_FIND = 3;


    logic [8:0]board_w,board_r,have_chess_w,have_chess_r;
    logic [7:0]i_data_r,i_data_w;
    logic [7:0]o_data_r,o_data_w;
    logic finished_r,finished_w;
    logic find_finished,find_ans;
    logic [3:0] find_x,find_y;
    logic start_find_r,start_find_w;
    logic first_step_r,first_step_w;
    // logic [3:0] x_r,x_w;
    // logic [3:0] y_r,y_w;
    logic [3:0] place_w,place_r;
    logic [1:0]state_r,state_w;

    assign o_x = o_data_r[7:4];
	assign o_y = o_data_r[3:0];
    assign o_finished = finished_r;

    always_comb begin
        state_w = state_r;
        start_find_w = start_find_r;
        // x_w = x_r;
        // y_w = y_r;
        finished_w = finished_r;
        i_data_w = i_data_r;
        o_data_w = o_data_r;
        place_w = place_r;
        first_step_w =first_step_r;
        if (state_r == S_IDLE) begin
			finished_w = 0;
            if(i_start)begin
                // x_w = i_data[7:4];
				// y_w = i_data[3:0];
                if(i_data[7:4] > 4'd2 || i_data[3:0] > 2 || have_chess_r == 9'b111111111) begin
                    state_w = S_IDLE;
                    finish_w = 1;
                    o_data_w = i_data;
                end
                else begin
                    place_w = 3*i_data[7:4]+i_data[3:0];
                    state_w = S_CONSTRACT;
                end
            end
        end
        else if(state_r == S_DEFENSE)begin
			state_w = S_IDLE;
            finished_w = 1;
            if(i_data != 8'b0001_0001)begin
                have_chess_w[4] = 1;
                board_w[4]  = 1; 
                o_data_w[3:0] = 4'b0001;
                o_data_w[7:4] = 4'b0001;
            end
            else begin
                have_chess_w[6] = 1;
                board_w[6]  = 1; 
                o_data_w[3:0] = 4'b0011;
                o_data_w[7:4] = 4'b0000;
            end
        end
        else if (state_r == S_CONSTRACT) begin
            board_w[place_r] = 0;
            have_chess_w[place_r] = 1;
            if(first_step_r == 1)begin
                first_step_w = 0;
                state_w = S_DEFENSE;
            end
            else begin
                start_find_w = 1;
                state_w = S_FIND;
            end
        end
        else if (state_r == S_FIND) begin
            start_find_w = 0;
            if(find_finish)begin
                state_w = S_IDLE;
                finish_w = 1;
                o_data_w = {find_x,find_y};
                have_chess_w[find_ans] = 1;
                board_w[find_ans] = 1;
            end
        end
        else begin
            state_w = state_r;
            // x_w = x_r;
            // y_w = y_r;
            finished_w = finished_r;
            i_data_w = i_data_r;
            o_data_w = o_data_r;
            board_w = board_r;
            place_w = place_w;
            have_chess_w = have_chess_r;
            start_find_w = start_find_r;
            first_step_w = first_step_r;
        end
    end
    always_ff @(posedge i_clk or negedge i_rst) begin
        if (!i_rst) begin
            place_r     <= 0;
            board_r     <= 0;
            have_chess_r<= 0;
            first_step_r<= 1;
            start_find_r<= 0;
            state_r     <= S_IDLE;
            // x_r         <= 4'b0;
            // y_r         <= 4'b0;
            finished_r  <= 1'b0;
            i_data_r    <= i_data_w;
            o_data_r    <= o_data_w;
        end
        else begin
            place_r             <= place_w;
            board_r             <= board_w;
            have_chess_r        <= have_chess_w;
            first_step_r        <=first_step_w;
            start_find_r        <=start_find_w;
            state_r             <= state_w;
            finished_r          <= finished_w;
            // x_r                 <= x_w;
            // y_r                 <= y_w;
            i_data_r            <= i_data_w;
            o_data_r            <= o_data_w;
        end
    end
endmodule