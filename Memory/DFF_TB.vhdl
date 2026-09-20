library IEEE;
use ieee.std_logic_1164.all;

entity DFF_tb is
end DFF_tb;

architecture behavioural of DFF_tb is

	signal d_i, clk, q_o : std_logic;
	
	begin
	
	UUT : entity work.DFF port map(
		d_i => d_i, clk => clk, q_o => q_o
		);
	
	--Generate a 10 ns period clock
	clk_process : process
	begin
		clk <= '0';
		wait for 5 ns;
		clk <= '1';
		wait for 5 ns;
	end process;
	
	--tests input of 0 and 1 for when clock is both 0 and 1
	process begin
	
	d_i <= '0';
	wait for 10 ns;
	
	d_i <= '1';
	wait for 10 ns;
	
	wait;
	end process;
end behavioural;