library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


Entity Cont_Reg_Param_Testbench is
end Cont_Reg_Param_Testbench;

architecture tb of Cont_Reg_Param_Testbench is
	signal reloj :  std_logic;
	signal reset :  std_logic;
	signal inicial : std_logic;
	signal seg1, seg2, seg3, seg4, seg5, seg6: std_logic_vector (6 downto 0);
	
	component Contador_Regresivo_Param
		port(
			reloj : in std_logic;
			reset : in std_logic;
			inicial : in std_logic;
			seg1, seg2, seg3, seg4, seg5, seg6: out std_logic_vector (6 downto 0)
		);
	end component;
	
	
	begin 
		DUT : Contador_Regresivo_Param
			port map (
				reloj => reloj,
				reset => reset,
				inicial => inicial,
				seg1 => seg1,
				seg2 => seg2,
				seg3 => seg3,
				seg4 => seg4,
				seg5 => seg5,
				seg6 => seg6
			);
	process begin	
		-- Prueba 2 bits
		inicial <= '0';wait for 1 us;
		inicial <= '1';wait for 1 us;
		inicial <= '0';wait for 1 us;
		inicial <= '1';wait for 1 us;
		-- Prueba resta
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;  
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us; 
		 assert ((seg1 = "1111001") and (seg2 = "1000000"))
		 report "Fallo en prueba resta 2 bits" severity error;
		 
		 reset <= '1';
		 wait for 1 us;  
		 reset <= '0';
		 wait for 1 us;
		 reset <= '1';
		 wait for 1 us;
		 inicial <= '0';wait for 1 us;
		 inicial <= '1';wait for 1 us;
		 inicial <= '0';wait for 1 us;
		 inicial <= '1';wait for 1 us;
		-- Prueba reset
		 wait for 1 us;
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;  
		 reloj <= '1';
		 reset <= '0';
		 wait for 1 us;
		 reloj <= '1';
		 reset <= '1'; 
		 wait for 1 us;
		 assert ((seg1 = "1111001") and (seg2 = "1111001"))
		 report "Fallo en prueba reset 2 bits" severity error;
		
		reset <= '1';
		wait for 1 us;  
		reset <= '0';
		wait for 1 us;
		reset <= '1';
		wait for 1 us;
		inicial <= '0';wait for 1 us;
		inicial <= '1';wait for 1 us;
		inicial <= '0';wait for 1 us;
		inicial <= '1';wait for 1 us;
		-- prueba max	
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;  
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us; 
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;  
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;
		 assert ((seg1 = "1000000") and (seg2 = "1000000"))
		 report "Fallo en prueba max 2 bits" severity error;
		 
		
		-- reset para continuar con la siguiente prueba
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '1';
		 reset <= '0';
		 wait for 1 us;
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;
		 
		 
		-- Prueba 4 bits
		inicial <= '0';wait for 1 us;
		inicial <= '1';wait for 1 us;
		inicial <= '0';wait for 1 us;
		inicial <= '1';wait for 1 us;
		
		inicial <= '0';wait for 1 us;
		inicial <= '1';wait for 1 us;
		inicial <= '0';wait for 1 us;
		inicial <= '1';wait for 1 us;
		-- Prueba resta
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;  
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us; 
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us; 
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;
		 assert ((seg1 = "1111001") and (seg2 = "1111001") and (seg3 = "1000000"))
		 report "Fallo en prueba resta 4 bits" severity error;
		
		reset <= '1';
		wait for 1 us;  
		reset <= '0';
		wait for 1 us;
		reset <= '1';
		wait for 1 us;
		inicial <= '0';wait for 1 us;
		inicial <= '1';wait for 1 us;
		inicial <= '0';wait for 1 us;
		inicial <= '1';wait for 1 us;
		
		inicial <= '0';wait for 1 us;
		inicial <= '1';wait for 1 us;
		inicial <= '0';wait for 1 us;
		inicial <= '1';wait for 1 us;
		-- Prueba reset 
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;  
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;  
		 reloj <= '1';
		 reset <= '0';
		 wait for 1 us;
		 reloj <= '1';
		 reset <= '1';
		 assert ((seg1 = "1111001") and (seg2 = "1111001") and (seg3 = "1111001") and (seg2 = "1111001"))
		 report "Fallo en prueba reset 4 bits" severity error;
		 
		-- reset para continuar con la siguiente prueba
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '1';
		 reset <= '0';
		 wait for 1 us;
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;
		 
		 
		-- Prueba 6 bits
		inicial <= '0';wait for 1 us;
		inicial <= '1';wait for 1 us;
		inicial <= '0';wait for 1 us;
		inicial <= '1';wait for 1 us;
		
		inicial <= '0';wait for 1 us;
		inicial <= '1';wait for 1 us;
		inicial <= '0';wait for 1 us;
		inicial <= '1';wait for 1 us;
		
		inicial <= '0';wait for 1 us;
		inicial <= '1';wait for 1 us;
		inicial <= '0';wait for 1 us;
		inicial <= '1';wait for 1 us;
		
		-- Prueba resta 6
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;  
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us; 
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us; 
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;  
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us; 
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us; 
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;  
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us; 
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us; 
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;  
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us; 
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us; 
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;
		 assert ((seg1 = "1111001") and (seg2 = "1111001") and (seg3 = "1111001") and (seg4 = "1111001") and (seg5 = "1000000"))
		 report "Fallo en prueba resta 6 bits" severity error;
		
		inicial <= '0';wait for 1 us;
		inicial <= '1';wait for 1 us;
		inicial <= '0';wait for 1 us;
		inicial <= '1';wait for 1 us;
		
		inicial <= '0';wait for 1 us;
		inicial <= '1';wait for 1 us;
		inicial <= '0';wait for 1 us;
		inicial <= '1';wait for 1 us;
		
		inicial <= '0';wait for 1 us;
		inicial <= '1';wait for 1 us;
		inicial <= '0';wait for 1 us;
		inicial <= '1';wait for 1 us;
		 -- Prueba reset
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;  
		 reloj <= '0';
		 reset <= '1';
		 wait for 1 us;
		 reloj <= '1';
		 reset <= '1';
		 wait for 1 us;  
		 reloj <= '1';
		 reset <= '0';
		 wait for 1 us;
		 reloj <= '1';
		 reset <= '1';
		 assert ((seg1 = "1111001") and (seg2 = "1111001") and (seg3 = "1111001") and (seg4 = "1111001") and (seg5 = "1111001") and (seg6 = "1111001"))
		 report "Fallo en prueba reset 6 bits" severity error;
		
		wait;
	end process;
end tb;