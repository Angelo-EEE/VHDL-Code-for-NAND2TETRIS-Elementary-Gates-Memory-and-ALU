library IEEE;
use IEEE.std_logic_1164.all;


entity xor_gate is 
	port(
		a_i, b_i : in std_logic;
		q_o      : out std_logic
		);
end xor_gate;


architecture rtl of xor_gate is
	signal st1   : std_logic;
	signal st2_0 : std_logic;
	signal st2_1 : std_logic;
	
	begin
		st1 <= a_i nand b_i;
		st2_0 <= a_i nand st1;
		st2_1 <= b_i nand st1;
		q_o <= st2_0 nand st2_1;
end rtl;