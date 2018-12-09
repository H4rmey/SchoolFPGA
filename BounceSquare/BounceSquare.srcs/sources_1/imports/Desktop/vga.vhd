
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity VGA is
    Port
    (
        clk25 : in STD_LOGIC;

        redIn, greenIn, blueIn : in STD_LOGIC;
        redOut, greenOut, blueOut : out STD_LOGIC;
        hsync, vsync : out  STD_LOGIC;
        hCountOut : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
        vCountOut : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0')
    );
end VGA;

architecture Behavioral of VGA is
    signal hcount : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
    signal vcount : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
begin
process (clk25)
    --width and height
    constant screenWidth : integer := 640;
    constant screenHeight : integer := 480;

    --sync zooi
    constant frontPorch_x : integer := 16;
    constant syncPulse_x : integer := 96;
    constant backPorch_x : integer := 48;

    constant frontPorch_y : integer := 10;
    constant syncPulse_y : integer := 2;
    constant backPorch_y : integer := 29;

    --bound of the screen
    constant leftBound  : integer := syncPulse_x + backPorch_x;
    constant rightBound : integer := leftBound + screenWidth;
    constant upperBound : integer := syncPulse_y + backPorch_y;
    constant lowerBound : integer := upperBound + screenHeight;
begin
    if rising_edge(clk25) then

        hCountOut <= hcount;
        vCountOut <= vcount;

        if (hcount >= 144) and (hcount < 784) and (vcount >= 31) and (vcount < 511) then
         redOut <= redIn;
         greenOut <= greenIn;
         blueOut <= blueIn;
       else
         redOut <= '0';
         greenOut <= '0';
         blueOut <= '0';
       end if;

       if hcount < 97 then
         hsync <= '0';
       else
         hsync <= '1';
       end if;

       if vcount < 3 then
         vsync <= '0';
       else
         vsync <= '1';
       end if;

       hcount <= hcount + 1;

       if hcount = 800 then
         vcount <= vcount + 1;
         hcount <= (others => '0');
       end if;

       if vcount = 521 then
         vcount <= (others => '0');
       end if;
    end if;
end process;

end Behavioral;
