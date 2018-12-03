library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Statemachine is
    Port
    (
        clk             : in STD_LOGIC;
        btnSysReset     : in STD_LOGIC;
        btnReset        : in STD_LOGIC;
        btnRun          : in STD_LOGIC;

        watchRunning    : out STD_LOGIC;
        watchReset      : out STD_LOGIC
    );
end Statemachine;

architecture Behavioral of Statemachine is

    --states
    type states is (RUNNING, STOPPED, RESET);
    signal state : states := RESET;

begin
    FSM_Controller : process(clk, btnSysReset)
        variable isRunning : BOOLEAN := false;
    begin
        --if: check for rising edge
        if rising_edge(clk) then

            --if: set the state to running
            if (btnRun = '1') then
                state <= RUNNING;
                isRunning := true;

            --else: stop the running of the watchstop
            elsif (btnRun = '0') and (isRunning) then
                state <= STOPPED;
                isRunning := false;

            --else: synchronous reset
            elsif (btnReset = '1') and (state = STOPPED) then
                state <= RESET;
            end if;

        --else: asynchronous reset
        elsif (btnSysReset = '1') then
            state <= RESET;
        end if;

    end process FSM_Controller;

    FSM_Behavior : process(clk, state)
    begin
        --if: check for rising edge
        if rising_edge(clk) then
            case state is
                --when: run the timer;
                when RUNNING =>
                watchRunning <= '1';
                WatchReset <= '0';

                --when: stop the timer;
                when STOPPED =>
                watchRunning <= '0';
                WatchReset <= '0';

                --when: reset the timer;
                when RESET =>
                watchRunning <= '0';
                WatchReset <= '1';
                state <= STOPPED;

                --when: not one of the states (for some reason)
                when others =>
                watchRunning <= '0';
                WatchReset <= '1';
                state <= STOPPED;
            end case;
        end if;
    end process FSM_Behavior;
end Behavioral;
