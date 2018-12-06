library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity State_TB is
end;

architecture Bench of State_TB is
  --create some variables here
  --inputs for the entity
  signal clk            : STD_LOGIC := '0';
  signal btnSysReset    : STD_LOGIC := '0';
  signal btnReset       : STD_LOGIC := '0';
  signal btnRun         : STD_LOGIC := '0';
  --outputs for the entity
  signal tRunning : STD_LOGIC := '0';
  signal tReset : STD_LOGIC := '0';
  signal tMins : STD_LOGIC_VECTOR (5 downto 0);
  signal tSecs : STD_LOGIC_VECTOR (5 downto 0);

  --delays
  constant DELAY_CLOCK  : TIME := 1 ns;
  constant DELAY_BUTTON : TIME := 5 ns;
  constant DELAY_DELAY  : TIME := 20 ns;
  constant cycles : POSITIVE := 100000;

begin

    FSM: entity WORK.Statemachine
    port map
    (
        clk             => clk,
        btnSysReset     => btnSysReset,
        btnReset        => btnReset,
        btnRun          => btnRun,

        watchRunning    => tRunning,
        watchReset      => tReset
    );

    CLOCK : process
    begin
    for i in 0 to cycles loop
        wait for DELAY_CLOCK/4;
        clk <= '1';
        wait for DELAY_CLOCK/4;
        clk <= '0';
    end loop;
    wait;
    end process;

    WATCHSTOP_TEST : process
    begin
        wait for DELAY_BUTTON;

        --press softreset
        btnReset <= '1';
        wait for DELAY_BUTTON;
        btnReset <= '0';
        wait for DELAY_DELAY;

        --press start
        btnRun <= '1';
        wait for DELAY_BUTTON;
        btnRun <= '0';
        wait for DELAY_DELAY;

        --press softreset
        btnReset <= '1';
        wait for DELAY_BUTTON;
        btnReset <= '0';
        wait for DELAY_DELAY;

        --press start
        btnRun <= '1';
        wait for DELAY_BUTTON;
        btnRun <= '0';
        wait for DELAY_DELAY;

        --press hardReset
        btnSysReset <= '1';
        wait for DELAY_BUTTON;
        btnSysReset <= '0';
        wait for DELAY_DELAY;

        --press start
        btnRun <= '1';
        wait for DELAY_BUTTON;
        btnRun <= '0';
        wait for DELAY_DELAY;

        --press start
        btnRun <= '1';
        wait for DELAY_BUTTON;
        btnRun <= '0';
        wait for DELAY_DELAY;
        wait;
    end process;
end Bench;
