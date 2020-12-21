typedef logic [1:0] chess_board [224:0];
module Score (
	input         i_clk,
	input         i_rst_n,
	input         i_start,
	input         board i_board,         // 15*15*2 bit chess board
    input         i_turn,          
	output signed [31:0] o_score,                      // 32 bit score
    output        o_finish
);

parameter S_BLACK 		= 4'd5;
parameter S_WHITE       = 4'd6;
parameter S_EVALUATE    = 4'd7;


parameter FIVE              = 24'd1000000;
parameter FOUR              = 24'd100000;
parameter THREE             = 24'd1000;
parameter TWO               = 24'd100;
parameter ONE               = 24'd10;
parameter BLOCKED_FOUR      = 24'd10000;
parameter BLOCKED_THREE     = 24'd100;
parameter BLOCKED_TWO       = 24'd10;

parameter b         = 2'd0;
parameter w         = 2'd1;
parameter l         = 2'd2;

parameter logic [1:0] black_con_five [0:4] = '{b, b, b, b, b};
parameter logic [1:0] black_con_four [0:5] = '{l, b, b, b, b, l};
parameter logic [1:0] black_con_three [0:4] = '{l, b, b, b, l};
parameter logic [1:0] black_jump_one_three_o [0:5] = '{l, b, l, b, b, l};
parameter logic [1:0] black_jump_one_three_r [0:5] = '{l, b, b, l, b, l};
parameter logic [1:0] black_con_two [0:5] = '{l, l, b, b, l, l};
parameter logic [1:0] black_blank_one_two [0:4] = '{l, b, l, b, l};
parameter logic [1:0] black_blank_two_two [0:5] = '{l, b, l, l, b, l};
parameter logic [1:0] black_con_one [0:2] = '{l, b, l};

parameter logic [1:0] black_blocked_con_four_o [0:5] = '{l, b, b, b, b, w };
parameter logic [1:0] black_blocked_con_four_r [0:5] = '{w, b, b, b, b, l };
parameter logic [1:0] black_blocked_jump_one_four_o [0:4] = '{b, l, b, b, b};
parameter logic [1:0] black_blocked_jump_one_four_r [0:4] = '{b, b, b, l, b};
parameter logic [1:0] black_blocked_jump_two_four [0:4] = '{b, b, l, b, b};
parameter logic [1:0] black_blocked_con_three_o [0:5] = '{l, l, b, b, b, w};
parameter logic [1:0] black_blocked_con_three_r [0:5] = '{w, b, b, b, l, l};
parameter logic [1:0] black_blocked_jump_one_three_o [0:5] = '{l, b, l, b, b, w};
parameter logic [1:0] black_blocked_jump_one_three_r [0:5] = '{w, b, b, l, b, l};
parameter logic [1:0] black_blocked_jump_two_three_o [0:5] = '{l, b, b, l, b, w};
parameter logic [1:0] black_blocked_jump_two_three_r [0:5] = '{w, b, l, b, b, l};
parameter logic [1:0] black_blocked_blank_one_three_o [0:4] = '{b, l, l, b, b};
parameter logic [1:0] black_blocked_blank_one_three_r [0:4] = '{b, b, l, l, b};
parameter logic [1:0] black_blocked_blank_two_three [0:4] = '{b, l, b, l, b};
parameter logic [1:0] black_blocked_double_three [0:6] = '{w, l, b, b ,b, l, w};
parameter logic [1:0] black_blocked_con_two_o [0:5] = '{l, l, l, b, b, w };
parameter logic [1:0] black_blocked_con_two_r [0:5] = '{w, b, b, l, l, l };
parameter logic [1:0] black_blocked_blank_one_two_o [0:5] = '{l, l, b, l, b, w};
parameter logic [1:0] black_blocked_blank_one_two_r [0:5] = '{w, b, l, b, l, l};
parameter logic [1:0] black_blocked_blank_two_two_o [0:5] = '{l, b, l, l, b, w};
parameter logic [1:0] black_blocked_blank_two_two_r [0:5] = '{w, b, l, l, b, l};
parameter logic [1:0] black_blocked_blank_three_two [0:4] = '{b, l, l, l, b};
parameter logic [1:0] black_blocked_one_o [0:2] = '{w, b, l};
parameter logic [1:0] black_blocked_one_r [0:2] = '{l, b, w};

