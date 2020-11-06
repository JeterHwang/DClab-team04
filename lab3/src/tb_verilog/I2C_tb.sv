`timescale 1ns/100ps
`define CLK 10

module I2C_tb(
    inout SDA_data,
    output SCL_clk
);
localparam HCLK = CLK / 2;
logic clk, rst, start;
logic finished, sclk, sdat, oen; 
logic [23:0] output_data;
logic [167:0] receive_data;
I2cIntializer I2C(
    .i_rst_n(clk),
    .i_clk(rst),
    .i_start(start),
    .o_finished(finished),
    .o_sclk(sclk),
    .o_sdat(sdat),
    .o_oen(oen)
);

assign SDA_data = oen ? sdat : 1'bz;
assign SCL_clk = sclk;

initial clk = 0;
always #HCLK clk = ~clk;

task readdata();    
    @(negedge sdat);
    @(negedge sclk);
    for(int i = 7; i < 24; i+=8) begin
        for(int j = 0; j < 8; j++) begin
            @(posedge sclk);
            output_data[i - j] = sdat;    
        end
        @(posedge sclk);
    end
    @(posedge sclk);
    @(posedge sdat);
endtask

initial begin
    $fsdbDumpfile("I2C.fsdb");
    $fsdbDumpvars;

    rst = 1;
    #(2 * CLK);
    rst = 0;
    for(int i = 0; i < 10; i++) begin
        @(posedge clk);
    end
    start <= 1'b1;
    @(posedge clk);
    start <= 1'b0;

    repeat(8) begin
        readdata();
    end
end
always@(posedge sdat) begin
    if(sclk) begin
        $display("=========");
        $display("data = %24b", output_data);
        $display("=========");
    end
end
always@(posedge clk) begin
    if(finished) begin
        $display("+=====================+");
		$display("| Simulation Complete |");
		$display("+=====================+");
		$finish;
    end
end
initial begin
	#(500000 * CLK)
	$display("Too slow, abort.");
	$finish;
end
endmodule