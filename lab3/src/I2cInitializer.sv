module I2cIntializer(
    input i_rst_n,
    input i_clk,
    input i_start,
    output o_finished,
    output o_sclk,
    output o_sdat,
    output O_oen
);

parameter S_IDLE =   3'd0;
parameter S_BUFFER = 3'd1;
parameter S_BLUE=    3'd2;
parameter S_GREEN =  3'd3;
parameter S_ACKING = 3'd4;
parameter S_DONE =   3'd5;

parameter bit[23:0] INIT_DATA [0:6] = '{
	24'b0011_0100_000_1111_0_0000_0000, // Reset
	// 24'b0011_0100_000_0000_0_1001_0111, // Left Line In
	// 24'b0011_0100_000_0001_0_1001_0111,	// Right Line In
	// 24'b0011_0100_000_0010_0_0111_1001, // Left Headphone Out 
	// 24'b0011_0100_000_0011_0_0111_1001,	// Right Headphone Out
	24'b0011_0100_000_0100_0_0001_0101, // Analogue Audio Path Control
	24'b0011_0100_000_0101_0_0000_0000, // Digital Audio Path Control
	24'b0011_0100_000_0110_0_0000_0000, // Power Down Control
	24'b0011_0100_000_0111_0_0100_0010, // Digital Audio Interface Format
	24'b0011_0100_000_1000_0_0001_1001, // Sampling Control
	24'b0011_0100_000_1001_0_0000_0001  // Active Control
};


logic [1:0] state_r , state_w;
logic       SCL_r, SCL_w;
logic       oen_r, oen_w;
logic       SDA_r, SDA_w;
logic       finished_r,finished_w;
logic       ack_r,ack_w;
logic [5:0] counts_r , counts_w;
logic [4:0] init_r, init_w;

assign o_finished = finished_r;
assign o_sclk = SCL_r;
assign io_sdat =  SDA_r;

always_comb begin
    state_w = state_r;
    fininshed_w = fininshed_r;
    SCL_w = SCL_r;
    SDA_w = SDA_r;
    oen_w = oen_r;
    counts_w = counts_w;
    init_w = init_r;
    ack_w = ack_r;

    case (state_r)
        S_IDLE: begin
            if (i_start) begin
                SDA_w = 1'b0;
                oen_w = 1'b1;
                SCL_w = 1'b1;
                state_w = S_BUFFER;
            end
        end

        S_BUFFER: begin
                state_w = S_BLUE;
        end
        
        S_BLUE: begin
            state_w = S_GREEN;
            // oen_w = 1'b1 ;                            // is outputing
            SCL_w = 1'b1 ;                            // 0
            SDA_w = INIT_DATA[init_r][23- counts_r];  // x->x'
            counts_w = counts_r + 1;  
        end

        S_GREEN: begin
            SCL_w = 1'b0;
            if (counts_r == 8 || counts_r == 16 || counts_r == 24 ) begin
                state_w = S_ACKING;
            end
            else begin
                state_w = S_BLUE;
            end
            
        end

        S_ACKING: begin
            oen_w = 1'b0 ;     // not outputing
            if (ack_r == 1'b0) begin
                ack_w = 1'b1;git 
                SCL_w = 1'b0;
            end
            else begin
                ack_w = 1'b0;
                SCL_w = 1'b1;
                if (counts_r == 24) begin
                    state_w = S_DONE;
                    init_w = init_r + 1;
                end
                else begin
                    state_w = S_BLUE;
                end
            end
        end
        S_DONE: begin
            state_w = S_IDLE;
            SDA_w = 1'b1;
            SCL_w = 1'b1;
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
        ack_r       <= 1'b0;

    end
    else begin
        state_r		<= state_w;
        SCL_r       <= SCL_w;
        SDA_r       <= SDA_w;
        counts_r    <= counts_w;
        inits_r     <= init_w;
        oen_r       <= oen_r;
        ack_r       <= ack_w;
        
    end
end

endmodule