parameter logic [1:0] white_con_five [0:4] = '{w, w, w, w, w};
parameter logic [1:0] white_con_four [0:5] = '{l, w, w, w, w, l};
parameter logic [1:0] white_con_three [0:4] = '{l, w, w, w, l};
parameter logic [1:0] white_jump_one_three_o [0:5] = '{l, w, l, w, w, l};
parameter logic [1:0] white_jump_one_three_r [0:5] = '{l, w, w, l, w, l};
parameter logic [1:0] white_con_two [0:5] = '{l, l, w, w, l, l};
parameter logic [1:0] white_blank_one_two [0:4] = '{l, w, l, w, l};
parameter logic [1:0] white_blank_two_two [0:5] = '{l, w, l, l, w, l};
parameter logic [1:0] white_con_one [0:2] = '{l, w, l};

parameter logic [1:0] white_blocked_con_four_o [0:5] = '{l, w, w, w, w, b };
parameter logic [1:0] white_blocked_con_four_r [0:5] = '{b, w, w, w, w, l };
parameter logic [1:0] white_blocked_jump_one_four_o [0:4] = '{w, l, w, w, w};
parameter logic [1:0] white_blocked_jump_one_four_r [0:4] = '{w, w, w, l, w};
parameter logic [1:0] white_blocked_jump_two_four [0:4] = '{w, w, l, w, w};
parameter logic [1:0] white_blocked_con_three_o [0:5] = '{l, l, w, w, w, b};
parameter logic [1:0] white_blocked_con_three_r [0:5] = '{b, w, w, w, l, l};
parameter logic [1:0] white_blocked_jump_one_three_o [0:5] = '{l, w, l, w, w, b};
parameter logic [1:0] white_blocked_jump_one_three_r [0:5] = '{b, w, w, l, b, l};
parameter logic [1:0] white_blocked_jump_two_three_o [0:5] = '{l, w, w, l, w, w};
parameter logic [1:0] white_blocked_jump_two_three_r [0:5] = '{w, w, l, w, w, l};
parameter logic [1:0] white_blocked_blank_one_three_o [0:4] = '{w, l, l, w, w};
parameter logic [1:0] white_blocked_blank_one_three_r [0:4] = '{w, w, l, l, w};
parameter logic [1:0] white_blocked_blank_two_three [0:4] = '{w, l, w, l, w};
parameter logic [1:0] white_blocked_double_three [0:6] = '{b, l, w, w ,w, l, b};
parameter logic [1:0] white_blocked_con_two_o [0:5] = '{l, l, l, w, w, b };
parameter logic [1:0] white_blocked_con_two_r [0:5] = '{b, w, w, l, l, l };
parameter logic [1:0] white_blocked_blank_one_two_o [0:5] = '{l, l, w, l, w, b};
parameter logic [1:0] white_blocked_blank_one_two_r [0:5] = '{b, w, l, w, l, l};
parameter logic [1:0] white_blocked_blank_two_two_o [0:5] = '{l, w, l, l, w, b};
parameter logic [1:0] white_blocked_blank_two_two_r [0:5] = '{b, w, l, l, w, l};
parameter logic [1:0] white_blocked_blank_three_two [0:4] = '{w, l, l, l, w};
parameter logic [1:0] white_blocked_one_o [0:2] = '{b, w, l};
parameter logic [1:0] white_blocked_one_r [0:2] = '{l, w, b};



logic [3:0]  state_r, state_w;
logic signed [31:0] white_score_r, white_score_w;
logic signed [31:0] black_score_r, black_score_w;
logic signed [31:0] score_r, score_w;
logic [11:0] counter_r, counter_w;
logic finished_r, finished_w;

