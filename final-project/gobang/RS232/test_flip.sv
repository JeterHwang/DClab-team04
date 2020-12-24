module Flip(
    input       i_clk,
    input       i_rst
    input       i_start,
    input [7:0] i_data,
    output[7:0] o_data,
    output      o_finished
);
    parameter S_IDLE = 0;
    parameter S_FLIP = 1;

    logic i_data_r,i_data_w;
    logic o_data_r,o_data_w;
    logic finished_r,finished_w;
    logic [3:0] x_r,x_w;
    logic [3:0] y_r,y_w;
    logic state_r,state_w;

    assign o_data = o_data_r;
    assign o_finished = finished_r;

    always_comb begin
        state_w = state_r;
        x_w = x_r;
        y_w = y_r;
        finished_w = finished_r;
        i_data_w = i_data_r;
        o_data_w = o_data_r;

        if (state_r == S_IDLE) begin
            if(i_start)begin
                state_w = S_FLIP;
                i_data_w = i_data;
            end
        end
        else if(state_r == S_FLIP)begin
            finished_w = 1;
            o_data_w[3:0] = i_data_r[7:4];
            o_data_w[7:4] = i_data_r[3:0];
            x_w           = i_data_r[7:4];
            y_w           = i_data_r[3:0];
        end
        else begin
            state_w = state_r;
            x_w = x_r;
            y_w = y_r;
            finished_w = finished_r;
            i_data_w = i_data_r;
            o_data_w = o_data_r;
        end
    end
    always_ff @(posedge i_clk or negedge i_rst) begin
        if (!i_rst) begin
            state_r     <= S_IDLE;
            x_r         <= 4'b0;
            y_r         <= 4'b0;
            finished_r  <= 1'b0;
            i_data_r    <= i_data_w;
            o_data_r    <= o_data_w;
        end
        else begin
            state_r     <= state_w;
            finished_r  <= finished_w;
            x_r         <= x_w;
            y_r         <= y_w;
            i_data_r    <= i_data_w;
            o_data_r    <= o_data_w;
        end
    end
endmodule