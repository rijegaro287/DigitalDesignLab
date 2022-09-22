----****************************
--
--         a
--         --
--      f |g |b
--         --
--       e|  |c
--         --
--         d
--
--
--
--**********************************


library IEEE;
use ieee.std_logic_1164.all;
entity decoSum is 
	port
	(
		--entradas
		num : in std_logic_vector (3 downto 0);
		
		--salidas
		Yout : out std_logic_vector(6 downto 0)
		
	);
	
end decoSum;

architecture concurrente of decoSum is 
begin
	with num select
--			 --abcdefg
--	Yout <= "1111110" when "0000",
--			  "0110000" when "0001",
--			  "1101101" when "0010",
--			  "1111001" when "0011",
--			  "0110011" when "0100",
--			  "1011011" when "0101",
--			  "1011111" when "0110",
--			  "1110000" when "0111",
--			  "1111111" when "1000",
--			  "1110011" when "1001",
--			  "1110111" when "1010",
--			  "0011111" when "1011",
--			  "1001110" when "1100",
--			  "0111101" when "1101",
--			  "1001111" when "1110",
--			  "1000111" when others;


        ----GFEDCBA  
			 --abcdefg
	Yout <= "1000000" when "0000",
			  "1111001" when "0001",
			  "0100100" when "0010",
			  "0110000" when "0011",
			  "0011001" when "0100",
			  "0010010" when "0101",
			  "0000010" when "0110",
			  "1111000" when "0111",
			  "0000000" when "1000",
			  "0011000" when "1001",
			  "0001000" when "1010",
			  "0000011" when "1011",
			  "1000110" when "1100",
			  "0100001" when "1101",
			  "0000110" when "1110",
			  "0001110" when others;
			  
end concurrente;
