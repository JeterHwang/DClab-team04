module AudPlayer(
    input   i_rst_n,
    input   i_bclk,
    input   i_daclrck,
    input   i_en,
    input   [15:0] i_dac_data,
    output  o_aud_dacdat,
    output  o_sent_finished,
    output  [5:0] o_tplay
);
localparam S_IDLE   = 0;
localparam S_WAIT   = 1;
localparam S_DELAY  = 2;
localparam S_SEND   = 3;

logic aud_dacdat_r, aud_dacdat_w;
logic [4:0]  counter_r, counter_w;
logic [1:0]  state_r, state_w;
logic finished_w, finished_r;
logic [24:0] tcounter_r, tcounter_w;
logic [5:0] playtime_r, playtime_w;

assign o_sent_finished = finished_r;
assign o_aud_dacdat = (!i_daclrck) ? aud_dacdat_r : 16'b0;
assign o_tplay = playtime_r;
always_comb begin
    finished_w          = finished_r;
    aud_dacdat_w        = aud_dacdat_r;
    counter_w           = counter_r;
    state_w             = state_r;
    playtime_w          = playtime_r;
    tcounter_w          = tcounter_r+1;
    case (state_r)
        
        S_IDLE: begin
            finished_w = 0;
            if(!i_en) begin
                tcounter_w = tcounter_r;
                playtime_w = playtime_r;
                state_w = S_IDLE;
            end
            else begin
                if(i_en) begin
                    state_w = S_WAIT;
                    counter_w = 0;
                end
                if(tcounter_r == 25'hb71b00) begin
                    tcounter_w = 0;
                    playtime_w = playtime_r+1;
                end
                else begin
                    tcounter_w = tcounter_r+1;
                    playtime_w = playtime_r;
                end
            end
        end
        S_WAIT: begin
            if(i_daclrck)
                state_w = S_DELAY;
            if(tcounter_r == 25'hb71b00) begin
                tcounter_w = 0;
                playtime_w = playtime_r+1;
            end
            else begin
                tcounter_w = tcounter_r+1;
                playtime_w = playtime_r;
            end
        end
        S_DELAY: begin
            if(i_daclrck) begin 
                if(tcounter_r == 25'hb71b00) begin
                    tcounter_w = 25'h0;
                    playtime_w = playtime_r+1;
                end
                else begin
                    tcounter_w = tcounter_r+1;
                    playtime_w = playtime_r;
                end
            end
            if(!i_daclrck) begin
                aud_dacdat_w = i_dac_data[13 - counter_r];
                counter_w = counter_r + 1;
                state_w = S_SEND;
                if(tcounter_r == 25'hb71b00) begin
                    tcounter_w = 25'h0;
                    playtime_w = playtime_r+1;
                end
                else begin
                    tcounter_w = tcounter_r+1;
                    playtime_w = playtime_r;
                end
            end

        end
        S_SEND: begin
            if (counter_r == 14) begin
                state_w = S_IDLE;
                if(i_en)
				    finished_w = 1;
				else
					finished_w = 0;
            end
            
            else begin
                aud_dacdat_w = i_dac_data[13-counter_r];
                counter_w = counter_r + 1;
            end
            if(tcounter_r == 25'hb71b00) begin
                tcounter_w = 0;
                playtime_w = playtime_r+1;
            end
            else begin
                tcounter_w = tcounter_r+1;
                playtime_w = playtime_r;
            end
        end
    endcase
end

// @ posedge i_nclk could be wrong !!!!!
always_ff @(negedge i_bclk or negedge i_rst_n) begin
    if(!i_rst_n) begin
        aud_dacdat_r    <= aud_dacdat_w;
        counter_r       <= 0;
        state_r         <= S_IDLE;
        finished_r      <= 0;
        playtime_r      <= 0;
        tcounter_r      <= 0;
    end
    else begin
        aud_dacdat_r    <= aud_dacdat_w;
        counter_r       <= counter_w;
        state_r         <= state_w;
        finished_r      <= finished_w;
        playtime_r      <= playtime_w;
        tcounter_r      <= tcounter_w;
    end
end
endmodule
