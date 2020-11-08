`timescale 1ns/100ps
`define CYCLE 10
`define H_CYCLE 5
`define LR_CYCLE 400
`define HLR_CYCLE 200


module player_tb();
    logic rst, bclk, lr_clk, enable;
    logic [2:0] state;
    logic [15:0] data;
    logic out;
    logic [15:0] ans;

    // localparam CYCLE        = 10;
    // localparam H_CYCLE      = 5;
    // localparam LR_CYCLE     = 400;
    // localparam HLR_CYCLE    = 200;
    localparam [15:0] data_arr [0:4] = '{
        16'b1111_0000_1100_1111,
        16'b1111_0000_1100_1111,
        16'b1000_0011_1100_0001,
        16'b1001_1100_0101_1000,
        16'b0110_1010_0100_1100
    };
    AudPlayer player0(
        .i_rst_n(rst),
        .i_bclk(bclk),
        .i_daclrck(lr_clk),
        .i_en(enable), // enable AudPlayer only when playing audio, work with AudDSP
        .i_dac_data(data), //dac_data
        .o_aud_dacdat(out)
    );
    
    initial bclk    = 0;
    initial lr_clk  = 0;
    initial enable  = 0;
    initial state   = 0;
    initial data    = 16'd0;
    
    always #(`H_CYCLE) bclk=~bclk;
    always #(`HLR_CYCLE) lr_clk=~lr_clk;
    // localparam CLK = 10;
	// localparam HCLK = CLK/2;
    // always #HCLK clk = ~clk;

    initial begin        
        $fsdbDumpfile("player.fsdb");
		$fsdbDumpvars;

        rst     = 0;
        #(`CYCLE*1.5) rst = 1;
        #(`CYCLE*2) rst = 0;
        #(`CYCLE*2) enable = 1;

        for(int i = 0; i < 5; i++) begin
            @(negedge lr_clk) begin
                data    = data_arr[i];
                ans     = 16'd0;
                state   = i;
            end
            for(int j = 0; j < 16; j++) begin
                @(negedge bclk) 
                    ans = ((ans << 1) | out);
            end
            $display("+=====================+");
            if(ans == data_arr[i]) begin
                $display("data %d simulation correct !!", i);
                $display("expected output = %16b", data_arr[i]);    
                $display("received output = %16b", ans[15:0]);
                $display("+=====================+");
            end    
            else begin
                $display("data %d simulation wrong !!", i);
                $display("expected output = %16b", data_arr[i]);    
                $display("received output = %16b", ans[15:0]);
                $display("+=====================+");
            end
        end
        
        // #(`LR_CYCLE*0.5) data = 16'b1111_0000_1100_1111;
        // state = 1;
        // #(`LR_CYCLE*0.5) data = 16'b1000_0011_1100_0001;
        // state = 2;
        // #(`LR_CYCLE*0.5) data = 16'b1001_1100_0101_1000;
        // state = 3;
        // #(`LR_CYCLE*0.5) data = 16'b0110_1010_0100_1100;
        // state = 4;


        
        // #(`LR_CYCLE*2) $finish;
        
         
        // rst = 1;
		// #(2*CLK)
		// rst = 0;
        
    end
    initial begin
        #(1000 * bclk)
        $display("Too slow, abort.");
        $finish;
    end
endmodule
