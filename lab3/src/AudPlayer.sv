module AudPlayer(
	input i_rst_n,
	input i_bclk,
	input i_daclrck,
	input i_en, // enable AudPlayer only when playing audio, work with AudDSP
	input [15:0] i_dac_data, //dac_data
	output o_aud_dacdat,
	output o_sent_finish
);
// parameters
parameter IDLE = 0;
parameter SENT = 1;
// logic declaration
logic [1:0] state_w, state_r;
logic [4:0] sent_counter_w, sent_counter_r;
logic finish_r, finish_w;
logic aud_data_r, aud_data_w;
// wire assignment
assign o_sent_finish = finish_r;
assign o_aud_dacdat = (!i_daclrck) ? aud_data_r : 1'b0;
// start working only when i_en is high && i_daclrck is low && pause is low
// ===== Combinational part ==
always_comb begin
	case(state_r)
		IDLE: begin
			// FSM && sent counter && o_aud_dacdat && finish
			finish_w = 0;
			if(i_en && !i_daclrck) begin
				state_w = SENT;
				sent_counter_w = sent_counter_r + 1;
				aud_data_w = i_dac_data[15 - sent_counter_r[3:0]];
			end
			else begin
				state_w = IDLE;
				sent_counter_w = 0;
				aud_data_w = 0;
			end
		end
		SENT: begin
			// finish
			if(sent_counter_r == 16) begin
				finish_w = 1;
			end
			else begin
				finish_w = 0;
			end
			// FSM && sent counter
			if(sent_counter_r == 16 || !i_en) begin
				state_w = IDLE;
				sent_counter_w = 0;
				aud_data_w = 0;
			end
			else begin
				state_w = SENT;
				sent_counter_w = sent_counter_r + 1;
				aud_data_w = i_dac_data[15 - sent_counter_r[3:0]];
			end
		end
		default: begin
			state_w = IDLE;
			finish_w = 0;
			sent_counter_w = 0;
			aud_data_w = 0;
		end
	endcase
end
// ===== Sequential part =====
always_ff @(negedge i_bclk or negedge i_rst_n) begin
	if(!i_rst_n) begin
		state_r <= 0;
		sent_counter_r <= 0;
		finish_r <= 0;
		aud_data_r <= 0;
	end
	else begin
		state_r <= state_w;
		sent_counter_r <= sent_counter_w;
		finish_r <= finish_w;
		aud_data_r <= aud_data_w;
	end
end
endmodule