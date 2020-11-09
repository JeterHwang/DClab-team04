module LCD_instructions(
    input       i_clk,
    input       i_start,
    input       i_rst_n,
    input [2:0] i_type,
    input [6:0] i_address,

    output      o_LCD_EN,
    output      o_LCD_RS,
    output      o_LCD_RW,
    output[7:0] o_LCD_data,
    output      o_finish
);

logic [14:0] counter_r, counter_w;
logic [10:0] inst_r, inst_w;
logic state_r, state_w;


parameter S_IDLE    = 0;
parameter S_EXE     = 1;

assign o_LCD_EN     = 1'b0;
assign o_LCD_RS     = inst_r[9];
assign o_LCD_RW     = inst_r[8];
assign o_LCD_data   = inst_r[7:0];

parameter [9:0] instructions[0:5] = '{
    10'b000011xxxx,     // precharge 
    10'b00001110xx,     // function set 
    10'b0000001100,     // display on
    10'b0000000001,     // clear display
    10'b0000000110,     // entry mode set
    10'b001xxxxxxx,     // set address (only 3 MSB used)
};
parameter [14:0] execution_time[0:5] = '{
    15'd15000, 
    15'd39, 
    15'd39, 
    15'd1530, 
    15'd39, 
    15'd39
};
always_comb begin
    case (state_r)
        S_IDLE: begin
            if(i_start) begin
                state_w     = S_EXE;
                counter_w   = 32'd0;
                if(i_type == 5)
                    inst_w  = {instructions[i_type][9:7], i_address};
                else
                    inst_w  = instructions[i_type];
            end
        end
        S_EXE: begin
            if(counter_r == execution_time[i_type]) begin
                state_w     = S_IDLE;
            end
            else begin
                counter_w   = counter_r + 1;
            end
        end
    endcase
end
always_ff @(posedge i_clk or posedge i_rst_n) begin
    if(i_rst_n) begin
        state_r     <= 1'b0;
        counter_r   <= 15'd0;
        inst_r      <= 11'd0;
    end
    else begin
        state_r     <= state_w;
        counter_r   <= counter_w;
        inst_r      <= inst_w;
    end
end
endmodule