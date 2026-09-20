library IEEE;
use IEEE.std_logic_1164.all;


entity MUX_tb is
end MUX_tb;


architecture behavioural of MUX_tb is
	signal a_i, b_i, sel : std_logic := '0';
	signal z_o 	  		 : std_logic;
	
	begin
		UUT : entity work.MUX port map(
			a_i => a_i, b_i => b_i, sel => sel, z_o => z_o
			);
			
	    process begin
			a_i <= '0';
			b_i <= '0';
			sel <= '0';
			wait for 1 ns;
	
			b_i <= '1';
			wait for 1 ns;
			
			a_i <= '1';
			b_i <= '0';
			wait for 1 ns;
			
			b_i <= '1';
			wait for 1 ns;
			
			a_i <= '0';
			b_i <= '0';
			sel <= '1';
			wait for 1 ns;
	
			b_i <= '1';
			wait for 1 ns;
			
			a_i <= '1';
			b_i <= '0';
			wait for 1 ns;
			
			b_i <= '1';
			wait for 1 ns;
			
			wait;
		end process;
		end behavioural;