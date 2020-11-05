module AudPlayer(
    input   i_rst_n,
    input   i_bclk,
    input   i_daclrck,
    input   i_en,
    input   i_dac_data,
    output  o_aud_dacdat
);

logic [15:0] aud_dacdat_r, aud_dacdat_w;
logic [3:0]  counter_r, counter_w;
logic state_r, state_w;
assign o_aud_dactdat = aud_dacdat_r;

always_comb begin
    aud_dacdat_w        = aud_dacdat_r;
    counter_w           = counter_r;
    state_w             = state_r;
    case (state_r)
        IDLE: begin
            if (i_en && !i_daclrck) begin
                state_w = WAIT;
                counter_w = 0;
            end
            else begin
                counter_w = 0;
        end
        WAIT: begin
            state_w = SEND;
        end
        SEND: begin
            if (counter_w != 16) begin
                aud_dacdat_w = i_dac_data[15 - counter_r];
                counter_w = counter_r+1;
            end
            else if (counter_w == 16) begin
                counter_w = 0;
                if (i_daclrck) begin
                    state_w = IDLE;
                end
            end
        end
    end

// @ posedge i_nclk could be wrong !!!!!
always_ff @(negedge i_bclk or negedge i_rst_n) begin
    if (i_rst_n) begin
        aud_dacdat_r    <= aud_dacdat_w;
        counter_r       <= 0;
        state_r         <= IDLE;
    end
    else begin
        aud_dacdat_r    <= aud_dacdat_w;
        counter_r       <= counter_w;
        state_r         <= state_w;

    end
end
endmodule
