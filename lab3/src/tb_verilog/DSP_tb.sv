`timescale 1ns/100ps
`define CYCLE 10
`define H_CYCLE 5
`define LR_CYCLE 400
`define HLR_CYCLE 200

module DSP_tb();
    logic rst,clk,start,stop,pause,fast,slow0,slow1;
    logic daclrck,sent_finish;
    logic [3:0]speed;
    logic [19:0] record_counter;
    logic [15:0] sram_data;
    logic [3:0] state;
    logic [15:0] dac_data;
    logic [19:0] sram_addr;
    logic player_en,finish;

    // localparam CLK = 10;
    // localparam HCLK = CLK / 2;
    localparam [15:0] dac_data_arr [0:2] = '{
        16'b1111_0000_1100_1111,
        16'b1111_0000_1100_1111,
        16'b1000_0011_1100_0001
    };
    localparam [15:0] sram_data_arr [0:2] = '{
        16'b1001_1100_0101_1000,
        16'b0110_1010_0100_1100,
        16'b0011_1011_0000_1101
    };
    localparam [19:0] sram_addr_arr [0:2] = '{
        20'b1001_0011_1101_1110_0001,
        20'b1000_0010_1010_1111_0011,
        20'b1110_0001_0110_0101_1000
    };
    localparam [19:0] record_counter_arr [0:2] = '{
        20'b1101_0111_1000_0010_0111,
        20'b0010_1011_1001_0000_0110,
        20'b1010_1111_0100_0111_1001
    };

    AudDSP DSP0(
        .i_rst_n(rst_n),
        .i_clk(clk),
        .i_start(start),
        .i_stop(stop),
        .i_pause(pause),
        .i_speed(speed),
        .i_fast(fast),
        .i_slow_0(slow0),
        .i_slow_1(slow1),
        .i_daclrck(daclrck),
        .i_sram_data(sram_data),
        .o_dacdata(dacdata),
        .o_sram_addr(sram_addr),
        .o_finish(finish)
        .i_sentfinish(sent_finish),

        .i_record_counter(record_counter),

        .o_player_en(player_en),

    );


    initial rst = 0;
    initial clk = 0;
    initial start = 0;
    initial pause = 0;
    initial stop = 0;
    initial fast = 0;
    initial slow0 = 0;
    initial slow1 = 0;
    initial state = 0;
    initial daclrck = 0;
    initial sent_finish = 0;
    initial speed = '{0010};
    initial sram_data = 16'd0;
    initial record_counter = 20'd0;
    initial dac_data = 16'd0;
    initial sram_addr = 20'd0;

    always begin
        #(`H_CYCLE) clk=~clk;
    end
    always begin
        #(`HLR_CYCLE) daclrck=~daclrck;
    end
// initial begin
// 		clk = 0;
// 		rst = 0;

// 		stop = 0;
// 		pause = 0;

// 		fast = 0;
// 		slow_0 = 0;
// 		slow_1 = 0;
// 		i_start = 0 ;

// 		control_speed = 2;

// 		#(`CYCLE*1.5) rst = 1;
// 		#(`CYCLE*3.5) rst = 0;

// 		#(`CYCLE*2) sram_data = 0;

// 		#(`CYCLE*6) fast = 1;
// 		i_start = 1 ;
// 		#(`CYCLE) i_start = 0 ;
// 		#(`CYCLE*2) fast = 0;
// 		i_start = 1 ;
// 		#(`CYCLE) i_start = 0 ;

// 		#(`CYCLE*600) pause = 1;
// 		control_speed = 5;
// 		#(`CYCLE*2) pause = 0;

// 		#(`CYCLE*600) slow_0 = 1;
// 		#(`CYCLE*2) slow_0 = 0;

// 		#(`CYCLE*300) pause = 1;
// 		control_speed = 7;
// 		#(`CYCLE*2) pause = 0;

// 		#(`CYCLE*500) slow_1 = 1;
// 		i_start = 1 ;
// 		#(`CYCLE) i_start = 0 ;
// 		#(`CYCLE*2) slow_1 = 0;
// 		i_start = 1 ;
// 		#(`CYCLE) i_start = 0 ;

// 		#(`CYCLE*600) stop = 1;
// 		#(`CYCLE*2) stop = 0;
// 		#(`CYCLE*10.5) rst = 1;
// 		#(`CYCLE*2) rst = 0;

// 		#(`CYCLE*3) slow_1 = 1;
// 		i_start = 1 ;
// 		#(`CYCLE) i_start = 0 ;
// 		#(`CYCLE*2) slow_1 = 0;
// 		i_start = 1 ;
// 		#(`CYCLE) i_start = 0 ;

// 		#(`CYCLE*500) pause = 1;
// 		control_speed = 1;
// 		#(`CYCLE*2) pause = 0;

// 		#(`CYCLE*6) fast = 1;
// 		i_start = 1 ;
// 		#(`CYCLE) i_start = 0 ;
// 		#(`CYCLE*2) fast = 0;
// 		i_start = 1 ;
// 		#(`CYCLE) i_start = 0 ;
      
//       #(`CYCLE*100) control_speed = 3;
 
// 		#(`CYCLE*1000) $finish;
// 	end
	
    initial begin
        
        $fsdbDumpfile("DSP.fsdb");
        $fsdbDumpvars;


        for(int i = 0; i < 3; i++) begin
                #(`CYCLE*2) enable = 1;
                #(`CYCLE*2) enable = 0;
                @(negedge lr_clk) begin
                    record_counter = record_counter_arr[i];
                    dac_data    = dac_data_arr[i];
                    sram_addr   = sram_addr_arr[i]
                    sram_data   = sram_addr_arr[i];
                    dac_ans     = 16'd0;
                    sram_ans    = 16'd0;
                    
                    state   = i;
                end
                // @(negedge bclk);
                // for(int j = 0; j < 16; j++) begin
                //     @(negedge bclk); 
                //         ans = ((ans << 1) | out);
                // end
                // $display("+=====================+");
                // if(ans == data_arr[i]) begin
                //     $display("data %d simulation correct !!", i);
                //     $display("expected output = %16b", dac_data_arr[i]);    
                //     $display("received output = %16b", ans[15:0]);
                //     $display("+=====================+");
                // end    
                // else begin
                //     $display("data %d simulation wrong !!", i);
                //     $display("expected output = %16b", data_arr[i]);    
                //     $display("received output = %16b", ans[15:0]);
                //     $display("+=====================+");
                // end
            end
    end





    always@(posedge clk) begin
        if(finished) begin
            $display("+=====================+");
            $display("| Simulation Complete |");
            $display("+=====================+");
            $finish;
        end
    end
    initial begin
        #(1000 * CLK)
        $display("Too slow, abort.");
        $finish;
    end
endmodule