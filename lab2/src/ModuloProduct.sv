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
parameter S_IDLE  = 1'b0;
parameter S_PREP  = 1'b1;
// ====== regs & wires ======
logic [255:0]   t_r, t_w;
logic [255:0]   m_r, m_w;
logic [8:0]     i_r, i_w;
logic           state_r, state_w;
logic           ready_r, ready_w;

// ==== output assignment ====
assign prep_rd = ready_r;
assign t       = mr;

// ====== combinational =====
always_comb begin
    case (state_r)    
        S_IDLE: begin
            if(i_start) begin
                state_w = S_PREP;
                t_w     = b;
                m_w     = 256'd0;
                i_w     = 9'd0;
                ready_w = 0'd0;    
            end
            else begin
                state_w = state_r;
                t_w     = t_r;
                m_w     = m_r;
                i_w     = i_r;
                ready_w = ready_r;
            end    
        end
        S_PREP: begin
            // update m
            if((a >> i_r) & 1) begin
                m_w = m_r + t_r - N;
            end
            else begin
                m_w = m_r + t_r;
            end
            // update t
            if(t_r + t_r > N) begin
                t_w = t_r + t_r - N;
            end
            else begin
                t_w = t_r + t_r;
            end
            // update state
            if(i_r == k) begin
                ready_w = 1'b1;
                state_w = S_IDLE;
            end
            else begin
                ready_w = ready_r;
                state_w = state_r;
            end
            // update i
            i_w = i_r + 9'd1;
        end
    endcase           
end

// ====== sequential ========
always_ff @(posedge i_clk or posedge i_rst) begin
    if(i_rst) begin
        t_r     = 256'd0;
        m_r     = 256'd0;
        i_r     = 9'd0;
        ready_r = 1'd0;
        state_r = S_IDLE;
    end
    else begin
        t_r     = t_w;
        m_r     = m_w;
        i_r     = i_w;
        ready_r = ready_w;
        state_r = state_w;
    end
end
endmodule
