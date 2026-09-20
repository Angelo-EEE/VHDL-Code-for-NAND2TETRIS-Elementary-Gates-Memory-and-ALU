library IEEE;
use IEEE.std_logic_1164.all;


entity DMUX_tb is
end DMUX_tb;

architecture behavioural of DMUX_tb is

	signal input, sel : std_logic := '0';
	signal a_o, b_o : std_logic;
	
	begin
	UUT : entity work.DMUX port map(
		input => input, sel => sel, a_o => a_o, b_o => b_o
		);
		
		process begin
			
			input  <= '0'; 
			sel <= '0';
			wait for 1 ns;
			
			sel <= '1';
			wait for 1 ns;
			
			input  <= '1';
			sel <= '0';
			wait for 1 ns;
			
			sel <= '1';
			wait for 1 ns;
			
		wait;
		end process;
end behavioural;