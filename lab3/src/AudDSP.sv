module AudDSP (
	input i_rst_n,
	input i_clk, // bclk
	input i_start, 
	input i_stop,
	input i_pause,
	input [3:0] i_speed, // from 2 to 8 (1/2 to 1/8)
	input i_fast,
	input i_slow_0, // constant interpolation
	input i_slow_1, // linear interpolation
	input i_daclrck,
	input i_sent_finish,
	input [19:0] i_record_counter,
	input [15:0] i_sram_data, // 16-bit data
	output [15:0] o_dac_data, // 16-bit data
	output [19:0] o_sram_addr, // total 1024K addresses
	output o_player_en, // AudPlayer enable
	output o_finish
);

parameter S_IDLE =          3'd0;
parameter S_FAST_FETCH =    3'd1;
parameter S_FAST_SENT =  	3'd2;
parameter S_SLOW_0_FETCH =  3'd3;
parameter S_SLOW_0_SENT  =  3'd4;
parameter S_SLOW_1_FETCH =  3'd5;
parameter S_SLOW_1_SENT =   3'd6;

logic       finished_r, finished_w;
logic       player_en_w, player_en_r;
logic [2:0] state_r, state_w;
logic [19:0] addr_r, addr_w;
logic [23:0] sent_counter_r, sent_counter_w;
logic [23:0] max_count, min_count; // min for fast & max for slow
logic signed [15:0] dac_data_r, dac_data_w;
logic signed [4:0] speed_r;
logic signed [15:0] sram_r1, sram_r2, sram_w1, sram_w2; // store consecutive sram data
logic [3:0] interpolation_counter_r, interpolation_counter_w; // interpolation count
logic [1:0] slow_fetch_counter_r, slow_fetch_counter_w;
logic signed [15:0] step;


assign o_sram_addr = addr_r;
assign o_player_en = player_en_r;
assign o_dac_data = dac_data_r;
assign o_finish = finished_r;
assign step = ($signed(sram_r2) - $signed(sram_r1)) / $signed(speed_r);


