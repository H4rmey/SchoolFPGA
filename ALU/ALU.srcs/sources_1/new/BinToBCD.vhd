library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BinToBCD is
    Port (
            binIn : in std_logic_vector(8 downto 0);
            BCD_0 : out std_logic_vector(3 downto 0);
            BCD_1 : out std_logic_vector(3 downto 0);
            BCD_2 : out std_logic_vector(3 downto 0);
            BCD_3 : out std_logic_vector(3 downto 0)
        );
end BinToBCD;

architecture Behavioral of BinToBCD is
begin
    process(binIn) is
		variable i : integer;
		variable b0, b1, b2 : std_logic_vector(3 downto 0) := "0000";
    begin
        for i in 0 to 7 loop
            if (b0 >= 5) then
                b0 := 3 + b0;
            end if;
            if (b1 >= 5) then
                b1 := 3 + b1;
            end if;
            if (b2 >= 5) then
                b2 := 3 + b2;
            end if;

            b2 := b2(2 downto 0) & b1(3);
            b1 := b1(2 downto 0) & b0(3);
            b0 := b0(2 downto 0) & binIn(7-i);
        end loop;

    BCD_0 <= b0;
    BCD_1 <= b1;
    BCD_2 <= b2;
    BCD_3 <= "111" & binIn(8);
    end process;
end Behavioral;
