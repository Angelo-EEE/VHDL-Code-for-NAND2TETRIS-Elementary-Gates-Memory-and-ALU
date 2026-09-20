library IEEE;
use IEEE.std_logic_1164.all;

entity and16_gate_tb is
end entity;

architecture behavioural of and16_gate_tb is
	signal a_i, b_i : std_logic_vector(15 downto 0) := x"0000";
	signal q_o 	    : std_logic_vector(15 downto 0);
	
	begin
	
		UUT : entity work.and16_gate port map(
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
			assert (q_o = x"0000")
				report "Alternating bits incorrect"
				severity error;
				
			--Test identity property X AND 1 = X
			a_i <= x"1234";
			b_i <= x"FFFF";
			wait for 1 ns;
			assert (q_o = x"1234")
				report "Identity property incorrect"
				severity error;
				
			-- Test zero property X AND 0 = 0
			a_i <= x"1234";
			b_i <= x"0000";
			wait for 1 ns;
			assert (q_o = x"0000")
				report "Zero property incorrect"
				severity error;
				
			--Test random combination
			a_i <= x"12AF";
			b_i <= x"B901";
			wait for 1 ns;
			assert (q_o = x"1001")
				report "Random combination incorrect"
				severity error;
				
			report "All tests passed" severity note;
			
		wait;
		end process;
end behavioural;