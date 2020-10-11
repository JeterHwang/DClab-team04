module Rsa256Wrapper (
    input         avm_rst,
    input         avm_clk,
    output  [4:0] avm_address,
    output        avm_read,
    input  [31:0] avm_readdata,
    output        avm_write,
    output [31:0] avm_writedata,
    input         avm_waitrequest
);

localparam RX_BASE     = 0*4;
localparam TX_BASE     = 1*4;
localparam STATUS_BASE = 2*4;
localparam TX_OK_BIT   = 6;
localparam RX_OK_BIT   = 7;

// Feel free to design your own FSM!
localparam S_READ_READY = 0;
localparam S_GET_PU_KEY = 1;
localparam S_GET_PR_KEY = 2;
localparam S_GET_DATA = 3;
localparam S_WAIT_CALCULATE = 4;
localparam S_WRITE_READY = 5;
localparam S_SEND_DATA = 6;

logic [255:0] n_r, n_w, d_r, d_w, enc_r, enc_w, dec_r, dec_w;
logic [2:0] state_r, state_w;
logic [10:0] bytes_counter_r, bytes_counter_w;
logic [4:0] avm_address_r, avm_address_w;
logic avm_read_r, avm_read_w, avm_write_r, avm_write_w;

logic rsa_start_r, rsa_start_w;
logic rsa_finished;
logic [255:0] rsa_dec;

assign avm_address = avm_address_r;
assign avm_read = avm_read_r;
assign avm_write = avm_write_r;
assign avm_writedata = dec_r[247-:8];

Rsa256Core rsa256_core(
    .i_clk(avm_clk),
    .i_rst(avm_rst),
    .i_start(rsa_start_r),
    .i_a(enc_r),
    .i_d(d_r),
    .i_n(n_r),
    .o_a_pow_d(rsa_dec),
    .o_finished(rsa_finished)
);

task StartRead;
    input [4:0] addr;
    begin
        avm_read_w = 1;
        avm_write_w = 0;
        avm_address_w = addr;
    end
endtask
task StartWrite;
    input [4:0] addr;
    begin
        avm_read_w = 0;
        avm_write_w = 1;
        avm_address_w = addr;
    end
endtask

always_comb begin
    n_w                 = n_r;
    d_w                 = d_r;
    enc_w               = enc_r;
    dec_w               = dec_r;
    avm_address_w       = avm_address_r;
    avm_read_w          = avm_read_r;
    avm_write_w         = avm_write_r;
    state_w             = state_r;
    bytes_counter_w     = bytes_counter_r;
    rsa_start_w         = rsa_start_r;
    case (state_r)
		S_READ_READY: begin
            if(avm_readdata[RX_OK_BIT] == 1'd1) begin
                if(avm_waitrequest == 1'd0) begin
                    state_w = S_GET_PU_KEY;
                    StartRead(RX_BASE);
                    bytes_counter_w = 11'd0;
                end
            end
		end
		S_GET_PU_KEY: begin
            //n_w = avm_readdata[{avm_readdata[7:0], 3'b111} : {avm_readdata[7:0], 3'b000}];
            if(avm_waitrequest == 1'd0) begin
                n_w[((bytes_counter_r << 3)+7)-:8] = avm_readdata[7:0];
                bytes_counter_w = bytes_counter_r + 11'b1;
            end
                if(bytes_counter_r == 31) begin
                    state_w = S_GET_PR_KEY;
                    bytes_counter_w = 11'd0;
                end
            
		end
        S_GET_PR_KEY: begin
            //exitd_w = avm_readdata[{avm_readdata[7:0], 3'b111} : {avm_readdata[7:0], 3'b000}];
            if(avm_waitrequest == 1'd0) begin
                d_w[((bytes_counter_r << 3)+7)-:8] = avm_readdata[7:0];
                bytes_counter_w = bytes_counter_r + 11'b1;
            end
            if(bytes_counter_r == 31) begin
                state_w = S_GET_DATA;
                bytes_counter_w = 11'b0;
            end
		end
        S_GET_DATA: begin
            //enc_w = avm_readdata[{avm_readdata[7:0], 3'b111} : {avm_readdata[7:0], 3'b000}];
            if(avm_waitrequest == 1'd0) begin
                enc_w[((bytes_counter_r << 3)+7)-:8] = avm_readdata[7:0];
                bytes_counter_w = bytes_counter_r + 11'b1;
            end
            if(bytes_counter_r == 31) begin
                state_w = S_WAIT_CALCULATE;
                bytes_counter_w = 11'b0;
                rsa_start_w = 1;
            end
		end
		S_WAIT_CALCULATE: begin
            rsa_start_w = 0;
            if(rsa_finished) begin
                dec_w = rsa_dec;
                state_w = S_WRITE_READY;
                avm_address_w = STATUS_BASE;
            end
		end
		S_WRITE_READY: begin
			if(avm_readdata[TX_OK_BIT] == 1) begin
                if(avm_waitrequest == 1'd0) begin
                    state_w = S_SEND_DATA;
                    StartWrite(TX_BASE);
                    bytes_counter_w = 11'b0;
                end
            end
        end
		S_SEND_DATA: begin
            dec_w = (dec_r << 8);
            bytes_counter_w = bytes_counter_r + 1'b1;
            if(bytes_counter_r == 30) begin
                state_w = S_READ_READY;
            end
        end
	endcase
end

always_ff @(posedge avm_clk or posedge avm_rst) begin
    if (avm_rst) begin
        n_r             <= 0;
        d_r             <= 0;
        enc_r           <= 0;
        dec_r           <= 0;
        avm_address_r   <= STATUS_BASE;
        avm_read_r      <= 1;
        avm_write_r     <= 0;
        state_r         <= S_READ_READY;
        bytes_counter_r <= 63;
        rsa_start_r     <= 0;
    end else begin
        n_r             <= n_w;
        d_r             <= d_w;
        enc_r           <= enc_w;
        dec_r           <= dec_w;
        avm_address_r   <= avm_address_w;
        avm_read_r      <= avm_read_w;
        avm_write_r     <= avm_write_w;
        state_r         <= state_w;
        bytes_counter_r <= bytes_counter_w;
        rsa_start_r     <= rsa_start_w;
    end
end

endmodule
