library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BCDOutput is
    Port (
            bin_0   : in std_logic_vector(3 downto 0);
            bin_1   : in std_logic_vector(3 downto 0);
            bin_2   : in std_logic_vector(3 downto 0);
            bin_3   : in std_logic_vector(3 downto 0);
            clk     : in std_logic;

            binOut : out std_logic_vector(3 downto 0);
            segmSelect : out std_logic_vector(3 downto 0)
         );
end BCDOutput;

architecture Behavioral of BCDOutput is
begin
    process(clk)
        variable segmCnt    : std_logic_vector(1 downto 0);
        variable cnt        : INTEGER;
    begin
        if (rising_edge(clk)) then            
            cnt := cnt + 1; 

            if (cnt >= 2500000) then

                segmCnt := segmCnt + 1;
                case segmCnt is
                    when "00" => 
                        binOut <= bin_0;
                        segmSelect <= "1110";
                    when "01" => 
                        binOut <= bin_1;
                        segmSelect <= "1101";
                    when "10" => 
                        binOut <= bin_2;
                        segmSelect <= "1011";
                    when "11" => 
                        binOut <= bin_3;
                        segmSelect <= "0111";
                    when others => NULL; 
                end case;                
                cnt := 0;

            end if;
        end if;
    end process;
end Behavioral;
