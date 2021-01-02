module Find(
    input       i_clk,
    input       i_rst,
    input       i_start,
    input  [8:0] i_board,
    input  [8:0] i_have_chess,
    output [3:0] o_x,
	output [3:0] o_y,
    output       o_finished,
    output [3:0] o_ans
);

parameter S_IDLE = 0;
parameter S_CAL = 1;
logic [3:0] f_x_r,f_x_w,f_y_r,f_y_w;
logic [3:0] f_ans_r,f_ans_w;
logic f_finished_r,f_finished_w;
logic state_w,state_r;
logic [2:0]count_w,count_r;

assign o_x = f_x_r;
assign o_y = f_y_r;
assign o_finished = f_finished_r;
assign o_ans = f_ans_r;

always_comb begin
    f_x_w = f_x_r;
    f_y_w = f_y_r;
    f_ans_w = f_ans_r;
    f_finished_w = f_finished_r;
    state_w = state_r;
    count_w = count_r;
    if(state_r == S_IDLE)begin
        if(i_start)begin
            if(count_r >= 3)begin
                f_finished_w = 1;
                f_x_w = 4'd4;
                f_y_w = 4'd4;
                f_ans_w = 0;
                state_w = S_IDLE;
            end
            else begin
                state_w = S_CAL;
            end
        end
    end
    else if(state_r == S_CAL)begin
        count_w = count_r + 1;
