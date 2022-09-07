library IEEE;
use IEEE.std_logic_1164.all;

entity adder_4bits_tb is 

end adder_4bits_tb;

architecture testbench of adder_4bits_tb is
component adder_4bits is
    port (
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        Cin : in std_logic;
        Cout : out std_logic;
        S : out std_logic_vector(3 downto 0)
    );
end component;

signal A: std_logic_vector(3 downto 0);
signal B: std_logic_vector(3 downto 0);
signal Cin: std_logic;
signal Cout: std_logic;
signal S: std_logic_vector(3 downto 0);

begin
    DUT: adder_4bits port map (A, B, Cin, Cout, S);

    tb_process: process
    begin
        --Salida 00000
        A <= "0000";
        B <= "0000";
        Cin <= '0';
        wait for 10 ns;

        -- Salida: 00111
        A <= "0101";
        B <= "0010";
        Cin <= '0';
        wait for 10 ns;

        -- Salida: 01100
        A <= "1010";
        B <= "0010";
        Cin <= '0';
        wait for 10 ns;
        
        -- Salida: 10110
        A <= "1111";
        B <= "0110";
        Cin <= '1';
        wait for 10 ns;

        -- Salida: 11111
        A <= "1111";
        B <= "1111";
        Cin <= '1';
        wait for 10 ns;

        wait;
    end process;
end testbench;

