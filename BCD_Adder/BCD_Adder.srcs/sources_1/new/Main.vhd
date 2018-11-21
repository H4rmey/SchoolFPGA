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

component BCDOutput is
    Port (
                bin_0   : in std_logic_vector(3 downto 0);
                bin_1   : in std_logic_vector(3 downto 0);
                bin_2   : in std_logic_vector(3 downto 0);
                bin_3   : in std_logic_vector(3 downto 0);
                clk     : in std_logic;
    
                binOut : out std_logic_vector(3 downto 0);
                segmSelect : out std_logic_vector(3 downto 0)
        );
end component;

component ToSeg is
    Port (
            binair  : in std_logic_vector(3 downto 0);
            segment : out std_logic_vector(6 downto 0)
         );
end component;

signal sums : std_logic_vector(8 downto 0); 
signal tempBinair : std_logic_vector(3 downto 0) := "0000";

signal ones     :  std_logic_vector(3 downto 0) := "0000"; 
signal tens     :  std_logic_vector(3 downto 0) := "0000"; 
signal hunderds :  std_logic_vector(3 downto 0) := "0000";

begin
    ADD: Adder port map (
                            inA => inputA,
                            inB => inputB,
                            sum => sums
                        );
    BinTB: BinToBCD port map  (
                                binIn => sums, 
                                BCD_0 => ones, 
                                BCD_1 => tens, 
                                BCD_2 => hunderds
                            );
    BCDOut: BCDOutput port map  (
                                    bin_0 => ones,
                                    bin_1 => tens,
                                    bin_2 => hunderds,
                                    bin_3 => "0000",
                                    clk => clock,

                                    binOut => tempBinair,
                                    segmSelect => segmSelection
                                );
    ToSegm: ToSeg port Map (
                                binair => tempBinair,
                                segment => segmOutput
                            );
end Behavioral;
