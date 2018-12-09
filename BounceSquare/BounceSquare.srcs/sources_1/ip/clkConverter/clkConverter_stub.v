// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Sat Dec  8 11:10:03 2018
// Host        : DESKTOP-7MRF67A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/hammi/OneDrive/Documenten/bitbucket/SchoolFPGA/BounceSquare/BounceSquare.srcs/sources_1/ip/clkConverter/clkConverter_stub.v
// Design      : clkConverter
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clkConverter(clk25MHz, clk100MHz)
/* synthesis syn_black_box black_box_pad_pin="clk25MHz,clk100MHz" */;
  output clk25MHz;
  input clk100MHz;
endmodule
