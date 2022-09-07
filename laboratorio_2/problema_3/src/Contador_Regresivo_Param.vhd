library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


Entity Contador_Regresivo_Param is
	port (
		reloj : in std_logic;
		reset : in std_logic;
		inicial : in std_logic;
		seg1, seg2, seg3, seg4, seg5, seg6: out std_logic_vector (6 downto 0)
	);
end Contador_Regresivo_Param;

Architecture contador of Contador_Regresivo_Param is
		--Variables Globales
		signal n : integer := 6 ; -- VARIABLE A PARAMETRIZAR 
		signal UNO : std_logic_vector (6 downto 0) := "1111001";
		signal CERO : std_logic_vector (6 downto 0) := "1000000";
		
		signal cuenta : integer range 0 to ((2**n) - 1) := 0;
		signal numbin : std_logic_vector (5 downto 0) := conv_std_logic_vector(cuenta, 6);
begin
	contador_n_bits : process (reset, n, UNO, CERO, cuenta, numbin) begin
		if (reset = '0') then
			cuenta <= 0;
		elsif (inicial = '0') and (cuenta < (2**n)) then
			cuenta <= ((2**n) - 1);
			numbin <= conv_std_logic_vector(cuenta, 6);
		elsif (reloj'event) and (reloj = '0') then
			if (cuenta = 0) then
				cuenta <= 0;
				numbin <= conv_std_logic_vector(cuenta, 6);
			else
				cuenta <= cuenta - 1;
				numbin <= numbin - 1;
			end if;
		end if;
		
		numbin <= conv_std_logic_vector(cuenta, 6);
		--segmento 6
		if (numbin(0) = '1') then
			seg1 <= UNO;
		else
			seg1 <= CERO;
		end if;
		--segmento 5
		if (numbin(1) = '1') then
			seg2 <= UNO;
		else
			seg2 <= CERO;
		end if;
		--segmento 4
		if (numbin(2) = '1') then
			seg3 <= UNO;
		else
			seg3 <= CERO;
		end if;
		--segmento 3
		if (numbin(3) = '1') then
			seg4 <= UNO;
		else
			seg4 <= CERO;
		end if;
		--segmento 2
		if (numbin(4) = '1') then
			seg5 <= UNO;
		else
			seg5 <= CERO;
		end if;
		--segmento 1
		if (numbin(5) = '1') then
			seg6 <= UNO;
		else
			seg6 <= CERO;
		end if;
	end process;
	
end contador;