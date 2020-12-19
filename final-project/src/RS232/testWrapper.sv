module Rsa256Wrapper (
    input         avm_rst,
    input         avm_clk,
    output  [4:0] avm_address,
    output        avm_read,
    input  [31:0]  avm_readdata,
    output        avm_write,
    output [31:0]  avm_writedata,
    input         avm_waitrequest
);

localparam RX_BASE     = 0*4;
localparam TX_BASE     = 1*4;
localparam STATUS_BASE = 2*4;
localparam TX_OK_BIT   = 6;
localparam RX_OK_BIT   = 7;

// Feel free to design your own FSM!
localparam S_READ_READY = 0;
localparam S_GET_DATA = 1;
localparam S_WRITE_READY = 2;
localparam S_SEND_DATA = 3;

logic [2:0] state_r, state_w;
logic [4:0] avm_address_r, avm_address_w;
logic avm_read_r, avm_read_w, avm_write_r, avm_write_w;

logic [7:0]data_r,data_w;
logic cal_start_r,cal_start_w;


assign avm_address = avm_address_r;
assign avm_read = avm_read_r;
assign avm_write = avm_write_r;
assign avm_writedata = data_r[7:0];


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
    avm_address_w       = avm_address_r;
    avm_read_w          = avm_read_r;
    avm_write_w         = avm_write_r;
    state_w             = state_r;
    case (state_r)
		S_READ_READY: begin
            if(!avm_waitrequest && avm_readdata[RX_OK_BIT] == 1'b1) begin
                state_w = S_GET_DATA;
                StartRead(RX_BASE);
            end
		end
        S_GET_DATA: begin
            if(!avm_waitrequest) begin
                data_w = avm_readdata[7:0];
                state_w = S_WRITE_READY;
                rsa_start_w = 1;
                avm_read_w = 0;
                StartRead(STATUS_BASE);
            end
		end
		S_WRITE_READY: begin
			if(!avm_waitrequest && avm_readdata[TX_OK_BIT] == 1) begin
                state_w = S_SEND_DATA;
                StartWrite(TX_BASE);
            end
        end
		S_SEND_DATA: begin
            if(!avm_waitrequest) begin
                state_w = S_READ_READY;
                StartRead(STATUS_BASE);  
            end
        end
	endcase
end

always_ff @(posedge avm_clk or posedge avm_rst) begin
    if (avm_rst) begin
        data_r          <= 0;
        avm_address_r   <= STATUS_BASE;
        avm_read_r      <= 1;
        avm_write_r     <= 0;
        state_r         <= S_READ_READY;
    end else begin
        data_r          <= data_w;
        avm_address_r   <= avm_address_w;
        avm_read_r      <= avm_read_w;
        avm_write_r     <= avm_write_w;
        state_r         <= state_w;
    end
end

endmodule
