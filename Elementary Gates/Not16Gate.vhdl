library IEEE;
use ieee.std_logic_1164.all;


entity not16_gate is
	port(
		a_i : in  std_logic_vector(15 downto 0);
		q_o : out std_logic_vector(15 downto 0)
		);
end not16_gate;


architecture rtl of not16_gate is
	begin
	
		q_o <= a_i nand a_i;
		
end rtl;