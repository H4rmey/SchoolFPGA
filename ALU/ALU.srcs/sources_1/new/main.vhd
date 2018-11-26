library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port(
            inputA, inputB : in std_logic_vector(7 downto 0);
            selLeft, selRight, selSelect : in std_logic;
            Coutout, equalOut : out std_logic;
            clock : in std_logic;
            segmOut : out std_logic_vector(6 downto 0)
        );
end main;

architecture Behavioral of main is

    signal tempOp : STD_LOGIC_VECTOR(3 downto 0);
    signal tRes : STD_LOGIC_VECTOR(8 downto 0);
    signal BCD : std_logic_vector(15 downto 0);
    signal tBin : std_logic_vector(3 downto 0);
    signal tSegm : std_logic_vector(3 downto 0);

begin
OpCodeSelect : entity work.OpCodeSelector(Behavioral)
Port map
(
    btnSelect   => selSelect,
    btnRight    => selRight,
    btnLeft     => selLeft,
    opOut       => tempOp
);

ArithmaticLogicUnit : entity work.ALU(Behavioral)
Port map
(
    A       => inputA,
    B       => inputB,
    Res     => tRes,
    Cout    => Coutout,
    Equal   => equalOut,
    opIn    => tempOp
);

BinairToBCD : entity work.BinToBCD(Behavioral)
Port map
(
    binIn   => tRes,
    BCD_0   => BCD(3 downto 0),
    BCD_1   => BCD(7 downto 4),
    BCD_2   => BCD(11 downto 8),
    BCD_3   => BCD(15 downto 12)
);

Multiplexer : entity work.MUX(Behavioral)
Port map
(
    BIN_0   => BCD(3 downto 0),
    BIN_1   => BCD(7 downto 4),
    BIN_2   => BCD(11 downto 8),
    BIN_3   => BCD(15 downto 12),
    clk     => clock,
    binOut  => tBin,
    segmSelect => tSegm
);

ToSegment : entity work.ToSeg(Behavioral)
Port map
(
    binair => tBin,
    segment => segmOut
 );

end Behavioral;
