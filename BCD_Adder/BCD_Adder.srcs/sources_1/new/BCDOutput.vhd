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
        variable segmCnt    : INTEGER;
        variable cnt        : INTEGER;
    begin
        if (rising_edge(clk)) then   
            if (cnt >= 2500000) then
                case segmCnt is
                    when 0 => 
                        binOut <= bin_0;
                        segmSelect <= "1110";
                    when 1 => 
                        binOut <= bin_1;
                        segmSelect <= "1101";
                    when 2 => 
                        binOut <= bin_2;
                        segmSelect <= "1011";
                    when 3 => 
                        binOut <= bin_3;
                        segmSelect <= "0111";
                    when others => NULL; 
                end case;  
                
                segmCnt := segmCnt + 1;
                 
                if (segmCnt = 4) then
                    segmCnt := 0;
                end if;

                cnt := 0;       

            end if;
            
            cnt := cnt + 1; 
        end if;
    end process;
end Behavioral;
