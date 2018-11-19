// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module Main(inputA, inputB, ones, tens, hunderds);
  input [7:0]inputA;
  input [7:0]inputB;
  output [3:0]ones;
  output [3:0]tens;
  output [3:0]hunderds;
endmodule
