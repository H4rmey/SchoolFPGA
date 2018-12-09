-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Sat Dec  8 11:10:03 2018
-- Host        : DESKTOP-7MRF67A running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/hammi/OneDrive/Documenten/bitbucket/SchoolFPGA/BounceSquare/BounceSquare.srcs/sources_1/ip/clkConverter/clkConverter_stub.vhdl
-- Design      : clkConverter
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clkConverter is
  Port ( 
    clk25MHz : out STD_LOGIC;
    clk100MHz : in STD_LOGIC
  );

end clkConverter;

architecture stub of clkConverter is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk25MHz,clk100MHz";
begin
end;
