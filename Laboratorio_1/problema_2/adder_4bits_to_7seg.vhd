library IEEE;
use IEEE.std_logic_1164.all;
use work.all;

entity adder_4bits_to_7seg is 
    port(
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        Cin : in std_logic;
        BCD_0 : out std_logic_vector(6 downto 0);
        BCD_1 : out std_logic_vector(6 downto 0)
    );
end adder_4bits_to_7seg;

architecture structural of adder_4bits_to_7seg is
component adder_4bits is
    port (
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        Cin : in std_logic;
        Cout : out std_logic;
        S : out std_logic_vector(3 downto 0)
    );
end component;

component bcd_deco is
    port (
        NUM : in std_logic_vector(3 downto 0);
        BCD : out std_logic_vector(6 downto 0)
    );
end component;

signal Cout : std_logic_vector(3 downto 0);
signal S : std_logic_vector(3 downto 0);


begin
    Cout(1) <= '0';
    Cout(2) <= '0';
    Cout(3) <= '0';

    adder : adder_4bits
        port map (
            A,
            B,
            Cin,
            Cout(0),
            S
        );

    deco_0 : bcd_deco
        port map (
            S,
            BCD_0
        );

    deco_1 : bcd_deco
        port map (
            Cout,
            BCD_1
        );
end structural;