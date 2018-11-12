library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FourBitAdder is
    Port( sw0:in std_logic;
        sw1:in std_logic;
        sw2:in std_logic;
        sw3:in std_logic;
        sw4:in std_logic;
        sw5:in std_logic;
        sw6:in std_logic;
        sw7:in std_logic;
        b0:out std_logic;
        b1:out std_logic;
        b2:out std_logic;
        b3:out std_logic;
        b4:out std_logic);
end FourBitAdder;

architecture Behavioral of FourBitAdder is
component FULL_ADDER is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
end component;

signal C0 : std_logic := '0';
signal C1 : std_logic := '0';
signal C2 : std_logic := '0';
signal C3 : std_logic := '0';
signal Cbegin : std_logic := '0';

begin

FA0: FULL_ADDER port map(A => sw0, B => sw4, S => b0, Cin => Cbegin, Cout => C0);
FA1: FULL_ADDER port map(A => sw1, B => sw5, S => b1, Cin => C0, Cout => C1);
FA2: FULL_ADDER port map(A => sw2, B => sw6, S => b2, Cin => C1, Cout => C2);
FA3: FULL_ADDER port map(A => sw3, B => sw7, S => b3, Cin => C2, Cout => C3);
b4 <= C3;

end Behavioral;
