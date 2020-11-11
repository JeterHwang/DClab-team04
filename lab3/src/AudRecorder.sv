module AudRecorder(
    input   i_rst_n,
    input   i_clk,
    input   i_lrc,
    input   i_start,
    input   i_pause,
    input   i_stop,
    input   i_data,
    output  [19:0] o_address,
    output  [15:0] o_data,
    output  o_finish
);
localparam S_IDLE = 0;
localparam S_WAIT = 1;
localparam S_REC = 2;
localparam S_PAUSE = 3;
localparam S_FINISH = 4;

logic [3:0] state_r, state_w;
logic [19:0] address_r, address_w;
logic [15:0] data_r, data_w;
logic [4:0] counter_r, counter_w;
logic cycle_w, cycle_r;
logic pause_w, pause_r;
logic finish_r, finish_w;
logic start_r, start_w;
logic Tpause_r, Tpause_w;
assign o_address    = address_r;
assign o_data       = data_r;
assign o_finish     = finish_r;
always_comb begin
    state_w             = state_r;
    address_w           = address_r;
    data_w              = data_r;
    counter_w           = counter_r;
    finish_w            = finish_r;
    pause_w             = pause_r;
    cycle_w             = cycle_r;
    start_w             = i_start;
    Tpause_w            = i_pause;
    case (state_r) 
        S_IDLE: begin
            if(!i_start && start_r) begin   // falls edge trigger
                state_w = S_WAIT;
                counter_w = 0;
                finish_w  = 0;
                address_w = 0;
            end
        end
        S_WAIT: begin
            if(i_lrc) begin
                counter_w = 0;
                cycle_w = 0;
                pause_w = 0;
                state_w = S_WAIT;
            end
            else if (!i_lrc && pause_r == 1) begin
                state_w = S_WAIT;
            end
            else if (!i_lrc && pause_r == 0 && cycle_r == 0) begin
                data_w[15-counter_r] = i_data;
                counter_w = counter_r+1;
                state_w = S_REC;
            end
            else if (!i_lrc && pause_r == 0 && cycle_r == 1) begin
                state_w = S_WAIT;
            end
        end

        S_REC: begin
            if(!i_pause && Tpause_r) begin
                counter_w = counter_r+1;
                data_w[15-counter_r] = i_data;
                pause_w = 1;
                state_w = S_PAUSE;
            end
            else if(address_r == 20'd1024000 || i_stop) begin
                state_w = S_FINISH;
                counter_w = counter_r;
                data_w = data_r;
                finish_w = 1;
            end
            else begin
                if(!i_lrc) begin
                    if(counter_r == 16) begin
                        address_w = address_r+1;
                        counter_w = counter_r;
                        cycle_w = 1;
                        state_w = S_WAIT;
                    end
                    else begin
                        data_w[15-counter_r] = i_data;
                        counter_w = counter_r+1;
                        state_w = S_REC;
                    end
                end
                else begin 
                    counter_w = 0;
                end
            end
        end
        S_PAUSE: begin           
            if(i_stop == 1) begin
                finish_w = 1;
                state_w = S_FINISH;
            end
            else if (!i_pause && Tpause_r) begin
                counter_w = counter_r;
                data_w = data_r;
                state_w = S_WAIT;
            end
            else begin
                if(counter_r == 16) begin
                    address_w = address_r+1;
                    counter_w = counter_r+1;
                    data_w = data_r;
                    state_w = S_PAUSE;
                end
                else if (counter_r < 16) begin
                    data_w[15-counter_r] = i_data;
                    counter_w = counter_r+1;
                    state_w = S_PAUSE;
                end
                else begin
                    address_w = address_r;
                    counter_w = counter_r;
                    data_w = data_r;
                    state_w = S_PAUSE;
                end
            end
        end
        S_FINISH: begin
            
            state_w = S_IDLE;
            
        end
    endcase
end

always_ff @(negedge i_clk or posedge i_rst_n) begin
    if (i_rst_n) begin
        state_r             <= S_IDLE;
        address_r           <= 0;
        data_r              <= 0;
        counter_r           <= 0;
        finish_r            <= 0;
        pause_r             <= 0;
        cycle_r             <= 0;
        start_r             <= 0;
        Tpause_r            <= 0;
    end
    else begin
        state_r             <= state_w;
        address_r           <= address_w;
        data_r              <= data_w;
        counter_r           <= counter_w;
        finish_r            <= finish_w;
        pause_r             <= pause_w;
        cycle_r             <= cycle_w;
        start_r             <= start_w;
        Tpause_r            <= Tpause_w;
    end

end
endmodule
