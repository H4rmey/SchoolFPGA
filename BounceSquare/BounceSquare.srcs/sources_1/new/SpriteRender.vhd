
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SpriteRender is
    Port
    (
        clk100 : in STD_LOGIC;

        hCountIn : in STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
        vCountIn : in STD_LOGIC_VECTOR(9 downto 0) := (others => '0');

        redOut : out STD_LOGIC;
        greenOut : out STD_LOGIC;
        blueOut : out STD_LOGIC
    );
end SpriteRender;

architecture Behavioral of SpriteRender is

begin
    Block_Render : process(hCountIn, vCountIn, clk100)
        --size of the cube
        constant size_x : integer := 10;
        constant size_y : integer := 10;

        --bound of the screen
        constant leftBound  : integer := 144;
        constant rightBound : integer := 784;
        constant upperBound : integer := 31;
        constant lowerBound : integer := 511;

        --coordinates
        variable x : integer := 150;
        variable y : integer := 150;

        --counter variables
        variable cnt : integer := 0;
        constant second : integer := 100000000;

        --extra
        variable Add_x : integer := 1;
        variable Add_y : integer := 1;
        constant speed : integer := 1;
    begin
        if (rising_edge(clk100)) then
            cnt := cnt + 1;
            if (hCountIn >= (x - size_x)) and (hCountIn < (x + size_x)) and (vCountIn >= (y - size_y)) and (vCountIn < (y + size_y)) then
                redOut <= '1';
                greenOut <= '0';
                blueOut <= '0';
            else
                redOut <= '0';
                greenOut <= '1';
                blueOut <= '1';
            end if;

            if (cnt = second/150) then
                x := x + Add_x;
                y := y + Add_y;
                cnt := 0;
            end if;

            if ((x - size_x) = leftBound) then
                Add_x := speed;
            elsif ((x + size_x) = rightBound) then
                Add_x := -speed;
            end if;

            if ((y - size_y) = upperBound) then
                Add_y := speed;
            elsif ((y + size_y) = lowerBound) then
                Add_y := -speed;
            end if;
        end if;
    end process;
end Behavioral;
