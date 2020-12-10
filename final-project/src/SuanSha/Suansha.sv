typedef logic [1:0] chess_board [224:0];
module Suansha(
    input               i_clk,
	input               i_rst_n,
	input               i_start,
	input  chess_board  i_board,
    input               
);
parameter S_RESET = 3'd0;

logic [2:0] state_r, state_w;

always_comb begin
    case(state_r)
        
    endcase    
end
always_ff @(posedge i_clk, negedge i_rst_n) begin
    if(!i_rst_n) begin
        state_r     => 3'd0;
    end
    else begin
        state_r     => state_w;
    end
end
endmodule