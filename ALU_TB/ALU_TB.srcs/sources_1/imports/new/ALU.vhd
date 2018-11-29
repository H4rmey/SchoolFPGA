
library IEEE;
library IEEE;
use     IEEE.STD_LOGIC_1164.ALL;
use     IEEE.NUMERIC_STD.ALL;

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
        variable tRes : signed(8 downto 0);
        variable At, Bt : signed(8 downto 0);
    begin
        At := resize(signed(A), 9);
        Bt := resize(signed(B), 9);
        
        case Op is
            When "0000" => tRes := At + Bt; --"A + B"
            When "0001" => tRes := At - Bt; --"A - B"
            When "0010" => tRes := Bt - At; --"B - A"
            When "0100" => tRes := At; --"A"
            When "0101" => tRes := Bt; --"B"
            When "0110" => tRes := -At; --"-A"
            When "0111" => tRes := -Bt; --"-B"
            When "1000" => tRes := At sll 1; --"shift A left"
            When "1001" => tRes := '0' & (At(7 downto 0) srl 1); --"shift A right"
            When "1010" => tRes := At rol 1; --"Rotate A left"
            When "1011" => tRes := '0' & (At(7 downto 0) ror 1); --"Rotate A right"
            When "1110" => tRes := "000000000"; --"all zeros"
            When "1111" => tRes := "111111111"; --"all ones"
            When others => tRes := "---------"; --"error"
        end case;
            if (At = Bt) then
                Equal <= '1';
            else
                Equal <= '0';
            end if;

            Res <= STD_LOGIC_VECTOR(tRes(7 downto 0));
            Cout <= tRes(8);
    end process;

end Behavioral;