always_comb begin
	case(state_r)
		S_IDLE:
			begin
				sram_w1 = 0;
				sram_w2 = 0;
				sent_counter_w = 0;
				slow_fetch_counter_w = 0;
				interpolation_counter_w = 0;
				player_en_w = 0;
				addr_w = 0;
				dac_data_w = 0;
				// finished
				if(i_stop)
					finished_w = 1;
				else
					finished_w = 0;
				// FSM
				if(i_start && !i_pause)	begin
					if(i_fast)
						state_w = S_FAST_FETCH;
					else if(i_slow_0)
						state_w = S_SLOW_0_FETCH;
					else if(i_slow_1)
						state_w = S_SLOW_1_FETCH;
					else
						state_w = state_r;
				end
				else state_w = state_r;
			end
        
		S_FAST_FETCH:
			begin
				sram_w1 = sram_r1;
				sram_w2 = sram_r2;
				slow_fetch_counter_w = 0;
				interpolation_counter_w = 0;
				// finished
				if(i_stop)
					finished_w = 1;
				else
					finished_w = 0;
				// FSM
				if(i_stop || finished_r)
					state_w = S_IDLE;
				else
					state_w = S_FAST_SENT;


				// AudPlayer en && dac_data
				if(i_stop || finished_r) begin
					player_en_w = 0;
					dac_data_w = 0;
				end
				else begin
					dac_data_w = i_sram_data;
					if(i_daclrck && !i_pause)
						player_en_w = 1;
					else
						player_en_w = 0;
				end
				// address
				if(i_stop || finished_r)
					addr_w = 0;
				else begin
					if(sent_counter_r < min_count)
						addr_w = addr_r + {{15{1'b0}},speed_r};  //sram_address 以n倍速度跳
					else 
						addr_w = 0;
				end
				// sent_counter
				if(i_stop || finished_r)
					sent_counter_w = 0;
				else
					sent_counter_w = sent_counter_r + 1;		
			end
        
        S_FAST_SENT:
			begin
				sram_w1 = sram_r1;
				sram_w2 = sram_r2;
				slow_fetch_counter_w = 0;
				interpolation_counter_w = 0;
				// FSM
				if(i_stop)
					state_w = S_IDLE;
				else if(i_sent_finish)
					state_w = S_FAST_FETCH;
				else
					state_w = S_FAST_SENT;
				// dac_data
				if(i_stop)
					dac_data_w = 0;
				else
					dac_data_w = dac_data_r;
				// AudPlayer en 
				if(i_stop || i_sent_finish)
					player_en_w = 0;
				else if(player_en_r)
					player_en_w = player_en_r;
				else
					begin
						if(!i_daclrck || i_pause)
							player_en_w = 0;
						else
							player_en_w = 1;
					end
				// address && sent_counter
				if(i_stop) begin
					addr_w = 0;
					sent_counter_w = 0;
				end
				else begin
					addr_w = addr_r;
					sent_counter_w = sent_counter_r;
				end
				// done
				if(i_stop)
					finished_w = 1;
				else begin
					if((sent_counter_r == min_count) && i_sent_finish)
						finished_w = 1;
					else
						finished_w = 0;
				end
			end
		S_SLOW_0_FETCH:
			begin
				// FSM && interpolation_counter && sent_counter
				if(i_stop || finished_r) begin
					state_w = S_IDLE;
					interpolation_counter_w = 0;
					sent_counter_w = 0;
				end
				else if(slow_fetch_counter_r == 2) begin
					state_w = S_SLOW_0_SENT;
					sent_counter_w = sent_counter_r + 1;
					if((interpolation_counter_r + 1) == speed_r[3:0])  //got it
						interpolation_counter_w = 0;
					else
						interpolation_counter_w = interpolation_counter_r + 1;
				end
				else begin
					state_w = S_SLOW_0_FETCH;
					interpolation_counter_w = interpolation_counter_r;
					sent_counter_w = sent_counter_r;
				end

				// slow_fetch counter
				if(i_stop || finished_r)
					slow_fetch_counter_w = 0;
				else
					slow_fetch_counter_w = slow_fetch_counter_r + 1;
				
				// AudPlayer en
				if(i_stop || finished_r)
					player_en_w = 0;
				else if(slow_fetch_counter_r == 2) begin
					if(i_daclrck && !i_pause)
						player_en_w = 1'b1;
					else
						player_en_w = 0;
				end
				else
					player_en_w = 0;
				
				// address && sram_r && dac_data
				if(i_stop || finished_r) begin
					addr_w = 0;
					sram_w1 = 0;
					sram_w2 = 0;
					dac_data_w = 0;
				end
				else begin
					if (slow_fetch_counter_r == 0)begin
							addr_w = addr_r + 1;
							sram_w1 = i_sram_data;
							sram_w2 = sram_r2;
					end
					else if (slow_fetch_counter_r == 1) begin
						sram_w1 = sram_r1;
						sram_w2 = i_sram_data;
						if((interpolation_counter_r + 1'b1) == speed_r[3:0])
							addr_w = addr_r;
						else
							addr_w = addr_r - 1;
					end
					else begin
						sram_w1 = sram_r1;
						sram_w2 = sram_r2;
						addr_w = addr_r;
					end
					// dac_data 
					if(slow_fetch_counter_r == 2)
						dac_data_w = sram_r1;
					else
						dac_data_w = dac_data_r;
				end
				// done
				if(i_stop)
					finished_w = 1;
				else
					finished_w = 0;
			end
		S_SLOW_0_SENT:
			begin
				sram_w1 = sram_r1;
				sram_w2 = sram_r2;
				slow_fetch_counter_w = 0;
				// dac_data && interpolation counter
				if(i_stop) begin
					dac_data_w = 0;
					interpolation_counter_w = 0;
				end
				else begin
					dac_data_w = dac_data_r;
					interpolation_counter_w = interpolation_counter_r;
				end
				// FSM
				if(i_stop)
					state_w = S_IDLE;
				else if(i_sent_finish)
					state_w = S_SLOW_0_FETCH;
				else
					state_w = S_SLOW_0_SENT;
				
				// AudPlayer en
				if(i_stop || i_sent_finish)
					player_en_w = 0;
				else if(player_en_r)
					player_en_w = player_en_r;
				else
					begin
						if(!i_daclrck || i_pause)
							player_en_w = 0;
						else
							player_en_w = 1;
					end
				
				// address && sent_counter
				if(i_stop) begin
					addr_w = 0;
					sent_counter_w = 0;
				end
				else begin
					addr_w = addr_r;
					sent_counter_w = sent_counter_r;
				end
				
				// done
				if(i_stop)
					finished_w = 1;
				else begin
					if((sent_counter_r == max_count) && i_sent_finish)
						finished_w = 1;
					else
						finished_w = 0;
				end
			end
		
		S_SLOW_1_FETCH:
			begin
				// FSM && interpolation_counter && sent_counter
				if(i_stop || finished_r) begin
					state_w = S_IDLE;
					interpolation_counter_w = 0;
					sent_counter_w = 0;
				end
				else if(slow_fetch_counter_r == 2) begin
					state_w = S_SLOW_1_SENT;
					sent_counter_w = sent_counter_r + 1;
					if((interpolation_counter_r + 1) == speed_r[3:0])
						interpolation_counter_w = 0;
					else
						interpolation_counter_w = interpolation_counter_r + 1;
				end
				else begin
					state_w = S_SLOW_1_FETCH;
					interpolation_counter_w = interpolation_counter_r;
					sent_counter_w = sent_counter_r;
				end
				// slow_fetch counter
				if(i_stop || finished_r)
					slow_fetch_counter_w = 0;
				else
					slow_fetch_counter_w = slow_fetch_counter_r + 1'b1;
				
				// AudPlayer en
				if(i_stop || finished_r)
					player_en_w = 0;
				else if(slow_fetch_counter_r == 2) begin
					if(i_daclrck && !i_pause)
						player_en_w = 1'b1;
					else
						player_en_w = 0;
				end
				else
					player_en_w = 0;
				
				// address && slow_r && dac_data
				if(i_stop || finished_r) begin
					addr_w = 0;
					sram_w1 = 0;
					sram_w2 = 0;
					dac_data_w = 0;
				end
				else begin
					if (slow_fetch_counter_r == 0)begin
							addr_w = addr_r + 1;
							sram_w1 = i_sram_data;
							sram_w2 = sram_r2;
					end
					else if (slow_fetch_counter_r == 1) begin
						sram_w1 = sram_r1;
						sram_w2 = i_sram_data;
						if((interpolation_counter_r + 1'b1) == speed_r[3:0])
							addr_w = addr_r;
						else
							addr_w = addr_r - 1;
					end
					else begin
						sram_w1 = sram_r1;
						sram_w2 = sram_r2;
						addr_w = addr_r;
					end


					// dac_data 
					if(interpolation_counter_r == 0) begin
						if(slow_fetch_counter_r == 2)
							dac_data_w = sram_r1;
						else
							dac_data_w = dac_data_r;
					end
					else begin
						if(slow_fetch_counter_r == 2) begin
							dac_data_w = $signed(dac_data_r) + $signed(step);
						end
						else
							dac_data_w = dac_data_r;
					end
				end
				// done
				if(i_stop)
					finished_w = 1;
				else
					finished_w = 0;
			end
		
		
		S_SLOW_1_SENT: 
			begin
				sram_w1 = sram_r1;
				sram_w2 = sram_r2;
				slow_fetch_counter_w = 0;
				// dac_data
				if(i_stop) begin
					dac_data_w = 0;
					interpolation_counter_w = 0;
				end
				else begin
					dac_data_w = dac_data_r;
					interpolation_counter_w = interpolation_counter_r;
				end
				// FSM
				if(i_stop)
					state_w = S_IDLE;
				else if(i_sent_finish)
					state_w = S_SLOW_1_FETCH;
				else
					state_w = S_SLOW_1_SENT;
				// AudPlayer en
				if(i_stop || i_sent_finish)
					player_en_w = 0;
				else if(player_en_r)
					player_en_w = player_en_r;
				else
					begin
						if(!i_daclrck || i_pause)
							player_en_w = 0;
						else
							player_en_w = 1;
					end
				// address && sent_counter
				if(i_stop) begin
					addr_w = 0;
					sent_counter_w = 0;
				end
				else begin
					addr_w = addr_r;
					sent_counter_w = sent_counter_r;
				end
				// done
				if(i_stop)
					finished_w = 1;
				else begin
					if((sent_counter_r == max_count) && i_sent_finish)
						finished_w = 1;
					else
						finished_w = 0;
				end
			end
	
		default: begin
			state_w = S_IDLE;
			player_en_w = 0;
			sent_counter_w = 0;
			interpolation_counter_w = 0;
			finished_w = 0;
			addr_w = 0;
			slow_fetch_counter_w = 0;
			sram_w1 = 0;
			sram_w2 = 0;
			dac_data_w = 0;
		end
	endcase
end


always_ff @(posedge i_clk) begin
	if(!i_rst_n) begin
		state_r <= S_IDLE;
		addr_r <= 0;
		finished_r <= 0;
		player_en_r <= 0;
		dac_data_r <= 0;
		sent_counter_r <= 0;
		sram_r1 <= 0;
		sram_r2 <= 0;
		speed_r <= 0;
		interpolation_counter_r <= 0;
		slow_fetch_counter_r <= 0;
		max_count <= 0;
		min_count <= 0;
	end
	else begin
		state_r <= state_w;
		addr_r <= addr_w;
		finished_r <= finished_w;
		player_en_r <= player_en_w;
		dac_data_r <= dac_data_w;
		sent_counter_r <= sent_counter_w;
		sram_r1 <= sram_w1;
		sram_r2 <= sram_w2;
		speed_r <= {{1'b0},i_speed};
		interpolation_counter_r <= interpolation_counter_w;
		slow_fetch_counter_r <= slow_fetch_counter_w;
		max_count <= (speed_r * (i_record_counter - 1)) + 1; 
		min_count <= i_record_counter / speed_r;
	end
end
endmodule