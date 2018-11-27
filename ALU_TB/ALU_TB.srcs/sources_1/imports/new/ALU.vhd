
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
      port
        (
            A       : in STD_LOGIC_VECTOR(7 downto 0);
            B       : in STD_LOGIC_VECTOR(7 downto 0);
            Op      : in STD_LOGIC_VECTOR(3 downto 0);

            Res     : out STD_LOGIC_VECTOR(7 downto 0);
            Cout    : out Std_logic;
            Equal   : out Std_logic
        );
end ALU;

architecture Behavioral of ALU is
begin
    process(A, B, Op)
        variable tRes : STD_LOGIC_VECTOR(8 downto 0);
    begin
        case Op is
            When "0000" => tRes := ('0' & A) + ('0' & B); --"A + B"
            When "0001" => tRes := ('0' & A) - ('0' & B); --"A - B"
            When "0010" => tRes := ('0' & B) + ('0' & A); --"B - A"
            When "0100" => tRes := ('0' & A); --"A"
            When "0101" => tRes := ('0' & B); --"B"
            When "0110" => tRes := ('1' & A); --"-A"
            When "0111" => tRes := ('1' & B); --"-B"
            When "1000" => tRes := A(7 downto 0) & '0'; --"shift A left"
            When "1001" => tRes := "00" & A(7 downto 1); --"shift A right"
            When "1010" => tRes := A(7 downto 0) & A(7); --"Rotate A left"
            When "1011" => tRes := '0' & A(0) & A(7 downto 1); --"Rotate A right"
            When "1110" => tRes := "000000000"; --"all zeros"
            When "1111" => tRes := "111111111"; --"all ones"
            when others => tRes := "111000111"; --"error"
        end case;
            if (A = B) then
                Equal <= '1';
            else
                Equal <= '0';
            end if;

            Res <= tRes(7 downto 0);
            Cout <= tRes(8);
    end process;

end Behavioral;
