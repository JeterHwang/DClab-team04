module Montgomery(
    input           i_clk,
	input           i_rst,
	input           i_start,
    input  [255:0]  N,
    input  [255:0]  a,
    input  [255:0]  b,
    output [255:0]  m,
    output          calc_rd
);
// ====== states ========
parameter S_IDLE    = 2'd0;
parameter S_PREP    = 2'd1;
parameter S_ENDFOR  = 2'd2;
parameter S_READY   = 2'd3;
// ====== regs & wires ======
logic [255:0]   m_r, m_w;
logic [8:0]     i_r, i_w;
logic [1:0]     state_r, state_w;
logic           ready_r, ready_w;

// ==== output assignment ====
assign calc_rd = ready_r;
assign m       = mr;

// ====== combinational ======
always_comb begin
    if(i_start) begin
        state_w = S_PREP;
        m_w     = 256'd0;
        i_w     = 9'd0;
        ready_w = 1'b0;
    end
    else begin
        case (state_r)
            S_IDLE: begin
                state_w = state_r;
                m_w     = m_r;
                i_w     = i_r;
                ready_w = ready_r;    
            end
            S_PREP: begin
                ready_w = ready_r;
                i_w     = i_r + 9'd1;
                // update m
                if(((a >> i_r) & 1) && ((m_r + b) & 1)) begin
                    m_w = ((m_r + b + N) >> 1);
                end
                else if (((a >> i_r) & 1) && !((m_r + b) & 1)) begin
                    m_w = ((m_r + b) >> 1);
                end
                else if (!((a >> i_r) & 1) && ((m_r + b) & 1)) begin
                    m_w = ((m_r + N) >> 1);
                end
                else begin
                    m_w = (m_r >> 1);
                end
                // update state
                if(i_r == 9'd255) begin
                    state_w = S_ENDFOR;
                end
                else begin
                    state_w = state_r;
                end
            end
            S_ENDFOR: begin
                i_w = i_r;
                if(m_r >= N) begin
                    m_w     = m_r - N;
                    state_w = state_r;
                    ready_w = ready_r;
                end
                else begin
                    m_w     = m_r;
                    state_w = S_READY;
                    ready_w = 1'b1;   
                end
            end
            S_READY: begin
                state_w = state_r;
                m_w     = m_r;
                i_w     = i_r;
                ready_w = ready_r; 
            end
        endcase    
    end
    
end

// ====== sequential ========
always_ff @(posedge i_clk or posedge i_rst) begin
    if(i_rst) begin
        m_r     = 256'd0;
        i_r     = 9'd0;
        ready_r = 1'd0;
        state_r = S_IDLE;
    end
    else begin
        m_r     = m_w;
        i_r     = i_w;
        ready_r = ready_w;
        state_r = state_w;
    end
end
endmodule