logic  [224:0] n1_five_r , n1_five_w ;                      
logic  [224:0] n1_four_r , n1_four_w ;                     
logic  [224:0] n1_con_three_r , n1_con_three_w ;           
logic  [224:0] n1_jump_one_three_r , n1_jump_one_three_w ;          
logic  [224:0] n1_con_two_r , n1_con_two_w ;                
logic  [224:0] n1_blank_one_two_r , n1_blank_one_two_w ;      
logic  [224:0] n1_blank_two_two_r , n1_blank_two_two_w ;     
logic  [224:0] n1_con_one_r , n1_con_one_w ;                      
logic  [224:0] b1_con_four_r , b1_con_four_w ;    
logic  [224:0] b1_jump_one_four_r , b1_jump_one_four_w ;    
logic  [224:0] b1_jump_two_four_r , b1_jump_two_four_w ;  
logic  [224:0] b1_con_three_r , b1_con_three_w ;          
logic  [224:0] b1_jump_one_three_r , b1_jump_one_three_w ;
logic  [224:0] b1_jump_two_three_r , b1_jump_two_three_w ;

logic  [224:0] b1_blank_one_three_r , b1_blank_one_three_w ; 
logic  [224:0] b1_blank_two_three_r , b1_blank_two_three_w ; 
logic  [224:0] b1_double_three_r , b1_double_three_w ;
logic  [224:0] b1_con_two_r , b1_con_two_w ;              
logic  [224:0] b1_blank_one_two_r , b1_blank_one_two_w ;      
logic  [224:0] b1_blank_two_two_r , b1_blank_two_two_w ;    
logic  [224:0] b1_blank_three_two_r , b1_blank_three_two_w ;  
logic  [224:0] b1_con_one_r , b1_con_one_w ;               

logic  [224:0] n2_five_r , n2_five_w ;               
logic  [224:0] n2_four_r , n2_four_w ;                     
logic  [224:0] n2_con_three_r , n2_con_three_w ;            
logic  [224:0] n2_jump_one_three_r , n2_jump_one_three_w ;        
logic  [224:0] n2_con_two_r , n2_con_two_w ;            
logic  [224:0] n2_blank_one_two_r , n2_blank_one_two_w ;
logic  [224:0] n2_blank_two_two_r , n2_blank_two_two_w ;    
logic  [224:0] n2_con_one_r , n2_con_one_w ;                     
logic  [224:0] b2_con_four_r , b2_con_four_w ;       
logic  [224:0] b2_jump_one_four_r , b2_jump_one_four_w ;    
logic  [224:0] b2_jump_two_four_r , b2_jump_two_four_w ;   
logic  [224:0] b2_con_three_r , b2_con_three_w ;       
logic  [224:0] b2_jump_one_three_r , b2_jump_one_three_w ;
logic  [224:0] b2_jump_two_three_r , b2_jump_two_three_w ;

logic  [224:0] b2_blank_one_three_r , b2_blank_one_three_w ; 
logic  [224:0] b2_blank_two_three_r , b2_blank_two_three_w ;  
logic  [224:0] b2_double_three_r , b2_double_three_w ;
logic  [224:0] b2_con_two_r , b2_con_two_w ;              
logic  [224:0] b2_blank_one_two_r , b2_blank_one_two_w ; 
logic  [224:0] b2_blank_two_two_r , b2_blank_two_two_w ;    
logic  [224:0] b2_blank_three_two_r , b2_blank_three_two_w ; 
logic  [224:0] b2_con_one_r , b2_con_one_w ;                       

assign o_finish = finished_r;



  
task Compare_five;
    input [224:0] pattern_cal ;
    input [1:0] pattern_check [0:4];
    input [1:0] chess_board [0:224];
    input [11:0] counter;

    begin
    repeat(15) begin
        for (int i = 0; i <= 10; i++) begin
            if( '{chess_board[counter+i*15], chess_board[counter+(i+1)*15], chess_board[counter+(i+2)*15], 
            chess_board[counter+(i+3)*15], chess_board[counter+(i+4)*15] } === pattern_check) begin
                pattern_cal[counter+ i*15] = 1;
            end
            else begin
                pattern_cal[counter+ i*15] = 0;
            end      
        end
        counter ++;
    end
    counter = 0;

    end
