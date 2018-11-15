library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BCD_OUTPUT is
    Port 
    ( 
        --clk : in std_logic;
        inA : in std_logic_vector(3 downto 0);
        inB : in std_logic_vector(3 downto 0); 
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

signal A, B : std_logic_vector(3 downto 0);
signal S : std_logic_vector(4 downto 0);

begin
S <= ('0' & A) + ('0' & B);
A <= inA;
B <= inB;

process(inA, inB)
    variable bcd : std_logic_vector(6 downto 0); 
    
    begin 
    case S is
        when "00000" => bcd := not("1111110"); --0
        when "00001" => bcd := not("0110000"); --1
        when "00010" => bcd := not("1101101"); --2
        when "00011" => bcd := not("1111001"); --3
        when "00100" => bcd := not("0110011"); --4
        when "00101" => bcd := not("1011011"); --5
        when "00110" => bcd := not("1011111"); --6
        when "00111" => bcd := not("1110000"); --7
        when "01000" => bcd := not("1111111"); --8
        when "01001" => bcd := not("1111011"); --9
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