//first time
        //center is black
        if(count_r == 2'b00)begin
            if(i_board[4] == 0)begin
                f_finished_w  = 1;
                state_w = S_IDLE;
                if(i_board[0] == 0 && i_have_chess[0] == 1)begin
                    f_x_w = 4'd2;
                    f_y_w = 4'd2;
                    f_ans_w = 4'd8;
                end
                else if (i_board[1] == 0 && i_have_chess[1] == 1 ) begin
                    f_x_w = 4'd2;
                    f_y_w = 4'd1;
                    f_ans_w = 4'd7;
                end
                else if (i_board[3] == 0 && i_have_chess[3] == 1 ) begin
                    f_x_w = 4'd1;
                    f_y_w = 4'd2;
                    f_ans_w = 4'd5;
                end
                else if (i_board[5] == 0 && i_have_chess[5] == 1 ) begin
                    f_x_w = 4'd1;
                    f_y_w = 4'd0;
                    f_ans_w = 4'd3;
                end
                else if (i_board[7] == 0 && i_have_chess[7] == 1) begin
                    f_x_w = 4'd0;
                    f_y_w = 4'd1;
                    f_ans_w = 4'd1;
                end
                else if (i_board[8] == 0 && i_have_chess[8] == 1 ) begin
                    f_x_w = 4'd0;
                    f_y_w = 4'd0;
                    f_ans_w = 4'd0;
                end
                else begin
                    f_x_w = 4'd0;
                    f_y_w = 4'd0;
                    f_ans_w = 4'd0;
                end
            end
            // center is white
            else if (i_board[4] == 1) begin
                f_finished_w  = 1;
                state_w = S_IDLE;
                //0
                if(i_board[0] == 0 && i_have_chess[0] == 1)begin
                    if(i_board[1] == 0 && i_have_chess[0] == 1)begin
                        f_x_w = 4'd0;
                        f_y_w = 4'd2;
                        f_ans_w = 4'd2;
                    end
                    else if (i_board[2] == 0 && i_have_chess[2] == 1) begin
                        f_x_w = 4'd0;
                        f_y_w = 4'd1;
                        f_ans_w = 4'd1;
                    end
                    else if (i_board[3] == 0 && i_have_chess[3] == 1) begin
                        f_x_w = 4'd2;
                        f_y_w = 4'd0;
                        f_ans_w = 4'd6;
                    end
                    else if (i_board[6] == 0 && i_have_chess[6] == 1) begin
                        f_x_w = 4'd1;
                        f_y_w = 4'd0;
                        f_ans_w = 4'd3;
                    end
                end
                //1
                else if(i_board[1] == 0 && i_have_chess[1] == 1)begin
                    if(i_board[2] == 0 && i_have_chess[2] == 1)begin
                        f_x_w = 4'd0;
                        f_y_w = 4'd0;
                        f_ans_w = 4'd0;
                    end
                end
                //2
                else if (i_board[2] == 0 && i_have_chess[2] == 1) begin
                    if(i_board[5] == 0 && i_have_chess[5] == 1)begin
                        f_x_w = 4'd2;
                        f_y_w = 4'd2;
                        f_ans_w = 4'd8;
                    end
                    else if(i_board[8] == 0 && i_have_chess[8] == 1)begin
                        f_x_w = 4'd1;
                        f_y_w = 4'd2;
                        f_ans_w = 4'd5;
                    end
                end
                //3
                else if (i_board[3] == 0 && i_have_chess[3] == 1) begin
                    if(i_board[6] == 0 && i_have_chess[6] == 1)begin
                        f_x_w = 4'd0;
                        f_y_w = 4'd0;
                        f_ans_w = 4'd0;
                    end
                end
                //5
                else if (i_board[5] == 0 && i_have_chess[5] == 1) begin
                    if(i_board[8] == 0 && i_have_chess[8] == 1)begin
                        f_x_w = 4'd0;
                        f_y_w = 4'd2;
                        f_ans_w = 4'd2;
                    end
                end
                //6
                else if (i_board[6] == 0 && i_have_chess[6] == 1 ) begin
                    if(i_board[7] == 0 && i_have_chess[7] == 1)begin
                        f_x_w = 4'd2;
                        f_y_w = 4'd2;
                        f_ans_w = 4'd8;
                    end
                    else if(i_board[8] == 0 && i_have_chess[8] == 1)begin
                        f_x_w = 4'd2;
                        f_y_w = 4'd1;
                        f_ans_w = 4'd7;
                    end
                end
                //7
                else if (i_board[7] == 0 && i_have_chess[7] == 1) begin
                    if(i_board[8] == 0 && i_have_chess[8] == 1)begin
                        f_x_w = 4'd2;
                        f_y_w = 4'd0;
                        f_ans_w = 4'd6;
                    end
                end
                else begin
                    f_x_w = 4'd0;
                    f_y_w = 4'd0;
                    f_ans_w = 4'd0;
                end
            end
            else begin
                f_x_w = 4'd0;
                f_y_w = 4'd0;
                f_ans_w = 4'd0;
            end
        end
//second time
        else if (count_r == 2'b01) begin  
        //center is black
            if(i_board[4] == 0)begin
                f_finished_w  = 1;
                state_w = S_IDLE;
                if (i_board[2] == 0 && i_have_chess[2] == 1) begin
                    if(i_have_chess[3] == 0)begin
                        f_x_w = 4'd1;
                        f_y_w = 4'd0;
                        f_ans_w = 4'd3;
                        count_w = 3; //finish
                    end
                    else begin
                        f_x_w = 4'd1;
                        f_y_w = 4'd2;
                        f_ans_w = 4'd5;
                    end
                end
                else if(i_board[0] == 0 && i_have_chess[0] == 1 && i_have_chess[8] == 0)begin
                    f_x_w = 4'd2;
                    f_y_w = 4'd2;
                    f_ans_w = 4'd8;
                end
                else if (i_board[1] == 0 && i_have_chess[1] == 1 && i_have_chess[7] == 0) begin
                    f_x_w = 4'd2;
                    f_y_w = 4'd1;
                    f_ans_w = 4'd7;
                end
                else if (i_board[3] == 0 && i_have_chess[3] == 1 && i_have_chess[5] == 0) begin
                    f_x_w = 4'd1;
                    f_y_w = 4'd2;
                    f_ans_w = 4'd5;
                end
                else if (i_board[5] == 0 && i_have_chess[5] == 1 && i_have_chess[3] == 0) begin
                    f_x_w = 4'd1;
                    f_y_w = 4'd0;
                    f_ans_w = 4'd3;
                end
                else if (i_board[7] == 0 && i_have_chess[7] == 1 && i_have_chess[1] == 0) begin
                    f_x_w = 4'd0;
                    f_y_w = 4'd1;
                    f_ans_w = 4'd1;
                end
                else if (i_board[8] == 0 && i_have_chess[8] == 1 && i_have_chess[0] == 0) begin
                    f_x_w = 4'd0;
                    f_y_w = 4'd0;
                    f_ans_w = 4'd0;
                end
                else begin
                    f_x_w = 4'd1;
                    f_y_w = 4'd0;
                    f_ans_w = 4'd3;
                end
            end
        // center is white
            else if (i_board[4] == 1) begin
                f_finished_w  = 1;
                state_w = S_IDLE;
                //0
                if(i_board[0] == 0 && i_have_chess[0] == 1)begin
                    if(i_board[1] == 0 && i_have_chess[0] == 1 && i_have_chess[2] == 0)begin
                        f_x_w = 4'd0;
                        f_y_w = 4'd2;
                        f_ans_w = 4'd2;
                    end
                    else if (i_board[2] == 0 && i_have_chess[2] == 1&& i_have_chess[1] == 0) begin
                        f_x_w = 4'd0;
                        f_y_w = 4'd1;
                        f_ans_w = 4'd1;
                    end
                    else if (i_board[3] == 0 && i_have_chess[3] == 1&& i_have_chess[6] == 0) begin
                        f_x_w = 4'd2;
                        f_y_w = 4'd0;
                        f_ans_w = 4'd6;
                    end
                    else if (i_board[6] == 0 && i_have_chess[6] == 1&& i_have_chess[3] == 0) begin
                        f_x_w = 4'd1;
                        f_y_w = 4'd0;
                        f_ans_w = 4'd3;
                    end
                end
                //1
                else if(i_board[1] == 0 && i_have_chess[1] == 1)begin
                    if(i_board[2] == 0 && i_have_chess[2] == 1 && i_have_chess[0] == 0)begin
                        f_x_w = 4'd0;
                        f_y_w = 4'd0;
                        f_ans_w = 4'd0;
                    end
                end
                //2
                else if (i_board[2] == 0 && i_have_chess[2] == 1) begin
                    if(i_board[5] == 0 && i_have_chess[5] == 1 && i_have_chess[8] == 0)begin
                        f_x_w = 4'd2;
                        f_y_w = 4'd2;
                        f_ans_w = 4'd8;
                    end
                    else if(i_board[8] == 0 && i_have_chess[8] == 1 && i_have_chess[5] == 0)begin
                        f_x_w = 4'd1;
                        f_y_w = 4'd2;
                        f_ans_w = 4'd5;
                    end
                end
                //3
                else if (i_board[3] == 0 && i_have_chess[3] == 1) begin
                    if(i_board[6] == 0 && i_have_chess[6] == 1 && i_have_chess[0] == 0)begin
                        f_x_w = 4'd0;
                        f_y_w = 4'd0;
                        f_ans_w = 4'd0;
                    end
                end
                //5
                else if (i_board[5] == 0 && i_have_chess[5] == 1) begin
                    if(i_board[8] == 0 && i_have_chess[8] == 1 && i_have_chess[2] == 0)begin
                        f_x_w = 4'd0;
                        f_y_w = 4'd2;
                        f_ans_w = 4'd2;
                    end
                end
                //6
                else if (i_board[6] == 0 && i_have_chess[6] == 1 ) begin
                    if(i_board[7] == 0 && i_have_chess[7] == 1 && i_have_chess[8] == 0)begin
                        f_x_w = 4'd2;
                        f_y_w = 4'd2;
                        f_ans_w = 4'd8;
                    end
                    else if(i_board[8] == 0 && i_have_chess[8] == 1 && i_have_chess[7] == 0)begin
                        f_x_w = 4'd2;
                        f_y_w = 4'd1;
                        f_ans_w = 4'd7;
                    end
                end
                //7
                else if (i_board[7] == 0 && i_have_chess[7] == 1) begin
                    if(i_board[8] == 0 && i_have_chess[8] == 1 && i_have_chess[6] == 0)begin
                        f_x_w = 4'd2;
                        f_y_w = 4'd0;
                        f_ans_w = 4'd6;
                    end
                end
                else begin
                    f_x_w = 4'd0;
                    f_y_w = 4'd0;
                    f_ans_w = 4'd0;
                end
            end
            else begin
                f_x_w = 4'd4;
                f_y_w = 4'd4;
                f_ans_w = 4'd0;
            end
        end
//third time
        else if (count_r == 2'b10) begin 
            //center is black
            if(i_board[4] == 0)begin
                f_finished_w  = 1;
                state_w = S_IDLE;
                if (i_board[2] == 0 && i_have_chess[2] == 1) begin
                    if(i_have_chess[3] == 0)begin
                        f_x_w = 4'd1;
                        f_y_w = 4'd0;
                        f_ans_w = 4'd3;
                    end
                    else if(i_board[8] == 0 && i_have_chess[8] == 1) begin
                        f_x_w = 4'd2;
                        f_y_w = 4'd1;
                        f_ans_w = 4'd7;
                    end
                end
                else if(i_board[0] == 0 && i_have_chess[0] == 1 && i_have_chess[8] == 0)begin
                    f_x_w = 4'd2;
                    f_y_w = 4'd2;
                    f_ans_w = 4'd8;
                end
                else if (i_board[1] == 0 && i_have_chess[1] == 1 && i_have_chess[7] == 0) begin
                    f_x_w = 4'd2;
                    f_y_w = 4'd1;
                    f_ans_w = 4'd7;
                end
                else if (i_board[3] == 0 && i_have_chess[3] == 1 && i_have_chess[5] == 0) begin
                    f_x_w = 4'd1;
                    f_y_w = 4'd2;
                    f_ans_w = 4'd5;
                end
                else if (i_board[5] == 0 && i_have_chess[5] == 1 && i_have_chess[3] == 0) begin
                    f_x_w = 4'd1;
                    f_y_w = 4'd0;
                    f_ans_w = 4'd3;
                end
                else if (i_board[7] == 0 && i_have_chess[7] == 1 && i_have_chess[1] == 0) begin
                    f_x_w = 4'd0;
                    f_y_w = 4'd1;
                    f_ans_w = 4'd1;
                end
                else if (i_board[8] == 0 && i_have_chess[8] == 1 && i_have_chess[0] == 0) begin
                    f_x_w = 4'd0;
                    f_y_w = 4'd0;
                    f_ans_w = 4'd0;
                end
                
                else begin
                    f_x_w = 4'd2;
                    f_y_w = 4'd1;
                    f_ans_w = 4'd7;
                end
            end
            //center is white
            else if (i_board[4] == 1) begin
                f_finished_w  = 1;
                state_w = S_IDLE;
                //0
                if(i_board[0] == 0 && i_have_chess[0] == 1)begin
                    if(i_board[1] == 0 && i_have_chess[0] == 1 && i_have_chess[2] == 0)begin
                        f_x_w = 4'd0;
                        f_y_w = 4'd2;
                        f_ans_w = 4'd2;
                    end
                    else if (i_board[2] == 0 && i_have_chess[2] == 1&& i_have_chess[1] == 0) begin
                        f_x_w = 4'd0;
                        f_y_w = 4'd1;
                        f_ans_w = 4'd1;
                    end
                    else if (i_board[3] == 0 && i_have_chess[3] == 1&& i_have_chess[6] == 0) begin
                        f_x_w = 4'd2;
                        f_y_w = 4'd0;
                        f_ans_w = 4'd6;
                    end
                    else if (i_board[6] == 0 && i_have_chess[6] == 1&& i_have_chess[3] == 0) begin
                        f_x_w = 4'd1;
                        f_y_w = 4'd0;
                        f_ans_w = 4'd3;
                    end
                end
                //1
                else if(i_board[1] == 0 && i_have_chess[1] == 1)begin
                    if(i_board[2] == 0 && i_have_chess[2] == 1 && i_have_chess[0] == 0)begin
                        f_x_w = 4'd0;
                        f_y_w = 4'd0;
                        f_ans_w = 4'd0;
                    end
                end
                //2
                else if (i_board[2] == 0 && i_have_chess[2] == 1) begin
                    if(i_board[5] == 0 && i_have_chess[5] == 1 && i_have_chess[8] == 0)begin
                        f_x_w = 4'd2;
                        f_y_w = 4'd2;
                        f_ans_w = 4'd8;
                    end
                    else if(i_board[8] == 0 && i_have_chess[8] == 1 && i_have_chess[5] == 0)begin
                        f_x_w = 4'd1;
                        f_y_w = 4'd2;
                        f_ans_w = 4'd5;
                    end
                end
                //3
                else if (i_board[3] == 0 && i_have_chess[3] == 1) begin
                    if(i_board[6] == 0 && i_have_chess[6] == 1 && i_have_chess[0] == 0)begin
                        f_x_w = 4'd0;
                        f_y_w = 4'd0;
                        f_ans_w = 4'd0;
                    end
                end
                //5
                else if (i_board[5] == 0 && i_have_chess[5] == 1) begin
                    if(i_board[8] == 0 && i_have_chess[8] == 1 && i_have_chess[2] == 0)begin
                        f_x_w = 4'd0;
                        f_y_w = 4'd2;
                        f_ans_w = 4'd2;
                    end
                end
                //6
                else if (i_board[6] == 0 && i_have_chess[6] == 1 ) begin
                    if(i_board[7] == 0 && i_have_chess[7] == 1 && i_have_chess[8] == 0)begin
                        f_x_w = 4'd2;
                        f_y_w = 4'd2;
                        f_ans_w = 4'd8;
                    end
                    else if(i_board[8] == 0 && i_have_chess[8] == 1 && i_have_chess[7] == 0)begin
                        f_x_w = 4'd2;
                        f_y_w = 4'd1;
                        f_ans_w = 4'd7;
                    end
                end
                //7
                else if (i_board[7] == 0 && i_have_chess[7] == 1) begin
                    if(i_board[8] == 0 && i_have_chess[8] == 1 && i_have_chess[6] == 0)begin
                        f_x_w = 4'd2;
                        f_y_w = 4'd0;
                        f_ans_w = 4'd6;
                    end
                end
                else begin
                    f_x_w = 4'd0;
                    f_y_w = 4'd0;
                    f_ans_w = 4'd0;
                end
            end
            else begin
                f_x_w = 4'd4;
                f_y_w = 4'd4;
                f_ans_w = 4'd0;
            end
        end
        else begin
            f_finished_w = 1;
            f_x_w = 4'd4;
            f_y_w = 4'd4;
            f_ans_w = 4'd0;
        end
    end
    else begin
        f_x_w = f_x_r;
        f_y_w = f_y_r;
        f_ans_w = f_ans_r;
        f_finished_w = f_finished_r;
        state_w = state_r;
        count_w = count_r;
    end

end

always_ff @(posedge i_clk or negedge i_rst) begin
        if (!i_rst) begin
            state_r <= S_IDLE;
            f_x_r <= 4'b0;
            f_y_r <= 4'b0;
            f_ans_r<= 4'b0;
            f_finished_r<=0;
            count_r <= 0;
        end
        else begin
            state_r <= state_w;
            f_x_r <= f_x_w;
            f_y_r <= f_y_w;
            f_ans_r<=f_ans_w;
            f_finished_r<= f_finished_w; 
            count_r <= count_w;
        end
end
endmodule