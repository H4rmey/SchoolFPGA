library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Main is
    Port ( 
            inputA : in std_logic_vector(7 downto 0);
            inputB : in std_logic_vector(7 downto 0);     

            clock : in std_logic;

            segmOutput : out std_logic_vector(6 downto 0);
            segmSelection : out std_logic_vector(3 downto 0)
        );
end Main;

architecture Behavioral of Main is

signal sums : std_logic_vector(8 downto 0); 
signal tempBinair : std_logic_vector(3 downto 0);
signal inpA : std_logic_vector(7 downto 0) := "00000001";
signal inpB : std_logic_vector(7 downto 0) := "00000111";   

signal ones     :  std_logic_vector(3 downto 0); 
signal tens     :  std_logic_vector(3 downto 0); 
signal hunderds :  std_logic_vector(3 downto 0);

begin
    ADD: entity work.Adder(Behavioral)  
    port map 
    (
        inA => inputA,
        inB => inputB,
        sum => sums
    );
    BinTB: entity work.BinToBCD(Behavioral)  
    port map  
    (
        binIn => sums, 
        BCD_0 => ones, 
        BCD_1 => tens, 
        BCD_2 => hunderds
    );
    BCDOut: entity work.BCDOutput(Behavioral) 
    port map 
    (
        bin_0 => ones,
        bin_1 => tens,
        bin_2 => hunderds,
        bin_3 => "0000",
        clk => clock,

        binOut => tempBinair,
        segmSelect => segmSelection
    );
    ToSegm: entity work.ToSeg(Behavioral)  
    port Map  
    (
        binair => tempBinair,
        segment => segmOutput
    );
end Behavioral;
