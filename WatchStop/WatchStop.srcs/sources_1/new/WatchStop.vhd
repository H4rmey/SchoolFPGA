library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

entity WatchStop is
    Port
    (
        clk             : in STD_LOGIC;
        watchRunning    : in STD_LOGIC;
        watchReset      : in STD_LOGIC;

        mins            : out STD_LOGIC_VECTOR (5 downto 0);
        secs            : out STD_LOGIC_VECTOR (5 downto 0)
    );
end WatchStop;

architecture Behavioral of WatchStop is

begin
    process (clk, watchRunning, watchReset)
        constant MHz    : integer := 100000000;
        variable clkcnt : integer range 0 to MHz;

        variable tMins : STD_LOGIC_VECTOR (5 downto 0) := "000000";
        variable tSecs : STD_LOGIC_VECTOR (5 downto 0) := "000000";
    begin
        --if: rising edge of the clock
        if (rising_edge(clk)) then
            --if: the counter reaches one second
            if (clkcnt = MHz) and (watchRunning = '1') then
                --if: the seconds reach 59 seconds
                if (tSecs = "111011") then
                    tMins := tMins + '1';   --add one to the minutes
                    tSecs := "000000";      --set seconds to 0
                else
                    tSecs := tSecs + '1';   --add one to the seconds
                end if;
                clkcnt := 0;    --reset the clockcount
            end if;

            --if: the watchreset is active
            if (watchReset = '1') then
                --reset the the watch
                tSecs := "000000";
                tMins := "000000";
            end if;

            --add one to the clockcount at a rising edge
            clkcnt := clkcnt + 1;

            --write tMins and tSecs to the output
            mins <= tMins;
            secs <= tSecs;
        end if;
    end process;
end Behavioral;
