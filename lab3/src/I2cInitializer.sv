module I2cIntializer(
    input i_rst_n,
    input i_clk,
    input i_start,
    output o_finished,
    output o_sclk,
    output o_sdat,
    output o_oen
);

parameter S_IDLE    = 3'd0;
parameter S_BUFFER  = 3'd1;
parameter S_BLUE    = 3'd2;
parameter S_GREEN   = 3'd3;
parameter S_DELAY   = 3'd4;
parameter S_DONE    = 3'd5;

parameter [23:0] INIT_DATA [6:0] = '{
	// 24'b0011_0100_000_0000_0_1001_0111, // Left Line In
	// 24'b0011_0100_000_0001_0_1001_0111,	// Right Line In
	// 24'b0011_0100_000_0010_0_0111_1001, // Left Headphone Out 
	// 24'b0011_0100_000_0011_0_0111_1001,	// Right Headphone Out
	27'b0011_0100_1_000_1001_0_1_0000_0001_1,  // Active Control
    27'b0011_0100_1_000_1000_0_1_0001_1001_1, // Sampling Control
    27'b0011_0100_1_000_0111_0_1_0100_0010_1, // Digital Audio Interface Format
    27'b0011_0100_1_000_0110_0_1_0000_0000_1, // Power Down Control
    27'b0011_0100_1_000_0101_0_1_0000_0000_1, // Digital Audio Path Control
    27'b0011_0100_1_000_0100_0_1_0001_0101_1, // Analogue Audio Path Control
    27'b0011_0100_1_000_1111_0_1_0000_0000_1 // Reset
};


logic [2:0] state_r , state_w;
logic       SCL_r, SCL_w;
logic       oen_r, oen_w;
logic       SDA_r, SDA_w;
logic       finished_r, finished_w;
logic [5:0] counts_r, counts_w;
logic [4:0] init_r, init_w;

assign o_finished   = finished_r;
assign o_sclk       = SCL_r;
assign o_sdat       = SDA_r;
assign o_oen        = oen_r;

always_comb begin
    state_w     = state_r;
    finished_w  = finished_r;
    SCL_w       = SCL_r;
    SDA_w       = SDA_r;
    oen_w       = oen_r;
    counts_w    = counts_w;
    init_w      = init_r;
    case (state_r)
        S_IDLE: begin
            if (i_start) begin
                SDA_w       = 1'b0;
                state_w     = S_BUFFER;
                init_w      = 5'd0;
                counts_w    = 6'd0;
            end
        end
        S_BUFFER: begin
            state_w     = S_BLUE;
            SCL_w       = 1'b0;
            SDA_w       = INIT_DATA[init_r][26 - counts_r];
            counts_w    = 6'd0;
        end
        S_BLUE: begin
            SCL_w       = 1'b1 ; 
            if(counts_r == 27)
                state_w     = S_DELAY;
            else
                state_w     = S_GREEN;
            counts_w    = counts_r + 1;
        end
        S_GREEN: begin
            SCL_w       = 1'b0;
            SDA_w       = INIT_DATA[init_r][26 - counts_r];
            state_w     = S_BLUE;
            if(counts_r == 8 || counts_r == 17 || counts_r == 26)  
                oen_w       = 1'b0;
            else 
                oen_w       = 1'b1;
            
        end
        S_DELAY: begin
            state_w     = S_DONE;
            SDA_w       = 1'b1;
        end
        S_DONE: begin
            if(init_r == 6) begin
                state_w      = S_IDLE;
                finished_w   = 1'b1;
            end
            else begin
                state_w     = S_BUFFER;
                SDA_w       = 1'b0;
                init_w      = init_r + 1;    
            end
        end
    endcase
    
end

always_ff @(posedge i_clk) begin
    if (!i_rst_n) begin
        state_r     <= S_IDLE;
        oen_r       <= 1'b1;
        SCL_r       <= 1'b1;
        SDA_r       <= 1'b1;

        counts_r    <= 1'b0;
        init_r      <= 1'b0;   

    end
    else begin
        state_r		<= state_w;
        SCL_r       <= SCL_w;
        SDA_r       <= SDA_w;
        counts_r    <= counts_w;
        init_r      <= init_w;
        oen_r       <= oen_w;
    end
end

endmodule

