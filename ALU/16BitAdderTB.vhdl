library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity adder_16bit_tb is
end adder_16bit_tb;

architecture behavioural of adder_16bit_tb is

	signal a_i, b_i, sum : signed(15 downto 0);
	signal carry_i, carry_o : std_logic;
	
	begin
	
	UUT : entity work.adder_16bit port map(
		a_i => a_i, b_i => b_i, carry_i => carry_i, sum => sum, carry_o => carry_o
		);
		
	process begin
	
	--test for all inputs = 0
	a_i <= x"0000";
	b_i <= x"0000";
	carry_i <= '0';
	wait for 1 ns;
	
	assert (sum = x"0000" and carry_o = '0')
		report "Error. a_i = 0x0000, b_i = 0x0000, carry_i = 0; sum should = 0x0000 and carry_o should = 0."
		severity error;
		
	--a_i and b_i = 0x0000 but carry_i = 1
	carry_i <= '1';
	wait for 1 ns;
	
		assert (sum = x"0001" and carry_o = '0')
		report "Error. a_i = 0x0000, b_i = 0x0000, carry_i = 1; sum should = 0x0001 and carry_o should = 0."
		severity error;
		
	--test for all bits = 1
	a_i <= x"FFFF";
	b_i <= x"FFFF";
	carry_i <= '1';
	wait for 1 ns;
	
	assert (sum = x"FFFF" and carry_o = '1')
		report "Error. a_i = 0xFFFF, b_i = 0xFFFF, carry_i = 1; sum should = 0xFFFF and carry_o should = 1."
		severity error;
	
	--a_i = 0xFFFF, b_i = 0xFFFF, carry_i = 0
	carry_i <= '0';
	wait for 1 ns;
	
		assert (sum = x"FFFE" and carry_o = '1')
		report "Error. a_i = 0xFFFF, b_i = 0xFFFF, carry_i = 0; sum should = 0xFFFE and carry_o should = 1."
		severity error;
	
	--alternating bit complement test
	a_i <= x"AAAA";
	b_i <= x"5555";
	carry_i <= '0'; --carry in = 0
	wait for 1 ns;
	
	assert (sum = x"FFFF" and carry_o = '0')
		report "Error. a_i = 0xAAAA, b_i = 0x5555, carry_i = 0; sum should = 0xFFFF and carry_o should = 0."
		severity error;
		
	carry_i <= '1'; --carry in = 1
	wait for 1 ns;
	
	assert (sum = x"0000" and carry_o = '1')
		report "Error. a_i = 0xAAAA, b_i = 0x5555, carry_i = 1; sum should = 0x0000 and carry_o should = 1."
		severity error;
		
	--test alternating bit pattern
	a_i <= x"5555";
	b_i <= x"5555";
	carry_i <= '0'; --carry in = 0
	wait for 1 ns;
	
	assert (sum = x"AAAA" and carry_o = '0')
		report "Error. a_i = 0x5555, b_i = 0x5555, carry_i = 0; sum should = 0xAAAA and carry_o should = 0."
		severity error;
		
	--and when carry_i = 1
	
	carry_i <= '1';
	wait for 1 ns;
	
	assert (sum = x"AAAB" and carry_o = '0')
		report "Error. a_i = 0x5555, b_i = 0x5555, carry_i = 1; sum should = 0xAAAB and carry_o should = 0."
		severity error;
	
	--test for random addition with carry bit
	a_i <= x"A5B2";
	b_i <= x"1234";
	carry_i <= '1';
	wait for 1 ns;
	
	assert (sum = x"B7E7" and carry_o = '0')
		report "Error. a_i = 0xA5B2, b_i = 0x1234, carry_i = 1; sum should = 0xB7E7 and carry_o should = 0."
		severity error;
		
	report "All tests passed"
		severity note;
		
	wait;
	end process;
end behavioural;