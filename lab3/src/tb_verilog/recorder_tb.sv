`timescale 1ns/100ps
`define CYCLE 10
`define H_CYCLE 5
`define LR_CYCLE 800
`define HLR_CYCLE 400


module recorder_tb;
    logic rst, bclk, lr_clk, start, pause, stop;
    logic data;
    logic [15:0] out;
    logic [19:0] address;
    logic [2:0] state;

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
        #(`H_CYCLE) bclk=~bclk;
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
        start = 0;
        data = 16'd0;
        pause = 0;
        stop = 0
        state = 0;

        #(`CYCLE*2) rst = 1;
        #(`CYCLE*2) rst = 0;
        #(`CYCLE*2) start = 1;
        #(`CYCLE*2) start = 0;
        
        integer data1 = 16'b1111_0000_1100_1111;
        integer data2 = 16'b1111_0000_1100_1111;
        integer data3 = 16'b1111_0000_1100_1111;
        integer data4 = 16'b1111_0000_1100_1111;

        for (int i=0; i<16; 1++)begin
            #(`CYCLE) data = data1[16-i];
        end
        #(`HLR_CYCLE);
        for (int i=0; i<16; 1++)begin
            #(`CYCLE) data = data2[16-i];
        end
        for (int i=0; i<16; 1++)begin
            #(`CYCLE) 
        end

        #(`CYCLE) data = 1;
        pause = 1;
        #(`CYCLE) pause = 0;
        #(`CYCLE) start = 1;
        #(`CYCLE) data = 0;
        start = 0;
        for (int i=0; i<14; 1++)begin
            #(`CYCLE) data = data2[16-i];
        end
        for (int i=0; i<16; 1++)begin
            #(`CYCLE) 
        end
        for (int i=0; i<14; 1++)begin
            #(`CYCLE) data = data3[16-i];
        end
        // #(`LR_CYCLE*0.5) data = 16'b0110_1010_0100_1100;


        #(`LR_CYCLE*2) $finish;
        $fsdbDumpfile("player.fsdb");
		$fsdbDumpvars;
         
        // rst = 1;
		// #(2*CLK)
		// rst = 0;
        
    end

endmodule