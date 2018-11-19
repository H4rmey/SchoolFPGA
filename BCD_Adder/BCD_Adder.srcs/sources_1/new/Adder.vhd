library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Adder is
    Port ( 
        inA : in std_logic_vector(3 downto 0);
        inB : in std_logic_vector(3 downto 0);
        sum : out std_logic_vector(4 downto 0)
        );
end Adder;

architecture Behavioral of Adder is

    signal A, B : std_logic_vector(3 downto 0);
    signal S : std_logic_vector(4 downto 0);

begin
    S <= ('0' & A) + ('0' & B);
    A <= inA;
    B <= inB;

end Behavioral;
