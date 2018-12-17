
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity main is
    Port
    (
        clk : in STD_LOGIC;

        red, green, blue : out STD_LOGIC;
        hsync, vsync : out STD_LOGIC
    );
end main;

architecture Behavioral of main is
    signal clk25 : STD_LOGIC := '0';

    signal tRed : STD_LOGIC;
    signal tGreen : STD_LOGIC;
    signal tBlue : STD_LOGIC;

    signal tHCount : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
    signal tVCount : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');

    component clkConverter25 is
    Port
    (
        clkIn : in STD_LOGIC;
        clkOut : out STD_LOGIC
    );
    end component;
begin
    --clock
    CLK_Converter : clkConverter25
    port map
    (
        clkIn => clk,
        clkOut => clk25
    );

    --vga output
    VGA_THING: entity WORK.VGA
    port map
    (
    --inputs
        clk25 => clk25,

        redIn => tRed,
        greenIn => tGreen,
        blueIn => tBlue,
    --outputs
        redOut => red,
        greenOut => green,
        blueOut => blue,

        hsync => hsync,
        vsync => vsync,
        hCountOut => tHCount,
        vCountOut => tVCount
    );

    --check for square
    ItsASquare: entity WORK.SpriteRender
    port map
    (
    --inputs
        clk25 => clk25,
        hCountIn => tHCount,
        vCountIn => tVCount,
    --outputs
        redOut => tRed,
        greenOut => tGreen,
        blueOut => tBlue
    );
end Behavioral;
