library IEEE;
use IEEE.std_logic_1164.all;



entity and_gate_tb is
end and_gate_tb;


architecture test of and_gate_tb is
	signal a_i, b_i : std_logic := '0';
	signal q_o 	    : std_logic;
	
begin
	UUT : entity work.and_gate port map(
		a_i => a_i,
		b_i => b_i,
		q_o => q_o
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
end architecture;