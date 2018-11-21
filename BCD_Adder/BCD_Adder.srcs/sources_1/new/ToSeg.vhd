library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ToSeg is
    Port (
            binair  : in std_logic_vector(3 downto 0);
            segment : out std_logic_vector(6 downto 0)
         );
end ToSeg;

architecture Behavioral of ToSeg is
begin
    process(binair)
        variable segm : std_logic_vector(6 downto 0);
    begin
        case binair is 
            when "0000" => segm := not("1111110"); --0
            when "0001" => segm := not("0110000"); --1
            when "0010" => segm := not("1101101"); --2
            when "0011" => segm := not("1111001"); --3
            when "0100" => segm := not("0110011"); --4
            when "0101" => segm := not("1011011"); --5
            when "0110" => segm := not("1011111"); --6
            when "0111" => segm := not("1110000"); --7
            when "1000" => segm := not("1111111"); --8
            when "1001" => segm := not("1111011"); --9
            when others => segm := not("0111110"); --H
        end case;
        
        segment <= segm;
    end process;
end Behavioral;