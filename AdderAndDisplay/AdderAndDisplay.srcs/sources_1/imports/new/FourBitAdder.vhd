library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FourBitAdder is
    Port( 
            FirstNr : in STD_LOGIC_VECTOR(3 downto 0);
            SecondNr : in STD_LOGIC_VECTOR(3 downto 0);
            Output : out STD_LOGIC_VECTOR(4 downto 0)
        );
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

FA0: FULL_ADDER port map(A => FirstNr(0), B => SecondNr(0), S => Output(0), Cin => Cbegin, Cout => C0);
FA1: FULL_ADDER port map(A => FirstNr(1), B => SecondNr(1), S => Output(1), Cin => C0, Cout => C1);
FA2: FULL_ADDER port map(A => FirstNr(2), B => SecondNr(2), S => Output(2), Cin => C1, Cout => C2);
FA3: FULL_ADDER port map(A => FirstNr(3), B => SecondNr(3), S => Output(3), Cin => C2, Cout => C3);
Output(4) <= C3;

end Behavioral;
