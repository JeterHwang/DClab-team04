module ModuloProduct(
    input          i_clk,
    input          i_rst,
    input          i_start,
    input  [255:0] N,
    input  [255:0] b,
    input  [256:0] a,
    input  [8:0]   k,
    output [255:0] t,
    output         prep_rd
);
// ====== states ========
parameter S_IDLE  = 2'd0;
parameter S_PREP  = 2'd1;
parameter S_CALC  = 2'd2;
// ====== regs & wires ======
logic [256:0]   t_r, t_w;
logic [256:0]   m_r, m_w;
logic [8:0]     i_r, i_w;
logic [1:0]     state_r, state_w;
logic           ready_r, ready_w;

// ==== output assignment ====
assign prep_rd = ready_r;
assign t       = m_r[255:0];

// ====== combinational =====
always_comb begin
    state_w = state_r;
    ready_w = ready_r;    
    i_w     = i_r;
    t_w     = t_r;
    m_w     = m_r;
    case (state_r)    
        S_IDLE: begin
            if(i_start) begin
                state_w = S_PREP;
                t_w     = {1'b0, b};
                m_w     = 257'd0;
                i_w     = 9'd0;
                ready_w = 1'd0;    
            end
        end
        S_PREP: begin
            // update m
            if(a[i_r] & 1) begin
                if(m_r + t_r >= N) begin
			        m_w = m_r + t_r - N;
                end
                else begin
                    m_w = m_r + t_r;;    
                end
		    end
            // update t
            if(t_r + t_r > N) begin
                t_w = t_r + t_r - N;
            end
            else begin
                t_w = t_r + t_r;
            end
            // update state
            state_w = S_CALC;
        end
        S_CALC: begin
            if(i_r == k) begin
                state_w = S_IDLE;
                ready_w = 1'b1;
            end
            else begin
                state_w = S_PREP;
                i_w = i_r + 9'd1;
            end
        end
    endcase           
end

// ====== sequential ========
always_ff @(posedge i_clk or posedge i_rst) begin
    if(i_rst) begin
        t_r     <= 257'd0;
        m_r     <= 257'd0;
        i_r     <= 9'd0;
        ready_r <= 1'd0;
        state_r <= S_IDLE;
    end
    else begin
        t_r     <= t_w;
        m_r     <= m_w;
        i_r     <= i_w;
        ready_r <= ready_w;
        state_r <= state_w;
    end
end
endmodule
