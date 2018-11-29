library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity OpCodeSelector is
    Port
    (
        btns    : in STD_LOGIC_VECTOR(3 downto 0);
        opOut   : out STD_LOGIC_VECTOR(3 downto 0)
    );
end OpCodeSelector;

architecture Behavioral of OpCodeSelector is
begin
        opOut <= btns;   
end Behavioral;
