library IEEE;
use IEEE.std_logic_1164.all;


entity or16_gate is
	port(
	a_i , b_i : in std_logic_vector(15 downto 0);
	q_o 	  : out std_logic_vector(15 downto 0)
	);
end or16_gate;


architecture rtl of or16_gate is

	signal a_inv : std_logic_vector(15 downto 0);
	signal b_inv : std_logic_vector(15 downto 0);
	
	begin
		a_inv <= a_i nand a_i;
		b_inv <= b_i nand b_i;
		q_o <= a_inv nand b_inv;
end rtl;