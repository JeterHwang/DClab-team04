module Score (
	input         i_clk,
	input         i_rst_n,
    input          [4:0] i_data,
                  
	output         [4:0] out
);
parameter S_IDLE = 1'd0;
parameter S_FINISH = 1'd1;
logic [4:0] count_w, count_r;
logic [4:0] no_w, no_r;
logic  state_w, state_r;
assign out = count_r;

task ff;


    input [4:0] data;
            begin
                for(int i=0; i<=2; i++) begin
                    count_w = data;
                end
                for(int j=0; j<=4; j++) begin
                    no_w = data;
                end


            end
endtask
always_comb begin
    state_w         = state_r;
    count_w         = count_r;
    no_w         = no_r;
    case(state_r)
        S_IDLE: begin
            ff(i_data);
            // count_w [2] = i_data;
            // count_w [1] = i_data;
            // count_w [0] = i_data;
            state_w = S_FINISH;
            end

        S_FINISH: begin
            state_w = S_IDLE;
       end
    endcase

end

always_ff @(posedge i_clk or posedge i_rst_n) begin
    if (i_rst_n) begin
        state_r         <= S_IDLE;
        count_r         <= 0;
        no_r            <= 0;

    end
    else begin
        state_r         <= state_w;
        count_r         <= count_w;
        no_r            <= no_w;

    end
end

endmodule