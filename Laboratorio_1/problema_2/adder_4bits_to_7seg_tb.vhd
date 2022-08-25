library IEEE;
use IEEE.std_logic_1164.all;

entity adder_4bits_to_7seg_tb is 

end adder_4bits_to_7seg_tb;

architecture testbench of adder_4bits_to_7seg_tb is
component adder_4bits_to_7seg is
    port (
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        Cin : in std_logic;
        BCD_0 : out std_logic_vector(6 downto 0);
        BCD_1 : out std_logic_vector(6 downto 0)
    );
end component;

signal A: std_logic_vector(3 downto 0);
signal B: std_logic_vector(3 downto 0);
signal Cin: std_logic;
signal BCD_0: std_logic_vector(6 downto 0);
signal BCD_1: std_logic_vector(6 downto 0);

begin
    DUT: adder_4bits_to_7seg port map (A, B, Cin, BCD_0, BCD_1);

    tb_process: process
    begin
        A <= "0000";
        B <= "0000";
        Cin <= '0';
        wait for 10 ns;

        A <= "0101";
        B <= "0010";
        Cin <= '0';
        wait for 10 ns;

        A <= "1010";
        B <= "0010";
        Cin <= '0';
        wait for 10 ns;

        A <= "1111";
        B <= "0110";
        Cin <= '1';
        wait for 10 ns;

        A <= "1111";
        B <= "1111";
        Cin <= '1';
        wait for 10 ns;

        wait;
    end process;
end testbench;