library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Adder is
    Port ( 
        inA : in std_logic_vector(7 downto 0);
        inB : in std_logic_vector(7 downto 0);
        sum : out std_logic_vector(8 downto 0)
        );
end Adder;

architecture Behavioral of Adder is
begin
    sum <= ('0' & inA) + ('0' & inB);
end Behavioral;
