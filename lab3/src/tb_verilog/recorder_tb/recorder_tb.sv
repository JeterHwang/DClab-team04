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
    logic [15:0] in;
    localparam [15:0] data_arr [0:4] = '{
        16'b1111_0010_1100_1111,
        16'b1111_0110_0100_1111,
        16'b1000_0011_1100_0001,
        16'b1001_1100_0101_1000,
        16'b0110_1010_0100_1100
    };

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
    initial in      = 16'd0;
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
        #(`CYCLE*20) start = 1;
        #(`CYCLE*3) start = 0;
        for(int i = 0; i < 5; i++) begin
            
            
            @(negedge lr_clk) begin
                in      = data_arr[i];
                ans     = 16'd0;
                state   = i;
                
            end
            @(negedge bclk);
            data    = in[15];
            for(int j = 0; j < 16; j++) begin
                $display("%1b", j);
                // data = in[15-j];
                if (j == 5) begin
                    pause = 1;
                    #(`CYCLE) pause = 0;
                    $display("%1b", j);
                    $display("%16b", out);
                end
                if (j == 8) begin
                    stop = 1;
                    #(`CYCLE) stop = 0;
                    break;
                end
                @(negedge bclk);
                    $display("%16b", ans);
                    ans     = 16'd0;
                    ans     = ((ans) | out);
                    
                    $display("%16b", out);
                    $display("%16b", ans);
                    $display("%16b", in);
                    $display("%1b %1b %1b", out[15-j], data, ans[15-j]);
                    
                    $display("++++++++++++++++++++");
                    if (j != 15) begin
                        data = in[14-j];
                    end
                    else if(j == 15) begin
                        data = in[0];
                    end
            end
        end
            #(`CYCLE*20) start = 1;
            #(`CYCLE*3) start = 0;
            for(int i = 0; i < 5; i++) begin
                @(negedge lr_clk) begin
                    in      = data_arr[i];
                    ans     = 16'd0;
                    state   = i;
                    
            end
            @(negedge bclk);
            data    = in[15];
            for(int j = 0; j < 16; j++) begin
                $display("%1b", j);
                // data = in[15-j];
                if (j == 5) begin
                    pause = 1;
                    #(`CYCLE) pause = 0;
                    $display("%1b", j);
                    $display("%16b", out);
                end
                if (j == 8) begin
                    stop = 1;
                    #(`CYCLE) stop = 0;
                    break;
                end
                @(negedge bclk);
                    $display("%16b", ans);
                    ans     = 16'd0;
                    ans     = ((ans) | out);
                    
                    $display("%16b", out);
                    $display("%16b", ans);
                    $display("%16b", in);
                    $display("%1b %1b %1b", out[15-j], data, ans[15-j]);
                    
                    $display("++++++++++++++++++++");
                    if (j != 15) begin
                        data = in[14-j];
                    end
                    else if(j == 15) begin
                        data = in[0];
                    end
            end
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
        // rst = 1;
		// #(2*CLK)
		// rst = 0;
    end
    initial begin
        #(1000 * (`CYCLE))
        $display("Too slow, abort.");
        $finish;
    end

endmodule