library IEEE;
use IEEE.std_logic_1164.all;

entity Dmux4Way_tb is
end Dmux4Way_tb;

architecture behavioural of Dmux4Way_tb is

	signal sel   : std_logic_vector(1 downto 0);
	signal input : std_logic;
	signal a_o, b_o, c_o, d_o : std_logic;
	
	begin
		UUT : entity work.Dmux4Way port map(
			sel => sel, input => input, a_o => a_o, b_o => b_o, c_o => c_o, d_o => d_o
			);
			
	process begin
		
		--test when input is 1
		input <= '1';
		sel <= "00";
		
		wait for 1 ns;
		
		assert (a_o = '1' and b_o = '0' and c_o = '0' and d_o = '0')
		report " SEL 00 failed when input is 1, output should be a_o = 1 and b_o, c_o and d_o = 0."
		severity error;
		
		sel <= "01";
		
		wait for 1 ns;
		
		assert (a_o = '0' and b_o = '1' and c_o = '0' and d_o = '0')
		report " SEL 01 failed when input is 1, output should be b_o = 1 and a_o, c_o and d_o = 0."
		severity error;
		
		sel <= "10";
		
		wait for 1 ns;
		
		assert (a_o = '0' and b_o = '0' and c_o = '1' and d_o = '0')
		report " SEL 10 failed when input is 1, output should be c_o = 1 and a_o, b_o and d_o = 0."
		severity error;
		
		sel <= "11";
		
		wait for 1 ns;
		
		assert (a_o = '0' and b_o = '0' and c_o = '0' and d_o = '1')
		report " SEL 11 failed when input is 1, output should be d_o = 1 and a_o, b_o and c_o = 0."
		severity error;
		
		-- test when input is 0
		input <= '0';
		sel <= "00";
		
		wait for 1 ns;
		
		assert (a_o = '0' and b_o = '0' and c_o = '0' and d_o = '0')
		report " SEL 00 failed when input is 0, all outputs should be 0."
		severity error;
		
		sel <= "01";
		
		wait for 1 ns;
		
		assert (a_o = '0' and b_o = '0' and c_o = '0' and d_o = '0')
		report " SEL 01 failed when input is 0, all outputs should be 0."
		severity error;
		
		sel <= "10";
		
		wait for 1 ns;
		
		assert (a_o = '0' and b_o = '0' and c_o = '0' and d_o = '0')
		report " SEL 10 failed when input is 0, all outputs should be 0."
		severity error;
		
		sel <= "11";
		
		wait for 1 ns;
		
		assert (a_o = '0' and b_o = '0' and c_o = '0' and d_o = '0')
		report " SEL 11 failed when input is 0, all outputs should be 0."
		severity error;
		
		report "All tests passed"
		severity note;
		
		wait;
	end process;
end behavioural;