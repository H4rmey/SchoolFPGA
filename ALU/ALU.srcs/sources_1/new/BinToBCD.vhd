library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity binToBCD is
    Port (
        bin : in STD_LOGIC_VECTOR (7 downto 0);
        Cout : in STD_LOGIC;
        ones : out STD_LOGIC_VECTOR(3 downto 0);
        tens : out STD_LOGIC_VECTOR(3 downto 0);
        hundreds : out STD_LOGIC_VECTOR(3 downto 0);
        minus : out STD_LOGIC_VECTOR(3 downto 0)
    );
end binToBCD;

architecture Behavioral of binToBCD is
begin
    process( bin, Cout )
        variable i : integer;
        variable binary_shift : STD_LOGIC_VECTOR(19 downto 0);
    begin
        --initialization
        binary_shift(19 downto 8) := (others => '0');

        if Cout = '0' then
            binary_shift(7 downto 0) := bin;
            minus <= "0000";
        else
            binary_shift(7 downto 0) := STD_LOGIC_VECTOR(NOT (signed(bin) - 1));
            minus <= "1111";
        end if;


        for i in 0 to 7 loop
            --addition if over column over or equal to 5
            if(binary_shift(11 downto 8) >= "0101") then
                binary_shift(11 downto 8) := binary_shift(11 downto 8) + "0011";
            end if;

            if(binary_shift(15 downto 12) >= "0101") then
                binary_shift(15 downto 12) := binary_shift(15 downto 12) + "0011";
            end if;

            if(binary_shift(19 downto 16) >= "0101") then
                binary_shift(19 downto 16) := binary_shift(19 downto 16) + "0011";
            end if;

            --shifting everyting
            binary_shift := binary_shift(18 downto 0) & '0';
        end loop;

        ones <= binary_shift(11 downto 8);
        tens <= binary_shift(15 downto 12);
        hundreds <= binary_shift(19 downto 16);
    end process ;

end architecture;
