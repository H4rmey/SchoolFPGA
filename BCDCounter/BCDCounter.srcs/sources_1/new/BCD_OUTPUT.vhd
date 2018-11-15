library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD_OUTPUT is
    Port 
    ( 
        --clk : in std_logic;
        inA : in std_logic_vector(3 downto 0);
        --inB : in std_logic_vector(3 downto 0);
        bcd_A : out std_logic;
        bcd_B : out std_logic;
        bcd_C : out std_logic;
        bcd_D : out std_logic;
        bcd_E : out std_logic;
        bcd_F : out std_logic;
        bcd_G : out std_logic
     );
end BCD_OUTPUT;

architecture Behavioral of BCD_OUTPUT is 
  
begin
process(inA)
    variable bcd : std_logic_vector(6 downto 0);   
         
    begin 
    case inA is
        when "0000" => bcd := not("1111110"); --0
        when "0001" => bcd := not("0110000"); --1
        when "0010" => bcd := not("1101101"); --2
        when "0011" => bcd := not("1111001"); --3
        when "0100" => bcd := not("0110011"); --4
        when "0101" => bcd := not("1011011"); --5
        when "0111" => bcd := not("1011111"); --6
        when "1000" => bcd := not("1110000"); --7
        when "1001" => bcd := not("1111111"); --8
        when "1010" => bcd := not("1111011"); --9
        when others => bcd := not("0111110"); --H
    end case; 
    
    bcd_A <= bcd(6);
    bcd_B <= bcd(5);
    bcd_C <= bcd(4);
    bcd_D <= bcd(3);
    bcd_E <= bcd(2);
    bcd_F <= bcd(1);
    bcd_G <= bcd(0);
       
end process;  

 
end Behavioral;