////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: serial2parallel_synthesis.v
// /___/   /\     Timestamp: Sun Aug 27 14:19:22 2017
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim serial2parallel.ngc serial2parallel_synthesis.v 
// Device	: xc3s100e-5-vq100
// Input file	: serial2parallel.ngc
// Output file	: /home/torben/sync/FHDW/BES2-U2/vhdl/Projekte/seriall2parallel2/netgen/synthesis/serial2parallel_synthesis.v
// # of Modules	: 1
// Design Name	: serial2parallel
// Xilinx        : /opt/Xilinx/14.7/ISE_DS/ISE/
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module serial2parallel (
  clk, seriallIn, reset, ens, parallelOut
);
  input clk;
  input seriallIn;
  input reset;
  input ens;
  output [7 : 0] parallelOut;
  wire clk_BUFGP_1;
  wire ens_IBUF_3;
  wire ens_inv;
  wire parallelOut_0_29;
  wire parallelOut_1_30;
  wire parallelOut_2_31;
  wire parallelOut_3_32;
  wire parallelOut_4_33;
  wire parallelOut_5_34;
  wire parallelOut_6_35;
  wire parallelOut_7_36;
  wire reset_IBUF_38;
  wire seriallIn_IBUF_40;
  wire [7 : 0] inputBuffer;
  wire [7 : 0] outputBuffer;
  FDR #(
    .INIT ( 1'b0 ))
  inputBuffer_0 (
    .C(clk_BUFGP_1),
    .D(seriallIn_IBUF_40),
    .R(ens_inv),
    .Q(inputBuffer[0])
  );
  FDR #(
    .INIT ( 1'b0 ))
  inputBuffer_1 (
    .C(clk_BUFGP_1),
    .D(inputBuffer[0]),
    .R(ens_inv),
    .Q(inputBuffer[1])
  );
  FDR #(
    .INIT ( 1'b0 ))
  inputBuffer_2 (
    .C(clk_BUFGP_1),
    .D(inputBuffer[1]),
    .R(ens_inv),
    .Q(inputBuffer[2])
  );
  FDR #(
    .INIT ( 1'b0 ))
  inputBuffer_3 (
    .C(clk_BUFGP_1),
    .D(inputBuffer[2]),
    .R(ens_inv),
    .Q(inputBuffer[3])
  );
  FDR #(
    .INIT ( 1'b0 ))
  inputBuffer_4 (
    .C(clk_BUFGP_1),
    .D(inputBuffer[3]),
    .R(ens_inv),
    .Q(inputBuffer[4])
  );
  FDR #(
    .INIT ( 1'b0 ))
  inputBuffer_5 (
    .C(clk_BUFGP_1),
    .D(inputBuffer[4]),
    .R(ens_inv),
    .Q(inputBuffer[5])
  );
  FDR #(
    .INIT ( 1'b0 ))
  inputBuffer_6 (
    .C(clk_BUFGP_1),
    .D(inputBuffer[5]),
    .R(ens_inv),
    .Q(inputBuffer[6])
  );
  FDR #(
    .INIT ( 1'b0 ))
  inputBuffer_7 (
    .C(clk_BUFGP_1),
    .D(inputBuffer[6]),
    .R(ens_inv),
    .Q(inputBuffer[7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  outputBuffer_0 (
    .C(clk_BUFGP_1),
    .CE(reset_IBUF_38),
    .D(inputBuffer[0]),
    .Q(outputBuffer[0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  outputBuffer_1 (
    .C(clk_BUFGP_1),
    .CE(reset_IBUF_38),
    .D(inputBuffer[1]),
    .Q(outputBuffer[1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  outputBuffer_2 (
    .C(clk_BUFGP_1),
    .CE(reset_IBUF_38),
    .D(inputBuffer[2]),
    .Q(outputBuffer[2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  outputBuffer_3 (
    .C(clk_BUFGP_1),
    .CE(reset_IBUF_38),
    .D(inputBuffer[3]),
    .Q(outputBuffer[3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  outputBuffer_4 (
    .C(clk_BUFGP_1),
    .CE(reset_IBUF_38),
    .D(inputBuffer[4]),
    .Q(outputBuffer[4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  outputBuffer_5 (
    .C(clk_BUFGP_1),
    .CE(reset_IBUF_38),
    .D(inputBuffer[5]),
    .Q(outputBuffer[5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  outputBuffer_6 (
    .C(clk_BUFGP_1),
    .CE(reset_IBUF_38),
    .D(inputBuffer[6]),
    .Q(outputBuffer[6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  outputBuffer_7 (
    .C(clk_BUFGP_1),
    .CE(reset_IBUF_38),
    .D(inputBuffer[7]),
    .Q(outputBuffer[7])
  );
  FD   parallelOut_0 (
    .C(clk_BUFGP_1),
    .D(outputBuffer[0]),
    .Q(parallelOut_0_29)
  );
  FD   parallelOut_1 (
    .C(clk_BUFGP_1),
    .D(outputBuffer[1]),
    .Q(parallelOut_1_30)
  );
  FD   parallelOut_2 (
    .C(clk_BUFGP_1),
    .D(outputBuffer[2]),
    .Q(parallelOut_2_31)
  );
  FD   parallelOut_3 (
    .C(clk_BUFGP_1),
    .D(outputBuffer[3]),
    .Q(parallelOut_3_32)
  );
  FD   parallelOut_4 (
    .C(clk_BUFGP_1),
    .D(outputBuffer[4]),
    .Q(parallelOut_4_33)
  );
  FD   parallelOut_5 (
    .C(clk_BUFGP_1),
    .D(outputBuffer[5]),
    .Q(parallelOut_5_34)
  );
  FD   parallelOut_6 (
    .C(clk_BUFGP_1),
    .D(outputBuffer[6]),
    .Q(parallelOut_6_35)
  );
  FD   parallelOut_7 (
    .C(clk_BUFGP_1),
    .D(outputBuffer[7]),
    .Q(parallelOut_7_36)
  );
  IBUF   seriallIn_IBUF (
    .I(seriallIn),
    .O(seriallIn_IBUF_40)
  );
  IBUF   reset_IBUF (
    .I(reset),
    .O(reset_IBUF_38)
  );
  IBUF   ens_IBUF (
    .I(ens),
    .O(ens_IBUF_3)
  );
  OBUF   parallelOut_7_OBUF (
    .I(parallelOut_7_36),
    .O(parallelOut[7])
  );
  OBUF   parallelOut_6_OBUF (
    .I(parallelOut_6_35),
    .O(parallelOut[6])
  );
  OBUF   parallelOut_5_OBUF (
    .I(parallelOut_5_34),
    .O(parallelOut[5])
  );
  OBUF   parallelOut_4_OBUF (
    .I(parallelOut_4_33),
    .O(parallelOut[4])
  );
  OBUF   parallelOut_3_OBUF (
    .I(parallelOut_3_32),
    .O(parallelOut[3])
  );
  OBUF   parallelOut_2_OBUF (
    .I(parallelOut_2_31),
    .O(parallelOut[2])
  );
  OBUF   parallelOut_1_OBUF (
    .I(parallelOut_1_30),
    .O(parallelOut[1])
  );
  OBUF   parallelOut_0_OBUF (
    .I(parallelOut_0_29),
    .O(parallelOut[0])
  );
  BUFGP   clk_BUFGP (
    .I(clk),
    .O(clk_BUFGP_1)
  );
  INV   ens_inv1_INV_0 (
    .I(ens_IBUF_3),
    .O(ens_inv)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

