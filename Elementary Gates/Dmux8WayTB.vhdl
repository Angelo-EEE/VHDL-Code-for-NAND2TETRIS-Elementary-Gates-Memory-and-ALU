library IEEE;
use IEEE.std_logic_1164.all;

entity Dmux8Way_tb is
end Dmux8Way_tb;

architecture behavioural of Dmux8Way_tb is

	signal sel : std_logic_vector(2 downto 0);
	signal input, a_o, b_o, c_o, d_o, e_o, f_o, g_o, h_o : std_logic;
	
	begin
	
	UUT : entity work.Dmux8Way port map(
		sel => sel, input => input, a_o => a_o, b_o => b_o, c_o => c_o, d_o => d_o, e_o => e_o, f_o => f_o, g_o => g_o, h_o => h_o
		);
		
	process begin
	
	--test when input is 1
		input <= '1';
		sel <= "000";
		
		wait for 1 ns;
		
		assert (a_o = '1' and b_o = '0' and c_o = '0' and d_o = '0' and e_o = '0' and f_o = '0' and g_o = '0' and h_o = '0')
		report " SEL 000 failed when input is 1, output should be a_o = 1 and all others = 0."
		severity error;
		
		sel <= "001";
		
		wait for 1 ns;
		
		assert (a_o = '0' and b_o = '1' and c_o = '0' and d_o = '0' and e_o = '0' and f_o = '0' and g_o = '0' and h_o = '0')
		report " SEL 001 failed when input is 1, output should be b_o = 1 and all others = 0."
		severity error;
		
		sel <= "010";
		
		wait for 1 ns;
		
		assert (a_o = '0' and b_o = '0' and c_o = '1' and d_o = '0' and e_o = '0' and f_o = '0' and g_o = '0' and h_o = '0')
		report " SEL 010 failed when input is 1, output should be c_o = 1 and all others = 0."
		severity error;
		
		sel <= "011";
		
		wait for 1 ns;
		
		assert (a_o = '0' and b_o = '0' and c_o = '0' and d_o = '1' and e_o = '0' and f_o = '0' and g_o = '0' and h_o = '0')
		report " SEL 011 failed when input is 1, output should be d_o = 1 and all others = 0."
		severity error;
		
		sel <= "100";
		
		wait for 1 ns;
		
		assert (a_o = '0' and b_o = '0' and c_o = '0' and d_o = '0' and e_o = '1' and f_o = '0' and g_o = '0' and h_o = '0')
		report " SEL 100 failed when input is 1, output should be e_o = 1 and all others = 0."
		severity error;
		
		sel <= "101";
		
		wait for 1 ns;
		
		assert (a_o = '0' and b_o = '0' and c_o = '0' and d_o = '0' and e_o = '0' and f_o = '1' and g_o = '0' and h_o = '0')
		report " SEL 101 failed when input is 1, output should be f_o = 1 and all others = 0."
		severity error;
		
		sel <= "110";
		
		wait for 1 ns;
		
		assert (a_o = '0' and b_o = '0' and c_o = '0' and d_o = '0' and e_o = '0' and f_o = '0' and g_o = '1' and h_o = '0')
		report " SEL 110 failed when input is 1, output should be g_o = 1 and all others = 0."
		severity error;
		
		sel <= "111";
		
		wait for 1 ns;
		
		assert (a_o = '0' and b_o = '0' and c_o = '0' and d_o = '0' and e_o = '0' and f_o = '0' and g_o = '0' and h_o = '1')
		report " SEL 111 failed when input is 1, output should be h_o = 1 and all others = 0."
		severity error;
		
		-- test when input is 0
		input <= '0';
		sel <= "000";
		
		wait for 1 ns;
		
		assert (a_o = '0' and b_o = '0' and c_o = '0' and d_o = '0' and e_o = '0' and f_o = '0' and g_o = '0' and h_o = '0')
		report " SEL 000 failed when input is 0, all outputs should be 0."
		severity error;
		
		sel <= "001";
		
		wait for 1 ns;
		
		assert (a_o = '0' and b_o = '0' and c_o = '0' and d_o = '0' and e_o = '0' and f_o = '0' and g_o = '0' and h_o = '0')
		report " SEL 001 failed when input is 0, all outputs should be 0."
		severity error;
		
		sel <= "010";
		
		wait for 1 ns;
		
		assert (a_o = '0' and b_o = '0' and c_o = '0' and d_o = '0' and e_o = '0' and f_o = '0' and g_o = '0' and h_o = '0')
		report " SEL 010 failed when input is 0, all outputs should be 0."
		severity error;
		
		sel <= "011";
		
		wait for 1 ns;
		
		assert (a_o = '0' and b_o = '0' and c_o = '0' and d_o = '0' and e_o = '0' and f_o = '0' and g_o = '0' and h_o = '0')
		report " SEL 011 failed when input is 0, all outputs should be 0."
		severity error;
		
		sel <= "100";
		
		wait for 1 ns;
		
		assert (a_o = '0' and b_o = '0' and c_o = '0' and d_o = '0' and e_o = '0' and f_o = '0' and g_o = '0' and h_o = '0')
		report " SEL 100 failed when input is 0, all outputs should be 0."
		severity error;
		
		sel <= "101";
		
		wait for 1 ns;
		
		assert (a_o = '0' and b_o = '0' and c_o = '0' and d_o = '0' and e_o = '0' and f_o = '0' and g_o = '0' and h_o = '0')
		report " SEL 101 failed when input is 0, all outputs should be 0."
		severity error;
		
		sel <= "110";
		
		wait for 1 ns;
		
		assert (a_o = '0' and b_o = '0' and c_o = '0' and d_o = '0' and e_o = '0' and f_o = '0' and g_o = '0' and h_o = '0')
		report " SEL 110 failed when input is 0, all outputs should be 0."
		severity error;
		
		sel <= "111";
		
		wait for 1 ns;
		
		assert (a_o = '0' and b_o = '0' and c_o = '0' and d_o = '0' and e_o = '0' and f_o = '0' and g_o = '0' and h_o = '0')
		report " SEL 111 failed when input is 0, all outputs should be 0."
		severity error;
		
		report "All tests passed"
		severity note;
		
		wait;
	end process;
end behavioural;