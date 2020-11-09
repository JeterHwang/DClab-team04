module LCD_datacontroll(
    input   i_clk,
    input   i_start,
    input   i_rst_n,
    input  [7:0] i_LCD_data,
    
    output [7:0] o_LCD_data,
    output  o_LCD_EN,
    output  o_LCD_RS,
    output  o_LCD_RW,
    output  o_wrtie_fin
);
parameter S_IDLE    = 0;
parameter S_RISE    = 1;
parameter S_HOLD    = 2;
parameter S_FALL    = 3;

logic [1:0] state_r, state_w;

assign o_LCD_data   = (state_r == S_IDLE) ? 8'b00000000 : i_LCD_data;
assign o_LCD_EN     = (state_r == S_HOLD) ? 1'b1 : 1'b0;
assign o_LCD_RS     = (state_r == S_IDLE) ? 1'bz : 1'b1;
assign o_LCD_RW     = (state_r == S_IDLE) ? 1'bz : 1'b0;
assign o_write_fin  = (state_r == S_FALL) ? 1'b1 : 1'b0;

always_comb begin
    state_w = state_r;
    case(state_r)
        S_IDLE: begin
            if(i_start)
                state_w = S_RISE;
        end
        S_RISE: begin
            state_w     = S_HOLD;
        end
        S_HOLD: begin
            state_w     = S_FALL;
        end
        S_FALL: begin
            state_w     = S_IDLE;
        end
    endcase    
end
always_ff @(posedge i_clk or posedge i_rst_n) begin
    if(i_rst_n) begin
        state_r     <= S_IDLE;
    end
    else begin
        state_r     <= state_w;
    end
end
endmodule