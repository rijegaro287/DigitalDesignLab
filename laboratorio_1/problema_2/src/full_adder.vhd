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
begin
    Cout <= (A and B) or ((A xor B) and Cin);
    S <= (A xor B) xor Cin;
end structural;