endtask

task Compare_seven;
    input [224:0] pattern_cal ;
    input [1:0] pattern_check [0:6];
    input [1:0] chess_board [0:224];
    input [11:0] counter;

    begin
    repeat(15) begin
        for (int i = 0; i <= 8; i++) begin
            if( '{chess_board[counter+i*15], chess_board[counter+(i+1)*15], chess_board[counter+(i+2)*15], 
            chess_board[counter+(i+3)*15], chess_board[counter+(i+4)*15], chess_board[counter+(i+5)*15], chess_board[counter+(i+6)*15] } === pattern_check) begin
                pattern_cal[counter+ i*15] = 1;
            end
            else begin
                pattern_cal[counter+ i*15] = 0;
            end      
        end
        counter ++;
    end
    counter = 0;

    end
endtask
task Compare_six;
    input [224:0] pattern_cal;
    input [1:0] pattern_check [0:5];
    input [1:0] chess_board [0:224];
    input [11:0] counter;

    begin
    repeat(15) begin
        for (int i = 0; i <= 9; i++) begin
            if( '{chess_board[counter+i*15], chess_board[counter+(i+1)*15], chess_board[counter+(i+2)*15], 
            chess_board[counter+(i+3)*15], chess_board[counter+(i+4)*15], chess_board[counter+(i+5)*15] } === pattern_check) begin
                pattern_cal[counter+ i*15] = 1;
            end
            else begin
                pattern_cal[counter+ i*15] = 0;
            end
            
        end
        counter ++;
    end
    counter = 0;

    end
