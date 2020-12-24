`timescale 1ns/10ps
`define CYCLE  10
`define HCYCLE  5

module tb_rs232;
   // port declaration for design-under-test
    reg            rst;
    reg            clk;
    wire    [4:0]   o_address;
    wire            o_read;
    reg    [31:0]  readdata;
    wire            o_write;
    wire    [31:0]  o_writedata;
    reg            waitrequest;
	

    // localparam RX_BASE     = 0*4;
    // localparam TX_BASE     = 1*4;
    // localparam STATUS_BASE = 2*4;
    localparam TX_OK_BIT   = 6;
    localparam RX_OK_BIT   = 7;
   // instantiate the design-under-test
	testWrapper u0(
        .avm_rst(rst),
        .avm_clk(clk),
        .avm_address(o_address),
        .avm_read(o_read),
        .avm_readdata(readdata),
        .avm_write(o_write),
        .avm_writedata(o_writedata),
        .avm_waitrequest(waitrequest)
    );
			  
	// define clock signal
	always  begin
		#(`HCYCLE) clk=~clk;
	end

	initial begin
		rst = 1;
        clk = 0;
        readdata = 32'h0000;
        waitrequest = 0;
        
		#(`CYCLE*2) rst = 0;
		#(`CYCLE) rst = 1;
		#(`CYCLE*4) 
        readdata = 32'h004f;
        readdata[RX_OK_BIT] = 1;
        readdata[TX_OK_BIT] = 1;
        #(`CYCLE*4) 
        readdata = 32'h002b;
        readdata[RX_OK_BIT] = 1;
        readdata[TX_OK_BIT] = 1;
        #(`CYCLE*4) 
        readdata = 32'h003c;
        readdata[RX_OK_BIT] = 1;
        readdata[TX_OK_BIT] = 1;
		#(`CYCLE*2) $finish;
	end
	
	initial begin
		$dumpfile("rs232.fsdb");
		$dumpvars;	
	end
endmodule