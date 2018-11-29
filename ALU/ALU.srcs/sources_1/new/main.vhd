library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port(
            inputA, inputB      : in std_logic_vector(7 downto 0);
            clock               : in std_logic;
            btns                : in std_logic_vector(3 downto 0);

            Coutout, equalOut   : out std_logic;
            segmOut             : out std_logic_vector(6 downto 0);
            sSegSelect          : out std_logic_vector(3 downto 0);
            leds                : out std_logic_vector(3 downto 0)
        );
end main;

architecture Behavioral of main is

    signal tempOp : STD_LOGIC_VECTOR(3 downto 0);
    signal tRes : STD_LOGIC_VECTOR(7 downto 0);
    signal BCD : std_logic_vector(15 downto 0);
    signal tBin : std_logic_vector(3 downto 0);
    signal Coutoutout : std_logic;

begin
ArithmaticLogicUnit : entity work.ALU(Behavioral)
Port map
(
    A       => inputA,
    B       => inputB,
    Res     => tRes,
    Cout    => Coutoutout,
    Equal   => equalOut,
    opIn    => btns
);

BinairToBCD : entity work.BinToBCD(Behavioral)
Port map
(
    bin         => tRes,
    Cout        => Coutoutout,
    ones        => BCD(3 downto 0),
    tens        => BCD(7 downto 4),
    hundreds    => BCD(11 downto 8),
    minus       => BCD(15 downto 12)
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
    segmSelect => sSegSelect
);

ToSegment : entity work.ToSeg(Behavioral)
Port map
(
    binair => tBin,
    segment => segmOut
);

Coutout <= Coutoutout;
leds <= btns;

end Behavioral;
