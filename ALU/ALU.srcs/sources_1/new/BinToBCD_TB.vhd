entity BinToBCD_TB is
end;

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

architecture Bench of BinToBCD_TB is
    signal bin      : std_logic_vector(7 downto 0)  := "00000000";
    signal Cout     : std_logic                     := '0';
    signal ones     : std_logic_vector(3 downto 0)  := "0000";
    signal tens     : std_logic_vector(3 downto 0)  := "0000";
    signal hundreds : std_logic_vector(3 downto 0)  := "0000";
    signal minus    : std_logic_vector(3 downto 0)  := "0000";

    signal BCD_0_OUTPUT : std_logic_vector(3 downto 0) := "0000";
    signal BCD_1_OUTPUT : std_logic_vector(3 downto 0) := "0000";
    signal BCD_2_OUTPUT : std_logic_vector(3 downto 0) := "0000";

    constant DELAY_INPUT : TIME := 10 ns;

    signal BCD_0_OK : BOOLEAN := true;
    signal BCD_1_OK : BOOLEAN := true;
    signal BCD_2_OK : BOOLEAN := true;

    signal DID_A_CHECK : BOOLEAN := false;

begin
    BinairToBCD : entity work.BinToBCD(Behavioral)
    Port map
    (
        bin         => bin,
        Cout        => Cout,
        ones        => ones,
        tens        => tens,
        hundreds    => hundreds,
        minus       => minus
    );

    Stim_bin : process
        variable i : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
    begin
        while i /= "11111111" loop
            bin <= i;
            i := i + 1;
            wait for DELAY_INPUT;
        end loop;
        wait;
    end process Stim_bin;

    BCD_0_CHECK : process
        variable i : integer := 0;
    begin
        for i in 0 to 9 loop
            BCD_0_OUTPUT <= std_logic_vector(to_unsigned(i, 4));
            wait for DELAY_INPUT;
        end loop;
    end process BCD_0_CHECK;

    BCD_1_CHECK : process
        variable i : integer := 0;
    begin
        for i in 0 to 9 loop
            BCD_1_OUTPUT <= std_logic_vector(to_unsigned(i, 4));
            wait for DELAY_INPUT * 10;
        end loop;
    end process BCD_1_CHECK;

    BCD_2_CHECK : process
        variable i : integer := 0;
    begin
        for i in 0 to 3 loop
            BCD_2_OUTPUT <= std_logic_vector(to_unsigned(i, 4));
            wait for DELAY_INPUT * 100;
        end loop;
    end process BCD_2_CHECK;

    Check_BCDs : process
        variable i : integer := 0;
    begin
        wait for DELAY_INPUT - 2 ns;
        for i in 255 downto 0 loop
            if (ones /= BCD_0_OUTPUT) then
                BCD_0_OK <= false;
            end if;
            if (tens /= BCD_1_OUTPUT) then
                BCD_1_OK <= false;
            end if;
            if (hundreds /= BCD_2_OUTPUT) then
                BCD_2_OK <= false;
            end if;

            if (DID_A_CHECK = true) then
                DID_A_CHECK <= false;
            elsif (DID_A_CHECK = false) then
                DID_A_CHECK <= true;
            end if;
            wait for DELAY_INPUT;
        end loop;
        wait;
    end process Check_BCDs;
end Bench;
