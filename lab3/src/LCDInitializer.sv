module LCD_initializer(
    input   i_clk,
    input   i_start,
    input   i_rst_n,

    output [7:0] o_LCD_data,
    output  o_LCD_EN,
    output  o_LCD_RS,
    output  o_LCD_RW
);

logic counter_r,counter
parameter S_IDLE    = 1;
parameter S_   = 2;
always_comb begin
    
end
always_ff @(posedge i_clk or posedge i_rst_n) begin
    if(i_rst_n) begin
        
    end
    else begin
        
    end
end
endmodule