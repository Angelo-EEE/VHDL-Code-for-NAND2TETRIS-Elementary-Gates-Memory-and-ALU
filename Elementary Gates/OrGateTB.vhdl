library IEEE;
use IEEE.std_logic_1164.all;


entity or_gate_tb is
end or_gate_tb;


architecture behaviour of or_gate_tb is
	signal a_i, b_i : std_logic := '0';
	signal q_o : std_logic;

    begin
	UUT : entity work.or_gate port map( -- intermediate signals not included as only external behaviour of the entity needs to be tested
		a_i => a_i,
		b_i => b_i,
		q_o => q_o);
		
		
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