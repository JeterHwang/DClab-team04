`timescale 1ns/100ps
`define CYCLE 10
`define H_CYCLE 5
`define LR_CYCLE 800
`define HLR_CYCLE 400


module recorder_tb;
    logic rst, bclk, lr_clk, start, pause, stop;
    logic in;
    logic [15:0] out;
    logic [19:0] address;

    AudRecorder recorder0(
        .i_rst_n(rst), 
        .i_clk(bclk),
        .i_lrc(lr_clk),
        .i_start(start),
        .i_pause(pause),
        .i_stop(stop),
        .i_data(in),
        .o_address(address),
        .o_data(out),
    );
    always begin
        #(`HCYCLE) bclk=~bclk;
    end
    always begin
        #(`HLR_CYCLE) lr_clk=~lr_clk;
    end
    // localparam CLK = 10;
	// localparam HCLK = CLK/2;
    // always #HCLK clk = ~clk;

    initial begin
        bclk = 0;
        rst = 0;
        lr_clk = 0;
        enable = 0;
        data = 16'd0;

        #(`CYCLE*1.5) rst = 1;
        #(`CYCLE*2) rst = 0;
        #(`CYCLE*2) enable = 1;

        #(`LR_CYCLE*0.5) data = 16'b1111_0000_1100_1111;
        #(`LR_CYCLE*0.5) data = 16'b1000_0011_1100_0001;
        #(`LR_CYCLE*0.5) data = 16'b1001_1100_0101_1000;
        #(`LR_CYCLE*0.5) data = 16'b0110_1010_0100_1100;


        #(`LR_CYCLE*2) $finish;
        $fsdbDumpfile("player.fsdb");
		$fsdbDumpvars;
         
        // rst = 1;
		// #(2*CLK)
		// rst = 0;
        
    end

endmodule