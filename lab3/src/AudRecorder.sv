module AudRecorder(
    input   i_rst_n,
    input   i_clk,
    input   i_lrc,
    input   i_start,
    input   i_pause,
    input   i_stop,
    input   i_data,
    output  o_address,
    output  o_data
);
localparam S_IDLE = 0;
localparam S_WAIT = 1;
localparam S_REC = 2;
localparam S_PAUSE = 3;
localparam S_FINISH = 4;

logic [1:0] state_r, state_w;
logic [19:0] address_r, address_w;
logic [15:0] data_r, data_w;
logic [19:0] counter_r, counter_w;
logic finish_r, finish_w;
assign o_address = address_r;
assign o_data = data_r;

always_comb begin
    state_w             = state_r;
    address_w           = address_r;
    data_w              = data_r;
    counter_w           = counter_r;
    finish_w            = finish_r;
    case (state_r) 
        S_IDLE: begin
            if(i_start) begin
                state_w = S_WAIT;
                counter_w = 0;
            end
        end
        S_WAIT: begin
            state_w = S_REC;
        end
        S_REC: begin
            if(i_pause) begin
                state_w = S_PAUSE;
            end
            if(!i_lrc) begin
                data_w[15-counter_r] = i_data;
                counter_w = counter_r+1;
                if(counter_w == 16) begin
                    address_w = address_r+1;
                    counter_w = 0;
                end
                if(address_w == 1024000 || i_stop) begin
                    state_w = S_FINISH;
                    counter_w = 0;
                    finish_w = 1;
                end
            end
        end
        S_PAUSE: begin
            if(finish_w == 1) begin
                state_w = S_FINISH;
            end
            if(!i_pause) begin
                state_w = S_REC;
            end
        end
        S_FINISH: begin
            counter_w = 0;
            state_w = S_IDLE;
        end
    endcase
end

always_ff @(posedge i_clk or posedge i_rst_n) begin
    if (i_rst_n) begin
        state_r             <= S_IDLE;
        address_r           <= address_w;
        data_r              <= data_w;
        counter_r           <= 0;
        finish_r            <= 0;
    end
    else begin
        state_r             <= state_w;
        address_r           <= address_w;
        data_r              <= data_w;
        counter_r           <= counter_w;
        finish_r            <= finish_w;
    end

end
endmodule