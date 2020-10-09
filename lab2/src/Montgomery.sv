module Montgomery(
    input           i_clk,
    input           i_rst,
    input           i_start,
    input  [257:0]  N,
    input  [255:0]  a,
    input  [257:0]  b,
    output [255:0]  m,
    output          calc_rd
);
// ====== states ========
parameter S_IDLE    = 2'd0;
parameter S_PREP   = 2'd1;
parameter S_CALC    = 2'd2;
// ====== regs & wires ======
logic [257:0]   m_r, m_w;
logic [8:0]     i_r, i_w;
logic [1:0]     state_r, state_w;
logic           ready_r, ready_w;

// ==== output assignment ====
assign calc_rd = ready_r;
assign m       = m_r[255:0];

// ====== combinational ======
always_comb begin
    state_w = state_r;
    m_w     = m_r;
    i_w     = i_r;
    ready_w = ready_r;
    case (state_r)
        S_IDLE: begin
            if(i_start) begin
                state_w = S_PREP1;
                m_w     = 258'd0;
                i_w     = 9'd0;
                ready_w = 1'b0;
            end
        end
        S_PREP: begin
            state_w = S_CALC;
            if((a[i_r] & 1) && ((m_r + b) & 258'd1)) begin
                m_w = ((m_r + b + N) >> 1);
            end
            else if ((a[i_r] & 1) && !((m_r + b) & 258'd1)) begin
                m_w = ((m_r + b) >> 1);
            end
            else if (!(a[i_r] & 1) && (m_r[0] & 1)) begin
                m_w = ((m_r + N) >> 1);
            end
            else begin
                m_w = (m_r >> 1);
            end
        end
        S_CALC: begin
            if(i_r == 9'd255) begin // end for loop
                state_w = S_IDLE;
                ready_w = 1'b1;
                // final update m
                if(m_r >= N) begin
                    m_w     = m_r - N;
                end
            end
            else begin // keep iterating
                state_w = S_PREP;
                i_w     = i_r + 9'd1;    
            end
        end
    endcase    
end

// ====== sequential ========
always_ff @(posedge i_clk or posedge i_rst) begin
    if(i_rst) begin
        m_r     <= 258'd0;
        i_r     <= 9'd0;
        ready_r <= 1'd0;
        state_r <= S_IDLE;
    end
    else begin
        m_r     <= m_w;
        i_r     <= i_w;
        ready_r <= ready_w;
        state_r <= state_w;
    end
end
endmodule
