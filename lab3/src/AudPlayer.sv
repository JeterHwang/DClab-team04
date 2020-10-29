module AudPlayer(
    input   i_rst_n,
    input   i_bclk,
    input   i_daclrck,
    input   i_en,
    input   i_dac_data,
    output  o_aud_dacdat
);

always_comb begin
    
end

// @ posedge i_nclk could be wrong !!!!!
always_ff @(posedge i_bclk or posedge i_rst_n) begin
    
end
endmodule
