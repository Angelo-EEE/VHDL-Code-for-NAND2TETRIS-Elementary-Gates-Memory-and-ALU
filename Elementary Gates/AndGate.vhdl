library IEEE;
use IEEE.std_logic_1164.all;


entity and_gate is
	port(
		a_i : in std_logic;
		b_i : in std_logic;
		q_o : out std_logic
		);
end and_gate;


architecture behavioural of and_gate is

	signal st1 : std_logic;
	
	begin
	
	st1 <= a_i nand b_i;
	q_o <= st1 nand st1;
end behavioural;
	