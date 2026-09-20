library IEEE;
use IEEE.std_logic_1164.all;


entity xor_gate_tb is
end xor_gate_tb;


architecture behaviour of xor_gate_tb is
	signal a_i, b_i : std_logic := '0';
	signal st1, st2_0, st2_1, q_o : std_logic;
	
	begin
		UUT : entity work.xor_gate port map(
			a_i => a_i, b_i => b_i, q_o => q_o
			);
		
		process begin
			a_i <= '0';
			b_i <= '0';
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
		end behaviour;