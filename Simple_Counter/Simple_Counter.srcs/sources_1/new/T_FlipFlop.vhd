library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_FlipFlop is
   port (T,Reset,CLK,CLK_enable: in std_logic;
	 Q: out std_logic);
end T_FlipFlop;
 
architecture Behavioral of T_FlipFlop is	 
	signal temp: std_logic;
begin
    process(CLK) 
    begin
        if (rising_edge(CLK)) then
            if Reset='1' then   
                temp <= '0';  		
            elsif CLK_enable ='1' then
                temp <= T xor temp;
            end if;
        end if; 
    end process;
    Q <= temp;	   
end Behavioral;