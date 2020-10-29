module I2cIntializer(
    input i_rst_n,
    input i_clk,
    input i_start,
    output o_finished,
    output o_sclk,
    output o_sdat,
    output O_oen
);

parameter S_IDLE = 2'd0;
parameter S_S= 2'd1;
parameter S_BLUE = 2'd2;
parameter S_GREEN = 2'd3;


logic [1:0] state_r , state_w;
logic       SCL_r, SCL_w;
logic       SDA_r, SDA_w;
logic [2:0] times_r , times_w;

assign o_sclk = SCL_r;
assign o_sdat = SDA_r;

always_comb begin
    state_w = state_r;
    SCL_w = SCL_r;
    times_w = times_r;
    case (state_r)
        S_IDLE: begin
            if (!i_start) begin
                SDA_w = 1'b0;
                state_w = S_S;
                times_w = 3'd0;
            end
        end

        S_S: begin
            state_w = S_BLUE;
        end

        S_BLUE: begin
            SCL_w = 1'b0;
            state_w = S_GREEN;
        end
        S_GREEN: begin
            SCL_w = 1'b1;
            state_w = S_BLUE;
            state_w = state_r + 1;
        end
        
    endcase
    
end

always_ff @(posedge i_clk) begin
    if (i_rst_n) begin
        pass
    end
    else begin
        pass
    end
end

endmodule

