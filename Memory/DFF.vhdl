library IEEE;
use ieee.std_logic_1164.all;

entity DFF is 
	port(
		d_i, clk : in std_logic;
		q_o : out std_logic
		);
end DFF;

architecture rtl of DFF is
begin
	
	process (clk) --process (sensitivity list) the sensitivity list contains all of the signals the process is sensetive to. This tells the process when to activate.
	begin
		if rising_edge(clk) then
			q_o <= d_i;
		end if;
	end process;
end rtl;