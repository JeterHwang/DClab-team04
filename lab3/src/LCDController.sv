module LCD_controller(
    input   i_clk,
    input   i_start,
    input   i_rst_n,
    input  [7:0] i_LCD_data,
    input   i_LCD_RS,
    input   i_LCD_WR,
    input   i_LCD_CL,

    output [7:0] o_LCD_data,
    output  o_LCD_EN,
    output  o_LCD_RS,
    output  o_LCD_RW,
    output  o_wrtie_fin
);

always_comb begin
    
end
always_ff @(posedge i_clk or posedge i_rst_n) begin
    if(i_rst_n) begin
        
    end
    else begin
        
    end
end
endmodule