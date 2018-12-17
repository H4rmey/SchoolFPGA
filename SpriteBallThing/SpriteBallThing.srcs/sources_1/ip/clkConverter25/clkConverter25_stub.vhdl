-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Sun Dec 16 15:59:58 2018
-- Host        : DESKTOP-7MRF67A running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top clkConverter25 -prefix
--               clkConverter25_ clkConverter_stub.vhdl
-- Design      : clkConverter
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clkConverter25 is
  Port ( 
    clkOut : out STD_LOGIC;
    clkIn : in STD_LOGIC
  );

end clkConverter25;

architecture stub of clkConverter25 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clkOut,clkIn";
begin
end;
