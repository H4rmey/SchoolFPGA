library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MUX is
    Port (
            BIN_0   : in std_logic_vector(3 downto 0);
            BIN_1   : in std_logic_vector(3 downto 0);
            BIN_2   : in std_logic_vector(3 downto 0);
            BIN_3   : in std_logic_vector(3 downto 0);
            clk     : in std_logic;

            binOut : out std_logic_vector(3 downto 0);
            segmSelect : out std_logic_vector(3 downto 0)
         );
end MUX;

architecture Behavioral of MUX is
begin
    process(clk)
        variable cnt : integer range 0 to 1000000 := 0;
    begin
        if rising_edge(clk) then
            case (cnt) is
                when 1 =>
                    segmSelect <= "1110";
                    binOut <= BIN_0;
                when 250000 =>
                    segmSelect <= "1101";
                    binOut <= BIN_1;
                when 500000 =>
                    segmSelect <= "1011";
                    binOut <= BIN_2;
                when 750000 =>
                    segmSelect <= "0111";
                    binOut <= BIN_3;
                when 1000000 =>
                    cnt := 0;
                when others => NULL;
            end case;
            cnt := cnt + 1;
         end if;
     end process;
end Behavioral;
