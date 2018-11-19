library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BinToBCD is
    Port (
        BinIn : in std_logic_vector(4 downto 0);
        BCD_0 : out std_logic_vector(3 downto 0);
        BCD_1 : out std_logic_vector(3 downto 0);
        BCD_2 : out std_logic_vector(3 downto 0);
        BCD_3 : out std_logic_vector(3 downto 0)     
        );
end BinToBCD;

architecture Behavioral of BinToBCD is

begin


end Behavioral;
