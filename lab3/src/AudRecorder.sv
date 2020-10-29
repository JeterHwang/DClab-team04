module AudRecorder(
    input   i_rst_n,
    input   i_clk,
    input   i_lrc,
    input   i_start,
    input   i_pause,
    input   i_stop,
    input   i_data,
    output  o_address,
    output  o_data
);
logic [1:0] state_r, state_w;
logic [19:0] address_r, address_w;
logic [15:0] data_r, data_w;
logic [19:0] counter_r, counter_w;

assign o_address = address_r;
assign o_data = data_r;

always_comb begin
    state_w             = state_r;
    address_w           = address_r;
    data_w              = data_r;
    counter_w           = counter_r;
    case (state_r) begin
        IDLE: begin
            
        end

        PAUSE: begin
            
        end

        STOP: begin
            
        end
    end
end

always_ff @(posedge i_clk or posedge i_rst_n) begin
    if (i_rst_n) begin
        state_r             <= IDLE;
        address_r           <= address_w;
        data_r              <= data_w;
        counter_r           <= 0;
    end
    else begin
        state_r             <= state_w;
        address_r           <= address_w;
        data_r              <= data_w;
        counter_r           <= counter_w;
    end

end
endmodule