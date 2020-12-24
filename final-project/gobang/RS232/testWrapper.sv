module Top (
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

logic [7:0] data_r,data_w;
// logic cal_start_r,cal_start_w;


assign avm_address = avm_address_r;
assign avm_read = avm_read_r;
assign avm_write = avm_write_r;
assign avm_writedata = data_r[7:0];


// task StartRead;
//     input [4:0] addr;
//     begin
//         avm_read_w = 1;
//         avm_write_w = 0;
//         avm_address_w = addr;
//     end
// endtask
// task StartWrite;
//     input [4:0] addr;
//     begin
//         avm_read_w = 0;
//         avm_write_w = 1;
//         avm_address_w = addr;
//     end
// endtask

always_comb begin
	 state_w = state_r;
    avm_read_w = avm_read_r;
    avm_write_w = avm_write_r;
    data_w = data_r;
    avm_address_w = avm_address_r;
    case(state_r)
        S_GET_DATA: begin
            avm_read_w = 1;
            avm_write_w = 0;
            if(!avm_waitrequest) begin
                if (avm_readdata[RX_OK_BIT] && (avm_address_r == STATUS_BASE)) begin
                    state_w = state_r;
                    avm_address_w = RX_BASE;
                    data_w = data_r;
                end
                else if (avm_address_r == RX_BASE) begin
                    state_w = S_SEND_DATA;
                    avm_address_w = STATUS_BASE;
                    data_w = avm_readdata[7:0];
                end
                else begin
                    state_w = state_r;
                    avm_address_w = avm_address_r;
                    data_w = data_r;
                    avm_read_w = avm_read_r;
                    avm_write_w = avm_write_r;
                end
            end
            else begin
                state_w = state_r;
                avm_address_w = avm_address_r;
                data_w = data_r;
                avm_read_w = avm_read_r;
                avm_write_w = avm_write_r;
            end
		end
		S_SEND_DATA: begin
            avm_read_w = 1;
            avm_write_w = 0;
            if(!avm_waitrequest) begin
                if(avm_readdata[TX_OK_BIT] && (avm_address_r == STATUS_BASE))begin
                    state_w = state_r;
                    avm_address_w = TX_BASE;
                    avm_read_w = 0;
                    avm_write_w = 1;
                end
                else if (avm_address_r == TX_BASE) begin
                    state_w = S_GET_DATA;
                    avm_address_w = STATUS_BASE;
                    avm_read_w = 1;
                    avm_write_w = 0;
                end
                else begin
                    state_w = state_r;
                    avm_address_w = avm_address_r;
                    avm_read_w = avm_read_r;
                    avm_write_w = avm_write_r;
                end 
            end
            else begin
                state_w = state_r;
                avm_address_w = avm_address_r;
                avm_read_w = avm_read_r;
                avm_write_w = avm_write_r;
            end
        end
        default: begin
            state_w = state_r;
            avm_read_w = avm_read_r;
            avm_write_w = avm_write_r;
            data_w = data_r;
            avm_address_w = avm_address_r;
        end
	endcase
end

always_ff @(posedge avm_clk or negedge avm_rst) begin
    if (!avm_rst) begin
        data_r          <= 8'b0;
        avm_address_r   <= STATUS_BASE;
        avm_read_r      <= 1;
        avm_write_r     <= 0;
        state_r         <= S_GET_DATA;
    end 
    else begin
        data_r          <= data_w;
        avm_address_r   <= avm_address_w;
        avm_read_r      <= avm_read_w;
        avm_write_r     <= avm_write_w;
        state_r         <= state_w;
    end
end

endmodule
