module AudDSP(
    input       i_rst_n,
    input       i_clk,
    input       i_start,
    input       i_pause,
    input       i_stop,
    input [3:0] i_speed,
    input       i_fast,
    input       i_slow_0,
    input       i_slow_1,
    input       i_daclrck,
    input       i_sram_data,
    output      o_dac_data,
    output      o_addr_play
);

always_comb begin
    
end

always_ff @(posedge i_clk or posedge i_rst_n) begin
    
end  
endmodule