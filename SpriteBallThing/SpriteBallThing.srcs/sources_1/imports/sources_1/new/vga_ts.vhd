library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vga_ts is
end;

architecture Bench of vga_ts is
    --create some variables here
    --inputs for the entity
    signal clk25 : STD_LOGIC := '0';
    signal input_x, input_y : integer := 0;

    --outputs for the entity
    signal blue, red, green : STD_LOGIC := '0';
    signal hsync, vsync : STD_LOGIC := '0';

    signal hcountout : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
    signal vcountout : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');

    --delays
    constant CLOCK  : TIME := 10 ps;
    constant cycles : POSITIVE := 10000000;
    constant cyc : POSITIVE := 15;

    --temp values
    signal tRed : STD_LOGIC := '0';
    signal tGreen : STD_LOGIC := '0';
    signal tBlue : STD_LOGIC := '0';

    signal tHCount : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
    signal tVCount : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');

    signal cnt_x : integer;
    signal cnt_y : integer;
begin
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
        blueOut => tBlue,

        cnt_x => cnt_x,
        cnt_y => cnt_y
    );

    CLOCK_CREATE : process
    begin
        for i in 0 to cycles loop
            wait for CLOCK/2;
            clk25 <= '1';
            wait for CLOCK/2;
            clk25 <= '0';
        end loop;
        wait;
    end process;
end Bench;
