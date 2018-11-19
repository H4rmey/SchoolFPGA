// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module Adder(inA, inB, sum);
  input [3:0]inA;
  input [3:0]inB;
  output [4:0]sum;
endmodule
