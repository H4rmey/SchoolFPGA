library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Main is
    Port ( 
        inputA : in std_logic_vector(7 downto 0);
        inputB : in std_logic_vector(7 downto 0);
        
        ones : out std_logic_vector(3 downto 0); 
        tens : out std_logic_vector(3 downto 0); 
        hunderds : out std_logic_vector(3 downto 0)
        );
end Main;

architecture Behavioral of Main is
component Adder is
    Port ( 
        inA : in std_logic_vector(7 downto 0);
        inB : in std_logic_vector(7 downto 0);
        sum : out std_logic_vector(8 downto 0)
        );
end component;

component BinToBCD is
    Port (
        binIn : in std_logic_vector(8 downto 0);
        BCD_0 : out std_logic_vector(3 downto 0);
        BCD_1 : out std_logic_vector(3 downto 0);
        BCD_2 : out std_logic_vector(3 downto 0)  
        );
end component;

signal sums : std_logic_vector(8 downto 0) := "001101011"; 
signal inpA : std_logic_vector(7 downto 0) := "00001100";
signal inpB : std_logic_vector(7 downto 0) := "00000011";

begin
    BTB: BinToBCD port map(
                            binIn => sums, 
                            BCD_0 => ones, 
                            BCD_1 => tens, 
                            BCD_2 => hunderds
                           );
end Behavioral;
