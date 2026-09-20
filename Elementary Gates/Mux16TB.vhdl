library IEEE;
use IEEE.std_logic_1164.all;


entity MUX16_tb is
end MUX16_tb;


architecture behavioural of MUX16_tb is
	signal a_i, b_i : std_logic_vector(15 downto 0) := x"0000";
	signal sel 		: std_logic;
	signal z_o 	    : std_logic_vector(15 downto 0);
	
	begin
		UUT : entity work.MUX16 port map(
			a_i => a_i, b_i => b_i, sel => sel, z_o => z_o
			);
			
	    process begin
			-- Sel = 0, output = a_i
			sel  <= '0';
			a_i <= x"0000";
			b_i <= x"1111";
			wait for 1 ns;

			assert (z_o = x"0000")
				report "SEL=0 failed (should output a_i)"
				severity error;
			
			-- Sel = 1, output = b_i
			sel <= '1';
			wait for 1 ns;

			assert (z_o = x"1111")
				report "SEL=1 failed (should output b_i)"
				severity error;
				
			-- Alternating, complimentary bits
			sel <= '0';
			a_i <= x"AAAA";
			b_i <= x"5555";
			wait for 1 ns;
			
			assert (z_o = x"AAAA")
				report "SEl=0, alternating bit test output failed (should be a_i)"
				severity error;
				
			sel <= '1';
			wait for 1 ns;
			
			assert (z_o = x"5555")
				report "SEl=1, alternating bit test output failed (should be b_i)"
				severity error;
				
			-- Identical inputs
			sel <= '0';
			a_i <= x"CCCC";
			b_i <= x"CCCC";
			wait for 1 ns;
			
			assert (z_o = x"CCCC")
				report "SEl=0, identical input test output failed (should be a_i)"
				severity error;
				
			sel <= '1';
			wait for 1 ns;
			assert (z_o = x"CCCC")
				report "SEl=1, identical input test output failed (should be b_i)"
				severity error;
				
			
			report "All tests passed" severity note;
			
		wait;
		end process;
end behavioural;