library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TFlipFlop is
    Port ( 
            T : in std_logic;
            CLK : in std_logic;
            EN : in std_logic;
            RESET : in std_logic;
            Q : out std_logic
        );
end TFlipFlop;

architecture Behavioral of TFlipFlop is
begin
    process(CLK, EN)
        if rising_edge(CLK) then
            if RESET = '1' then
                Q <= '0';
            elsif EN = '1' then
                Q <= T;
            end if;
        end if;
    end process;
end Behavioral;
