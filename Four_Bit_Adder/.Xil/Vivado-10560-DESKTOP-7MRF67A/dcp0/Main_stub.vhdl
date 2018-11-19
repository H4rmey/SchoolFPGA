-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Main is
  Port ( 
    inputA : in STD_LOGIC_VECTOR ( 7 downto 0 );
    inputB : in STD_LOGIC_VECTOR ( 7 downto 0 );
    ones : out STD_LOGIC_VECTOR ( 3 downto 0 );
    tens : out STD_LOGIC_VECTOR ( 3 downto 0 );
    hunderds : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );

end Main;

architecture stub of Main is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
begin
end;
