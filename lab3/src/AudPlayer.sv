module AudPlayer(
    input   i_rst_n,
    input   i_bclk,
    input   i_daclrck,
    input   i_en,
    input   [15:0] i_dac_data,
    output  o_aud_dacdat
);
localparam S_IDLE   = 0;
localparam S_WAIT   = 1;
localparam S_DELAY  = 2;
localparam S_SEND   = 3;

logic aud_dacdat_r, aud_dacdat_w;
logic [3:0]  counter_r, counter_w;
logic [1:0]  state_r, state_w;

assign o_aud_dactdat = aud_dacdat_r;

always_comb begin
    aud_dacdat_w        = aud_dacdat_r;
    counter_w           = counter_r;
    state_w             = state_r;
    case (state_r)
        S_IDLE: begin
            if(i_en) begin
                state_w = S_WAIT;
                counter_w = 0;
            end
        end
        S_WAIT: begin
            if(i_daclrck)
                state_w = S_DELAY;
        end
        S_DELAY: begin
            if(!i_daclrck)
                state_w = S_SEND;
        end
        S_SEND: begin
            if (counter_r != 16) begin
                aud_dacdat_w = i_dac_data[15-counter_r];
                counter_w = counter_r + 1;
            end
            else if (counter_r == 16) begin
                state_w = S_IDLE;
            end
        end
    endcase
end

// @ posedge i_nclk could be wrong !!!!!
always_ff @(negedge i_bclk or posedge i_rst_n) begin
    if(i_rst_n) begin
        aud_dacdat_r    <= aud_dacdat_w;
        counter_r       <= 0;
        state_r         <= S_IDLE;
    end
    else begin
        aud_dacdat_r    <= aud_dacdat_w;
        counter_r       <= counter_w;
        state_r         <= state_w;
        
    end
end
endmodule
