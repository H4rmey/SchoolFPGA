library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity OpCodeSelector is
    Port
    (
        btnSelect : in STD_LOGIC;
        btnLeft : in STD_LOGIC;
        btnRight : in STD_LOGIC;
        opOut : out STD_LOGIC_VECTOR(3 downto 0)
    );
end OpCodeSelector;

architecture Behavioral of OpCodeSelector is
begin
    process(btnSelect, btnLeft, btnRight)
        variable sel : STD_LOGIC_VECTOR(3 downto 0);
    begin
        if (btnRight = '1') then
            sel := sel + '1';
        elsif (btnLeft = '1') then
            sel := sel - '1';
        elsif (btnSelect = '1') then
            opOut <= sel;
        end if;
    end process;
end Behavioral;
