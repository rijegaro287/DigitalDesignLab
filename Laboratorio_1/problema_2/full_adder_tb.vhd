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
        S : out std_logic;
        Cout : out std_logic
    );
end component;

signal a, b, cin, s, cout : std_logic;

begin
    DUT: full_adder port map (
        a, b, cin,
        s, cout
    );

    tb_process: process
    begin
        a <= '0';
        b <= '0';
        cin <= '0';
        wait for 10 ns;

        a <= '1';
        b <= '0';
        cin <= '0';
        wait for 10 ns;

        a <= '0';
        b <= '1';
        cin <= '0';
        wait for 10 ns;

        a <= '1';
        b <= '1';
        cin <= '0';
        wait for 10 ns;

        a <= '0';
        b <= '0';
        cin <= '1';
        wait for 10 ns;

        a <= '1';
        b <= '0';
        cin <= '1';
        wait for 10 ns;

        a <= '0';
        b <= '1';
        cin <= '1';
        wait for 10 ns;

        a <= '1';
        b <= '1';
        cin <= '1';
        wait for 10 ns;
        
        wait;
    end process;
end testbench;