module I2cInitializer(
    input i_rst,
    input i_clk,
    input i_start,
    output o_finished,
    output o_sclk,
    output o_oen,
    output o_sdat
);

parameter bit [23:0] data_array [0:10] = '{
        24'b0011_0100_000_0000_0_1001_0111,
        24'b0011_0100_000_0001_0_1001_0111,
        24'b0011_0100_000_0010_0_0111_1001,
        24'b0011_0100_000_0011_0_0111_1001,
        24'b0011_0100_000_1111_0_0000_0000,
        24'b0011_0100_000_0100_0_0001_1101,
        24'b0011_0100_000_0101_0_0000_0000,
        24'b0011_0100_000_0110_0_0000_0000,
        24'b0011_0100_000_0111_0_0100_0010, 
        24'b0011_0100_000_1000_0_0001_1001,
        24'b0011_0100_000_1001_0_0000_0001
};
parameter S_IDLE = 0 ;
parameter S_START = 1 ;
parameter S_CHANGE = 2 ;
parameter S_TRANS = 3 ;
parameter S_PREPACK = 4 ;
parameter S_ACK = 5 ;
parameter S_HOLD = 6 ;
parameter S_FINISH = 7 ;

logic [2:0] state_w, state_r ;
logic [4:0] bit_counter_w, bit_counter_r ;
logic [3:0] data_counter_w, data_counter_r ;
logic [23:0] data_w, data_r ;
logic sclk_w, sclk_r ;
logic sda_w, sda_r ;
logic o_finished_w, o_finished_r ;
logic o_oen_w, o_oen_r ; 

assign o_finished = o_finished_r ;
assign o_sclk = sclk_r ;
assign o_oen = o_oen_r ;
assign o_sdat = sda_r;

always_comb begin
    state_w = state_r ;
    bit_counter_w = bit_counter_r ;
    data_counter_w = data_counter_r ;
    data_w = data_r ;
    sclk_w = sclk_r ;
    sda_w = sda_r ;
    o_finished_w = o_finished_r ;
    o_oen_w = o_oen_r ;
    case(state_r)
        S_IDLE : begin
            sda_w = 1 ;
            sclk_w = 1 ;
            o_oen_w = 1 ;
            bit_counter_w = 0 ;
            if(data_counter_r == 11)
            begin
                o_finished_w = 1 ;
                state_w = S_IDLE ;
            end
            else
            begin
                if(i_start)
                begin
                    state_w = S_START ;
                end
                else
                begin
                    state_w = S_IDLE ;
                end
            end
        end
        S_START : begin
            data_w = data_array[data_counter_r] ;
            sda_w = 0 ;
            state_w = S_CHANGE ;
        end
        S_CHANGE : begin
            o_oen_w = 1 ;
            sclk_w = 0 ;
            sda_w = data_r[23-bit_counter_r] ;
            bit_counter_w = bit_counter_r + 1 ;
            state_w = S_TRANS ;            
        end
        S_TRANS : begin
            if(bit_counter_r%8 == 0)
            begin
                sclk_w = 1 ;
                state_w = S_PREPACK ;
            end
            else
            begin
                sclk_w = 1 ;
                state_w = S_CHANGE ;
            end
        end
        S_PREPACK : 
        begin
            sclk_w =  0 ;
            o_oen_w = 0 ;
            state_w = S_ACK ;
        end
        S_ACK : 
        begin
            if(bit_counter_r == 24)
            begin
                sclk_w = 1 ;
                state_w = S_HOLD ;
                bit_counter_w = 0 ;
            end
            else
            begin
                sclk_w = 1 ;
                state_w = S_CHANGE ;
            end
        end
        S_HOLD : begin
            sclk_w = 0 ;
            sda_w = 0 ;
            o_oen_w = 1 ;
            state_w = S_FINISH ;
        end
        S_FINISH : 
        begin
            sclk_w = 1 ;
            state_w = S_IDLE ;
            data_counter_w = data_counter_r + 1 ;
        end               
    endcase	
end

always_ff @(posedge i_clk or posedge i_rst) 
begin
	if (i_rst) begin
        state_r <= S_IDLE ;
        bit_counter_r <= 0 ;
        data_counter_r <= 0 ;
        data_r <= 0 ;
        sclk_r <= 0 ;
        sda_r <= 0 ;
        o_finished_r <= 0 ;
        o_oen_r <= 1 ;		
	end
	else begin
        state_r <= state_w ;
        bit_counter_r <= bit_counter_w ;
        data_counter_r <= data_counter_w ;
        data_r <= data_w ;
        sclk_r <= sclk_w ;
        sda_r <= sda_w ;
        o_finished_r <= o_finished_w ;
        o_oen_r <= o_oen_w ;		
	end
end

endmodule