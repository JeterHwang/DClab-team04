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
parameter S_READ    = 2;
parameter S_WRITE   = 3;

// Host interface 
logic [1:0] state_r, state_w;
logic init_start_r, init_start_w;
logic write_start_r, write_start_w;
logic LCD_EN_r, LCD_EN_w;
logic LCD_RS_r, LCD_RS_w;
logic LCD_RW_r, LCD_RW_w;
logic [7:0] LCD_data_r, LCD_data_w;

// LCD initiate interface 
logic LCD_i_EN, LCD_i_RS, LCD_i_RW;
logic [7:0] LCD_i_data;
logic init_finish;

// LCD read/write interface 
logic LCD_w_EN, LCD_w_RS, LCD_w_RW;
logic [7:0] LCD_w_data;

// output interface 
assign o_LCD_data       = init_finish ? LCD_w_data : LCD_i_data;
assign o_LCD_RS         = init_finish ? LCD_w_RS : LCD_i_RS;
assign o_LCD_RW         = init_finish ? LCD_w_RW : LCD_i_RW;
assign o_init_finish    = init_finish;

LCD_initializer initializer(
	.i_clk(i_clk_800k),
	.i_start(init_start_r),
	.i_rst_n(i_rst_n),
    .i_bf(i_bf)
	
	.o_LCD_data(LCD_i_data),
	.o_LCD_EN(LCD_i_EN),
	.o_LCD_RS(LCD_i_RS),
	.o_LCD_RW(LCD_i_RW)
    .o_ini_finish(init_finish)
);

LCD_controller controller(
    .i_clk(i_clk),
    .i_start(),
    .i_rst_n(i_rst_n),
    .i_LCD_data(LCD_data_r),
    .i_LCD_EN(LCD_EN_r),
    .i_LCD_RS(LCD_RS_r),
    .i_LCD_WR(LCD_WR_r),
    
    .o_LCD_data(LCD_w_data),
    .o_LCD_EN(LCD_w_EN),
    .o_LCD_RS(LCD_w_RS),
    .o_LCD_RW(LCD_w_RW)
);

always_comb begin
    case(state_r)
        S_INIT: begin
            
        end
        S_IDLE: begin
            
        end
        S_READ: begin
            
        end
        S_WRITE: begin
            
        end
end

always_ff @(posedge i_clk or posedge i_rst_n) begin
    if(i_rst_n) begin
        state_r         <= 2'd0;
        init_start_r    <= 1'b0;
        LCD_data_r      <= 8'd0;
    end
    else begin
        state_r         <= state_w;
        init_start_r    <= init_start_w;
        LCD_data_r      <= LCD_data_w;
    end
end
endmodule