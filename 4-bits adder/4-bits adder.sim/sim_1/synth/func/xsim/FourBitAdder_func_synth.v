// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Thu Nov  8 17:54:44 2018
// Host        : DESKTOP-Q23M08U running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               {C:/Users/hammi/OneDrive/Documenten/BitBucket/SchoolFPGA/4-bits adder/4-bits
//               adder.sim/sim_1/synth/func/xsim/FourBitAdder_func_synth.v}
// Design      : FourBitAdder
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module FourBitAdder
   (sw0,
    sw1,
    sw2,
    sw3,
    sw4,
    sw5,
    sw6,
    sw7,
    b0,
    b1,
    b2,
    b3);
  input sw0;
  input sw1;
  input sw2;
  input sw3;
  input sw4;
  input sw5;
  input sw6;
  input sw7;
  output b0;
  output b1;
  output b2;
  output b3;

  wire C1;
  wire Cout;
  wire b0;
  wire b0_OBUF;
  wire b1;
  wire b1_OBUF;
  wire b2;
  wire b2_OBUF;
  wire b3;
  wire b3_OBUF;
  wire sw0;
  wire sw0_IBUF;
  wire sw1;
  wire sw1_IBUF;
  wire sw2;
  wire sw2_IBUF;
  wire sw3;
  wire sw3_IBUF;
  wire sw4;
  wire sw4_IBUF;
  wire sw5;
  wire sw5_IBUF;
  wire sw6;
  wire sw6_IBUF;
  wire sw7;
  wire sw7_IBUF;

  OBUF b0_OBUF_inst
       (.I(b0_OBUF),
        .O(b0));
  LUT3 #(
    .INIT(8'h8E)) 
    b0_OBUF_inst_i_1
       (.I0(sw4_IBUF),
        .I1(sw0_IBUF),
        .I2(Cout),
        .O(b0_OBUF));
  LUT3 #(
    .INIT(8'hE8)) 
    b0_OBUF_inst_i_2
       (.I0(Cout),
        .I1(sw0_IBUF),
        .I2(sw4_IBUF),
        .O(Cout));
  OBUF b1_OBUF_inst
       (.I(b1_OBUF),
        .O(b1));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h99969666)) 
    b1_OBUF_inst_i_1
       (.I0(sw5_IBUF),
        .I1(sw1_IBUF),
        .I2(sw4_IBUF),
        .I3(sw0_IBUF),
        .I4(Cout),
        .O(b1_OBUF));
  OBUF b2_OBUF_inst
       (.I(b2_OBUF),
        .O(b2));
  LUT5 #(
    .INIT(32'h99969666)) 
    b2_OBUF_inst_i_1
       (.I0(sw6_IBUF),
        .I1(sw2_IBUF),
        .I2(sw5_IBUF),
        .I3(sw1_IBUF),
        .I4(Cout),
        .O(b2_OBUF));
  OBUF b3_OBUF_inst
       (.I(b3_OBUF),
        .O(b3));
  LUT5 #(
    .INIT(32'h99969666)) 
    b3_OBUF_inst_i_1
       (.I0(sw7_IBUF),
        .I1(sw3_IBUF),
        .I2(sw6_IBUF),
        .I3(sw2_IBUF),
        .I4(C1),
        .O(b3_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFE8E800)) 
    b3_OBUF_inst_i_2
       (.I0(Cout),
        .I1(sw0_IBUF),
        .I2(sw4_IBUF),
        .I3(sw1_IBUF),
        .I4(sw5_IBUF),
        .O(C1));
  IBUF sw0_IBUF_inst
       (.I(sw0),
        .O(sw0_IBUF));
  IBUF sw1_IBUF_inst
       (.I(sw1),
        .O(sw1_IBUF));
  IBUF sw2_IBUF_inst
       (.I(sw2),
        .O(sw2_IBUF));
  IBUF sw3_IBUF_inst
       (.I(sw3),
        .O(sw3_IBUF));
  IBUF sw4_IBUF_inst
       (.I(sw4),
        .O(sw4_IBUF));
  IBUF sw5_IBUF_inst
       (.I(sw5),
        .O(sw5_IBUF));
  IBUF sw6_IBUF_inst
       (.I(sw6),
        .O(sw6_IBUF));
  IBUF sw7_IBUF_inst
       (.I(sw7),
        .O(sw7_IBUF));
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
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
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

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
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
