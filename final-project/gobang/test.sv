module Score (
	input         i_clk,
	input         i_rst_n,
	input         i_start,
                  
	output [24:0] out
);
parameter S_IDLE = 1'd0;
parameter S_FINISH = 1'd1;
logic [31:0] count_w, count_r;
logic [31:0] state_w, state_r;
assign out = count_r;
task ff;

input [31:0] count;
        begin
            for(int i=0; i<=2; i++) begin
                count[31 - i] = i;
            end
            for(int j=0; j<=6; j++) begin
                count[31 - j] = j;
            end


        end
endtask
always_comb begin
    state_w         = state_r;
    count_w         = count_r;
    case(state_r)
        S_IDLE: begin
            ff(count_w);
            state_w = S_FINISH;
        end
        S_FINISH: begin
            state_w = S_IDLE;

        end
    endcase


end

always_ff @(negedge i_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        state_r         <= S_IDLE;
        count_r         <= 0;

    end
    else begin
        state_r         <= state_w;
        count_r         <= count_w;

    end
end

endmodule