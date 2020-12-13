typedef logic [1:0] chess_board [224:0];
module Score (
	input         i_clk,
	input         i_rst_n,
	input         i_start,
	input         chess_board i_board,         // 15*15*2 bit chess boad
    input         i_turn,
    input  [16:0] i_parent_score,                     
	output [16:0] o_score                      // 17 bit score
);

parameter S_IDLE 		= 4'd0;
parameter S_UP 			= 4'd1;
parameter S_DOWN 		= 4'd2;
parameter S_RIGHT 		= 4'd3;
parameter S_LEFT 		= 4'd4;
parameter S_UPPER_LEFT 	= 4'd5;
parameter S_UPPER_RIGHT = 4'd6;
parameter S_DOWN_LEFT 	= 4'd7;
parameter S_DOWN_RIGHT 	= 4'd8;
parameter S_EVALUATE 	= 4'd9;
parameter S_ADD 		= 4'd10;
parameter S_FIX 		= 4'd11;

logic state_r, state_w;
logic score_r, score_w;

assign o_score     = score_r;

always_comb begin
    state_w             = state_r;
	score_w				= score_r;
	 
	case (state_r) 

    endcase
end

always_ff @(negedge i_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        state_r             <= S_IDLE;
		score_r				<= score_w;
    end
    else begin
        state_r             <= state_w;
		score_r				<= score_w;

    end

end













endmodule
