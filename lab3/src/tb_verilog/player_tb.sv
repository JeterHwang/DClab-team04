`timescale 1ns/100ps
`define CYCLE 10
`define H_CYCLE 5
`define LR_CYCLE 400
`define HLR_CYCLE 200


module player_tb;
    logic rst, bclk, lr_clk, enable;
    logic [2:0] state;
    logic [15:0] data;
    logic out;

    AudPlayer player0(
        .i_rst_n(rst),
        .i_bclk(bclk),
        .i_daclrck(lr_clk),
        .i_en(enable), // enable AudPlayer only when playing audio, work with AudDSP
        .i_dac_data(data), //dac_data
        .o_aud_dacdat(out)
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
        enable = 0;
        state = 0;
        data = 16'd0;

        #(`CYCLE*1.5) rst = 1;
        #(`CYCLE*2) rst = 0;
        #(`CYCLE*2) enable = 1;

        #(`LR_CYCLE*0.5) data = 16'b1111_0000_1100_1111;
        state = 1;
        #(`LR_CYCLE*0.5) data = 16'b1000_0011_1100_0001;
        state = 2;
        #(`LR_CYCLE*0.5) data = 16'b1001_1100_0101_1000;
        state = 3;
        #(`LR_CYCLE*0.5) data = 16'b0110_1010_0100_1100;
        state = 4;


        #(`LR_CYCLE*2) $finish;
        $fsdbDumpfile("player.fsdb");
		$fsdbDumpvars;
         
        // rst = 1;
		// #(2*CLK)
		// rst = 0;
        
    end

endmodule