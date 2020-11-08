module SDRAM_controller(
    input   i_clk,
    input   i_rst_n,
    input   i_wreg,
    input   i_wgnt,
    input   i_waddr,
    input   i_wdata,
    input   i_rreq,
    input   i_rgnt,
    input   i_raddr,
    input   i_rdata,

    output [12:0]   o_sdram_addr,
    output [1:0]    o_sdram_ba,
    inout  [31:0]   io_sdram_dq,
    output [3:0]    o_sdram_dqm,
    output          o_sdram_cas_n,
    output          o_sdram_cke,
    output          o_sdram_clk,
    output          o_sdram_cs_n,
    output          o_sdram_ras_n,
    output          o_sdram_we_n
);

parameter S_ = ;


    
endmodule