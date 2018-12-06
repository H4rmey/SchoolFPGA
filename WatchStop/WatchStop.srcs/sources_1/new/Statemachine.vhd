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

    --states: RUNNING, STOPPED and RESET
    type State_type is (RUN, STOPP, RESET, RUNT, STOPT);
    signal state, nextState : State_type;

begin



    Input_Handler: process(clk, btnSysReset)
        variable isRunning : BOOLEAN := false;
        variable btnFlag : BOOLEAN := false;
    begin
        --if: check for rising edge
        if (btnSysReset = '1') then
            state <= RESET;
        elsif (rising_edge(clk)) then
            state <= nextState;
        end if;
    end process Input_Handler;



    State_Handler : process(state, btnRun, btnReset)
    begin
        nextState <= state;
        case state is
            --when: run the timer;
            when RUN =>
            watchRunning <= '1';
            WatchReset <= '0';

            if (btnRun = '1') then
                nextState <= STOPT;
            end if;

            when STOPT =>
            if (btnRun = '0') then
                nextState <= STOPP;
            end if;

            --when: stop the timer;
            when STOPP =>
            watchRunning <= '0';
            WatchReset <= '0';

            if (btnRun = '1') then
                nextState <= RUNT;
            elsif (btnReset = '1') then
                nextState <= RESET;
            end if;

            when RUNT =>
            watchRunning <= '0';
            WatchReset <= '0';

            if (btnRun = '0') then
                nextState <= RUN;
            end if;

            --when: reset the timer;
            when RESET =>
            watchRunning <= '0';
            WatchReset <= '1';
            nextState <= STOPP;

            when others => nextState <= RUN;
        end case;
    end process State_Handler;

end Behavioral;
