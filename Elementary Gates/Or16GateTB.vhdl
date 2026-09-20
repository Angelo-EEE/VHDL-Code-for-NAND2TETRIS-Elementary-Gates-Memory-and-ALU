library IEEE;
use IEEE.std_logic_1164.all;


entity or16_gate_tb is
end entity;

architecture behavioural of or16_gate_tb is
	signal a_i, b_i : std_logic_vector(15 downto 0) := x"0000";
	signal q_o 	    : std_logic_vector(15 downto 0);
	
	begin
	
		UUT : entity work.or16_gate port map(
			a_i => a_i, b_i => b_i, q_o => q_o
			);
			
		process begin
		
			-- Test all 0s
			a_i <= x"0000";
			b_i <= x"0000";
			wait for 1 ns;
			assert (q_o = x"0000")
				report "All 0s incorrect"
				severity error;
				
			-- Test all 1s
			a_i <= x"FFFF";
			b_i <= x"FFFF";
			wait for 1 ns;
			assert (q_o = x"FFFF")
				report "All 1s incorrect"
				severity error;
				
			--Test alternating bits
			a_i <= x"AAAA";
			b_i <= x"5555";
			wait for 1 ns;
			assert (q_o = x"FFFF")
				report "Alternating bits incorrect"
				severity error;
				
			--Test mixed bits
			a_i <= x"0F0F";
			b_i <= x"F0F0";
			wait for 1 ns;
			assert (q_o = x"FFFF")
				report "Mixed bits incorrect"
				severity error;
				
			-- Test zero property X OR 0 = X
			a_i <= x"1234";
			b_i <= x"0000";
			wait for 1 ns;
			assert (q_o = x"1234")
				report "Zero property incorrect"
				severity error;
				
			--Test random combination
			a_i <= x"12AF";
			b_i <= x"B901";
			wait for 1 ns;
			assert (q_o = x"BBAF")
				report "Random combination incorrect"
				severity error;
				
			report "All tests passed" severity note;
			
		wait;
		end process;
end behavioural;