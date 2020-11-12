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
parameter   chla = 8'b01100001, chlb = 8'b01100010, chlc = 8'b01100011, chld = 8'b01100100, chle = 8'b01100101, chlf = 8'b01100110,
            chlg = 8'b01100111, chlh = 8'b01101000, chli = 8'b01101001, chlj = 8'b01101010, chlk = 8'b01101011, chll = 8'b01101100,
            chlm = 8'b01101101, chln = 8'b01101110, chlo = 8'b01101111, chlp = 8'b01110000, chlq = 8'b01110001, chlr = 8'b01110010,
            chls = 8'b01110011, chlt = 8'b01110100, chlu = 8'b01110101, chlv = 8'b01110110, chlw = 8'b01110111, chlx = 8'b01111000,
            chly = 8'b01111001, chlz = 8'b01111010;
parameter   chuA = 8'b01000001, chuB = 8'b01000010, chuC = 8'b01000011, chuD = 8'b01000100, chuE = 8'b01000101, chuF = 8'b01000110,
            chuG = 8'b01000111, chuH = 8'b01001000, chuI = 8'b01001001, chuJ = 8'b01001010, chuK = 8'b01001011, chuL = 8'b01001100,
            chuM = 8'b01001101, chuN = 8'b01001110, chuO = 8'b01001111, chuP = 8'b01010000, chuQ = 8'b01010001, chuR = 8'b01010010,
            chuS = 8'b01010011, chuT = 8'b01010100, chuU = 8'b01010101, chuV = 8'b01010110, chuW = 8'b01010111, chuX = 8'b01011000,
            chuY = 8'b01011001, chuZ = 8'b01011010;
parameter   n0 = 8'b00110000, n1 = 8'b00110001, n2 = 8'b00110010, n3 = 8'b00110011, n4 = 8'b00110100, 
            n5 = 8'b00110101, n6 = 8'b00110110, n7 = 8'b00110111, n8 = 8'b00111000, n9 = 8'b00111001;
parameter   NULL = 8'b00100000;

// printed data
parameter logic [7:0] init[0:31] = '{             // 'i', 'n', 'i', 't', 'i', 'a', 'l', 'i', 'z', 'i', 'n', 'g'
    NULL, NULL, NULL, chuI, chln, chli, chlt, chli, chla, chll, chli, chlz, chli, chln, chlg, NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL  
};
parameter logic [7:0] stop[0:31] = '{             // 's', 't', 'o', 'p'
    NULL, NULL, NULL, chuS, chlt, chlo, chlp, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL  
};
parameter logic [7:0] play_pause[0:31] = '{       // 'p', 'l', 'a', 'y', ' ', 'p', 'a', 'u', 's', 'e'
    NULL, NULL, NULL, chuP, chll, chla, chly, NULL, chuP, chla, chlu, chls, chle, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL  
};
parameter logic [7:0] record_pause[0:31] = '{     // 'r', 'e', 'c', 'o', 'r', 'd', ' ', 'p', 'a', 'u', 's', 'e'
    NULL, NULL, NULL, chuR, chle, chlc, chlo, chlr, chld, NULL, chuP, chla, chlu, chls, chle, NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL  
};
parameter logic [7:0] playing[0:31] = '{          // 'p', 'l', 'a', 'y', 'i', 'n', 'g'
    NULL, NULL, NULL, chuP, chll, chla, chly, chli, chln, chlg, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL  
};
parameter logic [7:0] recording[0:31] = '{        // 'r', 'e', 'c', 'o', 'r', 'd', 'i', 'n', 'g'
    NULL, NULL, NULL, chuR, chle, chlc, chlo, chlr, chld, chli, chln, chlg, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL  
};
// Host interface 
logic [2:0] state_r, state_w;
logic start_r, start_w;

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
    start_w         = i_start;
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
            if(i_start && !start_r) begin       // posedge triggered
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
                if(counter_r == 6'd32) begin
                    state_w         = S_IDLE;
                    render_finish_w = 1'b1;
                end
                else if(counter_r == 6'd16) begin
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
        start_r         <= 1'b0;
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
        start_r         <= start_w;
    end
end
endmodule
