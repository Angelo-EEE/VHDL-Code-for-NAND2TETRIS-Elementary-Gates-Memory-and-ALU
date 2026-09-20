library IEEE;
use ieee.std_logic_1164.all;



entity not_gate_tb is -- The test bench is isolated therefore, has no ports connected
end not_gate_tb;


architecture test of not_gate_tb is
-- Declare signals/wires
	signal a_i : std_logic := '0';
	signal q_o : std_logic;

begin
-- Assigns/ connects ports to signals
	UUT : entity work.not_gate port map(
			a_i  => a_i,
			q_o => q_o
			);
	
	process begin
		a_i <= '0';
        wait for 1 ns;
		
		a_i <= '1';
		wait for 1 ns;
	
		wait;
	end process;
end architecture; 