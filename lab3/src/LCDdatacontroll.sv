module LCD_datacontroll(
    input   i_clk,
    input   i_start,
    input   i_rst_n,
    input  [7:0] i_LCD_data,
    
    output [7:0] o_LCD_data,
    output  o_LCD_EN,
    output  o_LCD_RS,
    output  o_LCD_RW,
    output  o_write_fin
);
parameter S_IDLE     = 4'd0;
parameter S_RISE    = 4'd1;
parameter S_HOLD     = 4'd2;
parameter S_FALL     = 4'd3;

logic [3:0] state_r, state_w;
logic [10:0] count_r, count_w;
logic finish_r, finish_w;

assign o_LCD_data   = (state_r == S_IDLE) ? 8'b00000000 : i_LCD_data;
assign o_LCD_EN     = (state_r == S_HOLD) ? 1'b1 : 1'b0;
assign o_LCD_RS     = (state_r == S_IDLE) ? 1'b0 : 1'b1;
assign o_LCD_RW     = (state_r == S_IDLE) ? 1'b0 : 1'b0;
assign o_write_fin  = finish_r;

always_comb begin
    state_w = state_r;
	 count_w = count_r;
	 finish_w = finish_r;
    case(state_r)
        S_IDLE: begin
            finish_w = 1'b0;
				if(i_start) begin
                state_w = S_RISE;
					 count_w = 11'd0;
				end
        end
        S_RISE: begin
            if(count_r == 11'd500)
					state_w     = S_HOLD;
				count_w = count_r + 11'd1;
        end
        S_HOLD: begin
            if(count_r == 11'd1500)
					state_w     = S_FALL;
				count_w = count_r + 11'd1;
		  end
        S_FALL: begin
            if(count_r == 11'd2000) begin
					state_w     = S_IDLE;
					finish_w = 1'b1;
				end
				count_w = count_r + 11'd1;
        end
    endcase    
end
always_ff @(posedge i_clk or negedge i_rst_n) begin
    if(!i_rst_n) begin
        state_r     <= S_IDLE;
		  count_r	  <= 11'd0;
		  finish_r    <= 1'b0;
    end
    else begin
        state_r     <= state_w;
		  count_r	  <= count_w;
		  finish_r    <= finish_w;
    end
end
endmodule
