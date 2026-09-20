library IEEE;
use ieee.std_logic_1164.all;


entity not16_gate_tb is
end not16_gate_tb;

architecture behavioural of not16_gate_tb is
	signal a_i : std_logic_vector(15 downto 0) := x"0000";
	signal q_o : std_logic_vector(15 downto 0);
	
	begin 
	UUT : entity work.not16_gate port map(
		a_i => a_i, q_o => q_o
		);
		
		process begin
		-- Test all 0s
			a_i <= x"0000";
			wait for 1 ns;
			assert (q_o = x"FFFF")
				report "All 0s incorrect"
				severity error;
				
			-- Test all 1s
			a_i <= x"FFFF";
			wait for 1 ns;
			assert (q_o = x"0000")
				report "All 1s incorrect"
				severity error;
				
			--Test alternating bits
			a_i <= x"AAAA";
			wait for 1 ns;
			assert (q_o = x"5555")
				report "Alternating bits incorrect"
				severity error;
				
			--Test random combination
			a_i <= x"1234";
			wait for 1 ns;
			assert (q_o = x"EDCB")
				report "Random combination incorrect"
				severity error;
			
			report "All tests passed" severity note;
			
		wait;
		end process;
end behavioural;