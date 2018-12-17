
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SpriteRender is
    Port
    (
        clk25 : in STD_LOGIC;

        hCountIn : in STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
        vCountIn : in STD_LOGIC_VECTOR(9 downto 0) := (others => '0');

        redOut : out STD_LOGIC;
        greenOut : out STD_LOGIC;
        blueOut : out STD_LOGIC
    );
end SpriteRender;

architecture Behavioral of SpriteRender is

begin
    Block_Render : process(hCountIn, vCountIn, clk25)
        --size of the cube
        constant size_x : integer := 8;
        constant size_y : integer := 8;

        --bound of the screen
        constant leftBound  : integer := 144;
        constant rightBound : integer := 784;
        constant upperBound : integer := 31;
        constant lowerBound : integer := 511;

        --coordinates
        variable x : integer := 200;
        variable y : integer := 150;

        --extra
        variable Add_x : integer := 1;
        variable Add_y : integer := 1;
        variable cnt_x : integer := 0;
        variable cnt_y : integer := 0;
        constant speed : integer := 1;

        TYPE CircleArray IS ARRAY (0 to 15, 0 to 15) of STD_LOGIC_VECTOR(2 downto 0);
        Constant circleData : CircleArray :=
        (
            ("011", "011", "011", "011", "011", "011", "100", "100", "100", "100", "011", "011", "011", "011", "011", "011"),
            ("011", "011", "011", "011", "100", "100", "100", "100", "100", "100", "100", "100", "011", "011", "011", "011"),
            ("011", "011", "011", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "011", "011", "011"),
            ("011", "011", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "011", "011"),
            ("011", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "011"),
            ("011", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "011"),
            ("100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100"),
            ("100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100"),
            ("100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100"),
            ("100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100"),
            ("011", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "011"),
            ("011", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "011"),
            ("011", "011", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "011", "011"),
            ("011", "011", "011", "100", "100", "100", "100", "100", "100", "100", "100", "100", "100", "011", "011", "011"),
            ("011", "011", "011", "011", "100", "100", "100", "100", "100", "100", "100", "100", "011", "011", "011", "011"),
            ("011", "011", "011", "011", "011", "011", "100", "100", "100", "100", "011", "011", "011", "011", "011", "011")
        );
    begin
        if (rising_edge(clk25)) then--update the coordinates after a whole frame has been drawn
            if (hCountIn >= (x - size_x)) and (hCountIn < (x + size_x)) and (vCountIn >= (y - size_y)) and (vCountIn < (y + size_y)) then
                redOut      <= circleData(cnt_x, cnt_y)(2);
                greenOut    <= circleData(cnt_x, cnt_y)(1);
                blueOut     <= circleData(cnt_x, cnt_y)(0);

                if (cnt_x = 15) then
                    cnt_x := 0;
                    if (cnt_y = 15) then
                        cnt_y := 0;
                    else
                        cnt_y := cnt_y + 1;
                    end if;
                else
                    cnt_x := cnt_x + 1;
                end if;
            else
                redOut      <= '0';
                greenOut    <= '1';
                blueOut     <= '1';
            end if;

            if (hCountIn = 699 and vCountIn = 520) then
                x := x + Add_x;
                y := y + Add_y;
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
