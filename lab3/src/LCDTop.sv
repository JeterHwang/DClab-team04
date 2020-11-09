module LCD_Top(
    input   i_clk,
    input   i_start,
    input   i_rst_n,
    input   [2:0] i_mode,
    input   i_bf,

    output  [7:0] o_LCD_data,
    output  o_LCD_EN,
    output  o_LCD_RS,
    output  o_LCD_RW,
    output  o_init_finish,
);

parameter S_INIT    = 0;
parameter S_IDLE    = 1;
parameter S_CLEAR   = 2;
parameter S_WRITE   = 3;
parameter S_EVAL    = 4;

parameter [3:0] length[0:3] = '{
    4'd4, 4'd5, 4'd7, 4'd9
};
parameter [9:0] clear = 10'b0000000001;
parameter [9:0] stop[0:3] = '{
    10'b, 10'b, 10'b, 10'b
}
parameter [9:0] pause[0:4] = '{
    10'b, 10'b, 10'b, 10'b, 10'b
};
parameter [9:0] playing[0:6] = '{
    10'b, 10'b, 10'b, 10'b, 10'b, 10'b, 10'b,

};
parameter [9:0] recording[0:8] = '{
    10'b, 10'b, 10'b, 10'b, 10'b, 10'b, 10'b, 10'b, 10'b,
};
// Host interface 
logic [2:0] state_r, state_w;

logic init_start_r, init_start_w;
logic write_start_r, write_start_w;

logic LCD_CL_r, LCD_CL_w;
logic LCD_EN_r, LCD_EN_w;
logic LCD_RS_r, LCD_RS_w;
logic LCD_RW_r, LCD_RW_w;
logic [7:0] LCD_data_r, LCD_data_w;

logic [5:0] counter_r, counter_w;

// LCD initiate interface 
logic LCD_i_EN, LCD_i_RS, LCD_i_RW;
logic [7:0] LCD_i_data;
logic init_finish;

// LCD read/write interface 
logic LCD_w_EN, LCD_w_RS, LCD_w_RW;
logic [7:0] LCD_w_data;
logic write_fin;

// output interface 
assign o_LCD_data       = init_finish ? LCD_w_data : LCD_i_data;
assign o_LCD_EN         = init_finish ? LCD_w_EN : LCD_i_EN;
assign o_LCD_RS         = init_finish ? LCD_w_RS : LCD_i_RS;
assign o_LCD_RW         = init_finish ? LCD_w_RW : LCD_i_RW;

assign o_init_finish    = init_finish;

LCD_initializer initializer(
	.i_clk(i_clk_800k),
	.i_start(init_start_r),
	.i_rst_n(i_rst_n),
	
	.o_LCD_data(LCD_i_data),
	.o_LCD_EN(LCD_i_EN),
	.o_LCD_RS(LCD_i_RS),
	.o_LCD_RW(LCD_i_RW),
    .o_ini_finish(init_finish)
);

LCD_controller controller(
    .i_clk(i_clk),
    .i_start(write_start_r),
    .i_rst_n(i_rst_n),
    .i_LCD_data(LCD_data_r),
    .i_LCD_RS(LCD_RS_r),
    .i_LCD_WR(LCD_WR_r),
    .i_LCD_CL(LCD_CL_r),
    
    .o_LCD_data(LCD_w_data),
    .o_LCD_EN(LCD_w_EN),
    .o_LCD_RS(LCD_w_RS),
    .o_LCD_RW(LCD_w_RW),
    .o_write_fin(write_fin)
);
task mode2instructions(
    input [2:0] mode,
    input [5:0] count,
    
    output RS, WR, CL,
    output [7:0] data
);
    // stop 
    if(mode == 3'd0) begin
        CL      = 1'b1;
        RS      = clear[9];
        wR      = clear[8];
        data    = clear[7:0];
    end
    // pause
    else if(mode == 3'd1) begin
        CL      = 1'b0;
        RS      = pause[count][9];
        WR      = pause[count][8];
        data    = pause[count][7:0]; 
    end
    // recording 
    else if(mode == 3'd2) begin
        CL      = 1'b0;
        RS      = playing[count][9];
        WR      = playing[count][8];
        data    = playing[count][7:0]; 
    end
    // playing 
    else if(mode == 3'd3) begin
        CL      = 1'b0;
        RS      = recording[count][9];
        WR      = recording[count][8];
        data    = recording[count][7:0]; 
    end
    // clear
    else begin
        CL      = 1'b0;
        RS      = clear[count][9];
        WR      = clear[count][8];
        data    = clear[count][7:0]; 
    end
endtask

always_comb begin
    case(state_r)
        S_INIT: begin
            if(init_finish) begin
                state_w = S_IDLE;
            end
        end
        S_IDLE: begin
            if(i_start) begin
                state_w         = S_CLEAR;
                write_start_w   = 1'b1;
                mode2instructions(3'd4, 0, LCD_RS_w, LCD_RW_w, LCD_CL_w, LCD_data_w); 
            end
        end
        S_CLEAR: begin
            write_start_w   = 1'b0;
            if(write_fin) begin
                state_w         = S_WRITE;
            end            
        end
        S_WRITE: begin
            write_start_w   = 1'b1;
            state_w         = S_EVAL; 
            mode2instructions(i_mode, counter_r, LCD_RS_w, LCD_RW_w, LCD_CL_w, LCD_data_w);       
        end
        S_EVAL: begin
            write_start_w = 1'b0;
            if(write_fin) begin
                if(counter_r > length[i_mode]) begin
                    state_w         = S_IDLE;
                    write_start_w   = 1'b0;
                end
                else begin
                    state_w         = S_WRITE;
                    write_start_w   = 1'b1;    
                    counter_w       = counter_r + 1;
                end
            end
        end        
end

always_ff @(posedge i_clk or posedge i_rst_n) begin
    if(i_rst_n) begin
        state_r         <= 2'd0;
        init_start_r    <= 1'b0;
        LCD_data_r      <= 8'd0;
        write_start_r   <= 1'b0;
        LCD_CL_r        <= 1'b0;
        LCD_EN_r        <= 1'b0;
        LCD_CS_r        <= 1'b0;
        LCD_WR_r        <= 1'b0;
        counter_r       <= 6'd0;        
    end
    else begin
        state_r         <= state_w;
        init_start_r    <= init_start_w;
        LCD_data_r      <= LCD_data_w;
        write_start_r   <= write_start_w;
        LCD_CL_r        <= LCD_CL_w;
        LCD_EN_r        <= LCD_EN_w;
        LCD_CS_r        <= LCD_CS_w;
        LCD_WR_r        <= LCD_WR_w;
        counter_r       <= counter_w;
    end
end
endmodule