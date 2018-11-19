-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder is
  Port ( 
    inA : in STD_LOGIC_VECTOR ( 3 downto 0 );
    inB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    sum : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );

end Adder;

architecture stub of Adder is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
begin
end;
