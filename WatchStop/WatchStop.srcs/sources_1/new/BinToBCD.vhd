library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BinToBCD is
    Port
    (
        minIn : in std_logic_vector(5 downto 0);
        secIn : in std_logic_vector(5 downto 0);

        BCD_0 : out std_logic_vector(3 downto 0);
        BCD_1 : out std_logic_vector(3 downto 0);
        BCD_2 : out std_logic_vector(3 downto 0);
        BCD_3 : out std_logic_vector(3 downto 0)
    );
end BinToBCD;

architecture Behavioral of BinToBCD is
begin
    process( minIn, secIn )
        variable i : integer;
        variable tMin : STD_LOGIC_VECTOR(13 downto 0);
        variable tSec : STD_LOGIC_VECTOR(13 downto 0);
    begin
        --initialization
        tMin(13 downto 0) := "00000000000000";
        tSec(13 downto 0) := "00000000000000";

        tMin(5 downto 0) := minIn(5 downto 0);
        tSec(5 downto 0) := secIn(5 downto 0);

        for i in 0 to 5 loop
            --addition if over column over or equal to 5
            --check the minutes
            if(tMin(9 downto 6) >= "0101") then
                tMin(9 downto 6) := tMin(9 downto 6) + "0011";
            end if;

            if(tMin(13 downto 10) >= "0101") then
                tMin(13 downto 10) := tMin(13 downto 10) + "0011";
            end if;

            --check the seconds
            if(tSec(9 downto 6) >= "0101") then
                tSec(9 downto 6) := tSec(9 downto 6) + "0011";
            end if;

            if(tSec(13 downto 10) >= "0101") then
                tSec(13 downto 10) := tSec(13 downto 10) + "0011";
            end if;

            --shifting everyting
            tMin(12 downto 0) := tMin(11 downto 0) & '0';
            tSec(12 downto 0) := tSec(11 downto 0) & '0';
        end loop;

        --Seconds
        BCD_0 <= tSec(9 downto 6);
        BCD_1 <= tSec(13 downto 10);
        --Minutes
        BCD_2 <= tMin(9 downto 6);
        BCD_3 <= tMin(13 downto 10);
    end process ;
end Behavioral;
