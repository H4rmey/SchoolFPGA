library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

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
        constant MHz        : integer := 100000000;
        variable clkcnt     : integer range 0 to MHz;

        tmins    : STD_LOGIC_VECTOR (5 downto 0) := "000000";
        tsecs    : STD_LOGIC_VECTOR (5 downto 0) := "000000";
    begin
        --if: rising edge of the clock
        if (rising_edge(clk)) then
            --if: the counter reaches one second
            if (clkcnt = MHz) then
                --if: the watch is running
                if (watchRunning = '1') then
                    --if: the seconds reach 60 seconds
                    if (tSecs = "111100") then
                        tMins := tMins + '1';   --add one to the minutes
                        tSecs := "000000";      --set seconds to 0
                    elsif;
                        tSecs := tSecs + '1';   --add one to the seconds
                    end if;

                end if;
                clkcnt := 0;    --reset the clockcount

            --if: the watchreset is active
            elsif (watchReset) then
                --reset the the watch
                tSecs := "000000";
                tMins := "000000";
            else
                clkcnt := clkcnt + 1;   --add one to the clockcount at a rising edge
            end if;

            --write tMins and tSecs to the output
            mins <= tMins;
            secs <= tSecs;

        end if;
    end process;
end Behavioral;
