`timescale 1ns/100ps

module Top_tb(
    output [19:0] SRAM_ADDR,
    inout   [15:0] SRAM_DQ,
    output  SRAM_WE_N,
    output  SRAM_CE_N, 
    output  SRAM_OE_N,
    output  SRAM_LB_N,
    output  SRAM_UB_N,

    output  I2C_SCLK,
    inout   I2C_SDAT,

    output  AUD_DACDAT,

    inout  [7:0] LCD_DATA,
    output  LCD_EN,
    output  LCD_RS,
    output  LCD_RW,
    output  LCD_ON,
    output  LCD_BLON
);
parameter CLK_12M   = 84;
parameter HCLK_12M  = 42;
parameter CLK_100K  = 10000;
parameter HCLK_100K = 5000;
parameter CLK_800K  = 1250;
parameter HCLK_800K = 625;

parameter [15:0] REC_DATA [0:10] = '{
    16'h0123, 16'h1234, 16'h2345, 16'h3456, 
    16'h4567, 16'h5678, 16'h6789, 16'h789A, 
    16'h89AB, 16'h9ABC, 16'hABCD, 16'hBCDE, 
    16'hCDEF, 16'hDEF0, 16'hEF01, 16'hF012
};

logic clk_12m, clk_100k, clk_800k;
logic KEY0, KEY1, KEY2, KEY3;
logic [3:0] switch;
logic AUD_ADCDAT;
logic [23:0] I2C_inst;

Top top0(
    .i_rst_n(KEY3),
	.i_clk(clk_12m),
	.i_key_0(KEY0),
	.i_key_1(KEY1),
	.i_key_2(KEY2),
	.i_speed(switch), // design how user can decide mode on your own
	
	.o_SRAM_ADDR(SRAM_ADDR), // [19:0]
	.io_SRAM_DQ(SRAM_DQ), // [15:0]
	.o_SRAM_WE_N(SRAM_WE_N),
	.o_SRAM_CE_N(SRAM_CE_N),
	.o_SRAM_OE_N(SRAM_OE_N),
	.o_SRAM_LB_N(SRAM_LB_N),
	.o_SRAM_UB_N(SRAM_UB_N),
	
	.i_clk_100k(clk_100k),
	.o_I2C_SCLK(I2C_SCLK),
	.io_I2C_SDAT(I2C_SDAT),
	
	.i_AUD_ADCDAT(AUD_ADCDAT),
	.i_AUD_ADCLRCK(clk_800k),
	.i_AUD_BCLK(clk_12m),
	.i_AUD_DACLRCK(clk_800k),
	.o_AUD_DACDAT(AUD_DACDAT)

	.i_clk_800k(clk_800k),
	.io_LCD_DATA(LCD_DATA), // [7:0]
	.o_LCD_EN(LCD_EN),
	.o_LCD_RS(LCD_RS),
	.o_LCD_RW(LCD_RW),
	.o_LCD_ON(LCD_ON),
	.o_LCD_BLON(LCD_BLON),
);
always #HCLK_12M    clk_12m = ~clk_12m;
always #HCLK_800K   clk_800k = ~clk_800k;
always #HCLK_100K   clk_100k = ~clk_100k;

task LCD_output();
    @(posedge LCD_RS);
    $display("========= LCD display ========");
      
    for(int i = 0; i < 32; i++) begin
        @(posedge LCD_EN)
        $display("instruction %d : %b_%b_%8b", i, Rs, Rw, data);    
    end
    $display("==============================");
endtask
task I2C();    
    @(negedge I2C_SDAT);
    @(negedge I2C_SCLK);
    for(int i = 23; i > 0; i = i - 8) begin
        for(int j = 0; j < 8; j = j + 1) begin
            @(posedge I2C_SCLK);
            I2C_inst[i - j] = I2C_SDAT;    
        end
        @(posedge I2C_SCLK);
    end
    @(posedge I2C_SCLK);
    @(posedge I2C_SDAT);
    
    $display("=====  I2C instruction  ====");
    $display("data = %4b_%4b_%3b_%4b_%b_%4b_%4b", I2C_inst[23:20], I2C_inst[19:16], I2C_inst[15:13], I2C_inst[12:9], I2C_inst[8], I2C_inst[7:4], I2C_inst[3:0]);
    $display("============================");

endtask
initial begin
    clk_100k    = 0;
    clk_800k    = 0;
    clk_12m     = 0;
    KEY0        = 0;
    KEY1        = 0;
    KEY2        = 0;
    KEY3        = 0;
end

initial begin
    $fsdbDumpfile("I2C.fsdb");
    $fsdbDumpvars;
    #(CLK_100K) KEY3 = 1;
    KEY3    = 0;
    LCD_output();
    I2C();
    LCD_output();
    #(CLK_100K) KEY1 = 1;
end
always(@posedge I2C_SDAT) begin
    if()
end
initial begin
    #(100000 * CLK_100K)
    $display("Too slow, abort.");
    $finish;
end
endmodule