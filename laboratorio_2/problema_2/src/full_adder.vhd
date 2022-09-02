library IEEE;
use IEEE.std_logic_1164.all;
use work.all;

entity full_adder is 
    port(
        A : in std_logic;
        B : in std_logic;
        Cin : in std_logic;
        Cout : out std_logic;
        S : out std_logic
    );
end full_adder;

architecture structural of full_adder is
    
    signal N0 : std_logic;
    signal N1 : std_logic;
    signal N2 : std_logic;

begin
    N0 <= A and B;
    N1 <= A xor B;
    N2 <= N1 and Cin;

    Cout <= N0 or N2;
    S <= N1 xor Cin;
end structural;


