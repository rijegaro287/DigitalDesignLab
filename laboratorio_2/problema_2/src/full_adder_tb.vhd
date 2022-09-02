library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder_tb is 

end full_adder_tb;

architecture testbench of full_adder_tb is
component full_adder is
    port (
        A : in std_logic;
        B : in std_logic;
        Cin : in std_logic;
        Cout : out std_logic;
        S : out std_logic
    );
end component;

signal A, B, Cin, Cout, S : std_logic;

begin
    DUT: full_adder port map (A, B, Cin, Cout, S);

    tb_process: process
    begin
        A <= '0';
        B <= '0';
        Cin <= '0';
        wait for 10 ns;

        A <= '1';
        B <= '0';
        Cin <= '0';
        wait for 10 ns;

        A <= '0';
        B <= '1';
        Cin <= '0';
        wait for 10 ns;

        A <= '1';
        B <= '1';
        Cin <= '0';
        wait for 10 ns;

        A <= '0';
        B <= '0';
        Cin <= '1';
        wait for 10 ns;

        A <= '1';
        B <= '0';
        Cin <= '1';
        wait for 10 ns;

        A <= '0';
        B <= '1';
        Cin <= '1';
        wait for 10 ns;

        A <= '1';
        B <= '1';
        Cin <= '1';
        wait for 10 ns;
        
        wait;
    end process;
end testbench;