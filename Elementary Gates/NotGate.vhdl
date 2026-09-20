library IEEE;
use ieee.std_logic_1164.all;



entity not_gate is
	port(
		a_i : in  std_logic;
		q_o : out std_logic
		);
end not_gate;


architecture behavioural of not_gate is
	begin
	
		q_o <= a_i nand a_i;
		
end behavioural;