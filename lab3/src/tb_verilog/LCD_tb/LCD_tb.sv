`timescale 1ns/100ps

module LCD_tb();

localparam CLK     = 10;
localparam HCLK    = CLK / 2;

logic clk, rst, start;
logic [2:0] mode;
logic En, Rs, Rw, ini_fin, ren_fin;
logic [7:0] data;
LCD_Top LCD(
    .i_clk(clk),
    .i_start(start),
    .i_rst_n(rst),
    .i_mode(mode),
    .o_LCD_data(data),
    .o_LCD_EN(En),
    .o_LCD_RS(Rs),
    .o_LCD_RW(Rw),
    .o_init_finish(ini_fin),
    .o_render_finish(ren_fin)
); 

initial clk = 0;
always #HCLK clk = ~clk;

initial begin
    $fsdbDumpfile("LCD.fsdb");
    $fsdbDumpvars;

    rst = 1;
    #(2 * CLK) 
        rst = 0;
    @(posedge ini_fin) 
        start = 1;
        mode = 0;
    #(CLK) 
        start = 0;
    for(int i = 0; i < 32; i++) begin
        @(posedge En)
            $display("==============================");
            $display("instruction %d :", i);
            $display("%b_%b_%8b", Rs, Rw, data);
            $display("==============================");    
    end
end

always@(posedge ren_fin) begin
    $display("==============================");
    $display("Simulation Complete !!");
    $display("==============================");
    $finish;
end
initial begin
	#(25000 * CLK)
	$display("Too slow, abort.");
	$finish;
end
endmodule