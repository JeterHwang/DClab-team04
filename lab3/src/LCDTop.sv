module LCD_Top(
    input   i_clk,
    input   i_start,
    input   i_rst_n,
    input   [2:0] i_mode,

    output  [7:0] o_LCD_data,
    output  o_LCD_EN,
    output  o_LCD_RS,
    output  o_LCD_RW,
    output  o_init_finish,
    output  o_render_finish
);

parameter S_BEGIN               = 3'd0;
parameter S_INIT                = 3'd1;
parameter S_IDLE                = 3'd2;
parameter S_SET_ADDRESS         = 3'd3;
parameter S_WRITE               = 3'd4;

parameter instruction_count     = 3'd5;

// CGROM characters
parameter   cha = 8'b01100001, chb = 8'b01100001, chc = 8'b01100001, chd = 8'b01100001, che = 8'b01100001, chf = 8'b01100001,
            chg = 8'b01100001, chh = 8'b01100001, chi = 8'b01100001, chj = 8'b01100001, chk = 8'b01100001, chl = 8'b01100001,
            chm = 8'b01100001, chn = 8'b01100001, cho = 8'b01100001, chp = 8'b01100001, chq = 8'b01100001, chr = 8'b01100001,
            chs = 8'b01100001, cht = 8'b01100001, chu = 8'b01100001, chv = 8'b01100001, chw = 8'b01100001, chx = 8'b01100001,
            chy = 8'b01100001, chz = 8'b01100001;
parameter   chA = 8'b01100001, chB = 8'b01100001, chC = 8'b01100001, chD = 8'b01100001, chE = 8'b01100001, chF = 8'b01100001,
            chG = 8'b01100001, chH = 8'b01100001, chI = 8'b01100001, chJ = 8'b01100001, chK = 8'b01100001, chL = 8'b01100001,
            chM = 8'b01100001, chN = 8'b01100001, chO = 8'b01100001, chP = 8'b01100001, chQ = 8'b01100001, chR = 8'b01100001,
            chS = 8'b01100001, chT = 8'b01100001, chU = 8'b01100001, chV = 8'b01100001, chW = 8'b01100001, chX = 8'b01100001,
            chY = 8'b01100001, chZ = 8'b01100001;
parameter   n0 = 8'b00110001, n1 = 8'b00110001, n2 = 8'b00110001, n3 = 8'b00110001, n4 = 8'b00110001, 
            n5 = 8'b00110001, n6 = 8'b00110001, n7 = 8'b00110001, n8 = 8'b00110001, n9 = 8'b00110001;
parameter   NULL = 8'b00100000;

// printed data
parameter [7:0] init[0:31] = '{             // 'i', 'n', 'i', 't', 'i', 'a', 'l', 'i', 'z', 'i', 'n', 'g'
    NULL, NULL, NULL, chI, chn, chi, cht, chi, cha, chl, chi, chz, chi, chg, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL  
};
parameter [7:0] stop[0:31] = '{             // 's', 't', 'o', 'p'
    NULL, NULL, NULL, chS, cht, cho, chp, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL  
};
parameter [7:0] play_pause[0:31] = '{       // 'p', 'l', 'a', 'y', ' ', 'p', 'a', 'u', 's', 'e'
    NULL, NULL, NULL, chP, chl, cha, chy, NULL, chP, cha, chu, chs, che, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL  
};
parameter [7:0] record_pause[0:31] = '{     // 'r', 'e', 'c', 'o', 'r', 'd', ' ', 'p', 'a', 'u', 's', 'e'
    NULL, NULL, NULL, chR, che, chc, cho, chr, chd, NULL, chP, cha, chu, chs, che, NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL  
};
parameter [7:0] playing[0:31] = '{          // 'p', 'l', 'a', 'y', 'i', 'n', 'g'
    NULL, NULL, NULL, chP, chl, cha, chy, chi, chn, chg, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL  
};
parameter [7:0] recording[0:31] = '{        // 'r', 'e', 'c', 'o', 'r', 'd', 'i', 'n', 'g'
    NULL, NULL, NULL, chR, che, chc, cho, chr, chd, chi, chn, chg, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL  
};
// Host interface 
logic [2:0] state_r, state_w;

logic write_start_r, write_start_w;
logic render_finish_r, render_finish_w;

logic inst_start_r, inst_start_w;
logic [2:0] inst_type_r, inst_type_w;
logic [6:0] address_r, address_w;

logic [7:0] LCD_data_r, LCD_data_w;

logic [5:0] counter_r, counter_w;
logic [2:0] index_r, index_w;

// LCD instruction interface 
logic LCD_i_EN, LCD_i_RS, LCD_i_RW;
logic [7:0] LCD_i_data;
logic inst_finish;

// LCD read/write interface 
logic LCD_w_EN, LCD_w_RS, LCD_w_RW;
logic [7:0] LCD_w_data;
logic write_fin;

