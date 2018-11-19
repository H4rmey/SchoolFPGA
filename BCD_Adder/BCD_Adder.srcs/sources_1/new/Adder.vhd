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

    signal A, B : std_logic_vector(7 downto 0);
    signal S : std_logic_vector(8 downto 0);

begin
    S <= ('0' & A) + ('0' & B);
    A <= inA;
    B <= inB;

end Behavioral;
