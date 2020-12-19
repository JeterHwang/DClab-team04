module Score (
	input         i_clk,
	input         i_rst_n,
	input         i_start,
                  
	output [24:0] out
);
logic [30:0] state_w, state_r;

always_comb begin
    for(int i=0; i<=2; i++) begin
        state_w = i;
    end
    for(int j=0; j<=6; i++) begin
        state_w = i;
    end



end

always_ff @(negedge i_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        state_r         <= 0;

    end
    else begin
        state_r         <= state_w;

    end