// output interface 
assign o_LCD_data       = (state_r == S_SET_ADDRESS || state_r == S_INIT) ? LCD_i_data : LCD_w_data;
assign o_LCD_EN         = (state_r == S_SET_ADDRESS || state_r == S_INIT) ? LCD_i_EN : LCD_w_EN;
assign o_LCD_RS         = (state_r == S_SET_ADDRESS || state_r == S_INIT) ? LCD_i_RS : LCD_w_RS;
assign o_LCD_RW         = (state_r == S_SET_ADDRESS || state_r == S_INIT) ? LCD_i_RW : LCD_w_RW;

assign o_init_finish    = (state_r != S_BEGIN && state_r != S_INIT) ? 1'b1 : 1'b0;
assign o_render_finish  = render_finish_r;

LCD_instructions instructions(
	.i_clk(i_clk),
	.i_start(inst_start_r),
	.i_rst_n(i_rst_n),
    .i_type(inst_type_r),
    .i_address(address_r),
	
	.o_LCD_RS(LCD_i_RS),
	.o_LCD_RW(LCD_i_RW),
    .o_LCD_EN(LCD_i_EN),
    .o_LCD_data(LCD_i_data),
    .o_finish(inst_finish)
);

LCD_datacontroll dataflow(
    .i_clk(i_clk),
    .i_start(write_start_r),
    .i_rst_n(i_rst_n),
    .i_LCD_data(LCD_data_r),
    
    .o_LCD_data(LCD_w_data),
    .o_LCD_EN(LCD_w_EN),
    .o_LCD_RS(LCD_w_RS),
    .o_LCD_RW(LCD_w_RW),
    .o_write_fin(write_fin)
);
task CharacterData(
    input [2:0] mode,
    input [5:0] count,
    
    output [7:0] data
);
    // initializing
    if(mode == 3'd0)
        data    = init[count];
    // stop 
    else if(mode == 3'd1) 
        data    = stop[count];
    // play pause
    else if(mode == 3'd2)
        data    = play_pause[count];
    // record pause
    else if(mode == 3'd3)
        data    = record_pause[count];
    // playing 
    else if(mode == 3'd4)
        data    = playing[count]; 
    // recording 
    else
        data    = recording[count];     
endtask

always_comb begin
    state_w         = state_r;
    write_start_w   = write_start_r;
    inst_start_w    = inst_start_r;
    inst_type_w     = inst_type_r;
    address_w       = address_r;
    LCD_data_w      = LCD_data_r;
    counter_w       = counter_r;
    index_w         = index_r;        
    render_finish_w = render_finish_r;
    case(state_r)
        S_BEGIN: begin
            inst_start_w    = 1'b1;
            inst_type_w     = 3'd0;
            index_w         = 3'd0;
            state_w         = S_INIT;
        end
        S_INIT: begin
            if(inst_finish) begin
                if(index_r == instruction_count - 3'd1) begin
                    state_w = S_IDLE;
                end
                else begin
                    inst_start_w    = 1'b1; 
                    inst_type_w     = index_r + 1;
                    index_w         = index_r + 1;
                end       
            end
            else begin
                inst_start_w    = 1'b0;
            end
        end
        S_IDLE: begin
            if(i_start) begin
                state_w         = S_SET_ADDRESS;
                counter_w       = 6'd0;
                render_finish_w = 1'b0;

                inst_type_w     = 3'd5;
                inst_start_w    = 1'b1;
                address_w       = 7'b0000000;
            end
        end
        S_SET_ADDRESS: begin
            if(inst_finish) begin
                state_w         = S_WRITE;
                write_start_w   = 1'b1;
                counter_w       = counter_r + 1;
                CharacterData(i_mode, counter_r, LCD_data_w);
            end
            else begin
                inst_start_w    = 1'b0;
            end
        end
        S_WRITE: begin
            if(write_fin) begin
                if(counter_r == 6'd31) begin
                    state_w         = S_IDLE;
                    render_finish_w = 1'b1;
                end
                else if(counter_r == 6'd15) begin
                    state_w         = S_SET_ADDRESS;
                    inst_type_w     = 3'd5;
                    inst_start_w    = 1'b1;
                    address_w       = 7'b1000000;
                end
                else begin
                    write_start_w   = 1'b1;
                    counter_w       = counter_r + 1;
                    CharacterData(i_mode, counter_r, LCD_data_w);    
                end
            end
            else begin
                write_start_w = 1'b0;    
            end       
        end
    endcase
end

always_ff @(posedge i_clk or posedge i_rst_n) begin
    if(i_rst_n) begin
        state_r         <= S_BEGIN;
        write_start_r   <= 1'b0;
        inst_start_r    <= 1'b0;
        inst_type_r     <= 3'd0;
        address_r       <= 7'd0;
        LCD_data_r      <= 8'd0;
        counter_r       <= 6'd0;
        index_r         <= 3'd0;        
        render_finish_r <= 1'b0;
    end
    else begin
        state_r         <= state_w;
        write_start_r   <= write_start_w;
        inst_start_r    <= inst_start_w;
        inst_type_r     <= inst_type_w;
        address_r       <= address_w;
        LCD_data_r      <= LCD_data_w;
        counter_r       <= counter_w;
        index_r         <= index_w;        
        render_finish_r <= render_finish_w;
    end
end
endmodule