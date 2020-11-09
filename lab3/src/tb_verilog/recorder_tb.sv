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
    logic [21:0] state;
    logic [15:0] ans;
    localparam [15:0] data_arr  = 16'b0111_0100_1100_1111;

    AudRecorder recorder0(
        .i_rst_n(rst), 
        .i_clk(bclk),
        .i_lrc(lr_clk),
        .i_start(start),
        .i_pause(pause),
        .i_stop(stop),
        .i_data(data),
        .o_address(address),
        .o_data(out)
    );
    initial bclk    = 0;
    initial lr_clk  = 0;
    initial start  = 0;
    initial pause  = 0;
    initial stop  = 0;
    initial state   = 0;
    initial data    = 0;

    always #(`H_CYCLE) bclk=~bclk;
    always #(`HLR_CYCLE) lr_clk=~lr_clk;
    // always begin
    //     #(`H_CYCLE) bclk=~bclk;
    // end
    // always begin
    //     #(`HLR_CYCLE) lr_clk=~lr_clk;
    // end
    // localparam CLK = 10;
	// localparam HCLK = CLK/2;
    // always #HCLK clk = ~clk;

    initial begin
        $fsdbDumpfile("recorder.fsdb");
		$fsdbDumpvars;

        rst     = 0;
        #(`CYCLE*2) rst = 1;
        #(`CYCLE*2) rst = 0;
        for(int i = 0; i < 65000; i++) begin
            #(`CYCLE*2) start = 1;
            #(`CYCLE*2) start = 0;
            
            @(negedge lr_clk) begin
                
                ans     = 16'd0;
                state   = i;
            end
            @(negedge bclk);
            for(int j = 0; j < 16; j++) begin
                data = data_arr[15-j];
            @(negedge bclk);
                    $display("%16b", ans);
                    ans = ((ans) | out);
                    
                    $display("%16b", out);
                    $display("%16b", ans);
                    $display("%16b", data_arr);
                    $display("%1b %1b %1b", out[15-j], data, ans[15-j]);
                    $display("++++++++++++++++++++");
                    if (j == 5) begin
                        #(`CYCLE) pause = 1;
                        #(`CYCLE) pause = 0;
                        #(`CYCLE) pause = 1;
                        #(`CYCLE) pause = 0;
                    end
            end

            $display("+=====================+");
            if(ans == data_arr) begin
                $display("data %d simulation correct !!", i);
                $display("expected output = %16b", data_arr);    
                $display("received output = %16b", ans[15:0]);
                $display("+=====================+");
            end    
            else begin
                $display("data %d simulation wrong !!", i);
                $display("expected output = %16b", data_arr);    
                $display("received output = %16b", ans[15:0]);
                $display("+=====================+");
            end
        end
        // rst = 1;
		// #(2*CLK)
		// rst = 0;
    end
    initial begin
        #(500 * (`CYCLE))
        $display("Too slow, abort.");
        $finish;
    end

endmodule