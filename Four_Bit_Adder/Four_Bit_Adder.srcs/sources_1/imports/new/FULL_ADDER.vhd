library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FULL_ADDER is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
end FULL_ADDER;

architecture Behavioral of FULL_ADDER is
begin
S <= (A xor B) xor Cin;
Cout <= (A and B) or ((A xor B) and Cin);
    
end Behavioral;