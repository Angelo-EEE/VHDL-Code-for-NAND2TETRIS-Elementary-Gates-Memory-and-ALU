library IEEE;
use IEEE.std_logic_1164.all;

entity half_adder_tb is
end half_adder_tb;

architecture behavioural of half_adder_tb is
	
	signal a_i, b_i, sum, carry_o :std_logic;
	
	begin
		UUT : entity work.half_adder port map(
			a_i => a_i, b_i => b_i, sum => sum, carry_o => carry_o
			);
	
	process begin
	
		a_i <= '0';
		b_i <= '0';
		
		wait for 1 ns;
		
		assert (sum = '0' and carry_o = '0')
			report "Error. a_i = 0 and b_i = 0, sum and carry_o should be 0"
			severity error;
			
		b_i <= '1';
		
		wait for 1 ns;
		
		assert (sum = '1' and carry_o = '0')
			report "Error. a_i = 0 and b_i = 1, sum should be = 1 carry_o should be = 0"
			severity error;
			
		a_i <= '1';
		
		wait for 1 ns;
		
		assert (sum = '0' and carry_o = '1')
			report "Error. a_i = 1 and b_i = 1, sum should be = 0 carry_o should be = 1"
			severity error;
			
		b_i <= '0';
		
		wait for 1 ns;
		
		assert (sum = '1' and carry_o = '0')
			report "Error. a_i = 1 and b_i = 0, sum should be = 1 carry_o should be = 0"
			severity error;
			
		report "All tests passed"
		severity note;
		
		wait;
	end process;
end behavioural;