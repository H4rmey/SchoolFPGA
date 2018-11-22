library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BinToBCD is
    Port (
        binIn : in std_logic_vector(8 downto 0);
        BCD_0 : out std_logic_vector(3 downto 0);
        BCD_1 : out std_logic_vector(3 downto 0);
        BCD_2 : out std_logic_vector(3 downto 0)  
        );
end BinToBCD;

architecture Behavioral of BinToBCD is
begin
process( binIn )
    variable i : integer;
    variable binary_shift : STD_LOGIC_VECTOR(20 downto 0);
begin
    --initialization
    binary_shift(20 downto 9) := (others => '0');
    binary_shift(8 downto 0) := binIn;

    for i in 0 to 8 loop
        --addition if over column over or equal to 5
        if(binary_shift(12 downto 9) >= "0101") then
            binary_shift(12 downto 9) := binary_shift(12 downto 9) + "0011";
        end if;

        if(binary_shift(16 downto 13) >= "0101") then
            binary_shift(16 downto 13) := binary_shift(16 downto 13) + "0011";
        end if;
        
        if(binary_shift(20 downto 17) >= "0101") then
            binary_shift(20 downto 17) := binary_shift(20 downto 17) + "0011";
        end if;

        --shifting everyting
        binary_shift := binary_shift(19 downto 0) & '0';
    end loop;
    
    BCD_0 <= binary_shift(12 downto 9);
    BCD_1 <= binary_shift(16 downto 13);
    BCD_2 <= binary_shift(20 downto 17);
end process ;
end Behavioral;
