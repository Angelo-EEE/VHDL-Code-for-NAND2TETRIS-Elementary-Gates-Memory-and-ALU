library IEEE;
use IEEE.std_logic_1164.all;


entity and16_gate is
	port(
		a_i, b_i : in std_logic_vector(15 downto 0);
		q_o 	 : out std_logic_vector(15 downto 0)
		);
end and16_gate;


architecture rtl of and16_gate is

	signal st1 : std_logic_vector(15 downto 0);
	
	begin
		st1 <= a_i nand b_i;
		q_o <= st1 nand st1;
end rtl;