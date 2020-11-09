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
    4'd6, 4'd7, 4'd9, 4'd11
};
parameter [9:0] stop[0:5] = '{
    10'b, 10'b, 10'b, 10'b, 10'b, 10'b
}
parameter [9:0] pause[0:6] = '{
    10'b, 10'b, 10'b, 10'b, 10'b, 10'b, 10'b
};
parameter [9:0] playing[0:8] = '{
    10'b, 10'b, 10'b, 10'b, 10'b, 10'b, 10'b, 10'b, 10'b,
};
parameter [9:0] recording[0:10] = '{
    10'b, 10'b, 10'b, 10'b, 10'b, 10'b, 10'b, 10'b, 10'b, 10'b, 10'b,
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

logic [3:0] counter_r, counter_w;

// LCD instruction interface 
logic LCD_i_EN, LCD_i_RS, LCD_i_RW;
logic [7:0] LCD_i_data;
logic inst_finish;

// LCD read/write interface 
logic LCD_w_EN, LCD_w_RS, LCD_w_RW;
logic [7:0] LCD_w_data;
logic write_fin;

// output interface 
assign o_LCD_data       = (state_r == ) ? LCD_w_data : LCD_i_data;
assign o_LCD_EN         = (state_r == ) ? LCD_w_EN : LCD_i_EN;
assign o_LCD_RS         = (state_r == ) ? LCD_w_RS : LCD_i_RS;
assign o_LCD_RW         = (state_r == ) ? LCD_w_RW : LCD_i_RW;

assign o_init_finish    = (state_r == ) ? : ;

LCD_instructions instructions(
	.i_clk(i_clk_800k),
	.i_start(init_start_r),
	.i_rst_n(i_rst_n),
    .i_type(),
    .i_address(),
	
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
    .i_LCD_RS(LCD_RS_r),
    .i_LCD_RW(LCD_RW_r),
    
    .o_LCD_data(LCD_w_data),
    .o_LCD_EN(LCD_w_EN),
    .o_LCD_RS(LCD_w_RS),
    .o_LCD_RW(LCD_w_RW),
    .o_write_fin(write_fin)
);
task mode2instructions(
    input [2:0] mode,
    input [5:0] count,
    
    output Rs, Rw,
    output [7:0] data
);
    // stop 
    if(mode == 3'd0) begin
        Rs      = stop[count][9];
        Rw      = stop[count][8];
        data    = stop[count][7:0];
    end
    // pause
    else if(mode == 3'd1) begin
        Rs      = pause[count][9];
        Rw      = pause[count][8];
        data    = pause[count][7:0]; 
    end
    // recording 
    else if(mode == 3'd2) begin
        Rs      = playing[count][9];
        Rw      = playing[count][8];
        data    = playing[count][7:0]; 
    end
    // playing 
    else begin
        Rs      = recording[count][9];
        Rw      = recording[count][8];
        data    = recording[count][7:0]; 
    end
endtask

always_comb begin
    state_w         = state_r;
    init_start_w    = init_start_r;
    LCD_data_w      = LCD_data_r;
    write_start_w   = write_start_r;
    LCD_CL_w        = LCD_CL_r;
    LCD_EN_w        = LCD_EN_r;
    LCD_CS_w        = LCD_CS_r;
    LCD_RW_w        = LCD_RW_r;
    counter_w       = counter_r;
    case(state_r)
        S_INIT: begin
            if(init_finish) begin
                state_w = S_IDLE;
            end
        end
        S_IDLE: begin
            if(i_start) begin
                state_w         = S_WRITE;
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
                if(counter_r == length[i_mode]) begin
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
        LCD_RW_r        <= 1'b0;
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
        LCD_RW_r        <= LCD_RW_w;
        counter_r       <= counter_w;
    end
end
endmodule