endtask
task Compare_three;
    input [224:0] pattern_cal;
    input [1:0] pattern_check [0:2];
    input [1:0] chess_board [0:224];
    input [11:0] counter;

    begin
    repeat(15) begin
        for (int i = 0; i <= 12; i++) begin
            if( '{chess_board[counter+i*15], chess_board[counter+(i+1)*15], chess_board[counter+(i+2)*15] } === pattern_check) begin
                pattern_cal[counter+ i*15] = 1;
            end
            else begin
                pattern_cal[counter+ i*15] = 0;
            end
        end
        counter ++;
    end
    counter = 0;
    end
endtask

task Count;

    // input [23:0] pattern_store,
    input [224:0] pattern_board;
    input signed [31:0] score;
    begin
    for (int i=0; i<=224; i++) begin
        if (pattern_board[i] == 1) begin
            score += 1;
        end
    
    end

    end
endtask
assign o_score     = score_r;

always_comb begin
    state_w                 = state_r;
    black_score_w           = black_score_r;
    white_score_w           = white_score_r;
	score_w				    = score_r;
    counter_w                = counter_r;
    finished_w             = finished_r;

    n1_five_w                = n1_five_r;
    n1_four_w                = n1_four_r;
    n1_con_three_w           = n1_con_three_r;
    n1_jump_one_three_w      = n1_jump_one_three_r;
    n1_con_two_w             = n1_con_two_r;
    n1_blank_one_two_w       = n1_blank_one_two_r;
    n1_blank_two_two_w       = n1_blank_two_two_r;
    n1_con_one_w             = n1_con_one_r;

    b1_con_four_w            = b1_con_four_r;
    b1_jump_one_four_w       = b1_jump_one_four_r;
    b1_jump_two_four_w       = b1_jump_two_four_r;
    b1_con_three_w           = b1_con_three_r;      
    b1_jump_one_three_w      = b1_jump_one_three_r; 
    b1_jump_two_three_w      = b1_jump_two_three_r;
    b1_blank_one_three_w     = b1_blank_one_three_r;
    b1_blank_two_three_w     = b1_blank_two_three_r;
    b1_double_three_w        = b1_double_three_r;  
    b1_con_two_w             = b1_con_two_r;          
    b1_blank_one_two_w       = b1_blank_one_two_r; 
    b1_blank_two_two_w       = b1_blank_two_two_r;    
    b1_blank_three_two_w     = b1_blank_three_two_r;
    b1_con_one_w             = b1_con_one_r;

    n2_five_w                = n2_five_r;
    n2_four_w                = n2_four_r;
    n2_con_three_w           = n2_con_three_r;
    n2_jump_one_three_w      = n2_jump_one_three_r;
    n2_con_two_w             = n2_con_two_r;
    n2_blank_one_two_w       = n2_blank_one_two_r;
    n2_blank_two_two_w       = n2_blank_two_two_r;
    n2_con_one_w             = n2_con_one_r;

    b2_con_four_w            = b2_con_four_r;
    b2_jump_one_four_w       = b2_jump_one_four_r;
    b2_jump_two_four_w       = b2_jump_two_four_r;
    b2_con_three_w           = b2_con_three_r;      
    b2_jump_one_three_w      = b2_jump_one_three_r; 
    b2_jump_two_three_w      = b2_jump_two_three_r;
    b2_blank_one_three_w     = b2_blank_one_three_r;
    b2_blank_two_three_w     = b2_blank_two_three_r;
    b2_double_three_w        = b2_double_three_r;  
    b2_con_two_w             = b2_con_two_r;          
    b2_blank_one_two_w       = b2_blank_one_two_r; 
    b2_blank_two_two_w       = b2_blank_two_two_r;    
    b2_blank_three_two_w     = b2_blank_three_two_r;
    b2_con_one_w             = b2_con_one_r;

    
	case (state_r)
        S_BLACK: begin
            if(i_start) begin
            finished_w = 0;
            Compare_five(n1_five_w, black_con_five, i_board, counter_w);
            Compare_six(n1_four_w, black_con_four, i_board, counter_w);
            Compare_six(b1_con_four_w, black_blocked_con_four_o, i_board, counter_w);
            Compare_six(b1_con_four_w, black_blocked_con_four_r, i_board, counter_w);
            Compare_five(b1_jump_one_four_w, black_blocked_jump_one_four_o, i_board, counter_w);
            Compare_five(b1_jump_one_four_w, black_blocked_jump_one_four_r, i_board, counter_w);
            Compare_five(b1_jump_two_four_w, black_blocked_jump_two_four, i_board, counter_w);
            Compare_five(n1_con_three_w, black_con_three, i_board, counter_w);
            Compare_six(n1_jump_one_three_w, black_jump_one_three_o, i_board, counter_w);
            Compare_six(n1_jump_one_three_w, black_jump_one_three_r, i_board, counter_w);
            Compare_six(b1_con_three_w, black_blocked_con_three_o, i_board, counter_w);
            Compare_six(b1_con_three_w, black_blocked_con_three_r, i_board, counter_w);
            Compare_six(b1_jump_one_three_w, black_blocked_jump_one_three_o, i_board, counter_w);
            Compare_six(b1_jump_one_three_w, black_blocked_jump_one_three_r, i_board, counter_w);
            Compare_six(b1_jump_two_three_w, black_blocked_jump_two_three_o, i_board, counter_w);
            Compare_six(b1_jump_two_three_w, black_blocked_jump_two_three_r, i_board, counter_w);
            Compare_five(b1_blank_one_three_w, black_blocked_blank_one_three_o, i_board, counter_w);
            Compare_five(b1_blank_one_three_w, black_blocked_blank_one_three_o, i_board, counter_w);
            Compare_five(b1_blank_two_three_w, black_blocked_blank_two_three, i_board, counter_w);
            Compare_seven(b1_double_three_w, black_blocked_double_three, i_board, counter_w);
            Compare_six(n1_con_two_w, black_con_two, i_board, counter_w);
            Compare_five(n1_blank_one_two_w, black_blank_one_two, i_board, counter_w);
            Compare_six(n1_blank_two_two_w, black_blank_two_two, i_board, counter_w);
            Compare_six(b1_con_two_w, black_blocked_con_two_o, i_board, counter_w);
            Compare_six(b1_con_two_w, black_blocked_con_two_r, i_board, counter_w);
            Compare_six(b1_blank_one_two_w, black_blocked_blank_one_two_o, i_board, counter_w);
            Compare_six(b1_blank_one_two_w, black_blocked_blank_one_two_r, i_board, counter_w);
            Compare_six(b1_blank_two_two_w, black_blocked_blank_two_two_o, i_board, counter_w);
            Compare_six(b1_blank_two_two_w, black_blocked_blank_two_two_r, i_board, counter_w);
            Compare_five(b1_blank_three_two_w, black_blocked_blank_three_two, i_board, counter_w);
            Compare_three(n1_con_one_w, black_con_one, i_board, counter_w);
            Compare_three(b1_con_one_w, black_blocked_one_o, i_board, counter_w);
            Compare_three(b1_con_one_w, black_blocked_one_r, i_board, counter_w);
            state_w = S_WHITE;
            end
        end
        S_WHITE: begin

            Compare_five(n2_five_w, white_con_five, i_board, counter_w);
            Compare_six(n2_four_w, white_con_four, i_board, counter_w);
            Compare_six(b2_con_four_w, white_blocked_con_four_o, i_board, counter_w);
            Compare_six(b2_con_four_w, white_blocked_con_four_r, i_board, counter_w);
            Compare_five(b2_jump_one_four_w, white_blocked_jump_one_four_o, i_board, counter_w);
            Compare_five(b2_jump_one_four_w, white_blocked_jump_one_four_r, i_board, counter_w);
            Compare_five(b2_jump_two_four_w, white_blocked_jump_two_four, i_board, counter_w);
            Compare_five(n2_con_three_w, white_con_three, i_board, counter_w);
            Compare_six(n2_jump_one_three_w, white_jump_one_three_o, i_board, counter_w);
            Compare_six(n2_jump_one_three_w, white_jump_one_three_r, i_board, counter_w);
            Compare_six(b2_con_three_w, white_blocked_con_three_o, i_board, counter_w);
            Compare_six(b2_con_three_w, white_blocked_con_three_r, i_board, counter_w);
            Compare_six(b2_jump_one_three_w, white_blocked_jump_one_three_o, i_board, counter_w);
            Compare_six(b2_jump_one_three_w, white_blocked_jump_one_three_r, i_board, counter_w);
            Compare_six(b2_jump_two_three_w, white_blocked_jump_two_three_o, i_board, counter_w);
            Compare_six(b2_jump_two_three_w, white_blocked_jump_two_three_r, i_board, counter_w);
            Compare_five(b2_blank_one_three_w, white_blocked_blank_one_three_o, i_board, counter_w);
            Compare_five(b2_blank_one_three_w, white_blocked_blank_one_three_o, i_board, counter_w);
            Compare_five(b2_blank_two_three_w, white_blocked_blank_two_three, i_board, counter_w);
            Compare_seven(b2_double_three_w, white_blocked_double_three, i_board, counter_w);
            Compare_six(n2_con_two_w, white_con_two, i_board, counter_w);
            Compare_five(n2_blank_one_two_w, white_blank_one_two, i_board, counter_w);
            Compare_six(n2_blank_two_two_w, white_blank_two_two, i_board, counter_w);
            Compare_six(b2_con_two_w, white_blocked_con_two_o, i_board, counter_w);
            Compare_six(b2_con_two_w, white_blocked_con_two_r, i_board, counter_w);
            Compare_six(b2_blank_one_two_w, white_blocked_blank_one_two_o, i_board, counter_w);
            Compare_six(b2_blank_one_two_w, white_blocked_blank_one_two_r, i_board, counter_w);
            Compare_six(b2_blank_two_two_w, white_blocked_blank_two_two_o, i_board, counter_w);
            Compare_six(b2_blank_two_two_w, white_blocked_blank_two_two_r, i_board, counter_w);
            Compare_five(b2_blank_three_two_w, white_blocked_blank_three_two, i_board, counter_w);
            Compare_three(n2_con_one_w, white_con_one, i_board, counter_w);
            Compare_three(b2_con_one_w, white_blocked_one_o, i_board, counter_w);
            Compare_three(b2_con_one_w, white_blocked_one_r, i_board, counter_w);

        end
        S_EVALUATE: begin
            Count(black_score_w, n1_five_w);
            Count(black_score_w, n1_four_w);
            Count(black_score_w, n1_con_three_w);
            Count(black_score_w, n1_jump_one_three_w);
            Count(black_score_w, n1_con_two_w);
            Count(black_score_w, n1_blank_one_two_w);
            Count(black_score_w, n1_blank_two_two_w);
            Count(black_score_w, n1_con_one_w);

            Count(black_score_w, b1_con_four_w);
            Count(black_score_w, b1_jump_one_four_w);
            Count(black_score_w, b1_jump_two_four_w);
            Count(black_score_w, b1_con_three_w);
            Count(black_score_w, b1_jump_one_three_w);
            Count(black_score_w, b1_jump_two_three_w);
            Count(black_score_w, b1_blank_one_three_w);
            Count(black_score_w, b1_blank_two_three_w);
            Count(black_score_w, b1_double_three_w);
            Count(black_score_w, b1_con_two_w);
            Count(black_score_w, b1_blank_one_two_w);
            Count(black_score_w, b1_blank_two_two_w);
            Count(black_score_w, b1_blank_three_two_w);
            Count(black_score_w, b1_con_one_w);

            Count(white_score_w, n2_five_w);
            Count(white_score_w, n2_four_w);
            Count(white_score_w, n2_con_three_w);
            Count(white_score_w, n2_jump_one_three_w);
            Count(white_score_w, n2_con_two_w);
            Count(white_score_w, n2_blank_one_two_w);
            Count(white_score_w, n2_blank_two_two_w);
            Count(white_score_w, n2_con_one_w);

            Count(white_score_w, b2_con_four_w);
            Count(white_score_w, b2_jump_one_four_w);
            Count(white_score_w, b2_jump_two_four_w);
            Count(white_score_w, b2_con_three_w);
            Count(white_score_w, b2_jump_one_three_w);
            Count(white_score_w, b2_jump_two_three_w);
            Count(white_score_w, b2_blank_one_three_w);
            Count(white_score_w, b2_blank_two_three_w);
            Count(white_score_w, b2_double_three_w);
            Count(white_score_w, b2_con_two_w);
            Count(white_score_w, b2_blank_one_two_w);
            Count(white_score_w, b2_blank_two_two_w);
            Count(white_score_w, b2_blank_three_two_w);
            Count(white_score_w, b2_con_one_w);
            score_w = black_score_w - white_score_w;
            state_w = S_BLACK;
            finished_w  = 1;

        end
    endcase
end

always_ff @(negedge i_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        state_r                 <= S_BLACK;
        black_score_r           <= 0;
        white_score_r           <= 0;
		score_r				    <= 0;
        counter_r               <= 0;
        finished_r              <= 0;

        n1_five_r               <= 0;
        n1_four_r               <= 0;
        n1_con_three_r          <= 0;
        n1_jump_one_three_r     <= 0;
        n1_con_two_r            <= 0;
        n1_blank_one_two_r      <= 0;
        n1_blank_two_two_r      <= 0;
        n1_con_one_r            <= 0;

        b1_con_four_r           <= 0;
        b1_jump_one_four_r      <= 0;
        b1_jump_two_four_r      <= 0;
        b1_con_three_r          <= 0;      
        b1_jump_one_three_r     <= 0; 
        b1_jump_two_three_r     <= 0;
        b1_blank_one_three_r    <= 0;
        b1_blank_two_three_r    <= 0;
        b1_double_three_r       <= 0;  
        b1_con_two_r            <= 0;          
        b1_blank_one_two_r      <= 0;
        b1_blank_two_two_r      <= 0;    
        b1_blank_three_two_r    <= 0;
        b1_con_one_r            <= 0;

        n2_five_r               <= 0;
        n2_four_r               <= 0;
        n2_con_three_r          <= 0;
        n2_jump_one_three_r     <= 0;
        n2_con_two_r            <= 0;
        n2_blank_one_two_r      <= 0;
        n2_blank_two_two_r      <= 0;
        n2_con_one_r            <= 0;

        b2_con_four_r           <= 0;
        b2_jump_one_four_r      <= 0;
        b2_jump_two_four_r      <= 0;
        b2_con_three_r          <= 0;      
        b2_jump_one_three_r     <= 0; 
        b2_jump_two_three_r     <= 0;
        b2_blank_one_three_r    <= 0;
        b2_blank_two_three_r    <= 0;
        b2_double_three_r       <= 0;  
        b2_con_two_r            <= 0;          
        b2_blank_one_two_r      <= 0; 
        b2_blank_two_two_r      <= 0;    
        b2_blank_three_two_r    <= 0;
        b2_con_one_r            <= 0;
    end
    else begin
        state_r                 <= state_w;
		score_r				    <= score_w;
        counter_r               <= counter_w;
        black_score_r           <= black_score_w;
        white_score_r           <= white_score_w;
        finished_r              <= finished_w;

        n1_five_r               <= n1_five_w;
        n1_four_r               <= n1_four_w;
        n1_con_three_r          <= n1_con_three_w;
        n1_jump_one_three_r     <= n1_jump_one_three_w;
        n1_con_two_r            <= n1_con_two_w;
        n1_blank_one_two_r      <= n1_blank_one_two_w;
        n1_blank_two_two_r      <= n1_blank_two_two_w;
        n1_con_one_r            <= n1_con_one_w;

        b1_con_four_r           <= b1_con_four_w;
        b1_jump_one_four_r      <= b1_jump_one_four_w;
        b1_jump_two_four_r      <= b1_jump_two_four_w;
        b1_con_three_r          <= b1_con_three_w;      
        b1_jump_one_three_r     <= b1_jump_one_three_w; 
        b1_jump_two_three_r     <= b1_jump_two_three_w;
        b1_blank_one_three_r    <= b1_blank_one_three_w;
        b1_blank_two_three_r    <= b1_blank_two_three_w;
        b1_double_three_r       <= b1_double_three_w;  
        b1_con_two_r            <= b1_con_two_w;          
        b1_blank_one_two_r      <= b1_blank_one_two_w; 
        b1_blank_two_two_r      <= b1_blank_two_two_w;    
        b1_blank_three_two_r    <= b1_blank_three_two_w;
        b1_con_one_r            <= b1_con_one_w;

        n2_five_r               <= n2_five_w;
        n2_four_r               <= n2_four_w;
        n2_con_three_r          <= n2_con_three_w;
        n2_jump_one_three_r     <= n2_jump_one_three_w;
        n2_con_two_r            <= n2_con_two_w;
        n2_blank_one_two_r      <= n2_blank_one_two_w;
        n2_blank_two_two_r      <= n2_blank_two_two_w;
        n2_con_one_r            <= n2_con_one_w;

        b2_con_four_r           <= b2_con_four_w;
        b2_jump_one_four_r      <= b2_jump_one_four_w;
        b2_jump_two_four_r      <= b2_jump_two_four_w;
        b2_con_three_r          <= b2_con_three_w;      
        b2_jump_one_three_r     <= b2_jump_one_three_w; 
        b2_jump_two_three_r     <= b2_jump_two_three_w;
        b2_blank_one_three_r    <= b2_blank_one_three_w;
        b2_blank_two_three_r    <= b2_blank_two_three_w;
        b2_double_three_r       <= b2_double_three_w;  
        b2_con_two_r            <= b2_con_two_w;          
        b2_blank_one_two_r      <= b2_blank_one_two_w; 
        b2_blank_two_two_r      <= b2_blank_two_two_w;    
        b2_blank_three_two_r    <= b2_blank_three_two_w;
        b2_con_one_r            <= b2_con_one_w;

    end

end

endmodule
