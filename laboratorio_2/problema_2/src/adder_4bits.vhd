library IEEE;
use IEEE.std_logic_1164.all;
use work.all;

entity adder_4bits is 
    port(
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        Cin : in std_logic;
        Cout : out std_logic;
        S : out std_logic_vector(3 downto 0)
    );
end adder_4bits;

architecture structural of adder_4bits is

component full_adder is
    port (
        A : in std_logic;
        B : in std_logic;
        Cin : in std_logic;
        Cout : out std_logic;
        S : out std_logic
    );
end component;

signal Cout_0, Cout_1, Cout_2 : std_logic;

begin
    full_adder_0 : full_adder
        port map (
            A(0),
            B(0),
            Cin,
            Cout_0,
            S(0)
        );

    full_adder_1 : full_adder
        port map (
            A(1),
            B(1),
            Cout_0,
            Cout_1,
            S(1)
        );

    full_adder_2 : full_adder
        port map (
            A(2),
            B(2),
            Cout_1,
            Cout_2,
            S(2)
        );

    full_adder_3 : full_adder
        port map (
            A(3),
            B(3),
            Cout_2,
            Cout,
            S(3)
        );
end structural;

