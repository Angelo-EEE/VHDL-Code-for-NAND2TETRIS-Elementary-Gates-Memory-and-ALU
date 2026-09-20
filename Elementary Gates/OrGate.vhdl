library IEEE;
use IEEE.std_logic_1164.all;


entity or_gate is
	port(
	a_i , b_i  : in std_logic;
	q_o 		 : out std_logic
	);
end or_gate;


architecture rtl of or_gate is
---------------------------------------------------------------------------------------
-- The intermediate signals between gates are declared here instead of in the entity --
-- because the entity only considers external input and output ports/signals.        --
---------------------------------------------------------------------------------------

	signal a_inv : std_logic;
	signal b_inv : std_logic;
	
	begin
		a_inv <= a_i nand a_i;
		b_inv <= b_i nand b_i;
		q_o <= a_inv nand b_inv;
end rtl;