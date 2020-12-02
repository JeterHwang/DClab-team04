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
parameter S_IDLE 		= 4'd0;
parameter S_WAIT 		= 4'd1;
parameter S_REC 		= 4'd2;
parameter S_PAUSE 	= 4'd3;
parameter S_FINISH 	= 4'd4;

logic [3:0] state_r, state_w;
logic [19:0] address_r, address_w;
logic [15:0] data_r, data_w;
logic [4:0] counter_r, counter_w;
logic cycle_w, cycle_r;
logic pause_w, pause_r;
logic finish_r, finish_w;

assign o_address    = address_r;
assign o_data       = data_r;
assign o_finish     = finish_r;

always_comb begin
    state_w             = state_r;
    address_w           = address_r;
    data_w              = data_r;
    counter_w           = counter_r;
    finish_w            = finish_r;
    cycle_w             = cycle_r;
	 
	 if(i_start) pause_w = ~pause_r;
	 else pause_w = pause_r;
	 
	 case (state_r) 
        S_IDLE: begin
            if(i_start) begin   // rise edge trigger
                state_w = S_WAIT;
                data_w = 16'd0;
                counter_w = 0;
                finish_w  = 0;
                address_w = 0;
					 pause_w   = 0;
            end
        end
        S_WAIT: begin
            if(i_stop) begin
                finish_w = 1;
                state_w = S_FINISH;
            end
				else if(i_lrc) begin
					counter_w = 0;
					cycle_w = 0;
				end
				else if(!i_lrc && pause_r == 0 && cycle_r == 0) begin
					data_w[15-counter_r] = i_data;
					counter_w = counter_r+1;
					state_w = S_REC;
				end
				
        end
        S_REC: begin
				if(address_r == 20'd1024000 || i_stop) begin
                state_w = S_FINISH;
                counter_w = counter_r;
                data_w = data_r;
                finish_w = 1;
            end 
				else begin
                if(counter_r == 16) begin
                    address_w = address_r+1;
                    counter_w = counter_r;
                    cycle_w = 1;
                    state_w = S_WAIT;
                end
                else begin
                    data_w[15-counter_r] = i_data;
                    counter_w = counter_r+1;
                end
            end
        end
        S_FINISH: begin
            state_w = S_IDLE;
        end
    endcase
end

always_ff @(negedge i_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        state_r             <= S_IDLE;
        address_r           <= 0;
        data_r              <= 0;
        counter_r           <= 0;
        finish_r            <= 0;
        pause_r             <= 1;
        cycle_r             <= 0;
    end
    else begin
        state_r             <= state_w;
        address_r           <= address_w;
        data_r              <= data_w;
        counter_r           <= counter_w;
        finish_r            <= finish_w;
        pause_r             <= pause_w;
        cycle_r             <= cycle_w;
    end

end
endmodule
