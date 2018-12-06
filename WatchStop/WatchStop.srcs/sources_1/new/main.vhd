library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity main is
    Port
    (
        clk             : in STD_LOGIC;
        btnSysReset     : in STD_LOGIC;
        btnReset        : in STD_LOGIC;
        btnRun          : in STD_LOGIC;

        SEGM_SEL : out STD_LOGIC_VECTOR(3 downto 0);
        BCD_OUT : out std_logic_vector(6 downto 0)
    );
end main;

architecture Behavioral of main is
    signal tRunning : STD_LOGIC := '0';
    signal tReset : STD_LOGIC := '0';
    signal tMins : STD_LOGIC_VECTOR (5 downto 0) := (others => '0');
    signal tSecs : STD_LOGIC_VECTOR (5 downto 0) := (others => '0');

    signal tBCD_0 : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal tBCD_1 : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal tBCD_2 : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal tBCD_3 : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');

    signal tBinOut : std_logic_vector(3 downto 0) := (others => '0');
begin
    FSM: entity WORK.Statemachine
    port map
    (
        clk => clk,
        btnSysReset => btnSysReset,
        btnReset => btnReset,
        btnRun => btnRun,

        watchRunning => tRunning,
        watchReset => tReset
    );
    WS: entity WORK.WatchStop
    port map
    (
        clk             => clk,
        watchRunning    => tRunning,
        watchReset      => tReset,

        mins => tMins,
        secs => tSecs
    );
    BTB: entity WORK.BinToBCD
    port map
    (
        minIn => tMins,
        secIn => tSecs,

        BCD_0 => tBCD_0,
        BCD_1 => tBCD_1,
        BCD_2 => tBCD_2,
        BCD_3 => tBCD_3
    );
    MUXX: entity WORK.MUX
    port map
    (
        bin_0 => tBCD_0,
        bin_1 => tBCD_1,
        bin_2 => tBCD_2,
        bin_3 => tBCD_3,
        clk => clk,

        binOut => tBinOut,
        segmSelect => SEGM_SEL
    );
    TOSEG: entity WORK.ToSeg
    port map
    (
        binair => tBinOut,
        segment => BCD_OUT
    );

end Behavioral;
