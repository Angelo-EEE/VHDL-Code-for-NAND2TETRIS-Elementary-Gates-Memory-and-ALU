library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder_tb is
end full_adder_tb;

architecture behavioural of full_adder_tb is
	
	signal a_i, b_i, fa_carry_i : std_logic;
	signal fa_sum_o, fa_carry_o : std_logic;
	
	begin
	
	UUT : entity work.full_adder port map(
		a_i => a_i, b_i => b_i, fa_carry_i => fa_carry_i, fa_sum_o => fa_sum_o, fa_carry_o => fa_carry_o
		);
		
	process begin
	--test for all inputs = 0
	a_i <= '0';
	b_i <= '0';
	fa_carry_i <= '0';
	wait for 1 ns;
	
	assert (fa_sum_o = '0' and fa_carry_o = '0')
		report "Error. All inputs are 0, sum and carry out should be 0"
		severity error;
		
	--test for a_i = 0 , b_i = 0 and fa_carry_i = 1
	fa_carry_i <= '1';
	wait for 1 ns;
	
	assert (fa_sum_o = '1' and fa_carry_o = '0')
		report "Error. a_i = 0 , b_i = 0 and fa_carry_i = 1, sum should be = 1 and carry out should be = 0"
		severity error;
		
	--test for a_i = 0 , b_i = 1 and fa_carry_i = 0
	fa_carry_i <= '0';
	b_i <= '1';
	wait for 1 ns;
	
	assert (fa_sum_o = '1' and fa_carry_o = '0')
		report "Error. a_i = 0 , b_i = 1 and fa_carry_i = 0, sum should be = 1 and carry out should be = 0"
		severity error;
		
	--test for a_i = 0 , b_i = 1 and fa_carry_i = 1
	b_i <= '1';
	fa_carry_i <= '1';
	wait for 1 ns;
	
	assert (fa_sum_o = '0' and fa_carry_o = '1')
		report "Error. a_i = 0 , b_i = 1 and fa_carry_i = 1, sum should be = 0 and carry out should be = 1"
		severity error;
		
	--test for a_i = 1 , b_i = 0 and fa_carry_i = 0
	a_i <= '1';
	b_i <= '0';
	fa_carry_i <= '0';
	wait for 1 ns;
	
	assert (fa_sum_o = '1' and fa_carry_o = '0')
		report "Error. a_i = 1 , b_i = 0 and fa_carry_i = 0, sum should be = 1 and carry out should be = 0"
		severity error;
		
	--test for a_i = 1 , b_i = 0 and fa_carry_i = 1
	fa_carry_i <= '1';
	wait for 1 ns;
	
	assert (fa_sum_o = '0' and fa_carry_o = '1')
		report "Error. a_i = 1 , b_i = 0 and fa_carry_i = 1, sum should be = 0 and carry out should be = 1"
		severity error;
		
	--test for a_i = 1 , b_i = 1 and fa_carry_i = 0
	b_i <= '1';
	fa_carry_i <= '0';
	wait for 1 ns;
	
	assert (fa_sum_o = '0' and fa_carry_o = '1')
		report "Error. a_i = 1 , b_i = 1 and fa_carry_i = 0, sum should be = 0 and carry out should be = 1"
		severity error;
		
	--test for a_i = 0 , b_i = 1 and fa_carry_i = 1
	fa_carry_i <= '1';
	wait for 1 ns;
	
	assert (fa_sum_o = '1' and fa_carry_o = '1')
		report "Error. a_i = 1 , b_i = 1 and fa_carry_i = 1, sum should be = 1 and carry out should be = 1"
		severity error;
		
	report "All tests passed"
		severity note;
	
	wait;
	end process;
end behavioural;