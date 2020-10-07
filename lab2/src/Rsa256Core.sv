module Rsa256Core (
	input          i_clk,
	input          i_rst,
	input          i_start,
	input  [255:0] i_a, // cipher text y
	input  [255:0] i_d, // private key
	input  [255:0] i_n,
	output [255:0] o_a_pow_d, // plain text x
	output         o_finished
);
// operations for RSA256 decryption
// namely, the Montgomery algorithm
// ======= states ======
parameter S_IDLE 	= 3'd0;
parameter S_PREP 	= 3'd1;
parameter S_PREMONT = 3'd2;
parameter S_MONT 	= 3'd3;
parameter S_CALC 	= 3'd4;

// ======= registers & wires ======
logic [2:0] state_r, state_w;

logic prep_fin_r, prep_fin_w;			// prepare state finish
logic mod_start_r, mod_start_w;
logic tra_start_r, tra_start_w;		
logic update_m_fin_r, update_m_fin_w;	// calculate m finish
logic update_t_fin_r, update_t_fin_w;	// calculate t finish
logic cal_fin_r, cal_fin_w;				// calculate state finish

logic [8:0] count_r, count_w;     		// counter


logic [255:0] modulo_i_r, modulo_i_w; 		// m
logic [255:0] modulo_o_r, modulo_o_w;

logic [255:0] trans_ini_r, trans_ini_w;		// t
logic [255:0] trans_i_r, trans_i_w;   		
logic [255:0] trans_o_r, trans_o_w;

logic [255:0] output_r, output_w; 		// output

// ====== output assignment ======
assign o_a_pow_d  	= output_r;
assign o_finished 	= cal_fin_r;
// ====== call submodules ========
Montgomery montgomery_mt(
	.i_clk(i_clk),
	.i_rst(i_rst),
	.i_start(mod_start_r),
	.N(i_n),
	.a(modulo_i_r),
	.b(trans_i_r),
	.m(modulo_o_w),
	.calc_rd(update_m_fin_w)
);
Montgomery montgomery_tt(
	.i_clk(i_clk),
	.i_rst(i_rst),
	.i_start(tra_start_r),
	.N(i_n),
	.a(trans_i_r),
	.b(trans_i_r),
	.m(trans_o_w),
	.calc_rd(update_t_fin_w)
);
ModuloProduct moduloproduct(
	.i_clk(i_clk),
	.i_rst(i_rst),
	.i_start(i_start),
	.N(i_n),
	.b(i_y),
	.a(257'd(1<<256)),
	.k(9'd256),
	.t(trans_ini_w),
	.prep_rd(prep_fin_w)
);
// ======= combinational circuit =======
always_comb begin
	// default value
	state_w 		= state_r;
	mod_start_w		= mod_start_r;
	tra_start_w		= tra_start_r;
	cal_fin_w 		= cal_fin_r;
	count_w 		= count_r;
	modulo_i_w 		= modulo_i_r;
	trans_i_w  		= trans_i_r;
	output_w 		= output_r;
	// state cases
	case (state_r)
		S_IDLE: begin
			if(i_start) begin
				state_w 	= S_PREP;
			end
		end
		S_PREP: begin
			if(prep_fin_r) begin
				state_w 	= S_PREMONT;
				modulo_i_w 	= 256'd1;
				trans_i_w	= trans_ini_r;
				count_w		= 9'd0;
			end
		end
		S_PREMONT: begin
			tra_start_w		= 1'b1;
			state_w			= S_MONT;
			if((d >> count_r) & 1) begin
				mod_start_w = 1'b1;
			end
			else begin
				mod_start_w = 1'b0;
			end
		end
		S_MONT: begin
			// shut down the start signal 
			if(mod_start_r) begin
				mod_start_w = 1'b0;
			end
			if(tra_start_r) begin
				tra_start_w = 1'b0;
			end
			// mont finished
			if(update_t_fin_r && (update_t_fin_r || ((d >> count_r) & 1))) begin
				state_w 	= S_CALC;
			end
		end
		S_CALC: begin
			if(count_r != 9'd256) begin // keep iterating
				state_w 	= S_PREMONT;
				trans_i_w 	= trans_o_r;
				modulo_i_w 	= modulo_o_r;
				count_w 	= count_r + 9'd1;
			end
			else begin // output result
				state_w 	= S_IDLE;
				cal_fin_w 	= 1'b0;
				output_w 	= modulo_o_r;
			end
		end
	endcase
end

// ======= sequential circuit =========
always_ff @(posedge i_clk or posedge i_rst) begin
	if(i_rst) begin
		// changed
		state_r 		<= S_IDLE;
		mod_start_r 	<= 1'b0;
		tra_start_r 	<= 1'b0;
		// unchanged
		prep_fin_r 		<= prep_fin_w;
		update_m_fin_r 	<= update_m_fin_w;
		update_t_fin_r 	<= update_t_fin_w;
		cal_fin_r 		<= cal_fin_w;
		count_r 		<= count_w;
		modulo_i_r 		<= modulo_i_w;
		modulo_o_r 		<= modulo_o_w;
		trans_ini_r 	<= trans_ini_w;
		trans_i_r 		<= trans_i_w;
		trans_o_r 		<= trans_o_w;
		output_r 		<= output_w;
	end
	else begin
		state_r 		<= S_IDLE;
		mod_start_r 	<= mod_start_w;
		tra_start_r 	<= tra_start_w;
		prep_fin_r 		<= prep_fin_w;
		update_m_fin_r 	<= update_m_fin_w;
		update_t_fin_r 	<= update_t_fin_w;
		cal_fin_r 		<= cal_fin_w;
		count_r 		<= count_w;
		modulo_i_r 		<= modulo_i_w;
		modulo_o_r 		<= modulo_o_w;
		trans_ini_r 	<= trans_ini_w;
		trans_i_r 		<= trans_i_w;
		trans_o_r 		<= trans_o_w;
		output_r 		<= output_w;
	end
end
endmodule

/***************************************/
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


/*******************************/
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
    case (state_r)
         S_IDLE: begin
            if(i_start) begin
                state_w = S_PREP;
                m_w     = 256'd0;
                i_w     = 9'd0;
                ready_w = 1'b0;
            end
            else begin
                state_w = state_r;
                m_w     = m_r;
                i_w     = i_r;
                ready_w = ready_r;    
            end
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
                state_w = S_IDLE;
                ready_w = 1'b1;   
            end
        end
    endcase    
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

